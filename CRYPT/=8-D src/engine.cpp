/*
===============================
===============================
== smi²le Permutation Engine ==
=========== by b0b ============
===============================
===============================

+v1.0 (11/2008)
Pretty much just a recode of z0mbie's Real Permutation Engine since his shit fucks up a lot (A LOT), but its still an awesome idea so I tried to fix it.
*Added ETG engine (also by z0mbie) to add random junk code.
*Also ripped some of the mutatable instructions from RPME & Code Pervertor 2&3 for the Mutate() function & added a few new ones.

+v1.1 (01/2009)
*Added a shitload more instructions to Mutate() function. Results are more polymorphic now.

Stuff left to do:
-polymorphic loop generator.
-fix AddTrash() so that it sucks less.

== What do it does? ==
smi²le will disassemble a block of code into a list of opcode information.
Using that list the engine can:

+add trash/junk code
+add random jmps to code
+mutate instructions

When reassembling, the instructions are written to a buffer in random(ish) offsets
and linked together with jmps.

This means you can take a block of code and (per)mutate and/or add junk until it is unrecognizable,
then write to a buffer (maybe already filled with random data ;D) to make code appear 100% different
and obfuscated.

Can you dig it?

== How to make it does what it do? ==

void pseudo-example()
{
	if (smi2le::Disasm() == ERR_SUCCESS)
	{
		for (as_long_as_you_feel_like_it)
		{
			if (smi2le::AddTrash())
				break;
			if (smi2le::Permutate())
				break;
			if (smi2le::Mutate())
				break;

			//any other shit you add to the engine.

		}

		if (smi2le::Asm() == ERR_SUCCES)
		{
			do_stuff();
		}
	}
}
*/

//#define DEBUG_DUMP_OPLIST

#ifdef DEBUG_DUMP_OPLIST
#include <stdio.h>
#endif

#include "disasm.cpp" //lde32

#include "etg.hpp" //executable trash generator
#include "etg.cpp"

#define MAXCMDLEN 16

#define ERR_SUCCESS 0
#define ERR_BAD_PARAM 1
#define ERR_NO_MEM 2
#define ERR_DISASM 3
#define ERR_MORE_MEM 4
#define ERR_TRY_AGAIN 5

#define M_NONE 0
#define M_DONE 1
#define M_TODO 2


#define MAX_ATTEMPTS 10000


#pragma pack(1)
struct oplist
{
	unsigned char op[MAXCMDLEN]; //stored instruction
	unsigned short len; //instruction length
	unsigned long ofs; //offset of instruction in buffer (only used by Disasm and Asm)
	unsigned char asmFlag; //flag is set if op has been assembled (only used by Asm)
	oplist* ref; //if this instruction refers to another in the list, this will store a ptr to that oplist
	oplist* flow; //next instruction.
	oplist* next; //next list entry.
};
#pragma pack()

/*

oplist is a linked list of length disassembled opcodes.

  op = raw bytes for opcode
  len = length of op, in bytes
  ofs = used by Disasm & Asm, holds relative offset of instruction
  asmFlag = used by map_asm to mark instructions as assembled
  ref = if instruction is a jmp/jcc/loop/call then ref is the oplist that is referred to by this instruction, otherwise ref is null
  flow = if instruction is not a jmp/ret then flow will be the next oplist in execution, otherwise it will be null
  next = next oplist entry in list. null if @ end of list

*/

const BYTE r2s[] = { 
	0/*eax*/, 
	1/*ecx*/, 
	2/*edx*/, 
	3/*ebx*/, 
//	4/*esp*/, 
//	5/*ebp*/, 
	6/*esi*/, 
	7/*edi*/ };

class smi2le
{
public:
	smi2le(unsigned int seed) { map = NULL; op_root = NULL; srand(seed); }
	~smi2le() { if (map) free(map); if (op_root) destroy_opcodes(); }

	int Disasm(const unsigned char *lpInBuff, const unsigned long dwInSize, const unsigned long dwEntry); //disasm's into a list of opcodes.
	int Permutate(const unsigned short jmpChance); //adds random jmps to opcode list (1 in jmpChance % chance of inserting a jmp @ any instruction currently in oplist).
	int AddTrash(const unsigned short wCycles, const unsigned short wMinSize, const unsigned short wMaxSize, const bool bRemovenops);
	int Mutate(unsigned short mutChance); //mutate instructions. 1 in mutChance % chance of mutating an instruction if it can be mutated.
	int Asm(unsigned char *lpOutBuff, const unsigned long dwOutSize, unsigned long *dwOutEP); //assembles oplist into a buffer.
	unsigned long MinBuffSize();
	static unsigned long __cdecl my_rand(unsigned long fp, unsigned long range); //ETG requires an external rand function..
private:
	
	static oplist *addsubOps(unsigned char r, unsigned char type, unsigned long origValue, oplist *next, unsigned short min, unsigned short max);
	void destroy_opcodes();
	long bound_distance(unsigned long n, unsigned long size);
	int map_asm(unsigned long dwEP);

	unsigned char *map;
	unsigned long mapsize;
	oplist *op_root;
};




unsigned long smi2le::my_rand(unsigned long fp, unsigned long range)
{
	if (range)
		return rand() % range;
	else
		return 0;
}




void smi2le::destroy_opcodes()
{
	oplist *op_iter, *i;

	for (op_iter = op_root; op_iter; op_iter = i)
	{
		i = op_iter->next;
		free(op_iter);
	}

	op_root = NULL;
}




unsigned long smi2le::MinBuffSize()
{
	oplist *op_iter;
	unsigned long ret = 0;

	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		ret += op_iter->len;
	}

	return ret;
}



//basically just generates a bunch of add/sub ops.
//so that an instruction like "add eax, 1234" will turn into "add eax, 54321 -> sub eax, 6754 -> sub eax, 46333" or something
//it seemed like a cool idea.
oplist *smi2le::addsubOps(unsigned char r, unsigned char type, unsigned long origValue, oplist *next, unsigned short min, unsigned short max)
//r = destination register.(only last 3 bits should be set, higher 5 will be ignored anyway)
//type = false for sub, true for add
//origValue = original value that should be add/sub'd
//next = next in oplist
//min = min # of instructions
//max = max # of instructions
{
	oplist *ret, *templist;
	unsigned long v = 0, n;
	bool addsub;

	ret = (oplist*)malloc(sizeof(oplist));
	if (!ret)
		return (oplist*)ERR_NO_MEM;

	r &= 7;

	memset(ret, 0, sizeof(oplist));

	templist = ret;

	while (max--)
	{
		if (my_rand(0, 2))
			addsub = true;
		else
			addsub = false;

		templist->len = 6;

		templist->op[0] = 0x81;
		templist->op[1] = 0xC0 | (addsub ? 0 : 0x28) | r;
		//random 32bit value in op[2]
		n = my_rand(0, 0xFFFF0000);
		*(DWORD*)&templist->op[2] = n;

		if (addsub)
			v += n;
		else
			v -= n;

		templist->flow = (oplist*)malloc(sizeof(oplist));
		if (!templist->flow)
			return (oplist*)ERR_NO_MEM;

		memset(templist->flow, 0, sizeof(oplist));

		templist->next = templist->flow;
		templist = templist->flow;

		if (min)
			min--;
		else
		{
			if (!my_rand(0, 3))
				break;
		}
	}

	//fix v to = origValue.
	templist->len = 6;
	templist->op[0] = 0x81;

	if (type)
	{
		//add
		if (v > origValue)
		{
			//sub v - origValue
			templist->op[1] = 0xE8 | r;
			*(DWORD*)&templist->op[2] = v - origValue;
		}
		else
		{
			//add origValue - v
			templist->op[1] = 0xC0 | r;
			*(DWORD*)&templist->op[2] = origValue - v;
		}
	}
	else
	{
		//sub
		templist->op[1] = 0xE8 | r;
		if (v + origValue < v)
		{
			//sub r, v
			//sub origValue
			*(DWORD*)&templist->op[2] = v;

			templist->flow = (oplist*)malloc(sizeof(oplist));
			if (!templist->flow)
				return (oplist*)ERR_NO_MEM;

			memset(templist->flow, 0, sizeof(oplist));

			templist->next = templist->flow;
			templist = templist->flow;

			templist->len = 6;
			templist->op[0] = 0x81;
			templist->op[1] = 0xE8 | r;
			*(DWORD*)&templist->op[2] = origValue;
		}
		else
			//sub r, v + origValue
			*(DWORD*)&templist->op[2] = v + origValue;
	}

	templist->flow = next;
	templist->next = next;

	return ret;
}




