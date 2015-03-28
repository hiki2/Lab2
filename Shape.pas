unit Shape;

interface

uses
  Graphics,Math,System.Types,Vcl.ExtCtrls;

Type
  TDot = array of TPoint;
  TShapes = class(TObject)
    private
      fColor : TColor;
      function GetColor : TColor;
      procedure SetColor(NewColor : TColor);
    published
      property Color : TColor read GetColor write SetColor default clBlack;
  end;

  TPixel = class(TShapes)
    public
      FirstPos : TPoint;
      Constructor Create(FirstPos : TPoint);
  end;

  TLine = class(TPixel)
    public
      SecondPos : TPoint;
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
  end;

  TColoredShapes = class(TLine)
    private
      fFillColor : TColor;
      function GetFillColor : TColor;
      procedure SetFillColor(NewFillColor : TColor);
    published
      property FillColor : TColor read GetFillColor write SetFillColor default clWhite;
  end;

  TTri = class(TColoredShapes)
    public
      ThirdPos : TPoint;
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint; ThirdPos : TPoint);
  end;

  TRect = class(TColoredShapes)
    public
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
  end;

  TEllipse = class(TColoredShapes)
    public
      Constructor Create(FirstPos : TPoint; SecondPos : TPoint);
  end;

  TPolygon = class(TColoredShapes)
    public
      PosArr : TDot;
      Constructor Create(PosArr : TDot);
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

  constructor TPolygon.Create(PosArr: TDot);
  var
    i:integer;
  begin
    SetLength(self.PosArr,Length(PosArr));
    self.PosArr := Copy(PosArr,0,Length(PosArr));
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
end.
