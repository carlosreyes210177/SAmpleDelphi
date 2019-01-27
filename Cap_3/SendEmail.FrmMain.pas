unit SendEmail.FrmMain;

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
  Vcl.StdCtrls,
  RzTabs,
  Vcl.WinXCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
   TFrmMain = class(TForm)
      btnSendemail      : TButton;
      pgemail           : TPageControl;
      tsSend            : TTabSheet;
      tsSetting         : TTabSheet;
      grpSetting        : TGroupBox;
      lblHost           : TLabel;
      lblPort           : TLabel;
      lblEmail          : TLabel;
      lblPassword       : TLabel;
      lblName           : TLabel;
      edtHost           : TEdit;
      edtPort           : TEdit;
      edtEmail          : TEdit;
      edtPassword       : TEdit;
      btnShow_hide      : TButton;
      btnClear          : TButton;
      edtNameRecipient  : TEdit;
      chkUseTLS         : TCheckBox;
      lblToEmail        : TLabel;
      edtSentTo         : TEdit;
      edtAsunt          : TEdit;
      lblAsunt          : TLabel;
      mmoMessage        : TMemo;
      edtAttachment     : TEdit;
      lblAttachment     : TLabel;
      btnOpenfile       : TButton;
      Pnl_Wait          : TPanel;
      ActivityInd_Wait  : TActivityIndicator;

      procedure btnOpenfileClick(Sender: TObject);
      procedure btnShow_hideClick(Sender: TObject);
      procedure btnClearClick(Sender: TObject);
      procedure btnSendemailClick(Sender: TObject);
   private
   { Private declarations }


   public
   { Public declarations }


   end;

var
  FrmMain: TFrmMain;

implementation

uses
   SendEmain.classMail,
   System.Threading;

{$R *.dfm}

procedure TFrmMain.btnClearClick(Sender: TObject);
begin
   edtPassword.Clear;
end;

procedure TFrmMain.btnOpenfileClick(Sender: TObject);
begin
  with TOpenDialog.Create(Self) do
  begin
    if Execute then
      edtAttachment.Text := FileName;
  end;
end;

procedure TFrmMain.btnShow_hideClick(Sender: TObject);
begin
   case btnShow_hide.tag of
      0:
      begin
         edtPassword.PasswordChar := Char(#0);
         btnShow_hide.tag     := 1;
         btnShow_hide.Caption := 'Hide';
      end;

      1:
      begin
         edtPassword.PasswordChar := Char('*');
         btnShow_hide.tag := 0;
         btnShow_hide.Caption := 'Show';
      end;
   end;
end;

procedure TFrmMain.btnSendemailClick(Sender: TObject);
var
   Email : TEmail;
begin
   Email := TEmail.Create;

   with Email do
   begin
      Server     := edtHost.Text;
      Port       := edtPort.Text;
      UserName   := edtEmail.Text;
      Password   := edtPassword.Text;
      Reciepient := edtNameRecipient.Text;
      UseTLS     := chkUseTLS.Checked;
      //////////////////////////////////////////////////////////////
      ///   Message Send
      SentTo     := edtSentTo.Text;
      Subject    := edtAsunt.Text;
      Body.Add(mmoMessage.Lines.Text);
      Attachment := edtAttachment.Text;
   end;
   TTask.Run(
            procedure
            begin
               if TTask.CurrentTask.Status <> TTaskStatus.Canceled then
               begin
                  TThread.Synchronize(TThread.CurrentThread,
                                                            procedure
                                                            begin
                                                               btnSendemail.Enabled     := False;
                                                               Pnl_Wait.Visible         := True;
                                                               ActivityInd_Wait.Animate := True;
                                                               if Email.SendEmail then
                                                               begin
                                                                  Application.MessageBox(PChar('Correo ha sido enviado con éxito.'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
                                                               end
                                                               else
                                                               begin
                                                                  Application.MessageBox(PChar('Lo siento, hubo un error al enviar.'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
                                                               end;
                                                               ActivityInd_Wait.Animate := False;
                                                               Pnl_Wait.Visible         := False;
                                                               btnSendemail.Enabled     := True;
                                                            end);
               end;
            end);

end;

end.