int smi2le::Mutate(unsigned short mutChance)
{
	oplist *op_iter, *it2, *it3, *it4;
	unsigned long i;

	if (!mutChance)
		return ERR_BAD_PARAM;

	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		if (op_iter->len == 1)
		{
			//-xchg eax, r
			//+push eax
			//+push r
			//+pop eax
			//+pop r
			//or
			//+push r2
			//+mov r2, eax
			//+mov eax, r
			//+mov r, r2
			//+pop r2
			//or
			//+xchg eax, r (2 byte instruction)
			//or
			//+xchg r, r2
			//+xchg r2, eax
			//+xchg r, r2
			if (op_iter->op[0] >> 3 == 0x12 && !my_rand(0, mutChance))
			{
				oplist *it5;
				BYTE d;

				d = op_iter->op[0] & 7;

				switch (my_rand(0, 4))
				{
					case 0:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it2);
							free(it3);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50;
						op_iter->flow = it3;
						op_iter->next = it3;

						it3->len = 1;
						it3->op[0] = 0x50 | d;
						it3->next = it4;
						it3->flow = it4;

						it4->len = 1;
						it4->op[0] = 0x58;
						it4->flow = it2;
						it4->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | d;

						op_iter = it2;

						break;

					case 1:

						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (r2s[i] != 0 && r2s[i] != d)
								break;
						}

						if (i == sizeof(r2s) / sizeof(BYTE))
							break;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it2);
							free(it3);
							return ERR_NO_MEM;
						}

						it5 = (oplist*)malloc(sizeof(oplist));
						if (!it5)
						{
							free(it2);
							free(it3);
							free(it4);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memset(it5, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50 | r2s[i];
						op_iter->flow = it3;
						op_iter->next = it3;

						it3->len = 2;
						it3->op[0] = 0x89;
						it3->op[1] = 0xC0 | r2s[i];
						it3->flow = it4;
						it3->next = it4;

						it4->len = 2;
						it4->op[0] = 0x89;
						it4->op[1] = 0xC0 | (d << 3);
						it4->flow = it5;
						it4->next = it5;

						it5->len = 2;
						it5->op[0] = 0x89;
						it5->op[1] = 0xC0 | (r2s[i] << 3) | d;
						it5->flow = it2;
						it5->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | r2s[i];

						op_iter = it2;

						break;

					case 2:

						op_iter->len = 2;
						op_iter->op[0] = 0x87;
						op_iter->op[1] = 0xC0 | (my_rand(0, 2) ? (d << 3) : d);

						break;

					case 3:

						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (r2s[i] != 0 && r2s[i] != d)
								break;
						}
						if (i == sizeof(r2s) / sizeof(BYTE))
							break;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 2;
						op_iter->op[0] = 0x87;
						op_iter->op[1] = 0xC0 | (d << 3) | r2s[i];
						op_iter->flow = it3;
						op_iter->next = it3;

						it3->len = 1;
						it3->op[0] = 0x90 | r2s[i];
						it3->flow = it2;
						it3->next = it2;

						it2->len = 2;
						it2->op[0] = 0x87;
						it2->op[1] = 0xC0 | (d << 3) | r2s[i];

						op_iter = it2;

						break;
				}

				continue;
			}
		}

		if (op_iter->len == 2)
		{
			//- 10001011 11100101		; mov esp,ebp
			//  01011101				; pop ebp
			//+ 11001001				; leave

			if (op_iter->op[0] == 0x8B && op_iter->op[1] == 0xE5 && !my_rand(0, mutChance))
			{
				for (it2 = op_iter->flow; it2;)
				{
					if (it2->len == 1 && it2->op[0] == 0x5D)
					{
						it2->op[0] = 0xC9;

						memcpy(op_iter, it2, sizeof(oplist));
						free(it2);
						break;
					}
					else
					{
						if (it2->ref && !it2->flow)
						{
							it2 = it2->ref;
						}
						else
							it2 = NULL;
					}
				}
				if (it2)
					continue;
			}

			if ((op_iter->op[1] & 0xC0) == 0xC0)
			{
				if ((op_iter->op[0] & 0xFD) == 0x89 && !my_rand(0, mutChance))
				{
					// - 10001001 11xxxyyy		; mov r1,r2
					// + 01010xxx				; push r2
					//   01011yyy				; pop r1
					//or
					// - 10001011 11xxxyyy		; mov r1,r2
					// + 01010yyy				; push r2
					//	 01011xxx				; pop r1
					unsigned char t = op_iter->op[0];

					it2 = (oplist*)malloc(sizeof(oplist));
					if (!it2)
						return ERR_NO_MEM;

					memcpy(it2, op_iter, sizeof(oplist));

					op_iter->len = 1;
					op_iter->op[0] = 0x50 | ((op_iter->op[1] >> (t == 0x89 ? 3 : 0)) & 7);
					op_iter->flow = it2;
					op_iter->next = it2;

					it2->len = 1;
					it2->op[0] = 0x58 | ((op_iter->op[1] >> (t == 0x89 ? 0 : 3)) & 7);

					op_iter = it2;
					continue;
				}


				// - 00ttt001 11xxxyyy     ; ttt r1,r2 (ADD,ADC,AND,OR,SUB,SBB,XOR,CMP)
				// + 00ttt011 11yyyxxx
				// - 10001001 11xxxyyy     ; mov r1,r2
				// + 10001011 11yyyxxx		
				if (((op_iter->op[0] == 0x89 || op_iter->op[0] == 0x8B) || (!(op_iter->op[0] & 0xC0) && (op_iter->op[0] & 7) == 1 && (op_iter->op[0] & 7) == 3)))
				{
					op_iter->op[0] ^= 0x02;
					op_iter->op[1] = 0xC0 | ((op_iter->op[1] >> 3) & 7) | ((op_iter->op[1] & 7) << 3);
					continue;
				}


				//if (xxx==yyy)
				//- 001100xx 11xxxyyy     ; xor r1,r1
				//+ 001010xx 11xxxyyy     ; sub r1,r1
				if ((op_iter->op[0] & 0xFC) == 0x30 || (op_iter->op[0] & 0xFC) == 0x28)
				{
					if (((op_iter->op[1] >> 3 ) & 7) == (op_iter->op[1] & 7) && !my_rand(0, mutChance))
					{
						op_iter->op[0] ^= 0x18;
						continue;
					}
				}


				//if (xxx==yyy)
				//- 0000100x 11xxxyyy     ; or r1,r1
				//+ 1000010x 11xxxyyy     ; test r1,r1
				if (((op_iter->op[0] & 0xFE) == 0x08 || (op_iter->op[0] & 0xFE) == 0x84) && ((op_iter->op[1] >> 3) & 7) == (op_iter->op[1] & 7) && !my_rand(0, mutChance))
				{
					op_iter->op[0] ^= 0x8C;
					continue;
				}

				
				//sub r1, r2 -> 00101001 11abcxyz (abc = r2, xyz = r1)
				if (op_iter->op[0] == 0x29 && !my_rand(0, mutChance))
				{
					BYTE r1, r2;
					
					r1 = op_iter->op[1] & 7;
					r2 = (op_iter->op[1] >> 3) & 7;

					//sub r, r
					if (r1 == r2)
					{
						if (my_rand(0, 2))
						{
							//mov r1, 0
							op_iter->len = 5;
							op_iter->op[0] = 0xB8 | r1;
							*(DWORD*)&op_iter->op[1] = 0;
						}
						else
						{
							//or
							//xor r1, r1
							op_iter->len = 2;
							op_iter->op[0] = 0x31;
							op_iter->op[1] = 0xC0 | (r1 << 3) | r1;
						}

					}
					else
					{
						//push r3
						//mov r3, r2
						//sub r1, r3
						//pop r3

						//or 

						//push r3
						//mov r3, r1
						//sub r3, r2
						//mov r1, r3
						//pop r3

						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (r2s[i] != r1 && r2s[i] != r2)
								break;
						}
						if (i == sizeof(r2s) / sizeof(BYTE))
							continue;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it2);
							free(it3);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						if (my_rand(0, 2))
						{
							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 2;
							it3->op[0] = 0x89;
							it3->op[1] = 0xC0 | (r2 << 3) | r2s[i];
							it3->flow = it4;
							it3->next = it4;

							it4->len = 2;
							it4->op[0] = 0x29;
							it4->op[1] = 0xC0 | (r2s[i] << 3) | r1;
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];
						}
						else
						{
							oplist *it5;

							it5 = (oplist*)malloc(sizeof(oplist));
							if (!it5)
							{
								memcpy(op_iter, it2, sizeof(oplist));
								free(it2);
								free(it3);
								free(it4);
								return ERR_NO_MEM;
							}

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 2;
							it3->op[0] = 0x89;
							it3->op[1] = 0xC0 | (r1 << 3) | r2s[i];
							it3->flow = it4;
							it3->next = it4;

							it4->len = 2;
							it4->op[0] = 0x29;
							it4->op[1] = 0xC0 | (r2 << 3) | r2s[i];
							it4->flow = it5;
							it4->next = it5;

							it5->len = 2;
							it5->op[0] = 0x89;
							it5->op[1] = 0xC0 | (r2s[i] << 3) | r1;
							it5->flow = it2;
							it5->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];
						}

						op_iter = it2;
					}
					continue;
				}

				//-xchg r1, r2
				//+xchg r2, r1
				//or
				//+push r1
				//+push r2
				//+pop r1
				//+pop r2
				//or
				//+push r3
				//+mov r3, r1
				//+mov r1, r2
				//+mov r2, r3
				//+pop r3
				//or
				//+xchg r3, r2
				//+xchg r1, r3
				//+xchg r2, r3
				if (op_iter->op[0] == 0x87 && !my_rand(0, mutChance))
				{
					oplist *it5;
					BYTE d1, d2;

					d1 = op_iter->op[1] & 7;
					d2 = (op_iter->op[1] >> 3) & 7;

					switch (my_rand(0, 4))
					{
						case 0:

							op_iter->op[1] = 0xC0 | (d1 << 3) | d2;

							break;

						case 1:
							
							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | d1;
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 1;
							it3->op[0] = 0x50 | d2;
							it3->flow = it4;
							it3->next = it4;

							it4->len = 1;
							it4->op[0] = 0x58 | d1;
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | d2;

							op_iter = it2;

							break;

						case 2:

							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != d1 && r2s[i] != d2)
									break;
							}
							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							it5 = (oplist*)malloc(sizeof(oplist));
							if (!it5)
							{
								free(it2);
								free(it3);
								free(it4);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memset(it5, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 2;
							it3->op[0] = 0x89;
							it3->op[1] = 0xC0 | (d1 << 3) | r2s[i];
							it3->flow = it4;
							it3->next = it4;

							it4->len = 2;
							it4->op[0] = 0x89;
							it4->op[1] = 0xC0 | (d2 << 3) | d1;
							it4->flow = it5;
							it4->next = it5;

							it5->len = 2;
							it5->op[0] = 0x89;
							it5->op[1] = 0xC0 | (r2s[i] << 3) | d2;
							it5->flow = it2;
							it5->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];

							op_iter = it2;

							break;

						case 3:

							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != d1 && r2s[i] != d2)
									break;
							}
							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 2;
							op_iter->op[0] = 0x87;
							op_iter->op[1] = 0xC0 | (r2s[i] << 3) | d2;
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 2;
							it3->op[0] = 0x87;
							it3->op[1] = 0xC0 | (d1 << 3) | r2s[i];
							it3->flow = it2;
							it3->next = it2;

							it2->len = 2;
							it2->op[0] = 0x87;
							it2->op[1] = 0xC0 | (d2 << 3) | r2s[i];

							op_iter = it2;

							break;
					}
					continue;
				}
			}


			//- mov [r1], r2 -> 10001001 00xxxyyy
			//+ push r2 -> 01010xxx
			//+ pop [r1] -> 10001111 000000yyy
			//or
			//- mov r1, [r2] -> 10001011 00xxxyyy
			//+ push [r2] -> 11111111 00110yyy
			//+ pop r1 -> 01011xxx
			if ((op_iter->op[0] & 0xFD) == 0x89 && !my_rand(0, mutChance) && (op_iter->op[1] & 0xC0) == 0)
			{
				BYTE d, s;

				it2 = (oplist*)malloc(sizeof(oplist));
				if (!it2)
					return ERR_NO_MEM;

				memcpy(it2, op_iter, sizeof(oplist));

				op_iter->next = it2;
				op_iter->flow = it2;

				if (op_iter->op[0] == 0x89)
				{
				//-mov [r1], r2 -> 10001001 00xxxyyy

				//+push r2
				//+pop [r1]
					d = op_iter->op[1] & 7;
					s = op_iter->op[1] >> 3;

					op_iter->len = 1;
					op_iter->op[0] = 0x50 | s;

					it2->len = 2;
					it2->op[0] = 0x8F;
					it2->op[1] = 0x00 | d;
				}
				else
				{
				//-mov r1, [r2] -> 10001011 00xxxyyy

				//+push [r2]
				//+pop r1

					d = op_iter->op[1] >> 3;
					s = op_iter->op[1] & 7;

					op_iter->len = 2;
					op_iter->op[0] = 0xFF;
					op_iter->op[1] = 0x30 | s;

					it2->len = 1;
					it2->op[0] = 0x58 | d;
				}

				op_iter = it2;
				continue;
			}
		}

		if (op_iter->len == 3)
		{
			//- 10000011 11001abc		; or      r, -1
			//  11111111
			//+ 00110011 11abcabc		; xor     r, r
			//  01001abc				; dec     r
			if (op_iter->op[1] == 0x83 && (op_iter->op[1] & 0xC8) == 0xC8 && op_iter->op[2] == 0xFF && !my_rand(0, mutChance))
			{
				it2 = (oplist*)malloc(sizeof(oplist));
				if (!it2)
					return ERR_NO_MEM;

				memcpy(it2, op_iter, sizeof(oplist));

				op_iter->flow = it2;
				op_iter->next = it2;
				
				it2->len = 1;
				it2->op[0] = 0x48 | (op_iter->op[1] & 7);

				op_iter->len = 2;
				op_iter->op[0] = 0x31;
				op_iter->op[1] = 0xC0 | (op_iter->op[1] & 7) | ((op_iter->op[1] & 7) << 3);

				continue;
			}


			//add/sub r, #(8bit) -> 10000011 11abcxyz (xyz = r, abc = add or sub)
			//to
			//add/sub
			//add/sub
			//...
			if (op_iter->op[0] == 0x83 && (op_iter->op[1] & 0xC0) == 0xC0)
			{
				DWORD v;
				oplist *n, *t;

				v = (DWORD)(*(BYTE*)&op_iter->op[2]);
				if (op_iter->op[1] >> 3 == 0x18) //add
				{
					if (!my_rand(0, mutChance))
					{
						n = op_iter->next;
						t = addsubOps(op_iter->op[1] & 7, 1, v, n, 2, 5);
						if (t && t != (oplist*)ERR_NO_MEM)
						{
							memcpy(op_iter, t, sizeof(oplist));
							free(t);
							op_iter = n;
						}
					}
				}
				else
				{
					if (op_iter->op[1] >> 3 == 0x1D) //sub
					{
						if (!my_rand(0, mutChance))
						{
							n = op_iter->next;
							t = addsubOps(op_iter->op[1] & 7, 0, v, n, 2, 5);
							if (t && t != (oplist*)ERR_NO_MEM)
							{
								memcpy(op_iter, t, sizeof(oplist));
								free(t);
								op_iter = n;
							}
						}
					}
				}

				continue;
			}
			if (op_iter->op[0] == 0x8B)
			{
				//-mov dest, dword ptr [src + n(8bit, signed)] -> 10001011 01abcxyz n (abc = dest, xyz = src)

				//+sub dest, dest -> 00101001 11abcabc
				//+add/sub dest, n
				//+mov dest, dword ptr [src + dest] -> 10001011 00abc100 00xyzabc

				//or

				//+push src -> 01010xyz
				//+add/sub src, n
				//+mov dest, [src] -> 10001011 00abcxyz
				//+pop src -> 01011xyz

				//or
				
				//+push dword ptr [src + n] -> 11111111 01110xyz n
				//+pop dest -> 01011abc
				if ((op_iter->op[1] & 0x40) == 0x40)
				{
					if (!my_rand(0, mutChance))
					{
						BYTE d, s;

						d = (op_iter->op[1] >> 3) & 7;
						s = op_iter->op[1] & 7;

						switch (my_rand(0, 3))
						{
							case 0:

								if (s != d)
								{
									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;
									
									memcpy(it2, op_iter, sizeof(oplist));

									if ((signed char)op_iter->op[2] >= 0)
										op_iter->flow = addsubOps(d, 1, (DWORD)op_iter->op[2], it2, 2, 4);
									else
										op_iter->flow = addsubOps(d, 0, ((BYTE)0xFF - op_iter->op[2]) + 1, it2, 2, 4);
									if (!op_iter->flow || op_iter->flow == (oplist*)ERR_NO_MEM)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									op_iter->len = 2;
									op_iter->op[0] = 0x29;
									op_iter->op[1] = 0xC0 | (d << 3) | d;
									op_iter->next = op_iter->flow;


									it2->len = 3;
									it2->op[0] = 0x8B;
									it2->op[1] = (d << 3) | 4;
									it2->op[2] = (s << 3) | d;

									op_iter = it2;
								}

								break;

							case 1:

								if (s != d && s != 5)
								{

									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									it3 = (oplist*)malloc(sizeof(oplist));
									if (!it3)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									memset(it3, 0, sizeof(oplist));
									memcpy(it2, op_iter, sizeof(oplist));


									op_iter->len = 1;
									op_iter->op[0] = 0x50 | s;
									op_iter->flow = addsubOps(s, 1, (DWORD)op_iter->op[2], it3, 2, 5);
									if (!op_iter->flow || op_iter->flow == (oplist*)ERR_NO_MEM)
									{
										free(it3);
										memcpy(op_iter, it2, sizeof(oplist));
										free(it2);
										return ERR_NO_MEM;
									}
									op_iter->next = op_iter->flow;

/*									if (s == 5) //wtf? crashes.
									{
										it3->len = 3;
										it3->op[0] = 0x8B;
										it3->op[1] = 0x40 | (d << 3) | s;
										it3->op[2] = 0;
									}
									else
									{*/
										it3->len = 2;
										it3->op[0] = 0x8B;
										it3->op[1] = (d << 3) | s;
//									}

									it3->flow = it2;
									it3->next = it2;

									it2->len = 1;
									it2->op[0] = 0x58 | s;

									op_iter = it2;
								}

								break;

							case 2:

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 3;
								op_iter->op[0] = 0xFF;
								op_iter->op[1] = 0x70 | s;
//								op_iter->op[2] = op_iter->op[2];
								op_iter->flow = it2;
								op_iter->next = it2;

								it2->len = 1;
								it2->op[0] = 0x58 | d;

								op_iter = it2;

								break;
						}

						continue;
					}
				}
				else
				{
					//-mov dest, dword ptr [src1 + src2] -> 10001011 00abc100 00xyz123 (abc = dest, xyz = src1, 123 = src2)

					//+push src1 -> 01010xxx
					//+add src1, src2 -> 00000001 11xxxyyy (xxx = r2, yyy = r1)
					//+mov dest, dword ptr[src1] -> 10001011 00abcxxx (abc = dest, xxx = r2)
					//+pop src1 -> 01011xxx

					//or

					//+mov dest, src1 -> 10001001 11xxxabc
					//+?add dest, src2 -> 00000001 11yyyabc (if you do the add then next instruction would be mov dest, [dest]
					//+mov dest, dword ptr [src1|2 + dest] -> 10001011 00abc100 00yyyabc

					//or

					//+push dword ptr [src1 + src2] -> 11111111 00110100 00xyz123
					//+pop dest -> 01011abc
					
					//or

					//+mov dest, dword ptr [src2 + src1]
					if ((op_iter->op[1] & 0xC0) == 0 && (op_iter->op[1] & 7) == 4 && (op_iter->op[2] & 0xC0) == 0 && !my_rand(0, mutChance))
					{
						BYTE d, s1, s2;

						d = (op_iter->op[1] >> 3) & 7;
						s2 = op_iter->op[2] & 7;
						s1 = (op_iter->op[2] >> 3) & 7;
						

						switch (my_rand(0, 4))
						{
							case 0:

								if (s1 != d && s2 != d)
								{

									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									it3 = (oplist*)malloc(sizeof(oplist));
									if (!it3)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									it4 = (oplist*)malloc(sizeof(oplist));
									if (!it4)
									{
										free(it3);
										free(it2);
										return ERR_NO_MEM;
									}

									memset(it3, 0, sizeof(oplist));
									memset(it4, 0, sizeof(oplist));

									memcpy(it2, op_iter, sizeof(oplist));

									op_iter->len = 1;
									op_iter->op[0] = 0x50 | s1;
									op_iter->flow = it3;
									op_iter->next = it3;

									it3->len = 2;
									it3->op[0] = 1;
									it3->op[1] = 0xC0 | (s2 << 3) | s1;
									it3->flow = it4;
									it3->next = it4;

									if (s1 == 5)
									{
										it4->len = 3;
										it4->op[0] = 0x8B;
										it4->op[1] = 0x40 | (d << 3) | s1;
										it4->op[2] = 0;
									}
									else
									{
										it4->len = 2;
										it4->op[0] = 0x8B;
										it4->op[1] = (d << 3) | s1;
									}

									it4->flow = it2;
									it4->next = it2;

									it2->len = 1;
									it2->op[0] = 0x58 | s1;

									op_iter = it2;
								}

								break;

							case 1:

								if (s1 != d && s2 != d)
								{
									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									memcpy(it2, op_iter, sizeof(oplist));

									op_iter->len = 2;
									op_iter->op[0] = 0x89;
									op_iter->op[1] = 0xC0 | (s1 << 3) | d;

									op_iter->flow = it2;
									op_iter->next = it2;

									it2->len = 3;
									it2->op[0] = 0x8B;
									it2->op[1] = (d << 3) | 4;
									it2->op[2] = (d << 3) | s2;

									op_iter = it2;
								}

								break;

							case 2:

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 3;
								op_iter->op[0] = 0xFF;
								op_iter->op[1] = 0x34;
								op_iter->op[2] = (s1 << 3) | s2;
								op_iter->flow = it2;
								op_iter->next = it2;

								it2->len = 1;
								it2->op[0] = 0x58 | d;

								op_iter = it2;
								
								break;

							case 3:

								if (s1 != 5)
									op_iter->op[2] = (s2 << 3) | s1;
						}
						continue;
					}
				}
			}
			
			if (op_iter->op[0] == 0x89)
			{
				//-mov dword ptr [dest + n(8bit, signed)], src -> 10001001 01abcxyz n (abc = src, xyz = dest)

				//+add dest, n
				//+mov dword ptr [dest], src
				//+sub dest, n

				//or

				//+push dest
				//+add dest, n
				//+mov dword ptr [dest], src
				//+pop dest

				//or

				//+push src
				//+pop dword ptr [dest + n]

				//or

				//+push r2
				//+mov r2, dest
				// if n >= 0
				//+add r2, n
				// else
				//+sub r2, 0xFF - n + 1
				// end
				//+mov [r2], src
				//+pop r2

				//or

				//+push dest
				//+add dest, n
				//+mov [dest], src
				//+pop dest
				if ((op_iter->op[1] & 0x40) == 0x40)
				{
					if (!my_rand(0, mutChance))
					{
						oplist *it5;

						BYTE d, s;
						signed char n;

						s = (op_iter->op[1] >> 3) & 7;
						d = op_iter->op[1] & 7;
						n = (signed char)op_iter->op[2];

						switch (my_rand(0, 5))
						{
							case 0:

								if (d != s && d != 5)
								{

									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									it3 = (oplist*)malloc(sizeof(oplist));
									if (!it3)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									memset(it3, 0, sizeof(oplist));
									memcpy(it2, op_iter, sizeof(oplist));

									if (n >= 0)
									{
										op_iter->len = 3;
										op_iter->op[0] = 0x83;
										op_iter->op[1] = 0xC0 | d;
										op_iter->op[2] = n;
									}
									else
									{
										op_iter->len = 3;
										op_iter->op[0] = 0x83;
										op_iter->op[1] = 0xE8 | d;
										op_iter->op[2] = (0xFF - (BYTE)n) + 1;
									}

									op_iter->flow = it3;
									op_iter->next = it3;

/*									if (d == 5)
									{
										it3->len = 3;
										it3->op[0] = 0x89;
										it3->op[1] = 0x40 | (s << 3) | d;
										it3->op[2] = 0;
									}
									else
									{*/
										it3->len = 2;
										it3->op[0] = 0x89;
										it3->op[1] = (s << 3) | d;
//									}

									it3->next = it2;
									it3->flow = it2;

									if (n >= 0)
									{
										it2->len = 3;
										it2->op[0] = 0x83;
										it2->op[1] = 0xE8 | d;
										it2->op[2] = n;
									}
									else
									{
										it2->len = 3;
										it2->op[0] = 0x83;
										it2->op[1] = 0xC0 | d;
										it2->op[2] = (0xFF - (BYTE)n) + 1;
									}

									op_iter = it2;
								}

								break;

							case 1:

								if (d != s)
								{

									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									it3 = (oplist*)malloc(sizeof(oplist));
									if (!it3)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									it4 = (oplist*)malloc(sizeof(oplist));
									if (!it4)
									{
										free(it2);
										free(it3);
										return ERR_NO_MEM;
									}

									memset(it3, 0, sizeof(oplist));
									memset(it4, 0, sizeof(oplist));
									memcpy(it2, op_iter, sizeof(oplist));

									op_iter->len = 1;
									op_iter->op[0] = 0x50 | d;
									op_iter->flow = it3;
									op_iter->next = it3;

									it3->len = 3;
									if (n >= 0)
									{
										it3->op[0] = 0x83;
										it3->op[1] = 0xC0 | d;
										it3->op[2] = n;
									}
									else
									{
										it3->op[0] = 0x83;
										it3->op[1] = 0xE8 | d;
										it3->op[2] = (0xFF - (BYTE)n) + 1;
									}
									it3->flow = it4;
									it3->next = it4;

									if (d == 5)
									{
										it4->len = 3;
										it4->op[0] = 0x89;
										it4->op[1] = 0x40 | (s << 3) | d;
										it4->op[2] = 0;
									}
									else
									{
										it4->len = 2;
										it4->op[0] = 0x89;
										it4->op[1] = (s << 3) | d;

									}

									it4->flow = it2;
									it4->next = it2;

									it2->len = 1;
									it2->op[0] = 0x58 | d;

									op_iter = it2;
								}

								break;

							case 2:

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 1;
								op_iter->op[0] = 0x50 | s;
								op_iter->flow = it2;
								op_iter->next = it2;

								it2->len = 3;
								it2->op[0] = 0x8F;
								it2->op[1] = 0x40 | d;
								it2->op[2] = n;

								op_iter = it2;

								break;

							case 3:

								for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
								{
									if (r2s[i] != d && r2s[i] != s)
										break;
								}
								if (i == sizeof(r2s) / sizeof(BYTE))
									break;

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								it3 = (oplist*)malloc(sizeof(oplist));
								if (!it3)
								{
									free(it2);
									return ERR_NO_MEM;
								}

								it4 = (oplist*)malloc(sizeof(oplist));
								if (!it4)
								{
									free(it2);
									free(it3);
									return ERR_NO_MEM;
								}

								it5 = (oplist*)malloc(sizeof(oplist));
								if (!it5)
								{
									free(it2);
									free(it3);
									free(it4);
									return ERR_NO_MEM;
								}

								memset(it3, 0, sizeof(oplist));
								memset(it4, 0, sizeof(oplist));
								memset(it5, 0, sizeof(oplist));
								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 1;
								op_iter->op[0] = 0x50 | r2s[i];
								op_iter->flow = it3;
								op_iter->next = it3;

								it3->len = 2;
								it3->op[0] = 0x89;
								it3->op[1] = 0xC0 | (d << 3) | r2s[i];
								it3->flow = it4;
								it3->next = it4;

								if (n >= 0)
								{
									it4->len = 3;
									it4->op[0] = 0x83;
									it4->op[1] = 0xC0 | r2s[i];
									it4->op[2] = n;
								}
								else
								{
									it4->len = 3;
									it4->op[0] = 0x83;
									it4->op[1] = 0xE8 | r2s[i];
									it4->op[2] = (0xFF - (BYTE)n) + 1;
								}
								it4->flow = it5;
								it4->next = it5;

								it5->len = 2;
								it5->op[0] = 0x89;
								it5->op[1] = (s << 3) | r2s[i];
								it5->flow = it2;
								it5->next = it2;

								it2->len = 1;
								it2->op[0] = 0x58 | r2s[i];

								op_iter = it2;

								break;

							case 4:

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								it3 = (oplist*)malloc(sizeof(oplist));
								if (!it3)
								{
									free(it2);
									return ERR_NO_MEM;
								}

								it4 = (oplist*)malloc(sizeof(oplist));
								if (!it4)
								{
									free(it2);
									free(it3);
									return ERR_NO_MEM;
								}

								memset(it3, 0, sizeof(oplist));
								memset(it4, 0, sizeof(oplist));
								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 1;
								op_iter->op[0] = 0x50 | d;
								op_iter->flow = it3;
								op_iter->next = it3;

								if (n >= 0)
								{
									it3->len = 3;
									it3->op[0] = 0x83;
									it3->op[1] = 0xC0 | d;
									it3->op[2] = n;
								}
								else
								{
									it3->len = 3;
									it3->op[0] = 0x83;
									it3->op[1] = 0xE8 | d;
									it3->op[2] = (0xFF - (BYTE)n) + 1;
								}
								it3->flow = it4;
								it3->next = it4;

								if (d == 5)
								{
									it4->len = 3;
									it4->op[0] = 0x89;
									it4->op[1] = 0x40 | (s << 3) | d;
									it4->op[2] = 0;
								}
								else
								{
									it4->len = 2;
									it4->op[0] = 0x89;
									it4->op[1] = (s << 3) | d;
								}

								it4->flow = it2;
								it4->next = it2;
								
								it2->len = 1;
								it2->op[0] = 0x58 | d;

								op_iter = it2;

								break;
						}

						continue;
					}
				}
				else
				{
					//-mov dword ptr [dest1 + dest2], src -> 10001001 00abc100 00xyz123 (123 = dest2, xyz = dest1, abc = src)

					//+push dest1
					//+add dest1, dest2
					//+mov dword ptr [dest1], src
					//+pop dest1

					//or
					
					//+mov dword ptr[dest2 + dest1], src

					//or

					//+push src
					//+pop dword ptr[dest1 + dest2]

					//or

					//+push r2
					//+mov r2, dest1
					//+add r2, dest2
					//+mov dword ptr [r2], src
					//+pop r2
					if ((op_iter->op[2] & 7) != 5 && !my_rand(0, mutChance))
					{
						oplist *it5;
						BYTE d1, d2, s;

						s = op_iter->op[1] >> 3;
						d1 = op_iter->op[2] >> 3;
						d2 = op_iter->op[2] & 7;

						switch (my_rand(0, 4))
						{
							case 0:

								if (d1 != s)
								{

									it2 = (oplist*)malloc(sizeof(oplist));
									if (!it2)
										return ERR_NO_MEM;

									it3 = (oplist*)malloc(sizeof(oplist));
									if (!it3)
									{
										free(it2);
										return ERR_NO_MEM;
									}

									it4 = (oplist*)malloc(sizeof(oplist));
									if (!it4)
									{
										free(it2);
										free(it3);
										return ERR_NO_MEM;
									}

									memset(it3, 0, sizeof(oplist));
									memset(it4, 0, sizeof(oplist));
									memcpy(it2, op_iter, sizeof(oplist));

									op_iter->len = 1;
									op_iter->op[0] = 0x50 | d1;
									op_iter->flow = it3;
									op_iter->next = it3;
									
									it3->len = 2;
									it3->op[0] = 1;
									it3->op[1] = (d2 << 3) | d1;
									it3->flow = it4;
									it3->next = it4;

									if (d1 == 5)
									{
										it4->len = 3;
										it4->op[0] = 0x89;
										it4->op[1] = 0x40 | (s << 3) | d1;
										it4->op[2] = 0;
									}
									else
									{
										it4->len = 2;
										it4->op[0] = 0x89;
										it4->op[1] = (s << 3) | d1;
									}
									it4->flow = it2;
									it4->next = it2;

									it2->len = 1;
									it2->op[0] = 0x58 | d1;

									op_iter = it2;
								}

								break;

							case 1:

								if (d1 != 5)
									op_iter->op[2] = (d2 << 3) | d1;

								break;

							case 2:

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 1;
								op_iter->op[0] = 0x50 | s;
								op_iter->flow = it2;
								op_iter->next = it2;

								it2->len = 3;
								it2->op[0] = 0x8F;
								it2->op[1] = 0x04;
								it2->op[2] = (d1 << 3) | d2;

								op_iter = it2;

								break;

							case 3:

								for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
								{
									if (r2s[i] != d1 && r2s[i] != d2 && r2s[i] != s)
										break;
								}
								if (i == sizeof(r2s) / sizeof(BYTE))
									break;

								it2 = (oplist*)malloc(sizeof(oplist));
								if (!it2)
									return ERR_NO_MEM;

								it3 = (oplist*)malloc(sizeof(oplist));
								if (!it3)
								{
									free(it2);
									return ERR_NO_MEM;
								}

								it4 = (oplist*)malloc(sizeof(oplist));
								if (!it4)
								{
									free(it2);
									free(it3);
									return ERR_NO_MEM;
								}

								it5 = (oplist*)malloc(sizeof(oplist));
								if (!it5)
								{
									free(it2);
									free(it3);
									free(it4);
									return ERR_NO_MEM;
								}

								memset(it3, 0, sizeof(oplist));
								memset(it4, 0, sizeof(oplist));
								memset(it5, 0, sizeof(oplist));
								memcpy(it2, op_iter, sizeof(oplist));

								op_iter->len = 1;
								op_iter->op[0] = 0x50 | r2s[i];
								op_iter->flow = it3;
								op_iter->next = it3;

								it3->len = 2;
								it3->op[0] = 0x89;
								it3->op[1] = 0xC0 | (d1 << 3) | r2s[i];
								it3->flow = it4;
								it3->next = it4;

								it4->len = 2;
								it4->op[0] = 1;
								it4->op[1] = 0xC0 | (d2 << 3) | r2s[i];
								it4->flow = it5;
								it4->next = it5;

								it5->len = 2;
								it5->op[0] = 0x89;
								it5->op[1] = (s << 3) | r2s[i];
								it5->flow = it2;
								it5->next = it2;

								it2->len = 1;
								it2->op[0] = 0x58 | r2s[i];

								op_iter = it2;

								break;

						}

						continue;
					}
				}
			}
		}

		if (op_iter->len == 4)
		{
			//-mov r16, n(16bit)
			//if n == 0
			//+xor r, r
			//else
			//+mov r, 0
			//+add r, n

			//or

			//+push n
			//+pop r
			if (op_iter->op[0] == 0x66 && (op_iter->op[1] & 0xB8) == 0xB8 && !my_rand(0, mutChance))
			{
				BYTE d;
				WORD v;

				d = op_iter->op[1] & 7;
				v = *(WORD*)&op_iter->op[2];

				if (*(short*)&op_iter->op[2] == 0)
				{
					op_iter->len = 3;
					
					op_iter->op[0] = 0x66;
					op_iter->op[1] = 0x31;
					op_iter->op[2] = 0xC0 | (d << 3) | d;

					continue;
				}

				switch (my_rand(0, 2))
				{
					case 0:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						switch (my_rand(0, 3))
						{
							case 0:
								//mov r, 0 -> 10111abc 0
								op_iter->len = 4;
								*(WORD*)&op_iter->op[2] = 0;
								break;
							case 1:
								//xor r, r -> 00110001 11abcabc
								op_iter->len = 3;
								op_iter->op[0] = 0x66;
								op_iter->op[1] = 0x31;
								op_iter->op[2] = 0xC0 | (d << 3) | d;
								break;
							case 2:
								//sub r, r -> 00101001 11abcabc
								op_iter->len = 3;
								op_iter->op[0] = 0x66;
								op_iter->op[1] = 0x29;
								op_iter->op[2] = 0xC0 | (d << 3) | d;
						}

						op_iter->next = it2;
						op_iter->flow = it2;

						it2->len = 5;
						it2->op[0] = 0x66;
						it2->op[1] = 0x81;
						it2->op[2] = 0xC0 | d;
						*(WORD*)&it2->op[3] = v;

						op_iter = it2;

						break;

					case 1:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						if (v < 0x80)
						{
							op_iter->len = 3;
							op_iter->op[0] = 0x66;
							op_iter->op[1] = 0x6A;
			//					op_iter->op[2] = op_iter->op[2];
						}
						else
						{
							op_iter->len = 4;
							op_iter->op[0] = 0x66;
							op_iter->op[1] = 0x68;
//							op_iter->op[2] = op_iter->op[2];
						}
						op_iter->flow = it2;
						op_iter->next = it2;

						it2->len = 2;
						it2->op[0] = 0x66;
						it2->op[1] = 0x58 | d;

						op_iter = it2;

						break;
				}

				continue;
			}
		}


		if (op_iter->len == 5)
		{
			//-mov r32, n(32bit)
			//if n == 0
			//+xor r, r
			//else
			//+mov r, 0 / xor r, r / sub r, r
			//+add r, n
			//or
			//+push n
			//+pop r
			if ((op_iter->op[0] & 0xB8) == 0xB8 && !my_rand(0, mutChance))
			{

				BYTE d;
				DWORD v;

				d = op_iter->op[0] & 7;
				v = *(DWORD*)&op_iter->op[1];

				if (*(long*)&op_iter->op[1] == 0)
				{
					op_iter->len = 2;
					op_iter->op[0] = 0x31;
					op_iter->op[1] = 0xC0 | (d << 3) | d;

					continue;
				}

				switch (my_rand(0, 2))
				{
					case 0:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						switch (my_rand(0, 3))
						{
							case 0:
								//mov r, 0 -> 10111abc 0
								op_iter->len = 5;
								*(DWORD*)&op_iter->op[1] = 0;
								break;
							case 1:
								//xor r, r -> 00110001 11abcabc
								op_iter->len = 2;
								op_iter->op[0] = 0x31;
								op_iter->op[1] = 0xC0 | (d << 3) | d;
								break;
							case 2:
								//sub r, r -> 00101001 11abcabc
								op_iter->len = 2;
								op_iter->op[0] = 0x29;
								op_iter->op[1] = 0xC0 | (d << 3) | d;
						}

						op_iter->next = it2;
						op_iter->flow = it2;

						it2->len = 6;
						it2->op[0] = 0x81;
						it2->op[1] = 0xC0 | d;
						*(DWORD*)&it2->op[2] = v;

						op_iter = it2;

						break;

					case 1:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						if (v < 0x80)
						{
							op_iter->len = 2;
							op_iter->op[0] = 0x6A;
						}
						else
						{
							op_iter->len = 5;
							op_iter->op[0] = 0x68;
						}

						op_iter->flow = it2;
						op_iter->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | d;

						op_iter = it2;

						break;
				}

				continue;
			}
		}

		if (op_iter->len == 6)
		{
			//mov eax, fs:[#] -> 01100100 10100001 #(32bit)
			//to
			//mov eax, # -> 10111000 #(32bit)
			//mov eax, fs:[eax] -> 01100100 10001011 00000000
			if (*(WORD*)&op_iter->op[0] == 0xA164 && !my_rand(0, mutChance))
			{
				it2 = (oplist*)malloc(sizeof(oplist));
				if (!it2)
					return ERR_NO_MEM;

				memcpy(it2, op_iter, sizeof(oplist));

				op_iter->next = it2;
				op_iter->flow = it2;

				op_iter->len = 5;
				op_iter->op[0] = 0xB8;
				*(DWORD*)&op_iter->op[1] = *(DWORD*)&it2->op[2];

				it2->len = 3;
				*(WORD*)&it2->op[0] = 0x8B64;
				it2->op[2] = 0;

				op_iter = it2;

				continue;
			}

			//add/sub r, #(32bit) -> 10000011 11abcxyz (xyz = r, abc = add or sub) #(32bit)
			//to
			//add/sub
			//add/sub
			//...
			if (op_iter->op[0] == 0x81 && (op_iter->op[1] & 0xC0) == 0xC0)
			{
				DWORD v;
				oplist *t, *n;

				v = *(DWORD*)&op_iter->op[2];

				if (op_iter->op[1] >> 3 == 0x18) //add
				{
					if (!my_rand(0, mutChance))
					{
						n = op_iter->next;
						t = addsubOps(op_iter->op[1] & 7, 1, v, n, 2, 5);
						if (t && t != (oplist*)ERR_NO_MEM)
						{
							memcpy(op_iter, t, sizeof(oplist));
							free(t);
							op_iter = n;
						}
					}
				}
				else
				{
					if (op_iter->op[1] >> 3 == 0x1D) //sub
					{
						if (!my_rand(0, mutChance))
						{
							n = op_iter->next;
							t = addsubOps(op_iter->op[1] & 7, 0, v, n, 2, 5);
							if (t && t != (oplist*)ERR_NO_MEM)
							{
								memcpy(op_iter, t, sizeof(oplist));
								free(t);
								op_iter = n;
							}
						}
					}
				}

				continue;
			}


			//-mov r, dword ptr [32bit va] -> 10001011 00abc101 addr

			//+sub r, r / mov r, 0 / xor r, r
			//+add/sub r, addr
			//+mov r, dword ptr [r] -> 10001011 00abcxyz (abc = xyz)

			//or

			//+mov r, addr
			//+mov r, [r]

			//or

			//+push dword ptr [addr]
			//+pop r

			//or

			//+push r2
			//+(a)mov r2, 0 / xor / sub
			//+(a)add/sub r2, addr
			//+(b)mov r2, addr
			//+mov r, [r2]
			//+pop r2
			if (op_iter->op[0] == 0x8B && (op_iter->op[1] & 7) == 5 && (op_iter->op[1] & 0xC0) == 0)
			{
				if (!my_rand(0, mutChance))
				{
					BYTE d;
					DWORD v;

					d = op_iter->op[1] >> 3;
					v = *(DWORD*)&op_iter->op[2];

					switch (my_rand(0, 4))
					{
						case 0:

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							memcpy(it2, op_iter, sizeof(oplist));

							switch (my_rand(0, 3))
							{
								case 0:
									// sub r, r
									op_iter->len = 2;
									op_iter->op[0] = 0x29;
									op_iter->op[1] = 0xC0 | (d << 3) | d;

									break;

								case 1:
									// mov r, 0
									op_iter->len = 5;
									op_iter->op[0] = 0xB8 | d;
									*(DWORD*)&op_iter->op[1] = 0;

									break;

								case 2:
									// xor r, r
									op_iter->len = 2;
									op_iter->op[0] = 0x31;
									op_iter->op[1] = 0xC0 | (d << 3) | d;

									break;
							}

							op_iter->flow = addsubOps(d, 1, v, it2, 2, 5);
							if (!op_iter->flow || op_iter->flow == (oplist*)ERR_NO_MEM)
							{
								memcpy(op_iter, it2, sizeof(oplist));
								free(it2);
								return ERR_NO_MEM;
							}
							op_iter->next = op_iter->flow;

							if (d == 5)
							{
								it2->len = 3;
								it2->op[0] = 0x8B;
								it2->op[1] = 0x40 | (d << 3) | d;
								it2->op[2] = 0;
							}
							else
							{
								it2->len = 2;
								it2->op[0] = 0x8B;
								it2->op[1] = (d << 3) | d;
							}

							op_iter = it2;

							break;

						case 1:

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 5;
							op_iter->op[0] = 0xB8 | d;
							*(DWORD*)&op_iter->op[1] = v;
							op_iter->flow = it2;
							op_iter->next = it2;

							if (d == 5)
							{
								it2->len = 3;
								it2->op[0] = 0x8B;
								it2->op[1] = 0x40 | (d << 3) | d;
								it2->op[2] = 0;
							}
							else
							{
								it2->len = 2;
								it2->op[0] = 0x8B;
								it2->op[1] = (d << 3) | d;
							}

							op_iter = it2;

							break;

						case 2:

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 6;
							op_iter->op[0] = 0xFF;
							op_iter->op[1] = 0x35;
	//						*(DWORD*)&op_iter->op[2] = v;
							op_iter->flow = it2;
							op_iter->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | d;

							op_iter = it2;

							break;

						case 3:

							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != d)
									break;
							}
							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							if (my_rand(0, 2))
							{
								switch (my_rand(0, 3))
								{
									case 0:
										//mov r2, 0
										it3->len = 5;
										it3->op[0] = 0xB8 | r2s[i];
										*(DWORD*)&it3->op[1] = 0;

										break;
									case 1:
										//sub r2, r2
										it3->len = 2;
										it3->op[0] = 0x29;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;

									case 2:
										//xor r2, r2
										it3->len = 2;
										it3->op[0] = 0x31;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;
								}

								it3->flow = addsubOps(r2s[i], 1, v, it4, 2, 4);
								if (!it3->flow || it3->flow == (oplist*)ERR_NO_MEM)
								{
									memcpy(op_iter, it2, sizeof(oplist));
									free(it2);
									free(it3);
									free(it4);
									return ERR_NO_MEM;
								}
								it3->next = it3->flow;
							}
							else
							{
								//mov r2, addr
								it3->len = 5;
								it3->op[0] = 0xB8 | r2s[i];
								*(DWORD*)&it3->op[1] = v;
								it3->flow = it4;
								it3->next = it4;
							}

							it4->len = 2;
							it4->op[0] = 0x8B;
							it4->op[1] = (d << 3) | r2s[i];
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];

							op_iter = it2;

							break;
					}

					continue;
				}
			}


			//-mov dword ptr [n(32bit va)], r -> 10001001 00abc101 addr

			//+push r2
			//+(a)mov r2, n
			//+(b)xor r2, r2 / sub r2, r2 / mov r2, 0
			//+(b)add r2, n
			//+mov [r2], r
			//+pop r2

			//+push r
			//+pop [n]
			if (op_iter->op[0] == 0x89 && (op_iter->op[1] & 7) == 5 && (op_iter->op[1] & 0xC0) == 0 && !my_rand(0, mutChance))
			{
				BYTE s;
				DWORD n;

				s = (op_iter->op[1] >> 3) & 7;
				n = *(DWORD*)&op_iter->op[2];

				switch (my_rand(0, 2))
				{
					case 0:
						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (r2s[i] != s)
								break;
						}
						if (i == sizeof(r2s) / sizeof(BYTE))
							break;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it2);
							free(it3);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50 | r2s[i];
						op_iter->flow = it3;
						op_iter->next = it3;

						if (my_rand(0, 2))
						{
							it3->len = 5;
							it3->op[0] = 0xB8 | r2s[i];
							*(DWORD*)&it3->op[1] = n;
							it3->flow = it4;
							it3->next = it4;
						}
						else
						{
							switch (my_rand(0, 3))
							{
								case 0:
									it3->len = 2;
									it3->op[0] = 0x31;
									it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

									break;

								case 1:

									it3->len = 2;
									it3->op[0] = 0x29;
									it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

									break;

								case 2:

									it3->len = 5;
									it3->op[0] = 0xB8 | r2s[i];
									*(DWORD*)&it3->op[1] = 0;

									break;
							}

							it3->flow = addsubOps(r2s[i], 1, n, it4, 2, 4);
							if (!it3->flow)
							{
								memcpy(op_iter, it2, sizeof(oplist));
								free(it2);
								free(it3);
								free(it4);
								return ERR_NO_MEM;
							}
							it3->next = it3->flow;
						}

						it4->len = 2;
						it4->op[0] = 0x89;
						it4->op[1] = (s << 3) | r2s[i];
						it4->flow = it2;
						it4->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | r2s[i];

						op_iter = it2;

						break;

					case 1:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50 | s;
						op_iter->flow = it2;
						op_iter->next = it2;

						it2->len = 6;
						it2->op[0] = 0x8F;
						it2->op[1] = 0x05;
						*(DWORD*)&it2->op[2] = n;

						op_iter = it2;

						break;
				}
			}


			//-mov dword ptr [r], n(32bit) -> 11000111 00000abc n

			//+push n
			//+pop dword ptr [r]

			//+push r2
			//+mov r2, n
			//+mov [r], r2
			//+pop r2

			//+push r2
			//+mov r2, 0 / xor / sub
			//+add/sub r2, n
			//+mov [r], r2
			//+pop r2
			if (op_iter->op[0] == 0xC7 && (op_iter->op[1] & 0xF8) == 0 && !my_rand(0, mutChance))
			{
				BYTE d;
				DWORD n;

				d = op_iter->op[1];
				n = *(DWORD*)&op_iter->op[2];

				switch (my_rand(0, 3))
				{
					case 0:

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						memcpy(it2, op_iter, sizeof(oplist));

						if (n < 0x80)
						{
							op_iter->len = 2;
							op_iter->op[0] = 0x6A;
							op_iter->op[1] = (BYTE)n;
						}
						else
						{
							op_iter->len = 5;
							op_iter->op[0] = 0x68;
							*(DWORD*)&op_iter->op[1] = n;
						}

						op_iter->next = it2;
						op_iter->flow = it2;

						if (d == 5)
						{
							it2->len = 3;
							it2->op[0] = 0x8F;
							it2->op[1] = 0x40 | d;
							it2->op[2] = 0;
						}
						else
						{
							it2->len = 2;
							it2->op[0] = 0x8F;
							it2->op[1] = d;
						}

						op_iter = it2;

						break;

					case 1:

						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (d != r2s[i])
								break;
						}
						if (i == sizeof(r2s) / sizeof(BYTE))
							break;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it2);
							free(it3);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50 | r2s[i];
						op_iter->flow = it3;
						op_iter->next = it3;

						it3->len = 5;
						it3->op[0] = 0xB8 | r2s[i];
						*(DWORD*)&it3->op[1] = n;
						it3->flow = it4;
						it3->next = it4;

						if (d == 5)
						{
							it4->len = 3;
							it4->op[0] = 89;
							it4->op[1] = 0x40 | (r2s[i] << 3) | d;
							it4->op[2] = 0;
						}
						else
						{
							it4->len = 2;
							it4->op[0] = 0x89;
							it4->op[1] = (r2s[i] << 3) | d;
						}
						it4->flow = it2;
						it4->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | r2s[i];

						op_iter = it2;

						break;

					case 2:

						for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
						{
							if (r2s[i] != d)
								break;
						}
						if (i == sizeof(r2s) / sizeof(BYTE))
							break;

						it2 = (oplist*)malloc(sizeof(oplist));
						if (!it2)
							return ERR_NO_MEM;

						it3 = (oplist*)malloc(sizeof(oplist));
						if (!it3)
						{
							free(it2);
							return ERR_NO_MEM;
						}

						it4 = (oplist*)malloc(sizeof(oplist));
						if (!it4)
						{
							free(it3);
							free(it2);
							return ERR_NO_MEM;
						}

						memset(it3, 0, sizeof(oplist));
						memset(it4, 0, sizeof(oplist));
						memcpy(it2, op_iter, sizeof(oplist));

						op_iter->len = 1;
						op_iter->op[0] = 0x50 | r2s[i];
						op_iter->flow = it3;
						op_iter->next = it3;

						switch (my_rand(0, 3))
						{
							case 0:
								//mov r2, 0
								it3->len = 5;
								it3->op[0] = 0xB8 | r2s[i];
								*(DWORD*)&it3->op[1] = 0;

								break;

							case 1:
								//xor r2, r2
								it3->len = 2;
								it3->op[0] = 0x31;
								it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

								break;

							case 2:
								//sub r2, r2
								it3->len = 2;
								it3->op[0] = 0x29;
								it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

								break;
						}

						it3->flow = addsubOps(r2s[i], 1, n, it4, 2, 4);
						if (!it3->flow || it3->flow == (oplist*)ERR_NO_MEM)
						{
							memcpy(op_iter, it2, sizeof(oplist));
							free(it2);
							free(it3);
							free(it4);
							return ERR_NO_MEM;
						}
						it3->next = it3->flow;

						it4->len = 2;
						it4->op[0] = 0x89;
						it4->op[1] = (r2s[i] << 3) | d;
						it4->flow = it2;
						it4->next = it2;

						it2->len = 1;
						it2->op[0] = 0x58 | r2s[i];

						op_iter = it2;

						break;
				}

				continue;
			}

			//invert conditional jumps
			//-jcc x
			//+!jcc asd
			//+jmp x
			//asd:
			if (op_iter->flow && op_iter->ref && (*(WORD*)&op_iter->op[0] & 0xF0FF) == 0x800F && !my_rand(0, mutChance))
			{
				it2 = (oplist*)malloc(sizeof(oplist));
				if (!it2)
					return ERR_NO_MEM;

				memcpy(it2, op_iter, sizeof(oplist));

				op_iter->op[1] ^= 1;
				it3 = op_iter->ref;
				op_iter->ref = op_iter->flow;
				op_iter->flow = it2;
				op_iter->next = it2;

				it2->len = 5;
				it2->op[0] = 0xE9;
				it2->ref = it3;
				it2->flow = NULL;

				op_iter = it2;

				continue;
			}
		}

		if (op_iter->len == 7)
		{
			//-mov r!=eax, fs:[#] -> 01100100 10001011 00abcxyz #(32bit)
			//+mov r, # -> 10111abc #(32bit)
			//+mov r, fs:[r] -> 01100100 10001011 00abcabc
			if (*(WORD*)&op_iter->op[0] == 0x8B64 && !(op_iter->op[3] & 0xC0) && !my_rand(0, mutChance))
			{
				BYTE d;

				it2 = (oplist*)malloc(sizeof(oplist));
				if (!it2)
					return ERR_NO_MEM;

				memcpy(it2, op_iter, sizeof(oplist));

				d = op_iter->op[2] >> 3;

				op_iter->next = it2;
				op_iter->flow = it2;

				op_iter->len = 5;
				op_iter->op[0] = 0xB8 | d;
				*(DWORD*)&op_iter->op[1] = *(DWORD*)it2->op[3];

				it2->len = 3;
				*(WORD*)&it2->op[0] = 0x8B64;
				it2->op[2] = (d << 3) | d;

				op_iter = it2;

				continue;
			}


			//mov dword ptr [r + x(8bit, signed?)], n(32bit) -> 11000111 01000abc x n

			//push n
			//pop dword ptr [r + x]

			//or

			//push r
			//sub r, x / add r, x
			//mov dword ptr [r], n
			//pop r

			//or

			//+push r2
			//+(a)mov r2, 0 / xor / sub
			//+(a)add r2, x
			//+(b)mov r2, x
			//+mov dword ptr [r + r2], n
			//+pop r2

			//or

			//+push r2
			//+(a)mov r2, 0 / xor / sub
			//+(a)add/sub r2, n
			//+(b)mov r2, n
			//+mov dword ptr [r + x], r2 -> 0x89 01abcxyz x abc = r2, xyz = r
			//+pop r2

			//or

			//+push r2
			//+mov r2, n
			//+mov dword ptr [r + x], r2
			//+pop r2
			if (op_iter->op[0] == 0xC7 && (op_iter->op[1] & 0x40) == 0x40)
			{
				if (!my_rand(0, mutChance))
				{
					BYTE r;
					signed char x;
					DWORD n;

					r = op_iter->op[1] & 7;
					x = (signed char)op_iter->op[2];
					n = *(DWORD*)&op_iter->op[3];

					switch (my_rand(0, 5))
					{
						case 0:

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							memcpy(it2, op_iter, sizeof(oplist));

							if (n < 0x80)
							{
								op_iter->len = 2;
								op_iter->op[0] = 0x6A;
								op_iter->op[1] = (BYTE)n;
							}
							else
							{
								op_iter->len = 5;
								op_iter->op[0] = 0x68;
								*(DWORD*)&op_iter->op[1] = n;
							}

							op_iter->flow = it2;
							op_iter->next = it2;

							it2->len = 3;
							it2->op[0] = 0x8F;
							it2->op[1] = 0x40 | r;
							it2->op[2] = x;

							op_iter = it2;

							break;

						case 1:

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r;
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 3;
							if (x >= 0)
							{
								it3->op[0] = 0x83;
								it3->op[1] = 0xC0 | r;
								it3->op[2] = x;
							}
							else
							{
								it3->op[0] = 0x83;
								it3->op[1] = 0xE8 | r;
								it3->op[2] = (0xFF - (BYTE)x) + 1;
							}

							it3->flow = it4;
							it3->next = it4;

							if (r == 5)
							{
								it4->len = 7;
								it4->op[0] = 0xC7;
								it4->op[1] = 0x40 | r;
								it4->op[2] = 0;
								*(DWORD*)&it4->op[3] = n;
							}
							else
							{
								it4->len = 6;
								it4->op[0] = 0xC7;
								it4->op[1] = r;
								*(DWORD*)&it4->op[2] = n;
							}

							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r;

							op_iter = it2;

							break;

						case 2:

							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != r)
									break;
							}

							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							if (my_rand(0, 2))
							{
								switch (my_rand(0, 3))
								{
									case 0:
										//mov r2, 0
										it3->len = 5;
										it3->op[0] = 0xB8 | r2s[i];
										*(DWORD*)&it3->op[1] = 0;

										break;

									case 1:
										//xor r2, r2
										it3->len = 2;
										it3->op[0] = 0x31;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;

									case 2:
										//sub r2, r2
										it3->len = 2;
										it3->op[0] = 0x29;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;
								}

								//add r2, x
								it3->flow = addsubOps(r2s[i], 1, x, it4, 2, 4);
								if (!it3->flow || it3->flow == (oplist*)ERR_NO_MEM)
								{
									memcpy(op_iter, it2, sizeof(oplist));
									free(it2);
									free(it3);
									free(it4);
									return ERR_NO_MEM;
								}
								it3->next = it3->flow;
							}
							else
							{
								//mov r2, x
								it3->len = 5;
								it3->op[0] = 0xB8 | r2s[i];
								*(DWORD*)&it3->op[1] = (DWORD)x;

								it3->flow = it4;
								it3->next = it4;
							}

							//mov dword ptr [r + r2], n -> 0xC7 0x04 00abcxyz n (abc = r, xyz = r2)
							it4->len = 7;
							it4->op[0] = 0xC7;
							it4->op[1] = 4;
							it4->op[2] = (r << 3) | r2s[i];
							*(DWORD*)&it4->op[3] = n;
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];

							op_iter = it2;

							break;

						case 3:

							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != r)
									break;
							}
							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							if (my_rand(0, 2))
							{
								switch (my_rand(0, 3))
								{
									case 0:
										//mov r2, 0
										it3->len = 5;
										it3->op[0] = 0xB8 | r2s[i];
										*(DWORD*)&it3->op[1] = 0;

										break;
									case 1:
										//sub r2, r2
										it3->len = 2;
										it3->op[0] = 0x29;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;
									case 2:
										//xor r2, r2
										it3->len = 2;
										it3->op[0] = 0x31;
										it3->op[1] = 0xC0 | (r2s[i] << 3) | r2s[i];

										break;
								}

								it3->flow = addsubOps(r2s[i], 1, n, it4, 2, 4);
								if (!it3->flow || it3->flow == (oplist*)ERR_NO_MEM)
								{
									memcpy(op_iter, it2, sizeof(oplist));
									free(it2);
									free(it3);
									free(it4);
									return ERR_NO_MEM;
								}
								it3->next = it3->flow;
							}
							else
							{
								it3->len = 5;
								it3->op[0] = 0xB8 | r2s[i];
								*(DWORD*)&it3->op[1] = n;
								it3->flow = it4;
								it3->next = it4;
							}

							it4->len = 3;
							it4->op[0] = 0x89;
							it4->op[1] = 0x40 | (r2s[i] << 3) | r;
							it4->op[2] = x;
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];

							op_iter = it2;

							break;

						case 4:
							
							for (i = 0; i < sizeof(r2s) / sizeof(BYTE); i++)
							{
								if (r2s[i] != r)
									break;
							}
							if (i == sizeof(r2s) / sizeof(BYTE))
								break;

							it2 = (oplist*)malloc(sizeof(oplist));
							if (!it2)
								return ERR_NO_MEM;

							it3 = (oplist*)malloc(sizeof(oplist));
							if (!it3)
							{
								free(it2);
								return ERR_NO_MEM;
							}

							it4 = (oplist*)malloc(sizeof(oplist));
							if (!it4)
							{
								free(it2);
								free(it3);
								return ERR_NO_MEM;
							}

							memset(it3, 0, sizeof(oplist));
							memset(it4, 0, sizeof(oplist));
							memcpy(it2, op_iter, sizeof(oplist));

							op_iter->len = 1;
							op_iter->op[0] = 0x50 | r2s[i];
							op_iter->flow = it3;
							op_iter->next = it3;

							it3->len = 5;
							it3->op[0] = 0xB8 | r2s[i];
							*(DWORD*)&it3->op[1] = n;
							it3->flow = it4;
							it3->next = it4;

							it4->len = 3;
							it4->op[0] = 0x89;
							it4->op[1] = 0x40 | (r2s[i] << 3) | r;
							it4->op[2] = x;
							it4->flow = it2;
							it4->next = it2;

							it2->len = 1;
							it2->op[0] = 0x58 | r2s[i];

							op_iter = it2;

							break;
					}

					continue;
				}
			}
		}
	}

	return ERR_SUCCESS;
}




