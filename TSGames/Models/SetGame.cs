namespace SetGame
{
    public class Game
    {
        private SetPiece m_piece; 
        public Game()
        {
            m_piece         = new SetPiece();
            m_piece.Color   = (int) SetPiece.ColorType.Red;
            m_piece.Fill    = (int)SetPiece.FillType.Solid;
            m_piece.Shape   = (int)SetPiece.ShapeType.Cylinder;
            m_piece.Number = (int)SetPiece.NumberType.Three;


        }

        public SetPiece Piece 
        {
            get { return m_piece;}
        }






    }
}