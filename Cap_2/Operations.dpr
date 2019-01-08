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
  Dll.ClasOperation in 'Dll.ClasOperation.pas';

{$R *.res}

function Suma(iA : Integer; iB : Integer) : Integer; stdcall;
begin
   try
      Result  := (iA + iB);
   except
      on E : Exception do
      begin
         raise Exception.Create(E.Message);
      end;
   end;
end;

function Resta(iA : Integer; iB : Integer) : Integer; stdcall;
begin
   Result := (iA - iB);
end;

function Multiplicar(iA : Integer; iB : Integer) : Integer; stdcall;
begin
   Result := Trunc(iA * iB);
end;

function Dividir(iA : Integer; iB : Integer) : Integer; stdcall;
begin
   Result := Trunc(iA / iB);
end;

exports Suma;
exports Resta;
exports Multiplicar;
exports Dividir;

begin

end.