int smi2le::AddTrash(const unsigned short wCycles, const unsigned short wMinSize, const unsigned short wMaxSize, const bool bRemovenops)
{
	if (!wCycles || !wMaxSize || wMaxSize < wMinSize)
		return ERR_BAD_PARAM;

	oplist *op_iter, *op_iter2, *insert;

	unsigned short cycles = wCycles;
	unsigned long n_ops = MinBuffSize();
	unsigned long onevery = 10 + my_rand(0, n_ops / (wCycles + 1)), atleast = 10 + my_rand(0, 50), count = 0;

	void *ptrash;
	unsigned long dwlen, dwret;

	void* etg_ptr = &etg_bin;

	op_iter = op_root;
	while (cycles--)
	{
		for (; op_iter; op_iter = op_iter->next, count++)
		{
			if ((!(my_rand(0, (cycles + wCycles) * 2) || count >= onevery)) && count >= atleast)
			{
				count = 0;

				dwlen = (wMinSize + my_rand(0, wMaxSize - wMinSize)) + 4;
				if (dwlen < 5)
					break;

				ptrash = malloc(dwlen);

				if (!ptrash)
					return ERR_NO_MEM;

				memset(ptrash, 0x90, dwlen);
				*(unsigned short*)ptrash = 0x9C60;  // pushad
													// pushfd
				*(unsigned short*)((char*)ptrash + dwlen - 2) = 0x619D; // popfd
																		// popad
				(*(etg_engine*)etg_ptr)
					(0,
					ETG_ALL-ETG_JMPS,
					REG_ALL,
					REG_EAX|REG_EBX,
					&dwret,
					wMaxSize,
					dwlen - 4,
					(unsigned char*)ptrash + 2,
					my_rand);

				if (dwret)
				{
					insert = op_root;
					op_root = NULL;
					if (Disasm((unsigned char*)ptrash, dwlen, 0) == 0)
					{
						free(ptrash);
						if (bRemovenops)
						{
							oplist *op;
							for (op_iter2 = op_root; op_iter2; op_iter2 = op_iter2->next)
							{
								while (op_iter2->next && (op_iter2->next)->len == 1 && (op_iter2->next)->op[0] == 0x90)
								{
									op = op_iter2->next;
									op_iter2->flow = op->next;
									op_iter2->next = op->next;
									free(op);
								}
							}
						}

						//insert @ op_iter
						op_iter2 = (oplist*)malloc(sizeof(oplist));
						if (!op_iter2)
						{
							destroy_opcodes();
							op_root = insert;
							return ERR_NO_MEM;
						}

						memcpy(op_iter2, op_iter, sizeof(oplist));
						memcpy(op_iter, op_root, sizeof(oplist));

						free(op_root);
						for (; op_iter; op_iter = op_iter->next)
						{
							if (!op_iter->next)
							{
								op_iter->flow = op_iter2;
								op_iter->next = op_iter2;
								break;
							}
						}
						op_root = insert;
					}
					else
					{
						free(ptrash);
						op_root = insert;
					}
					break;
				}
			}
		}
		if (!op_iter)
			op_iter = op_root;
	}
	return ERR_SUCCESS;

}




