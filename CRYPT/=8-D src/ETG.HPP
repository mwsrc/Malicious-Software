
////////x///////x///////x///////x///////x///////x///////x///////x///////x////
// ETG 2.00 engine
////////x///////x///////x///////x///////x///////x///////x///////x///////x////

#ifndef __ETG_BIN_HPP__
#define __ETG_BIN_HPP__

#define ETG_MOVRR       0x00000001
#define ETG_MOVRC       0x00000002
#define ETG_MOVSXZX     0x00000004
#define ETG_XCHG        0x00000008
#define ETG_LEA         0x00000010
#define ETG_TTTRR       0x00000020
#define ETG_TTTRC       0x00000040
#define ETG_INCDEC      0x00000080
#define ETG_NOTNEG      0x00000100
#define ETG_TESTRR      0x00000200
#define ETG_TESTRC      0x00000400
#define ETG_IMUL        0x00000800
#define ETG_SHIFT       0x00001000
#define ETG_SHxD        0x00002000
#define ETG_BSWAP       0x00004000
#define ETG_XADD        0x00008000
#define ETG_BSx         0x00010000
#define ETG_BTx         0x00020000
#define ETG_JMPS        0x00040000
#define ETG_SEG         0x00080000
#define ETG_REP         0x00100000
#define ETG_ALL         0x001FFFFF
#define ETG_DEFAULT     ETG_TTTRC       // used if no cmds specified

#define REG_EAX         0x00000001
#define REG_ECX         0x00000002
#define REG_EDX         0x00000004
#define REG_EBX         0x00000008
#define REG_ESP         0x00000010
#define REG_EBP         0x00000020
#define REG_ESI         0x00000040
#define REG_EDI         0x00000080
#define REG_ALL         ((~REG_ESP)&0xFF)
#define REG_DEFAULT     REG_EAX         // used if no regs specified

typedef
void __cdecl etg_engine(
                DWORD   user_param,             // user-parameter
                DWORD   cmd_avail,              // set of ETG_xxx
                DWORD   regsrcavail,            // set of REG_xxx
                DWORD   regdstavail,            // set of REG_xxx
                DWORD*  osizeptr,               // ptr to generated bufsize
                DWORD   ncmds,                  // max number of commands
                DWORD   bufsize,                // max size of buffer
                BYTE*   buf,                    // ptr to output buffer
                DWORD __cdecl user_random(DWORD userdata, DWORD range)
                );

#endif // __ETG_BIN_HPP__
