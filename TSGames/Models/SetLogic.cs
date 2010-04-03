using TSGames.GameLogic;
using System.Collections.Generic;


namespace SetGame
{
    public class SetLogic
    {
#region public constructor


        public SetLogic()
        {
        }


        

        /// <summary>
        /// Creates a Set Piece with Random color, number, shape, fill
        /// </summary>
        /// <returns></returns>
        public static SetPiece CreatePiece()
        {
            SetPiece p = new SetPiece();
           
            p.Color = GameLogic.RandomNumber(1, 3);
            p.Number = GameLogic.RandomNumber(1, 3);
            p.Shape = GameLogic.RandomNumber(1, 3);
            p.Fill = GameLogic.RandomNumber(1, 3);
            return p;
        }

        public static bool Contains(SetPiece p, List<SetPiece> list)
        {
            foreach (SetPiece s in list)
            {
                if (p.Equals(s))
                    return true;
            }
            return false;
        }
        /// <summary>
        /// Creates a Set Piece with Random color, number, shape, fill that does not exist in the 
        /// given list of pieces
        /// </summary>
        /// <returns></returns>
        public static SetPiece CreatePiece(List<SetPiece> list)
        {
            bool cont = true;
            SetPiece p = new SetPiece();
            while (cont)
            {
                
                p.Color = GameLogic.RandomNumber(1, 3);
                p.Number = GameLogic.RandomNumber(1, 3);
                p.Shape = GameLogic.RandomNumber(1, 3);
                p.Fill = GameLogic.RandomNumber(1, 3);
                if (!Contains(p, list))
                {
                    //found a new card!
                    cont = false;
                }
            }
            return p;
        }

        /// <summary>
        /// Creates a Set Piece with Random color, number, shape. Fill is constant
        /// </summary>
        /// <returns></returns>
        public static SetPiece CreateSimplePiece()
        {
            SetPiece p = new SetPiece();

            p.Color = GameLogic.RandomNumber(1, 3);
            p.Number = GameLogic.RandomNumber(1, 3);
            p.Shape = GameLogic.RandomNumber(1, 3);
            p.Fill = 1;
            return p;
        }

        /// <summary>
        /// Creates a List of total Set Pieces with Random color, number, shape, and fill
        /// </summary>
        /// <param name="total"></param>
        /// <returns></returns>
        public static List<SetPiece> CreatePieces(int total)
        {
            List<SetPiece> m_pieces = new List<SetPiece>();
            for (int i = 0; i < total; ++i)
            {
                SetPiece p = CreatePiece(m_pieces);
                m_pieces.Add(p);
            }
            return m_pieces;
        }

        /// <summary>
        /// Creates a List of total Set Pieces with Random color, number, shape. Fill is constant
        /// </summary>
        /// <param name="total"></param>
        /// <returns></returns>
        public static List<SetPiece> CreateSimplePieces(int total)
        {
            List<SetPiece> m_pieces = new List<SetPiece>();
            for (int i = 0; i < total; ++i)
            {
                SetPiece p = CreateSimplePiece();
                m_pieces.Add(p);
            }
            return m_pieces;
        }


        /// <summary>
        /// This routine determines if the set of pieces contains a Set Match.
        /// If there are less than 3 pieces in the list, then the routine automatically
        /// returns false.   If there are 3 or more, then all possible combinations of
        /// 3 pieces are examined for a match.  If a match is found, the returning 
        /// list of integers is filled with the 3 indexes that makes the match in the 
        /// input array.  If no matches are found, the returned list is empty.
        /// </summary>
        /// <param name="pieces"></param>
        /// <returns></returns>
        public static List<int> ContainsMatch(List<SetPiece> pieces, List<int> state)
        {
            List<int> ret = new List<int>();
            if (pieces.Count < 3)
                return ret;

            //0,1,2,3

            //0,1,2
            //0,1,3
            //
            
            

            int p1; //permutation runner
            int r1; //runner 1
            int r2; //runner 2


            for(p1 = 0; p1 < state.Count - 2; ++p1)
            {
                for (r1 = p1 + 1; r1 < state.Count - 1; ++r1)
                {
                    for(r2 = r1 + 1; r2 < state.Count; ++r2)
                    {
                        if (ContainsMatch(pieces[state[p1]], pieces[state[r1]], pieces[state[r2]]))
                        {
                            ret.Add(state[p1]);
                            ret.Add(state[r1]);
                            ret.Add(state[r2]);


                            return ret;
                        }
                    }
                }
            }

            //no matches were found, so return the empty list;
            return ret;

        }


        /// <summary>
        /// Given 3 set pieces, this routine determines is there is a Match.
        /// To get a Match, all 4 variables (Color, Shape, Fill, and Number)
        /// must all be the same or all be different.  If a Match is found,
        /// the function returns true.  Otherwise,  it returns false.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool ContainsMatch(SetPiece a, SetPiece b, SetPiece c)
        {
            bool ret = true;
            if (!Match(a.Number, b.Number, c.Number))
                ret = false;
            if (ret && !Match(a.Color, b.Color, c.Color))
                ret = false;
            if (ret && !Match(a.Shape, b.Shape, c.Shape))
                ret = false;
            if (ret && !Match(a.Fill, b.Fill, c.Fill))
                ret = false;
            
            return ret;

        }


        /// <summary>
        /// Match Contains the matching logic, which is the 3 numbers
        /// have to be the same or all 3 have to be different to return
        /// true. Otherwise, it returns false.
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <param name="c"></param>
        /// <returns></returns>
        public static bool Match(int a, int b, int c)
        {
            if ((a == b && b == c) || (a != b && b != c && a != c))
            {
                return true;
            }
            return false;
        }

#endregion


        public static List<SetPiece> CreatePieces()
        {
            List<SetPiece> m_p = new List<SetPiece>();

            for (int i = 1; i <= 3; ++i)
            {
                for (int j = 1; j <= 3; ++j)
                {
                    for (int k = 1; k <= 3; ++k)
                    {
                        for (int l = 1; l <= 3; ++l)
                        {
                            string urlstr = "/Images/Pieces/"+i + j + k + l+".jpg";
                            m_p.Add(new SetPiece(i, j, k, l, urlstr));
                        }
                    }
                }
            }
            return m_p;
            
        }

        public static List<int> CreateState()
        {
            List<int> list = new List<int>();
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            list.Add(GameLogic.RandomNumber(0, 80));
            return list;

        }
    }
}