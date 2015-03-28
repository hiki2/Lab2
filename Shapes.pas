unit Shapes;

interface

uses
  Graphics,Math,System.Types,Vcl.ExtCtrls;

Type
  TShapes = class
    private
      fColor : TColor;
      function GetColor : TColor;
      procedure SetColor(NewColor : TColor);
    public
      //procedure Draw(var Image : TImage); virtual; abstract;
      function GetType : TShapes; virtual; abstract;
    published
      property Color : TColor read GetColor write SetColor default clBlack;
  end;

  TPixel = class(TShapes)
    public
      FirstPos : TPoint;
      Constructor Create(FirstPos : TPoint);
      //procedure Draw(var Image : TImage); override;
      function GetType : TShapes; override;

  end;

  TLine = class(TPixel)
    public
      SecondPos : TPoint;
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
      //procedure Draw(var Image : TImage); override;
      function GetType : TShapes; override;
  end;

  TColoredShapes = class(TLine)
    private
      fFillColor : TColor;
      function GetFillColor : TColor;
      procedure SetFillColor(NewFillColor : TColor);
    public
      //procedure Draw(var Image : TImage); override; abstract;
      function GetType : TShapes; override; abstract;
    published
      property FillColor : TColor read GetFillColor write SetFillColor default clWhite;
  end;

  TTri = class(TColoredShapes)
    public
      ThirdPos : TPoint;
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint; ThirdPos : TPoint);
      function GetType : TShapes; override;
      //procedure Draw(var Image : TImage); override;
  end;

  TRect = class(TColoredShapes)
    public
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
      function GetType : TShapes; override;
      //procedure Draw(var Image : TImage); override;
  end;

  TEllipse = class(TColoredShapes)
    public
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
      function GetType : TShapes; override;
      //procedure Draw(var Image : TImage); override;
  end;

implementation

  constructor TPixel.Create(FirstPos: TPoint);
  begin
    self.FirstPos := FirstPos;
  end;

  constructor TLine.Create(FirstPos: TPoint; SecondPos: TPoint);
  begin
    inherited Create(FirstPos);
    self.SecondPos := SecondPos;
  end;

  constructor TTri.Create(FirstPos: TPoint; SecondPos: TPoint; ThirdPos: TPoint);
  begin
    inherited Create(FirstPos,SecondPos);
    self.ThirdPos := ThirdPos;
  end;

  constructor TRect.Create(FirstPos: TPoint; SecondPos: TPoint);
  begin
    inherited Create(FirstPos,SecondPos);
  end;

  constructor TEllipse.Create(FirstPos: TPoint; SecondPos: TPoint);
  begin
    inherited Create(FirstPos,SecondPos);
  end;

  function TShapes.GetColor;
  begin
    result := self.fColor;
  end;

  procedure TShapes.SetColor(NewColor: TColor);
  begin
    self.fColor := NewColor;
  end;

  function TColoredShapes.GetFillColor;
  begin
    result := self.fFillColor;
  end;

  procedure TColoredShapes.SetFillColor(NewFillColor: TColor);
  begin
    self.fFillColor := NewFillColor;
  end;


  {procedure TPixel.Draw(var Image : TImage);
  begin
    Image.Canvas.Pixels[self.FirstPos.X,self.FirstPos.Y] := self.fColor;
  end;

  procedure TLine.Draw(var Image : TImage);
  begin
    Image.Canvas.Pen.Color := fColor;
    Image.Canvas.MoveTo(self.FirstPos.X,self.FirstPos.Y);
    Image.Canvas.LineTo(self.SecondPos.X,self.SecondPos.Y);
  end;

  procedure TTri.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := fColor;
    Image.Canvas.Brush.Color := fFillColor;
    Image.Canvas.Polyline([self.FirstPos,self.SecondPos,self.ThirdPos,self.FirstPos]);
  end;

  procedure TRect.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := fColor;
    Image.Canvas.Brush.Color := fFillColor;
    Image.Canvas.Rectangle(self.FirstPos.X,self.FirstPos.Y,self.SecondPos.X,self.SecondPos.Y);
  end;

  procedure TEllipse.Draw(var Image: TImage);
  begin
    Image.Canvas.Pen.Color := fColor;
    Image.Canvas.Brush.Color := fFillColor;
    Image.Canvas.Ellipse(self.FirstPos.X,self.FirstPos.Y,self.SecondPos.X,self.SecondPos.Y);
  end;}

  function TPixel.GetType : TShapes;
  var
    Pixel : TPixel;
  begin
    Pixel := TPixel.Create(self.FirstPos);
    Pixel.Color := self.fColor;
    result := Pixel;
  end;

  function TLine.GetType : TShapes;
  var
    Line : TLine;
  begin
    Line := TLine.Create(self.FirstPos,self.SecondPos);
    Line.Color := self.fColor;
    result := Line;
  end;

  function TRect.GetType : TShapes;
  var
    Rect : TRect;
  begin
    Rect := TRect.Create(self.FirstPos,self.SecondPos);
    Rect.Color := self.fColor;
    Rect.FillColor := self.fFillColor;
    result := Rect;
  end;

  function TEllipse.GetType : TShapes;
  var
    Ellipse : TEllipse;
  begin
    Ellipse := TEllipse.Create(self.FirstPos,self.SecondPos);
    Ellipse.Color := self.fColor;
    Ellipse.FillColor := self.fFillColor;
    result := Ellipse;
  end;

  function TTri.GetType : TShapes;
  var
    Tri : TTri;
  begin
    Tri := TTri.Create(self.FirstPos,self.SecondPos,self.ThirdPos);
    Tri.Color := self.fColor;
    Tri.FillColor := self.fFillColor;
    result := Tri;
  end;
end.
