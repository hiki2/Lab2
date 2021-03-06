unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages,System.TypInfo, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Shape,ShapesDraw,System.Generics.Collections,
  Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    MainImage: TImage;
    MainPanel: TPanel;
    PenColorBox: TColorBox;
    XLabel: TLabel;
    YLabel: TLabel;
    DeleteBtn: TButton;
    RedrawBtn: TButton;
    NumberEdit: TLabeledEdit;
    BrushColorBox: TColorBox;
    NumberAngels: TLabeledEdit;
    UpDown: TUpDown;
    PenLabel: TLabel;
    BrushLabel: TLabel;
    ShapeGroup: TRadioGroup;
    PixelBtn: TRadioButton;
    LineBtn: TRadioButton;
    RectBtn: TRadioButton;
    EllipseBtn: TRadioButton;
    TriBtn: TRadioButton;
    PolygonBtn: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure MainImageMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure MainImageClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure RedrawBtnClick(Sender: TObject);
    procedure UpDownChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  TwoAngels = 2;
  TreeAngels = 3;

var
  MainForm: TMainForm;
  tempPointArr : TList<TPoint>;
  ShapeDrawerList : TList<TDrawShapes>;

implementation

{$R *.dfm}

procedure ReDraw(List : TList<TDrawShapes>; Image : TImage);
var
  i: Integer;
Begin
  Image.Picture := nil;
  for i := 0 to ShapeDrawerList.Count - 1 do
    List.Items[i].Draw(Image);
End;

procedure Delete(var List : TList<TPoint>);
var
  i : Integer;
Begin
  for i := List.Count - 1 downto 0 do
    List.Delete(i);
End;

function ReColor(Shape : TShapes; Pen : TColor; Brush : TColor) : TShapes;
Begin
  Shape.Color := Pen;
  TColoredShapes(Shape).FillColor := Brush;
  result := Shape;
End;


procedure TMainForm.DeleteBtnClick(Sender: TObject);
begin
  try
    ShapeDrawerList.Delete(StrToInt(NumberEdit.Text) - 1);
    ReDraw(ShapeDrawerList,MainImage);
  except
    ShowMessage('This shape is not exist');
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  tempPointArr := TList<TPoint>.Create;
  ShapeDrawerList := TList<TDrawShapes>.Create;
end;

procedure TMainForm.MainImageClick(Sender: TObject);
var
  Shape : TShapes;
begin
  tempPointArr.Add(TPoint.Create(StrToInt(XLabel.Caption),StrToInt(YLabel.Caption)));
  if PixelBtn.Checked then
  Begin
    Shape := TPixel.Create(tempPointArr.Items[0]);
    Shape.Color := PenColorBox.Selected;
    ShapeDrawerList.Add(TDrawPixel.Create(TPixel(Shape)));
    Delete(tempPointArr);
  End;
  if tempPointArr.Count = TwoAngels then
  Begin
    if LineBtn.Checked then
    Begin
      Shape := TLine.Create(tempPointArr.Items[0],tempPointArr.Items[1]);
      Shape.Color := PenColorBox.Selected;
      ShapeDrawerList.Add(TDrawLine.Create(TLine(Shape)));
      Delete(tempPointArr);
    End;
    if RectBtn.Checked then
    Begin
      Shape := TRect.Create(tempPointArr.Items[0],tempPointArr.Items[1]);
      Shape.Color := PenColorBox.Selected;
      TColoredShapes(Shape).FillColor := BrushColorBox.Selected;
      ShapeDrawerList.Add(TDrawRect.Create(TRect(Shape)));
      Delete(tempPointArr);
    End;
    if EllipseBtn.Checked then
    Begin
      Shape := TEllipse.Create(tempPointArr.Items[0],tempPointArr.Items[1]);
      Shape.Color := PenColorBox.Selected;
      TColoredShapes(Shape).FillColor := BrushColorBox.Selected;
      ShapeDrawerList.Add(TDrawEllipse.Create(TEllipse(Shape)));
      Delete(tempPointArr);
    End;
  end;
  if tempPointArr.Count = TreeAngels then
  Begin
    if TriBtn.Checked then
    Begin
      Shape := TTri.Create(tempPointArr.Items[0],tempPointArr.Items[1],tempPointArr.Items[2]);
      Shape.Color := PenColorBox.Selected;
      TColoredShapes(Shape).FillColor := BrushColorBox.Selected;
      ShapeDrawerList.Add(TDrawTri.Create(TTri(Shape)));
      Delete(tempPointArr);
    End;
  End;
  if tempPointArr.Count = StrToInt(NumberAngels.Text) then
  Begin
    if PolygonBtn.Checked then
    Begin
      Shape := TPolygon.Create(TDot(tempPointArr.ToArray));
      Shape.Color := PenColorBox.Selected;
      TColoredShapes(Shape).FillColor := BrushColorBox.Selected;
      ShapeDrawerList.Add(TDrawPolygon.Create(TPolygon(Shape)));
      Delete(tempPointArr);
    end;
  End;
  ReDraw(ShapeDrawerList,MainImage);
end;

procedure TMainForm.MainImageMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
  XLabel.Caption := IntToStr(X);
  YLabel.Caption := IntToStr(Y);
end;

procedure TMainForm.RedrawBtnClick(Sender: TObject);
begin
  ReDraw(ShapeDrawerList,MainImage);
end;

procedure TMainForm.UpDownChangingEx(Sender: TObject; var AllowChange: Boolean;
  NewValue: Integer; Direction: TUpDownDirection);
var
  temp : integer;
begin
  temp := StrToInt(NumberAngels.Text);
  if (Direction = updUp) and (temp >= 4 ) then
    inc(temp);
  if (Direction = updDown) and (temp > 4 ) then
    dec(temp);
  NumberAngels.Text := IntToStr(temp);
end;

end.