int smi2le::Permutate(const unsigned short jmpChance)
{
	oplist* op_iter, *insert;

	if (!jmpChance || !op_root)
		return ERR_BAD_PARAM;

	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		if (!my_rand(0, jmpChance) && op_iter->flow) //don't jmp to a jmp, that's not cool man.
		{
			//insert jmp @ this instruction
			insert = (oplist*)malloc(sizeof(oplist));
			if (!insert)
				return ERR_NO_MEM;

			memcpy(insert, op_iter, sizeof(oplist));

			op_iter->flow = NULL;
			op_iter->len = 5;
			op_iter->next = insert;
			op_iter->ref = insert;
			op_iter->op[0] = 0xE9;

			op_iter = insert;
		}
	}

	return ERR_SUCCESS;
}




int smi2le::Disasm(const unsigned char *lpInBuff, const unsigned long dwInSize, const unsigned long dwEntry)
//disassembles a buffer into a linked list for mutation/reassembly.
//i just ripped the disasm algo from z0mbie's rpme
{
	unsigned long dwNextOp, i, len, ref;
	oplist *op_iter, *insert;

	if (map)
	{
		mapsize = 0;
		free(map);
	}
	if (op_root)
		destroy_opcodes();

	if (!lpInBuff || !dwInSize || dwEntry >= dwInSize)
		return ERR_BAD_PARAM;

	map = (unsigned char*)malloc(dwInSize);
	if (!map)
		return ERR_NO_MEM;

	mapsize = dwInSize;

	memset(map, M_NONE, mapsize);

	map[dwEntry] = M_TODO;
	dwNextOp = dwEntry;

	op_root = (oplist*)malloc(sizeof(oplist));

	memset(op_root, 0, sizeof(oplist));

	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		len = disasm_main(&lpInBuff[dwNextOp]);
		if (len >= MAXCMDLEN || len == 0)
			return ERR_DISASM;
		ref = (unsigned long)-1;

		memset(&map[dwNextOp], M_DONE, len);

		//add instruction to opcode list
		op_iter->ofs = dwNextOp;
		op_iter->len = (unsigned short)len;
		memcpy(op_iter->op, &lpInBuff[dwNextOp], len);

		unsigned char op = op_iter->op[0];
		unsigned short wop = *(unsigned short*)&op_iter->op[0];
		unsigned long a = (unsigned long)-1;
		unsigned long b = (unsigned long)-1;

		if (len > 1)
			a = dwNextOp + len + (char)op_iter->op[len - 1];
		if (len > 4)
			b = dwNextOp + len + *((long*)&op_iter->op[len - 4]);

		if (dwNextOp + len >= mapsize)
			dwNextOp = (unsigned long)-1;
		else
			dwNextOp += len;

		if (((op & 0xF0) == 0x70) || ((op & 0xFC) == 0xE0)) 
		{
			ref = a; // jcc,jcxz,loop/z/nz
		}
		if ((wop & 0xF0FF) == 0x800F)
		{
			ref = b;    // jcc near
		}
		if (op == 0xE8)
		{
			ref = b; //call
		}
		if (op == 0xE9) //jmp
		{
			ref = b;
			dwNextOp = (unsigned long)-1;
		}
		if (op == 0xEB) //jmp short
		{
			ref = a;
			dwNextOp = (unsigned long)-1;
		}
		if (((op & 0xF6) == 0xC2) || (op == 0xCF) || ((wop & 0x38FF) == 0x20FF))
	        dwNextOp = (unsigned long)-1; // ret/ret#/retf/retf#/iret/jmp modrm


		if (ref < mapsize)
		{
			//ref is in bounds..
			//mark as todo
			if (map[ref] != M_DONE)
				map[ref] = M_TODO;
			op_iter->ref = (oplist*)ref;
		}
		else
			op_iter->ref = (oplist*)-1;

		op_iter->next = (oplist*)malloc(sizeof(oplist));
		if (!op_iter->next)
			return ERR_NO_MEM;

		memset(op_iter->next, 0, sizeof(oplist));

		if (dwNextOp != (unsigned long)-1)
		{
			if (map[dwNextOp] == M_DONE)
			{
				for (insert = op_root; insert; insert = insert->next)
				{
					if (insert->ofs == dwNextOp)
					{
						op_iter->flow = insert;

						//find next todo
						dwNextOp = (unsigned long)-1;
						for (i = 0; i < mapsize; i++)
						{
							if (map[i] == M_TODO)
							{
								dwNextOp = i;
								break;
							}
						}
						break;
					}
				}
			}
			else
				op_iter->flow = op_iter->next;
		}
		else //if (dwNextOp == (unsigned long)-1)
		{
			op_iter->flow = NULL;
			for (i = 0; i < mapsize; i++)
			{
				if (map[i] == M_TODO)
				{
					dwNextOp = i;
					break;
				}
			}
		}

		if (dwNextOp == (unsigned long)-1)
		{
			free(op_iter->next);
			op_iter->next = NULL;
			break;
		}
	}

