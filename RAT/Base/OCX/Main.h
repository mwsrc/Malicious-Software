//---------------------------------------------------------------------------

#ifndef MainH
#define MainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TListView *OcxList;
	TGroupBox *GroupBoxUnregister;
	TButton *ButtonUnregister;
	TGroupBox *GroupBoxRegister;
	TCheckBox *chkOverwrite;
	TButton *ButtonRegister;
	TButton *InfoButton;
	TPopupMenu *PopupMenu1;
	TMenuItem *Refresh;
	void __fastcall ButtonRegisterClick(TObject *Sender);
	void __fastcall ButtonUnregisterClick(TObject *Sender);
	void __fastcall InfoButtonClick(TObject *Sender);
	void __fastcall RefreshClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
