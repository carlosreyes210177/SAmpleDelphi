//////////////////////////////////////
/// <author>Ing. Carlos Reyes</author>
/// <Date>12/02/2019</Date>


unit AppDragDrop.FrmDragDrop2;

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
   Vcl.ComCtrls,
   RzListVw,
   System.ImageList,
   Vcl.ImgList;

type
   TfrmDragDrop2 = class(TForm)
      lvGroupsSource : TListView;
      lvGroupsTarget : TListView;
      btnRemoveAll   : TButton;
      btnAddAll      : TButton;
      btnRemove      : TButton;
      btnAdd         : TButton;
      il1            : TImageList;

      procedure lvGroupsSourceDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure lvGroupsTargetDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure lvGroupsSourceDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure lvGroupsTargetDragDrop(Sender, Source: TObject; X, Y: Integer);
      procedure btnAddClick(Sender: TObject);
      procedure btnRemoveClick(Sender: TObject);
      procedure btnAddAllClick(Sender: TObject);
      procedure btnRemoveAllClick(Sender: TObject);

  private
  { Private declarations }
      procedure AddList(var Source : TListView; var Target : TListView);
      procedure AddAllList(var Source : TListView; var Target : TListView);


  public
    { Public declarations }
  end;

var
  frmDragDrop2: TfrmDragDrop2;

implementation

uses
   Winapi.CommCtrl;

{$R *.dfm}


procedure TfrmDragDrop2.AddAllList(var Source, Target: TListView);
var
   I : NativeInt;
   L : TListItem;
begin
   Source.Items.BeginUpdate;
   try
      for I := Source.Items.Count -1 downto 0 do
      begin
         Source.Selected := Source.Items[I];
         L := Target.Items.Add;
         L.Assign(Source.Selected);
         Source.Items[I].Delete;

         Target.GetNextItem(L, sdAll, [isSelected]);
         Target.Selected := L;
      end;
   finally
      Source.Items.EndUpdate;
   end;
end;

procedure TfrmDragDrop2.AddList(var Source, Target: TListView);
var
   L : TListItem;
begin
   if Source.Selected <> nil then
   begin
       L := Target.Items.Add;
       L.Assign(Source.Selected);
       L.ImageIndex := 0;
       Source.Selected.Delete;

       Target.GetNextItem(L, sdAll, [isSelected]);
       Target.Selected := L;
   end;
end;

procedure TfrmDragDrop2.btnAddAllClick(Sender: TObject);
begin
   AddAllList(lvGroupsSource, lvGroupsTarget);
end;

procedure TfrmDragDrop2.btnAddClick(Sender: TObject);
begin
   AddList(lvGroupsSource, lvGroupsTarget);
end;

procedure TfrmDragDrop2.btnRemoveAllClick(Sender: TObject);
begin
   AddAllList(lvGroupsTarget, lvGroupsSource);
end;

procedure TfrmDragDrop2.btnRemoveClick(Sender: TObject);
begin
   AddList(lvGroupsTarget, lvGroupsSource);
end;

procedure TfrmDragDrop2.FormCreate(Sender: TObject);
var
   I : Integer;
begin
   lvGroupsSource.Columns[0].Width := LVSCW_AUTOSIZE_USEHEADER;
   lvGroupsTarget.Columns[0].Width := LVSCW_AUTOSIZE_USEHEADER;
   lvGroupsSource.Clear;
   lvGroupsTarget.Clear;

   for I := 0 to 9 do
   begin
      with lvGroupsSource.Items.Add do
      begin
         Caption := 'Usuario ' + I.ToString;
      end;
   end;
end;

procedure TfrmDragDrop2.lvGroupsSourceDragDrop(Sender, Source: TObject; X, Y: Integer);
var
   L : TListItem;
begin
   if (Sender is TListView) and (Source is TListView) then
   begin
      while TListView(Source).Selected <> nil do
      begin
         L := TListView(Sender).Items.Add;
         L.Assign(TListView(Source).Selected);

         L := TListView(Source).Selected;
         TListView(Source).GetNextItem(L, sdAll, [isSelected]);
         L.Delete;
      end;
   end;
end;

procedure TfrmDragDrop2.lvGroupsSourceDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Sender is TListView) and (Source is TListView);
end;

procedure TfrmDragDrop2.lvGroupsTargetDragDrop(Sender, Source: TObject; X, Y: Integer);
var
   L : TListItem;
begin
   if (sender is TListView) and (Source is TListView) then
   begin
      while TListView(Source).Selected <> nil do
      begin
         L := TListView(Sender).Items.Add;
         L.Assign(TListView(Source).Selected);

         L := TListView(Source).Selected;
         TListView(Source).GetNextItem(L, sdAll, [isSelected]);
         L.Delete;
      end;
   end;
end;

procedure TfrmDragDrop2.lvGroupsTargetDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Sender is TListView) and (Source is TListView);
end;

end.