//done disassembling

	//expand short jmps & w/e
	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		unsigned char c;
		if (op_iter->ref != (oplist*)-1)
		{
			c = op_iter->op[0];
			if ((c & 0xF0) == 0x70) //jc short
			{
				op_iter->op[0] = 0x0F;
				op_iter->op[1] = 0xF0 ^ c;
				op_iter->len = 6;
			}
			if (c == 0xEB) //jmp short
			{
				op_iter->op[0] = 0xE9;
				op_iter->len = 5;
			}
			if ((c & 0xFC) == 0xE0)                 // loop/z/nz,jcxz?
			{
				if (c == 0xE2)                      // loop
				{
					//change this to 2 instructions
					insert = (oplist*)malloc(sizeof(oplist));
					if (!insert)
						return ERR_NO_MEM;

					memcpy(insert, op_iter, sizeof(oplist));

					op_iter->op[0] = 0x49;                 // dec ecx
					op_iter->len = 1;
					op_iter->next = insert;
					op_iter->ref = (oplist*)-1;
					op_iter->flow = insert;

					*(unsigned short*)&insert->op[0]=0x850F;      // jnz near ...
					insert->ofs = (unsigned long)-1;
					insert->len = 6;

					op_iter = insert;
				}
				else
					if (c == 0xE3)                      // jcxz
					{
						//change this to 2 instructions
						insert = (oplist*)malloc(sizeof(oplist));
						if (!insert)
							return ERR_NO_MEM;

						memcpy(insert, op_iter, sizeof(oplist));

						*(unsigned short*)&op_iter->op[0] = 0xC909;      // or ecx, ecx
						op_iter->len = 2;
						op_iter->next = insert;
						op_iter->ref = (oplist*)-1;
						op_iter->flow = insert;

						*(unsigned short*)&insert->op[0] = 0x840F;      // jz near ...
						insert->ofs = (unsigned long)-1;
						insert->len = 6;

						op_iter = insert;
					}
					else
						return ERR_DISASM;
			}
		}
	}

	//fix ref's
	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		if (op_iter->ref != (oplist*)-1)
		{
			for (insert = op_root; insert; insert = insert->next)
			{
				if (insert->ofs == (unsigned long)op_iter->ref)
				{
					op_iter->ref = insert;
					break;
				}
			}
		}
		else
			op_iter->ref = NULL;
	}

	free(map);
	map = NULL;

	return ERR_SUCCESS;
}




