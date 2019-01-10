///////////////////////////////////////////
// Desarrollador : Ing. Carlos Reyes
// Email         : carlosreyes210177@gmail.com

unit Dll.ClasOperation;

interface
uses
   System.SysUtils,
   System.Classes;

type
   IOperation = interface
   ['{655F5196-7EBB-473F-BE76-99B33883A59D}']
      function Suma(const iA : Integer; const iB : Integer) : Integer;
      function Resta(const iA : Integer; const iB : Integer) : Integer;
      function Dividir(const iA : Integer; const iB : Integer) : Integer;
      function Multiplicar(const iA : Integer; const iB : Integer) : Integer;
   end;

   TOperation = class(TInterfacedObject, IOperation)
   private


   public
      constructor Create;
      destructor Destroy; override;

      function Suma(const iA : Integer; const iB : Integer) : Integer;
      function Resta(const iA : Integer; const iB : Integer) : Integer;
      function Dividir(const iA : Integer; const iB : Integer) : Integer;
      function Multiplicar(const iA : Integer; const iB : Integer) : Integer;
   end;


implementation

{ TOperation }

constructor TOperation.Create;
begin

end;

destructor TOperation.Destroy;
begin

   inherited Destroy;
end;

function TOperation.Dividir(const iA, iB: Integer): Integer;
begin
   try
      Result := Trunc(ia / iB);
   except
      on E : Exception do
      begin
         raise Exception.Create(e.Message);
      end;
   end;
end;

function TOperation.Multiplicar(const iA, iB: Integer): Integer;
begin
   try
      Result := Trunc(ia * iB);
   except
      on E : Exception do
      begin
         raise Exception.Create(e.Message);
      end;
   end;
end;

function TOperation.Resta(const iA, iB: Integer): Integer;
begin
   try
      Result := (ia - iB);
   except
      on E : Exception do
      begin
         raise Exception.Create(e.Message);
      end;
   end;

end;

function TOperation.Suma(const iA, iB: Integer): Integer;
begin
   try
      Result := (ia + iB);
   except
      on E : Exception do
      begin
         raise Exception.Create(e.Message);
      end;
   end;
end;

end.
