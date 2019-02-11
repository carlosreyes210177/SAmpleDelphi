program IncrustarFrom2;

uses
  Vcl.Forms,
  Sample.IncrustarForm.FrmMain2 in 'Sample.IncrustarForm.FrmMain2.pas' {FrmMain},
  Sample.IncrustarForm.Frm2 in 'Sample.IncrustarForm.Frm2.pas' {Frm1};

{$R *.res}

begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TFrmMain, FrmMain);
   Application.Run;
end.
