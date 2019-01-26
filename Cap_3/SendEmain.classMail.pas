//////////////////////////////////////////////////////////
/// Cap. 3
/// <author>Ing. Carlos Reyes</author>
///<email>carlosreyes210177@gmail.com</email>
unit SendEmain.classMail;

interface
uses
   System.Classes,
   System.SysUtils,
   Winapi.Windows;

type
   IEmail = interface
   ['{FC261EF7-F612-434B-A63D-8C8C50354F21}'] //CTRL + SHIFT + g
      function GetAttachment: string;
      function GetBody: TStringList;
      function GetPassword: string;
      function GetPort: string;
      function GetReciepient: string;
      function GetSentTo: string;
      function GetServer: string;
      function GetSubject: string;
      function GetUserName: string;
      procedure SetAttachment(const Value: string);
      procedure SetBody(const Value: TStringList);
      procedure SetPassword(const Value: string);
      procedure SetPort(const Value: string);
      procedure SetReciepient(const Value: string);
      procedure SetSentTo(const Value: string);
      procedure Setserver(const Value: string);
      procedure SetSubject(const Value: string);
      procedure SetUserName(const Value: string);
      function SendEmail : Boolean;
      function GetUseTLS: Boolean;
      procedure SetUseTLS(const Value: Boolean);
   end;


   TEmail = class(TInterfacedObject, IEmail)
   private
      //////////////////////////////////////////////////////////////
      ///   Setting
      FServer     : string;
      FPort       : string;
      FUserName   : string;
      FPassword   : string;
      FReciepient : string;

      //////////////////////////////////////////////////////////////
      ///   Message Send
      FSentTo     : string;
      FSubject    : string;
      FBody       : TStringList;
      FAttachment : string;
      FUseTLS     : Boolean;

      function GetAttachment: string;
      function GetBody: TStringList;
      function GetPassword: string;
      function GetPort: string;
      function GetReciepient: string;
      function GetSentTo: string;
      function GetServer: string;
      function GetSubject: string;
      function GetUserName: string;
      procedure SetAttachment(const Value: string);
      procedure SetBody(const Value: TStringList);
      procedure SetPassword(const Value: string);
      procedure SetPort(const Value: string);
      procedure SetReciepient(const Value: string);
      procedure SetSentTo(const Value: string);
      procedure SetServer(const Value: string);
      procedure SetSubject(const Value: string);
      procedure SetUserName(const Value: string);
      function GetUseTLS: Boolean;
      procedure SetUseTLS(const Value: Boolean);

   public
      constructor Create; overload;
      constructor Create(sServer : string; sPort : string; sUserName : string; sPassword : string; sReciepient : string; sUseTLS : Boolean;
                         sSentTo : string; sSubject : string; sBody : TStringList; sAttachment : string); overload;


      destructor Destroy; override;

      ///////////////////////////////////////////////////////////////
      ///   Send Email
      function SendEmail : Boolean;

      //////////////////////////////////////////////////////////////
      ///   Setting
      property Server     : string  read GetServer     write SetServer;
      property Port       : string  read GetPort       write SetPort;
      property UserName   : string  read GetUserName   write SetUserName;
      property Password   : string  read GetPassword   write SetPassword;
      property Reciepient : string  read GetReciepient write SetReciepient;
      property UseTLS     : Boolean read GetUseTLS     write SetUseTLS;
      //////////////////////////////////////////////////////////////
      ///   Message Send
      property SentTo     : string      read GetSentTo     write SetSentTo;
      property Subject    : string      read GetSubject    write SetSubject;
      property Body       : TStringList read GetBody       write SetBody;
      property Attachment : string      read GetAttachment write SetAttachment;
   end;


implementation

uses
   Vcl.Forms,
   Vcl.Dialogs,
   IdComponent,
   IdTCPConnection,
   IdTCPClient,
   IdHTTP,
   IdBaseComponent,
   IdMessage,
   IdExplicitTLSClientServerBase,
   IdMessageClient,
   IdSMTPBase,
   IdSMTP,
   IdIOHandler,
   IdIOHandlerSocket,
   IdIOHandlerStack,
   IdSSL,
   IdSSLOpenSSL,
   IdAttachmentFile,
   IdText;

{ TEmail }

constructor TEmail.Create;
begin
   FBody := TStringList.Create;
end;

constructor TEmail.Create(sServer, sPort, sUserName, sPassword, sReciepient: string; sUseTLS: Boolean; sSentTo, sSubject: string;
  sBody: TStringList; sAttachment: string);
begin
   Create;
   //////////////////////////////////////////////////////////////
   ///   Setting
   FServer     := sServer;
   FPort       := sPort;
   FUserName   := sUserName;
   FPassword   := sPassword;
   FReciepient := sReciepient;
   FUseTLS     := sUseTLS;
   //////////////////////////////////////////////////////////////
   ///   Message Send
   FSentTo     := sSentTo;
   FSubject    := sSubject;
   FBody.Assign(sBody);
   FAttachment := sAttachment;
