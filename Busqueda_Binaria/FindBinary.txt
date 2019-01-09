program FindBinary;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Winapi.Windows;

procedure ClearScreen;
var
   stdout      : THandle;
   csbi        : TConsoleScreenBufferInfo;
   ConsoleSize : DWORD;
   NumWritten  : DWORD;
   Origin      : TCoord;
begin
   stdout := GetStdHandle(STD_OUTPUT_HANDLE);
   Win32Check(stdout<>INVALID_HANDLE_VALUE);
   Win32Check(GetConsoleScreenBufferInfo(stdout, csbi));
   ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;
   Origin.X := 0;
   Origin.Y := 0;
   Win32Check(FillConsoleOutputCharacter(stdout, ' ', ConsoleSize, Origin, NumWritten));
   Win32Check(FillConsoleOutputAttribute(stdout, csbi.wAttributes, ConsoleSize, Origin, NumWritten));
   Win32Check(SetConsoleCursorPosition(stdout, Origin));
end;

var
   c       : Integer;
   First   : Integer;
   Last    : Integer;
   Middle  : Integer;
   n       : Integer;
   search  : Integer;
   iarray  : array[0..99] of Integer;
begin
   try
      ClearScreen;
      Writeln('Ingrese numero de elementos');
      Readln(n);
      Writeln('ingrese ' + n.ToString + ' Enteros');

      for var I := 0 to n -1 do
      begin
         Readln(iarray[I]);
      end;

      Writeln('Ingrese numero a buscar');
      Readln(search);

      /////////////////////////
      First  := 0;
      Last   := n -1;
      Middle := Trunc((First + Last)/2);
      while (First <= Last) do
      begin
         if iarray[Middle] < search then
         begin
            First := Middle + 1;
         end
         else
         if iarray[Middle] = search then
         begin
            Writeln(search.ToString + ' se encuentra en la ubicacion ' + Integer(Middle + 1).ToString);
            Break;
         end
         else
         begin
            Last := Middle -1;
         end;
         Middle := Trunc((First + Last)/2);
      end;

      if First > Last then
      begin
         Writeln('Mo se encontro!' + search.ToString + ' no esta presente en la lista');
      end;

      Readln;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
end.
