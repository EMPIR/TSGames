using System;
using System.Collections;
using System.Collections.Generic;

namespace SetGame
{
    public class Game
    {
        private List<SetPiece> m_pieces;
        private bool m_match = false;
        private List<int> m_matches;

        public Game()
        {
            m_pieces = new List<SetPiece>();
            m_pieces = SetLogic.CreatePieces(12);
            m_matches = SetLogic.ContainsMatch(m_pieces);

            if (m_matches.Count > 0)
            {
                Match = true;
            }
            else
            {
                Match = false;
            }

        }

        public List<int> Matches
        {
            get { return m_matches; }
        }
        public bool Match
        {
            get { return m_match; }
            set { m_match = value; }
        }
       

        public List<SetPiece> Pieces
        {
            get { return m_pieces; }
        }






    }
}