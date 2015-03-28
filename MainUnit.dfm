object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Painter'
  ClientHeight = 807
  ClientWidth = 1338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object MainImage: TImage
    Left = -3
    Top = 0
    Width = 1089
    Height = 807
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    OnClick = MainImageClick
    OnMouseMove = MainImageMouseMove
  end
  object MainPanel: TPanel
    Left = 1083
    Top = 0
    Width = 255
    Height = 807
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alRight
    TabOrder = 0
    object XLabel: TLabel
      Left = 152
      Top = 782
      Width = 18
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '0'
    end
    object YLabel: TLabel
      Left = 191
      Top = 782
      Width = 26
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '0'
    end
    object PenLabel: TLabel
      Left = 24
      Top = 218
      Width = 23
      Height = 17
      Caption = 'Pen'
    end
    object BrushLabel: TLabel
      Left = 168
      Top = 218
      Width = 35
      Height = 17
      Caption = 'Brush'
    end
    object PenColorBox: TColorBox
      Left = 24
      Top = 242
      Width = 40
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
    end
    object DeleteBtn: TButton
      Left = 22
      Top = 592
      Width = 78
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Delete'
      TabOrder = 1
      OnClick = DeleteBtnClick
    end
    object RedrawBtn: TButton
      Left = 148
      Top = 592
      Width = 76
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Redraw'
      TabOrder = 2
      OnClick = RedrawBtnClick
    end
    object NumberEdit: TLabeledEdit
      Left = 24
      Top = 559
      Width = 201
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      EditLabel.Width = 54
      EditLabel.Height = 17
      EditLabel.Margins.Left = 4
      EditLabel.Margins.Top = 4
      EditLabel.Margins.Right = 4
      EditLabel.Margins.Bottom = 4
      EditLabel.Caption = 'Number:'
      TabOrder = 3
    end
    object BrushColorBox: TColorBox
      Left = 168
      Top = 242
      Width = 40
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 4
    end
    object NumberAngels: TLabeledEdit
      Left = 24
      Top = 294
      Width = 169
      Height = 25
      EditLabel.Width = 110
      EditLabel.Height = 17
      EditLabel.Caption = 'Number Of Angles'
      Enabled = False
      TabOrder = 5
      Text = '4'
    end
    object UpDown: TUpDown
      Left = 192
      Top = 294
      Width = 21
      Height = 25
      TabOrder = 6
      OnChangingEx = UpDownChangingEx
    end
    object ShapeGroup: TRadioGroup
      Left = 24
      Top = 10
      Width = 193
      Height = 167
      Caption = 'Shape'
      TabOrder = 7
    end
    object PixelBtn: TRadioButton
      Left = 40
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Pixel'
      Checked = True
      TabOrder = 8
      TabStop = True
    end
    object LineBtn: TRadioButton
      Left = 40
      Top = 55
      Width = 113
      Height = 17
      Caption = 'Line'
      TabOrder = 9
    end
    object RectBtn: TRadioButton
      Left = 40
      Top = 78
      Width = 113
      Height = 17
      Caption = 'Rect'
      TabOrder = 10
    end
    object EllipseBtn: TRadioButton
      Left = 40
      Top = 101
      Width = 113
      Height = 17
      Caption = 'Ellipse'
      TabOrder = 11
    end
    object TriBtn: TRadioButton
      Left = 40
      Top = 124
      Width = 113
      Height = 17
      Caption = 'Tri'
      TabOrder = 12
    end
    object PolygonBtn: TRadioButton
      Left = 40
      Top = 147
      Width = 113
      Height = 17
      Caption = 'Polygon'
      TabOrder = 13
    end
  end
end
