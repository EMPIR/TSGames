namespace SetGame
{
    public class SetPiece
    {
#region public enums
        
        public enum ColorType
        {
            Red = 1,
            Green = 2,
            Blue = 3
        };

        public enum FillType
        {
            Solid = 1,
            Hollow = 2,
            Striped = 3
        };

        public enum ShapeType
        {
            Diamond = 1,
            Cylinder = 2,
            Squiggle = 3
        };

        public enum NumberType
        {
            One = 1,
            Two = 2,
            Three = 3
        }
        #endregion

#region private member variables
        private int m_color;
        private int m_fill;
        private int m_shape;
        private int m_number;
        private int m_index;
        private string m_url;
#endregion

#region public constructor
        public SetPiece()
        {
        }

        public SetPiece(int shape, int color, int fill, int number, string url)
        {
            Shape = shape;
            Color = color;
            Fill = fill;
            Number = number;
            URL = url;
        }
#endregion

#region public member functions

        public string URL
        {
            get { return m_url; }
            set { m_url = value; }
        }

        public override bool Equals(System.Object obj)
        {
            // If parameter is null return false.
            if (obj == null)
            {
                return false;
            }

            // If parameter cannot be cast to Point return false.
            SetPiece p = obj as SetPiece;
            if ((System.Object)p == null)
            {
                return false;
            }

            // Return true if the fields match:
            return (Color == p.Color) && (Fill == p.Fill) &&
                   (Shape == p.Shape) && (Number == p.Number);
        }
        public int Index
        {
            get { return m_index; }
            set { m_index = value; }
        }
        public int Color
        {
            get { return m_color; }
            set { m_color = value; }
        
        }

        

        

        public int Fill
        {
            get { return m_fill; }
            set { m_fill = value; }

        }

        

        public int Shape
        {
            get { return m_shape; }
            set { m_shape = value; }

        }


        public int Number
        {
            get { return m_number; }
            set { m_number = value; }

        }
#endregion  //public member functions

#region public string functions

        public string ColorStr
        {
            get
            {
                switch (m_color)
                {
                    case (int)ColorType.Red:
                        {
                            return "Red";
                        };
                    case (int)ColorType.Blue:
                        {
                            return "Blue";
                        };
                    case (int)ColorType.Green:
                        {
                            return "Green";
                        };
                    default:
                        {
                            return "undefined";
                        }
                };
            }


        }

        public string FillStr
        {
            get
            {
                switch (m_fill)
                {
                    case (int)FillType.Hollow:
                        {
                            return "Hollow";
                        };
                    case (int)FillType.Solid:
                        {
                            return "Solid";
                        };
                    case (int)FillType.Striped:
                        {
                            return "Striped";
                        };
                    default:
                        {
                            return "undefined";
                        }
                };
            }


        }

        public string ShapeStr
        {
            get
            {
                switch (m_shape)
                {
                    case (int)ShapeType.Cylinder:
                        {
                            return "Cylinder";
                        };
                    case (int)ShapeType.Diamond:
                        {
                            return "Diamond";
                        };
                    case (int)ShapeType.Squiggle:
                        {
                            return "Squiggle";
                        };
                    default:
                        {
                            return "undefined";
                        }
                };
            }


        }


        public string NumberStr
        {
            get
            {
                switch (m_number)
                {
                    case (int)NumberType.One:
                        {
                            return "One";
                        };
                    case (int)NumberType.Two:
                        {
                            return "Two";
                        };
                    case (int)NumberType.Three:
                        {
                            return "Three";
                        };
                    default:
                        {
                            return "undefined";
                        }
                };
            }


        }

#endregion //public string functions

    }
}