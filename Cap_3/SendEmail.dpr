program SendEmail;

uses
  Vcl.Forms,
  SendEmail.FrmMain in 'SendEmail.FrmMain.pas' {FrmMain},
  SendEmain.classMail in 'SendEmain.classMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
