///////////////////////////////////////////
// Desarrollador : Ing. Carlos Reyes
// Email         : carlosreyes210177@gmail.com
library Operations;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs,
  Dll.ClasOperation in 'Dll.ClasOperation.pas';

{$R *.res}

function Suma(iA : Integer; iB : Integer) : Integer; stdcall;
var
   Operation : TOperation;
begin
   Operation := TOperation.Create;
   try
      Result := Operation.Suma(iA, iB);
   finally
      FreeAndNil(Operation);
   end;
end;

function Resta(iA : Integer; iB : Integer) : Integer; stdcall;
var
   Operation : TOperation;
begin
   Operation := TOperation.Create;
   try
      Result := Operation.Resta(iA, iB);
   finally
      FreeAndNil(Operation);
   end;
end;

function Multiplicar(iA : Integer; iB : Integer) : Integer; stdcall;
var
   Operation : TOperation;
begin
   Operation := TOperation.Create;
   try
      Result := Operation.Multiplicar(iA, iB);
   finally
      FreeAndNil(Operation);
   end;
end;

function Dividir(iA : Integer; iB : Integer) : Integer; stdcall;
var
   Operation : TOperation;
begin
   Operation := TOperation.Create;
   try
      Result := Operation.Dividir(iA, iB);
   finally
      FreeAndNil(Operation);
   end;
end;

exports Suma;
exports Resta;
exports Multiplicar;
exports Dividir;
end.
