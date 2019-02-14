//////////////////////////////////////
/// <author>Ing. Carlos Reyes</author>
/// <Date>12/02/2019</Date>


unit AppDragDrop.FrmDragDrop;

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
   RzButton,
   System.ImageList,
   Vcl.ImgList, Vcl.StdCtrls;

type
   TfrmDragDrop = class(TForm)
      lv1               : TListView;
    btnOrderFieldUp: TButton;
    btnOrderFieldDown: TButton;
    il1: TImageList;

      procedure FormCreate(Sender: TObject);
      procedure btnOrderFieldUpClick(Sender: TObject);
      procedure btnOrderFieldDownClick(Sender: TObject);
      procedure lv1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
      procedure lv1DragDrop(Sender, Source: TObject; X, Y: Integer);

   private
   { Private declarations }
      procedure AddItems;
      procedure ChangeItens(const OldItems : Integer; NewItems : Integer);

   public
   { Public declarations }


   end;

var
  frmDragDrop: TfrmDragDrop;

implementation

{$R *.dfm}

uses
   Winapi.CommCtrl;

{ TfrmDragDrop }

procedure TfrmDragDrop.AddItems;
var
   I : Integer;
begin
   lv1.Clear;
   for I := 0 to 25 do
   begin
      with lv1.Items.Add do
      begin
         Caption    := 'FIELD' + i.ToString;
         ImageIndex := 0;
      end;
   end;
end;

procedure TfrmDragDrop.btnOrderFieldDownClick(Sender: TObject);
begin
   ChangeItens(lv1.Selected.Index, (lv1.Selected.Index + 1));
end;

procedure TfrmDragDrop.btnOrderFieldUpClick(Sender: TObject);
begin
   ChangeItens(lv1.Selected.Index, (lv1.Selected.Index - 1));
end;

procedure TfrmDragDrop.ChangeItens(const OldItems: Integer; NewItems: Integer);
var
   tLI       : TListItem;
   IndexItem : Integer;
begin
   lv1.Items.BeginUpdate;
   try
      tLI := TListItem.Create(lv1.Items);
      tLI.Assign(lv1.Items[OldItems]);
      if lv1.Items[NewItems] <> nil then
      begin
         lv1.Items[OldItems].Assign(lv1.Items.Item[NewItems]);
         lv1.Items[NewItems].Assign(tLI);

         IndexItem                := lv1.ItemIndex;
         lv1.Items[NewItems].Data := Pointer(Integer(IndexItem));

         lv1.Items[NewItems].Selected := True;
         lv1.Items[NewItems].Focused  := True;
      end;
      tLI.Free;
   finally
      lv1.Items.EndUpdate
   end;
end;

procedure TfrmDragDrop.FormCreate(Sender: TObject);
begin
   lv1.Columns[0].Width := LVSCW_AUTOSIZE_USEHEADER;
   AddItems;
end;

procedure TfrmDragDrop.lv1DragDrop(Sender, Source: TObject; X, Y: Integer);
var
   DragItem     : TListItem;
   DropItem     : TListItem;
   CurrentItem  : TListItem;
   NextItem     : TListItem;
   IndexItem    : Integer;
begin
   ////////////////////////////////////
   if Sender = Source then
   begin
      with TListView(Sender) do
      begin
         DropItem    := GetItemAt(X, Y);
         CurrentItem := Selected;
         while CurrentItem <> nil do
         begin
            NextItem := GetNextItem(CurrentItem, SdAll, [IsSelected]);
            if DropItem = nil then
               DragItem := Items.Add
            else
               DragItem := Items.Insert(DropItem.Index);

            DragItem.Assign(CurrentItem);
            IndexItem     := DragItem.Index;
            DragItem.Data := Pointer(Integer(IndexItem));

            DragItem.Selected := True;
            DragItem.Focused  := True;

            CurrentItem.Free;
            CurrentItem := NextItem;
         end;
      end;
   end;

end;

procedure TfrmDragDrop.lv1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   ////////////////////////////////////
   Accept := (Sender is TListView) and (Source is TListView);
end;

end.

