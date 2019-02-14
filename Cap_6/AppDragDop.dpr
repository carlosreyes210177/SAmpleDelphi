program AppDragDop;

uses
  Vcl.Forms,
  AppDragDrop.FrmDragDrop in 'AppDragDrop.FrmDragDrop.pas' {frmDragDrop},
  AppDragDrop.FrmDragDrop2 in 'AppDragDrop.FrmDragDrop2.pas' {frmDragDrop2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDragDrop, frmDragDrop);
  //Application.CreateForm(TfrmDragDrop2, frmDragDrop2);
  Application.Run;
end.
