using System;
using System.Collections;
using System.Collections.Generic;

namespace SetGame
{
    

    public class Game
    {
        private List<int> m_state;
        private List<SetPiece> m_pieces;
        private bool m_match = false;
        private List<int> m_matches;

        
        public Game()
        {
            m_pieces = SetLogic.CreatePieces();
            m_state = SetLogic.CreateState();
            m_matches = SetLogic.ContainsMatch(m_pieces,m_state);

            if (m_matches.Count > 0)
                Match = true;
            else
                Match = false;
        }

        public bool Move(int a, int b, int c)
        {
            if(SetLogic.ContainsMatch(m_pieces[a],m_pieces[b],m_pieces[c]))
            {
                return true;

            }
            return false;

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

        public List<int> State
        {
            get { return m_state; }
        }






    }
}