end;

destructor TEmail.Destroy;
begin
   FBody.DisposeOf;
   inherited Destroy;
end;

function TEmail.GetAttachment: string;
begin
   Result := FAttachment;
end;

function TEmail.GetBody: TStringList;
begin
   Result := FBody;
end;

function TEmail.GetPassword: string;
begin
   Result := FPassword;
end;

function TEmail.GetPort: string;
begin
   Result := FPort;
end;

function TEmail.GetReciepient: string;
begin
   Result := FReciepient;
end;

function TEmail.GetSentTo: string;
begin
   Result := FSentTo;
end;

function TEmail.GetServer: string;
begin
   Result := FServer;
end;

function TEmail.GetSubject: string;
begin
   Result := FSubject;
end;

function TEmail.GetUserName: string;
begin
   Result := UserName;
end;

function TEmail.GetUseTLS: Boolean;
begin
   Result := FUseTLS;
end;

function TEmail.SendEmail: Boolean;
var
  IdMsg   : TIdMessage;
  SMTP    : TIdSMTP;
  SSL     : TIdSSLIOHandlerSocketOpenSSL;
  //IdText  : TIdText;

begin
   Result := False;

   SMTP   := TIdSMTP.Create(nil);
   IdMsg  := TIdMessage.Create(nil);
   SSL    := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
   try
      try
         //SSL
         SSL.SSLOptions.Method      := sslvSSLv23;
         SSL.SSLOptions.Mode        := sslmUnassigned;
         SSL.SSLOptions.VerifyMode  := [];
         SSL.SSLOptions.VerifyDepth := 0;

         //IdMsg
         IdMsg.CharSet      := 'utf-8';
         IdMsg.Encoding     := meMIME;
         IdMsg.Priority     := mpNormal;
         IdMsg.From.Name    := FReciepient;
         IdMsg.From.Address := FUserName;
         IdMsg.subject      := FSubject;

         // IdMsg
         //IdMsg.Recipients.Add;
         IdMsg.Recipients.EMailAddresses  := FSentTo;
         IdMsg.Body.Assign(FBody);

         //SMTP
         SMTP.IOHandler := SSL;
         if FUseTLS then
         begin
            SMTP.UseTLS := utUseExplicitTLS;
         end
         else
         begin
            SMTP.UseTLS := utUseImplicitTLS;
         end;
         SMTP.AuthType  := satDefault;
         SMTP.Host      := FServer;
         SMTP.Port      := FPort.ToInteger;
         SMTP.username  := FUserName;
         SMTP.password  := FPassword;

         SMTP.Connect;

         if FAttachment <> EmptyStr then
         begin
            if FileExists(FAttachment) then
            begin
               TIdAttachmentFile.Create(IdMsg.MessageParts, FAttachment);
            end;
         end;

         if SMTP.Connected then
         begin
            try
               SMTP.Send(IdMsg);
            except
               on E:Exception do
               begin
                  Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
               end;
            end;
         end;

         while SMTP.Connected do
         begin
            SMTP.Disconnect;
            Result := True;
         end;
      finally
         UnLoadOpenSSLLibrary;
         SMTP.Free;
         IdMsg.Free;
         SSL.Free;
         //IdText.Free;
      end;

   except
      on e:Exception do
      begin
         Application.MessageBox(PChar(E.Message), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
      end;
   end;
end;

procedure TEmail.SetAttachment(const Value: string);
begin
   if Value <> FAttachment then
      FAttachment := Value;
end;

procedure TEmail.SetBody(const Value: TStringList);
begin
   if Value <> FBody then
      FBody := Value;
end;

procedure TEmail.SetPassword(const Value: string);
begin
   if Value <> FPassword then
      FPassword := Value;
end;

procedure TEmail.SetPort(const Value: string);
begin
   if Value <> FPort then
      FPort := Value;
end;

procedure TEmail.SetReciepient(const Value: string);
begin
   if Value <> FReciepient then
      FReciepient := Value;
end;

procedure TEmail.SetSentTo(const Value: string);
begin
   if Value <> FSentTo then
      FSentTo := Value;
end;

procedure TEmail.SetServer(const Value: string);
begin
   if Value <> FServer then
      FServer := Value;
end;

procedure TEmail.SetSubject(const Value: string);
begin
   if Value <> FSubject then
      FSubject := Value;
end;

procedure TEmail.SetUserName(const Value: string);
begin
   if Value <> FUserName then
      FUserName := Value;
end;

procedure TEmail.SetUseTLS(const Value: Boolean);
begin
   if Value <> FUseTLS then
      FUseTLS := Value;
end;

end.
