//////////////////////////////////////////////
/// Cap. 5
/// Ejemplo de incrustar formulario en pagecontrol
/// Desarrollado : Ing. Carlos Reyes

unit Sample.IncrustarForm.FrmMain2;

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
   Vcl.ComCtrls,
   Vcl.StdCtrls, Vcl.ExtCtrls;

type
   TTabSheet = class(Vcl.ComCtrls.TTabSheet)
   private
      FData: Pointer;

   public
      property Data: Pointer read FData write FData;
   end;

   TFrmMain = class(TForm)
      pgcSample          : TPageControl;
      pnl1               : TPanel;
      btnCreatePage      : TButton;
      btnChangeColorPage : TButton;
      dlgColorPage       : TColorDialog;

      procedure btnCreatePageClick(Sender: TObject);
      procedure btnChangeColorPageClick(Sender: TObject);

   private
   { Private declarations }
      procedure AddFormToPage;

   public
   { Public declarations }

   end;

var
  FrmMain: TFrmMain;

implementation

uses
   Sample.IncrustarForm.Frm2,
   System.Threading;

{$R *.dfm}

procedure TFrmMain.AddFormToPage;
var
   pnl   : TTabSheet;
   I     : Integer;
   Frm1  : TFrm1;
   Tasks : ITask;
begin
   for I := 0 to 5 do
   begin
      try
         ///////////////////////////////////////////
         ///   Creo el apnel
         pnl                      := TTabSheet.Create(pgcSample);
         pnl.PageControl          := pgcSample;
         pnl.Caption              := 'Form ' + I.ToString;
         pnl.ImageIndex           := 9;
         pnl.Color                := clWhite;
         pgcSample.ActivePage     :=  pnl;
      except
         on E : Exception do
         begin
            Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_OK + MB_TOPMOST);
            Exit;
         end;
      end;

      /////////////////////////////////////////////////////
      ///   Creo el formulario
      Frm1     := TFrm1.Create(pnl);
      pnl.Data := Pointer(Frm1);

      Tasks := TTask.Create(
               procedure
               begin
                  TThread.Synchronize(nil,
                                          procedure
                                          begin
                                             try
                                                with Frm1 do
                                                begin
                                                   Top               := 0;
                                                   Left              := 0;
                                                   Parent            := pnl;
                                                   Width             := pnl.Width;
                                                   Height            := pnl.Height;
                                                   lblNumber.Caption := '# ' + I.ToString;

                                                   Show;
                                                end;
                                             except
                                                on E : Exception do
                                                begin
                                                   Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
                                                end;
                                             end;
                                          end);
               end);

      Tasks.Start;
      while not TTask.WaitForAll(Tasks, 1000) do
      begin
        CheckSynchronize(0);
        Application.ProcessMessages;
      end;
   end;
end;

procedure TFrmMain.btnChangeColorPageClick(Sender: TObject);
begin
   if pgcSample.ActivePageIndex <> -1 then
   begin
      if TTabSheet(pgcSample.ActivePage).Data <> nil then
      begin
         if dlgColorPage.Execute(Self.Handle) then
         begin
            TFrm1(TTabSheet(pgcSample.ActivePage).Data).Color := dlgColorPage.Color;
         end;
      end;
   end;
end;

procedure TFrmMain.btnCreatePageClick(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   try
      AddFormToPage;
   finally
      Screen.Cursor := crDefault;
   end;
end;

end.
