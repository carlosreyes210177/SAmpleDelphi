unit Sample.IncrustarForm.Form1;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.StdCtrls;

type
   TFrm1 = class(TForm)
      lblTitle : TLabel;
      chk1     : TCheckBox;
      rb1      : TRadioButton;
      rb2      : TRadioButton;
      cbb1     : TComboBox;
      edt1     : TEdit;
      btn1     : TButton;
      mmo1     : TMemo;

   private
   { Private declarations }


   public
   { Public declarations }


   end;

//var
//  Frm1: TFrm1;

implementation

{$R *.dfm}

end.
