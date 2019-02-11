program IncrustarForm;

uses
  Vcl.Forms,
  Sample.IncrustarForm.FrmMain in 'Sample.IncrustarForm.FrmMain.pas' {FrmMain},
  Sample.IncrustarForm.Form1 in 'Sample.IncrustarForm.Form1.pas' {Frm1},
  Sample.IncrustarForm.Form2 in 'Sample.IncrustarForm.Form2.pas' {Frm2};

{$R *.res}

begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TFrmMain, FrmMain);
   Application.Run;
end.
