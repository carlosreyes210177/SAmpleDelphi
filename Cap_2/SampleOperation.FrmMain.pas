unit SampleOperation.FrmMain;

interface

//{$DEFINE STATIC_DLL}
{$DEFINE DYNAMIC_DLL}
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
   Vcl.StdCtrls, Vcl.WinXCtrls;

type
   TfrmMain = class(TForm)
      btnClose          : TButton;
      grp1              : TGroupBox;
      edtValorA         : TEdit;
      edtValorB         : TEdit;
      lblValorA         : TLabel;
      lblValorB         : TLabel;
      edtResult         : TEdit;
      lblResult         : TLabel;
      btnRun            : TButton;
      grpResta          : TGroupBox;
      lblValorAResta    : TLabel;
      lblValorBResta    : TLabel;
      lblResultResta    : TLabel;
      edtValorAResta    : TEdit;
      edtValorBResta    : TEdit;
      edtResultResta    : TEdit;
      btnRunResta       : TButton;
      grpmMulti         : TGroupBox;
      lblValorAMulti    : TLabel;
      lblValorBMulti    : TLabel;
      lblResultMulti    : TLabel;
      edtValorAMulti    : TEdit;
      edtValorBMulti    : TEdit;
      edtResultMulti    : TEdit;
      btnRunMulti       : TButton;
      grpDividir        : TGroupBox;
      lblValorADividir  : TLabel;
      lblValorBDividir  : TLabel;
      lblResulDividir   : TLabel;
      edtValorADividir  : TEdit;
      edtValorBDividir  : TEdit;
      edtResultDividir  : TEdit;
      btnRunDividir     : TButton;

      procedure btnCloseClick(Sender: TObject);
      procedure btnRunClick(Sender: TObject);
      procedure btnRunRestaClick(Sender: TObject);
      procedure btnRunMultiClick(Sender: TObject);
      procedure btnRunDividirClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);

   private
   { Private declarations }
      function ValidNumber(const sValueA : string; const sValueB : string) : Boolean;
      {$IFDEF DYNAMIC_DLL}
      ///////////////////////////////////////
      /// Dynamic Load
      function GetSuma(const iA : Integer; const iB : Integer): Integer;
      function GetResta(iA : Integer; iB : Integer) : Integer;
      function GetMultiplicar(iA : Integer; iB : Integer) : Integer;
      function GetDividir(iA : Integer; iB : Integer) : Integer;
      {$ENDIF}
   public
   { Public declarations }

   end;

var
  frmMain: TfrmMain;

implementation

uses
   System.Threading;

{$R *.dfm}



///////////////////////////////////////
// Estatic Load
{$IFDEF STATIC_DLL}
function Suma(iA : Integer; iB : Integer) : Integer; stdcall; external 'Operations.dll';
function Resta(iA : Integer; iB : Integer) : Integer; stdcall; external 'Operations.dll';
function Multiplicar(iA : Integer; iB : Integer) : Integer; stdcall; external 'Operations.dll';
function Dividir(iA : Integer; iB : Integer) : Integer; stdcall; external 'Operations.dll';
{$ENDIF}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
   Close;
end;


procedure TfrmMain.btnRunClick(Sender: TObject);
begin
   if ValidNumber(edtValorA.Text, edtValorB.Text) then
   begin
      TTask.Run(
               procedure
               begin
                  if TTask.CurrentTask.Status <> TTaskStatus.Canceled then
                  begin
                     TThread.Synchronize(TThread.CurrentThread,
                                                             procedure
                                                             begin
                                                               {$IFDEF STATIC_DLL}
                                                               edtResult.Text := Suma(StrToInt(edtValorA.Text), StrToInt(edtValorB.Text)).ToString;
                                                               {$ENDIF}
                                                               {$IFDEF DYNAMIC_DLL}
                                                               edtResult.Text := GetSuma(StrToInt(edtValorA.Text), StrToInt(edtValorB.Text)).ToString;
                                                               {$ENDIF}
                                                             end);
                  end;
               end);
   end;
