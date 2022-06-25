unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation, FMX.ListBox;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    loData: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    btnRefresh: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    procedure addItem(LstBox:TListBox;AText:String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

const
  hari : array [1..7] of string = ('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu');

procedure TForm1.addItem(LstBox:TListBox;AText:String);
var
 lo : TLayout;
 lb : TListBoxItem;
begin
  Label1.Text   := LstBox.Items.Count.ToString;
  Label2.Text   := AText;

  lb            := TListBoxItem.Create(ListBox1);
  lb.Height     := loData.Height;
  lb.Tag        := LstBox.Items.Count;
  lb.Selectable := True;

  lo            := TLayout(loData.Clone(lb));
  lo.Align      := TAlignLayout.Client;
  lo.Visible    := True;

  lb.AddObject(lo);
  LstBox.AddObject(lb);
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
var I : Integer;
begin

  //Dilooping dari sini
  //Database pakai WHILE NOT EOF
  for I := low(hari) to high(hari) do addItem(ListBox1,hari[I]);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  loData.Visible := false;
  btnRefreshClick(self);
end;

procedure TForm1.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  ShowMessage('Hari '+hari[Item.Tag+1]);
end;

end.
