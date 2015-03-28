unit DrawShapes;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Shape, System.Generics.Collections,Math;

Type

  TDrawShapes = class(TShapes)
    public      
      procedure Draw(Pixel : TPixel; var Image : TImage); overload;
      procedure Draw(Line : TLine; var Image : TImage); overload;
      procedure Draw(Rect : TRect; var Image : TImage); overload;
      procedure Draw(Ellipse : TEllipse; var Image : TImage); overload;
      procedure Draw(Tri : TTri; var Image : TImage); overload;
      procedure Draw(Polygon: TPolygon; var Image: TImage);overload;
      procedure Draw(Shape : TShapes; var Image : TImage); overload;
  end;

implementation

  procedure TDrawShapes.Draw(Shape: TShapes; var Image: TImage);
  var
    MyType : string;
  begin
    MyType := Shape.ClassName;
    if MyType = 'TPixel' then Draw(TPixel(Shape),Image) else
    if MyType = 'TLine' then Draw(TLine(Shape),Image) else
    if MyType = 'TRect' then Draw(TRect(Shape),Image) else
    if MyType = 'TEllipse' then Draw(TEllipse(Shape),Image) else
    if MyType = 'TTri' then Draw(TTri(Shape),Image) else
    if MyType = 'TPolygon' then Draw(TPolygon(Shape),Image);
  end;

  procedure TDrawShapes.Draw(Pixel : TPixel; var Image : TImage);
  Begin
     Image.Canvas.Pixels[Pixel.FirstPos.X,Pixel.FirstPos.Y] := Pixel.Color;
  End;

  procedure TDrawShapes.Draw(Line : TLine; var Image : TImage);
  Begin
    Image.Canvas.Pen.Color := Line.Color;
    Image.Canvas.MoveTo(Line.FirstPos.X,Line.FirstPos.Y);
    Image.Canvas.LineTo(Line.SecondPos.X,Line.SecondPos.Y);
  End;

  procedure TDrawShapes.Draw(Rect : TRect; var Image : TImage);
  Begin
    Image.Canvas.Pen.Color := Rect.Color;
    Image.Canvas.Brush.Color := Rect.FillColor;
    Image.Canvas.Rectangle(Rect.FirstPos.X,Rect.FirstPos.Y,Rect.SecondPos.X,Rect.SecondPos.Y);
  End;

  procedure TDrawShapes.Draw(Ellipse : TEllipse; var Image : TImage);
  Begin
    Image.Canvas.Pen.Color := Ellipse.Color;
    Image.Canvas.Brush.Color := Ellipse.FillColor;
    Image.Canvas.Ellipse(Ellipse.FirstPos.X,Ellipse.FirstPos.Y,Ellipse.SecondPos.X,Ellipse.SecondPos.Y);
  End;

  procedure TDrawShapes.Draw(Tri : TTri; var Image : TImage);
  Begin
    Image.Canvas.Pen.Color := Tri.Color;
    Image.Canvas.Brush.Color := Tri.FillColor;
    Image.Canvas.Polygon([Tri.FirstPos,Tri.SecondPos,Tri.ThirdPos]);
  End;

  procedure TDrawShapes.Draw(Polygon: TPolygon; var Image: TImage);
  begin
    Image.Canvas.Pen.Color := Polygon.Color;
    Image.Canvas.Brush.Color := Polygon.FillColor;
    Image.Canvas.Polygon(Polygon.PosArr);
  end;
end.