end;

procedure TfrmMain.btnRunDividirClick(Sender: TObject);
begin
   if ValidNumber(edtValorADividir.Text, edtValorBDividir.Text) then
   begin
      TTask.Run(
               procedure
               begin
                  if TTask.CurrentTask.Status <> TTaskStatus.Canceled then
                  begin
                     TThread.Synchronize(TThread.CurrentThread,
                                                             procedure
                                                             begin
                                                               {$IFDEF STATIC_DLL}
                                                               edtResultDividir.Text := Dividir(StrToInt(edtValorADividir.Text), StrToInt(edtValorBDividir.Text)).ToString;
                                                               {$ENDIF}
                                                               {$IFDEF DYNAMIC_DLL}
                                                               edtResultDividir.Text := GetDividir(StrToInt(edtValorADividir.Text), StrToInt(edtValorBDividir.Text)).ToString;
                                                               {$ENDIF}
                                                             end);
                  end;
               end);
   end;
end;

procedure TfrmMain.btnRunMultiClick(Sender: TObject);
begin
   if ValidNumber(edtValorAMulti.Text, edtValorBMulti.Text) then
   begin
      TTask.Run(
               procedure
               begin
                  if TTask.CurrentTask.Status <> TTaskStatus.Canceled then
                  begin
                     TThread.Synchronize(TThread.CurrentThread,
                                                             procedure
                                                             begin
                                                               {$IFDEF STATIC_DLL}
                                                               edtResultMulti.Text := Multiplicar(StrToInt(edtValorAMulti.Text), StrToInt(edtValorBMulti.Text)).ToString;
                                                               {$ENDIF}
                                                               {$IFDEF DYNAMIC_DLL}
                                                               edtResultMulti.Text := GetMultiplicar(StrToInt(edtValorAMulti.Text), StrToInt(edtValorBMulti.Text)).ToString;
                                                               {$ENDIF}
                                                             end);
                  end;
               end);
   end;
end;

procedure TfrmMain.btnRunRestaClick(Sender: TObject);
begin
   if ValidNumber(edtValorAResta.Text, edtValorBResta.Text) then
   begin
      TTask.Run(
               procedure
               begin
                  if TTask.CurrentTask.Status <> TTaskStatus.Canceled then
                  begin
                     TThread.Synchronize(TThread.CurrentThread,
                                                             procedure
                                                             begin
                                                               {$IFDEF STATIC_DLL}
                                                               edtResultResta.Text := Resta(StrToInt(edtValorAResta.Text), StrToInt(edtValorBResta.Text)).ToString;
                                                               {$ENDIF}
                                                               {$IFDEF DYNAMIC_DLL}
                                                               edtResultResta.Text := GetResta(StrToInt(edtValorAResta.Text), StrToInt(edtValorBResta.Text)).ToString;
                                                               {$ENDIF}
                                                             end);
                  end;
               end);
   end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   SetCurrentDir(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))));
end;

{$IFDEF DYNAMIC_DLL}
function TfrmMain.GetDividir(iA, iB: Integer): Integer;
type
   TDividirFunc = function(iA : Integer; iB : Integer) : Integer; stdcall;
var
   dllHandle   : cardinal;
   DividirFunc : TDividirFunc;
