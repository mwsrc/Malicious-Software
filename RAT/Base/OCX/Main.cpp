/*********************************************************
Title:         Viotto ocx Registrator
Version:       1.0
Release date:  2/9/2010
Licence:       Open Source
Purpose:       fast and easy registration of ocx files.
Compiler used: Embarcadero C++ 2010
Notes:         Must run with administrator priviledges.
               Don't be a ripper and preserve credits if
			   this code has been useful to you!

*********************************************************/

#include <string>
#include <dir.h>
using namespace std;

#pragma hdrstop

#include "Main.h"

#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

bool fileexists(const char *FileName);
int dir(const char *szDir, string szFiles = "*");
void UpdateList();

string FileIndex[100];
string ocxfile;
int i;





__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
UpdateList();
}


void __fastcall TForm1::ButtonRegisterClick(TObject *Sender)
{
  bool FailIfExists = true;

	if (chkOverwrite->Checked == true) {FailIfExists = false;}

	for (i = 0; i < OcxList->Items->Count; i++) { //Do registration process for each file in list

	   if (OcxList->Items->operator [](i)->Checked == true)  { //Copy and register only if item is checked

		   string ocxname = string((OcxList->Items->operator [](i)->Caption).t_str());
		   ocxfile   = string(getenv("WinDir")) + "\\system32\\" + ocxname;

		   CopyFile(ocxname.c_str(), ocxfile.c_str(), FailIfExists);
		   ShellExecute(this->Handle, "open", "regsvr32.exe ", ("\"" + ocxfile + "\"").c_str(), NULL, SW_HIDE);

	   }

	}

  UpdateList();

}


void __fastcall TForm1::ButtonUnregisterClick(TObject *Sender)
{
	for (i = 0; i < OcxList->Items->Count; i++) { //Do unregistration process for each file in list

	   if (OcxList->Items->operator [](i)->Checked == true) { //unegister only if item is checked

		   string ocxname = string((OcxList->Items->operator [](i)->Caption).t_str());
		   ocxfile        = string(getenv("WinDir")) + "\\system32\\" + ocxname;

		   ShellExecute(NULL, "open", "regsvr32.exe ", ("-u \"" + ocxfile + "\"").c_str(), NULL, SW_HIDE);
	   }

	}

  UpdateList();

}




bool fileexists(const char *FileName)
{
FILE *fp;
fp=fopen(FileName,"r");
if (fp == NULL) {return false;}
else {return true;}
}



int dir(const char *szDir, string szFiles)
//return -1 if directory not found else number of files in dir
{
	char path[MAX_PATH];
	WIN32_FIND_DATA fd;

	sprintf( path,("%s\\" + szFiles).c_str(), szDir);
	HANDLE hFind = FindFirstFile( path, &fd);
	if(hFind != INVALID_HANDLE_VALUE)
	{
		int count = 0;
		  do
		  {
			puts( fd.cFileName);
			count = count + 1;
			FileIndex[count] = fd.cFileName;
		  }
		  while( FindNextFile( hFind, &fd));
			FindClose( hFind);

		return count;
	}
	return -1;
}



void UpdateList()

{ char AppPath[MAX_PATH];

  getcwd(AppPath, MAX_PATH); //Get current working directory

  Form1->OcxList->Clear();

  int count = dir(AppPath, "*.ocx");

	for (i = 1; i< count+1 ; i++)
	{
	  TListItem *CurrentItem;
	  CurrentItem = Form1->OcxList->Items ->Add();
	  CurrentItem->Caption = UnicodeString(FileIndex[i].c_str());
	  CurrentItem->Checked = true;

	  ocxfile = string(getenv("WinDir")) + "\\system32\\" + FileIndex[i];

		if (fileexists(ocxfile.c_str()) == true)
		   { CurrentItem->SubItems->Add("Yes");}
		else
		   { CurrentItem->SubItems->Add("No"); }

	}
}




void __fastcall TForm1::InfoButtonClick(TObject *Sender)
{
char InfoText[] = {"version 1.0 Open Source \r\n \r\n Author: Viotto \r\n Official website: viotto-security.net \r\n Coded in C++ \r\n \r\n Do you want to visit the official website?"};
if (MessageBoxA(this->Handle, InfoText, "Viotto ocx Registrator", MB_YESNO + MB_ICONINFORMATION) == IDYES)
{ShellExecuteA(this->Handle, "open", "www.viotto-security.net", NULL, NULL, SW_SHOWNORMAL);}
}

void __fastcall TForm1::RefreshClick(TObject *Sender)
{
UpdateList();
}