long smi2le::bound_distance(unsigned long n, unsigned long size)
//returns:
//-1 == size out of bounds or overwrites other code
//else it is the room left between n + size and the boundary or code
{
	unsigned long i, ret;

	if (!map || !mapsize)
		return -1;

	if (n + size > mapsize)
		return -1;

	for (i = n; i < n + size; i++)
	{
		if (map[i] == M_DONE)
			return -1;
	}
	
	for (i = n + size, ret = 0; i < mapsize; i++, ret++)
	{
		if (map[i] == M_DONE)
			break;
	}

	return ret;
}




int smi2le::map_asm(unsigned long dwEP)
//internal function to actually map the instructions & link. Asm() just writes the results to a buffer.
{
	oplist *op_iter, *old;
	unsigned long i, tries;

	if (!mapsize)
		return ERR_BAD_PARAM;

	if (map)
		free(map);

	map = (unsigned char*)malloc(mapsize);

	if (!map)
		return ERR_NO_MEM;

	memset(map, M_NONE, mapsize);

	i = dwEP;

#ifdef DEBUG_DUMP_OPLIST
	printf("Mapping ops:\nDumping...\n");
#endif

	for (op_iter = op_root; op_iter;)
	{
#ifdef DEBUG_DUMP_OPLIST
		printf("%x, %d, %d\n", op_iter->op[0], op_iter->len, op_iter->cur_ofs);
#endif
		if (op_iter->flow) //not a jmp or ret
		{
			if (bound_distance(i, op_iter->len) >= 5) //there is room for @ least a jmp after this instruction
			{
				//map instruction
				op_iter->asmFlag = 1;
				op_iter->ofs = i;

				memset(&map[i], M_DONE, op_iter->len);

				i += op_iter->len;

				op_iter = op_iter->flow;
			}
			else
			{
				if (bound_distance(i, 5) >= 0) //there is room for a jmp here, insert jmp @ current place in list
				{
					old = (oplist*)malloc(sizeof(oplist));
					if (!old)
						return ERR_NO_MEM;

					memcpy(old, op_iter, sizeof(oplist));

					op_iter->asmFlag = 1;
					op_iter->flow = 0;
					op_iter->ref = old;
					op_iter->len = 5;
					op_iter->next = old;
					op_iter->op[0] = 0xE9;
					op_iter->ofs = i;

					memset(&map[i], M_DONE, op_iter->len);

					//randomize i?
					tries = 0;
					do
					{
						i = my_rand(0, mapsize); //(rand() + i) % mapsize;
					} while (bound_distance(i, op_iter->len) < 5 && ++tries < MAX_ATTEMPTS);

					if (tries >= MAX_ATTEMPTS)
						return ERR_TRY_AGAIN;

					op_iter = op_iter->ref;
				}
				else
				{
					//done fucked up already.
					return ERR_TRY_AGAIN;
				}
			}
		}
		else //probably a jmp or ret (or just the end of the buffer)
		{
			if (bound_distance(i, op_iter->len >= 0)) //in bounds.
			{
				//map instruction
				op_iter->asmFlag = 1;
				op_iter->ofs = i;
				memset(&map[i], M_DONE, op_iter->len);
			}
			else
			{
				if (bound_distance(i, 5) >= 0)
				{
					//insert a jmp @ this instruction
					old = (oplist*)malloc(sizeof(oplist));
					if (!old)
						return ERR_NO_MEM;

					memcpy(old, op_iter, sizeof(oplist));

					op_iter->asmFlag = 1;
					op_iter->ref = old;
					op_iter->len = 5;
					op_iter->next = old;
					op_iter->op[0] = 0xE9;
					op_iter->ofs = i;

					memset(&map[i], M_DONE, op_iter->len);
				}
				else
					return ERR_TRY_AGAIN;
			}
			if (op_iter->ref && !(op_iter->ref)->asmFlag)
				op_iter = op_iter->ref;
			else
			{
				//find new unasmbled
				for (op_iter = op_root; op_iter; op_iter = op_iter->next)
				{
					if (!(op_iter->asmFlag))
						break;
				}
				if (!op_iter) //no more unmapped instructions left in list, so we're done mapping.
					break;
			}

			//randomize i
			tries = 0;
			do
			{
				i = my_rand(0, mapsize);
			} while (bound_distance(i, op_iter->len) < 5 && ++tries < MAX_ATTEMPTS);

			if (tries >= MAX_ATTEMPTS)
				return ERR_TRY_AGAIN;
		}
	}

#ifdef DEBUG_DUMP_OPLIST
	printf("Finished map/dump\n");
#endif
	//everything is mapped, now to fix raw offsets in ops
	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		if (op_iter->ref)
		{
			if ((op_iter->op[0] == 0xE9 || op_iter->op[0] == 0xE8) && op_iter->len == 5) //jmp or call
				*(long*)&op_iter->op[1] = (long)(op_iter->ref)->ofs - (long)(op_iter->ofs + op_iter->len);
			else
			{
				if (op_iter->len == 6) //jcc
					*(long*)&op_iter->op[2] = (long)(op_iter->ref)->ofs - (long)(op_iter->ofs + op_iter->len);
			}
		}
	}

	return ERR_SUCCESS;
}




