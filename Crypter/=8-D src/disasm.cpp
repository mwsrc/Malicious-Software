
 // LDE32 interface
#include <windows.h>

#define DISASM_ERROR    0xFFFFFFFF

extern "C"
{
DWORD __cdecl disasm_main(const BYTE*);   // length-disassembler interface
}

DWORD __cdecl disasm(DWORD,const BYTE* x)
{
  return disasm_main(x);
}