begin
   Result := 0;
   dllHandle := Winapi.Windows.LoadLibrary('Operations.dll');
   if dllHandle <> 0 then
   begin
      try
         @DividirFunc := GetProcAddress(dllHandle, 'Dividir') ;
         if Assigned(DividirFunc) then
         begin
            Result := DividirFunc(iA, iB);
         end
         else
         begin
            Application.MessageBox(PChar('Function Suma no se encontro'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
         end;
      finally
         Winapi.Windows.FreeLibrary(dllHandle);
      end;
   end
   else
   begin
      ShowMessage('Operations.dll  not found/not loaded') ;
   end;
end;

function TfrmMain.GetMultiplicar(iA, iB: Integer): Integer;
type
   TMultiplicarFunc = function(iA : Integer; iB : Integer) : Integer; stdcall;
var
   dllHandle        : cardinal;
   MultiplicarFunc  : TMultiplicarFunc;
begin
   Result := 0;
   dllHandle := Winapi.Windows.LoadLibrary('Operations.dll');
   if dllHandle <> 0 then
   begin
      try
         @MultiplicarFunc := GetProcAddress(dllHandle, 'Multiplicar') ;
         if Assigned(MultiplicarFunc) then
         begin
            Result := MultiplicarFunc(iA, iB);
         end
         else
         begin
            Application.MessageBox(PChar('Function Suma no se encontro'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
         end;
      finally
         Winapi.Windows.FreeLibrary(dllHandle);
      end;
   end
   else
   begin
      ShowMessage('Operations.dll  not found/not loaded') ;
   end;
end;

function TfrmMain.GetResta(iA, iB: Integer): Integer;
type
   TRestaFunc = function(iA : Integer; iB : Integer) : Integer; stdcall;
var
   dllHandle : cardinal;
   RestaFunc  : TRestaFunc;
begin
   Result := 0;
   dllHandle := Winapi.Windows.LoadLibrary('Operations.dll');
   if dllHandle <> 0 then
   begin
      try
         @RestaFunc := GetProcAddress(dllHandle, 'Resta') ;
         if Assigned(RestaFunc) then
         begin
            Result := RestaFunc(iA, iB);
         end
         else
         begin
            Application.MessageBox(PChar('Function Suma no se encontro'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
         end;
      finally
         Winapi.Windows.FreeLibrary(dllHandle);
      end;
   end
   else
   begin
      ShowMessage('Operations.dll  not found/not loaded') ;
   end;
end;

function TfrmMain.GetSuma(const iA, iB: Integer): Integer;
type
   TSumaFunc = function(iA : Integer; iB : Integer) : Integer; stdcall;
var
   dllHandle : cardinal;
   SumaFunc  : TSumaFunc;
begin
   Result := 0;
   dllHandle := Winapi.Windows.LoadLibrary('Operations.dll');
   if dllHandle <> 0 then
   begin
      try
         @SumaFunc := GetProcAddress(dllHandle, 'Suma') ;
         if Assigned(SumaFunc) then
         begin
            Result := SumaFunc(iA, iB);
         end
         else
         begin
            Application.MessageBox(PChar('Function Suma no se encontro'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
         end;
      finally
         Winapi.Windows.FreeLibrary(dllHandle);
      end;
   end
   else
   begin
      ShowMessage('Operations.dll  not found/not loaded') ;
   end;
end;
{$ENDIF}

function TfrmMain.ValidNumber(const sValueA, sValueB : string): Boolean;
var
   iValue : Integer;
begin
   Result := True;
   ///////////////////////////////////////
   ///   valido los valores ingresdos en EDIT
   if sValueA.IsEmpty then
   begin
      Application.MessageBox(PChar('Ingrese el valor A'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
      Result := False;
      Exit;
   end;

   if sValueB.IsEmpty then
   begin
      Application.MessageBox(PChar('Ingrese el valor B'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
      Result := False;
      Exit;
   end;

   if not TryStrToInt(sValueA, iValue) then
   begin
      Application.MessageBox(PChar('Valor ingresado no es valido'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
      Result := False;
      Exit;
   end;

   if not TryStrToInt(sValueB, iValue) then
   begin
      Application.MessageBox(PChar('Valor ingresado no es valido'), PChar(Application.Title), MB_OK + MB_ICONSTOP + MB_TOPMOST);
      Result := False;
      Exit;
   end;
end;

end.