int smi2le::Asm(unsigned char *lpOutBuff, const unsigned long dwOutSize, unsigned long *dwOutEP)
{
	oplist *op_iter, rmv;
	int map_ret;
	unsigned long dwOpPtr = 0;

	if (dwOutSize < mapsize || !dwOutSize)
		return ERR_MORE_MEM;

	mapsize = dwOutSize;

	if (!dwOutEP)
		dwOpPtr = 0;
	else
	{
		dwOpPtr = my_rand(0, dwOutSize - MAXCMDLEN);
		*dwOutEP = dwOpPtr;
	}

	//set all asmFlags & ofs to 0;
	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
	{
		op_iter->ofs = 0;
		op_iter->asmFlag = 0;
	}

	//no jmps for the first 10 instructions (jmps @ ep sometimes set off heuristic av's). just hope that it doesn't remove any original jmps or shit might crash.
	//this part is just for the =8-D crypter, remove it if you use the engine for anything else because it WILL CRASH.
	for (op_iter = op_root, map_ret = 0; op_iter && map_ret < 10; map_ret++, op_iter = op_iter->flow)
	{
		while (!op_iter->flow)
		{
			if (op_iter->ref)
			{
				memcpy(&rmv, op_iter->ref, sizeof(oplist));
				free(op_iter->ref);
				memcpy(op_iter, &rmv, sizeof(oplist));
			}
			else
				break;
		}
	}

	map_ret = map_asm(dwOpPtr);

	if (map_ret != ERR_SUCCESS)
		return map_ret;

	for (op_iter = op_root; op_iter; op_iter = op_iter->next)
		memcpy(&lpOutBuff[op_iter->ofs], op_iter->op, op_iter->len);

	return ERR_SUCCESS;
}

// blood clot, <3 atk. :)