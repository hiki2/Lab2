unit ShapesDraw;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Shape, System.Generics.Collections,Math;

Type

  TDrawShapes = class
    public
      procedure Draw(var Image : TImage);virtual; abstract;
  end;

  TDrawPixel = class(TDrawShapes)
    private
      Pixel : TPixel;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Pixel : TPixel);
  end;


  TDrawLine = class(TDrawShapes)
    private
      Line : TLine;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Line : TLine);
  end;

  TDrawRect = class(TDrawShapes)
    private
      Rect : TRect;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Rect : TRect);
  end;

  TDrawEllipse = class(TDrawShapes)
    private
      Ellipse : TEllipse;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Ellipse : TEllipse);

  end;

  TDrawTri = class(TDrawShapes)
    private
      Tri : TTri;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Tri : TTri);
  end;

  TDrawPolygon = class(TDrawShapes)
    private
      Polygon : TPolygon;
    public
      procedure Draw(var Image : TImage);override;
      Constructor Create(Polygon : TPolygon);
  end;

implementation

  constructor TDrawPixel.Create(Pixel: TPixel);
  begin
    self.Pixel := Pixel;
  end;

  constructor TDrawLine.Create(Line: TLine);
  begin
    self.Line := Line;
  end;

  constructor TDrawRect.Create(Rect: TRect);
  begin
    self.Rect := Rect;
  end;

  constructor TDrawEllipse.Create(Ellipse: TEllipse);
  begin
    self.Ellipse := Ellipse;
  end;

  constructor TDrawTri.Create(Tri: TTri);
  begin
    self.Tri := Tri;
  end;

  constructor TDrawPolygon.Create(Polygon: TPolygon);
  begin
    self.Polygon := Polygon;
  end;

  procedure TDrawPixel.Draw(var Image: TImage);
  begin
    Image.Canvas.Pixels[self.Pixel.FirstPos.X,self.Pixel.FirstPos.Y] := self.Pixel.Color;
  end;

  procedure TDrawLine.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := self.Line.Color;
    Image.Canvas.MoveTo(self.Line.FirstPos.X,self.Line.FirstPos.Y);
    Image.Canvas.LineTo(self.Line.SecondPos.X,self.Line.SecondPos.Y);
  end;

  procedure TDrawRect.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := self.Rect.Color;
    Image.Canvas.Brush.Color := self.Rect.FillColor;
    Image.Canvas.Rectangle(self.Rect.FirstPos.X,self.Rect.FirstPos.Y,self.Rect.SecondPos.X,self.Rect.SecondPos.Y);
  end;

  procedure TDrawEllipse.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := self.Ellipse.Color;
    Image.Canvas.Brush.Color := self.Ellipse.FillColor;
    Image.Canvas.Ellipse(self.Ellipse.FirstPos.X,self.Ellipse.FirstPos.Y,self.Ellipse.SecondPos.X,self.Ellipse.SecondPos.Y);
  end;

  procedure TDrawTri.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := self.Tri.Color;
    Image.Canvas.Brush.Color := self.Tri.FillColor;
    Image.Canvas.Polygon([self.Tri.FirstPos,self.Tri.SecondPos,self.Tri.ThirdPos]);
  end;

  procedure TDrawPolygon.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := self.Polygon.Color;
    Image.Canvas.Brush.Color := self.Polygon.FillColor;
    Image.Canvas.Polygon(self.Polygon.PosArr);
  end;
end.
