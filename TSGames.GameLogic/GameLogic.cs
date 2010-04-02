using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TSGames.GameLogic
{
    public class GameLogic
    {
        static int increment = 0;
        static System.Random random = null;
        public GameLogic()
        {

        }

        /// <summary>
        /// returns a Random Number between 0.0 and 1.0
        /// </summary>
        /// <returns></returns>
        public static double RandomNumber()
        {
            if (random == null)
                random = new System.Random();
           
            return random.NextDouble();
        }

        /// <summary>
        /// returns a Random Number integer between the specified bounds
        /// </summary>
        /// <returns></returns>
        public static int RandomNumber(int floor, int ceiling)
        {
            if (random == null)
                random = new System.Random();

            double d = random.NextDouble();
            double dret = ((d * (ceiling - floor)));
            int ret = Convert.ToInt32(dret);
            ret+=floor;
            return ret;
        }
    }
}
