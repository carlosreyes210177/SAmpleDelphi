///////////////////////////////////////////
// Desarrollador : Ing. Carlos Reyes
// Email         : carlosreyes210177@gmail.com
program SampleOperation;

uses
  Vcl.Forms,
  SampleOperation.FrmMain in 'SampleOperation.FrmMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
