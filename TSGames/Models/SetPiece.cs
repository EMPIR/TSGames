namespace SetGame
{
    public class SetPiece
    {
        public enum ColorType
        {
            Red = 1,
            Greem = 2,
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

        private int m_color;
        private int m_fill;
        private int m_shape;
        private int m_number;

        public SetPiece()
        {
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

        

    }
}