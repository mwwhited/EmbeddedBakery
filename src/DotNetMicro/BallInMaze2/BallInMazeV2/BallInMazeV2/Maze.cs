////////////////////////////////////////////////
// DESCRIPTION:
//    Sample Maze class
//
// Legal Notices:
//    Copyright (C) 2007, EmbeddedFusion
//    ALL RIGHTS RESERVED
//
//    This file, software, or program is supplied as part of a published
//    article or book, documentation sample or support library. Its use is
//    subject to the following terms:
//    
//    1) You may not alter or remove any Copyright, or other legal notices in the software.
//    2) You may not distribute or sell the software or derivatives for a fee.
//    3) You may incorporate the software in your own programs and systems
//       that add substantial functionality to it under any terms you wish. In any such
//       programs or modules you must credit EmbeddedFusion alongside any copyright
//       notice you place on your own program or documentation with the following: 
//       "Portions Copyright (C) 2007, EmbeddedFusion, Ltd."
//
// Disclaimer:
//    EmbeddedFusion makes no warranty of any kind regarding
//    this code.  This code is provided on an "As Is" basis and
//    EmbeddedFusion will not provide any support assistance,
//    installation, training or other services.
//    EmbeddedFusion does not provide any updates, enhancements
//    or extensions. EmbeddedFusion specifically disclaims any
//    warranty of merchantability, non-infringement, fitness for any
//    particular purpose, or any other warranty.
//
//    EmbeddedFusion disclaims all liability, including liability
//    for infringement of any proprietary rights, relating to use of the
//    code. No license, express or implied, by estoppel or otherwise,
//    to any intellectual property rights is granted herein.
//

using System;
using System.Collections;
using Microsoft.SPOT;
using DeviceSolutions.SPOT;

namespace BallInMazeV2
{
    /// <summary>Class for generating and representing a 2D Maze</summary>
    /// <remarks>
    /// While the Maze has dimensions in terms of grid rows and columns
    /// the actual units and scale of a single grid cell are not contained 
    /// in the Maze. This allows for great flexibility in the actual
    /// representation of the maze. For instance the overloaded 
    /// <see cref="Maze.ToString()">ToString()</see> method will provide
    /// a text based representation of the maze from it's raw binary data
    /// structure. GUI user interface can provide a graphical representation
    /// in whatever scale desired with walls having any dimensions and 
    /// representation desired.
    /// </remarks>
    /// <ImplementationNote>
    /// There are effectively two types of coordintates in use here. One
    /// is the public grid cell position that does not count walls as a
    /// cell, that is walls have no size and have no location. This is
    /// how we typically think about a maze drawn on a grid of graph
    /// paper. 
    /// 
    /// Secondly ther is the the internal matrix represented by the
    /// FullMazeGrid array, however DOES have walls as actual entries
    /// in the array due to how the maze generation algorithm works.
    /// In the internal array all even rows and even columns are for
    /// the walls. Odd rows and Odd Columns are the actual cells of
    /// the maze.
    /// 
    /// ALL public methods use the maze grid cell location information
    /// NOT the internal representation location. This keeps the
    /// application focused on the grid as generally thought of by a
    /// developer and hides the internal representation so it can be
    /// altered in the future, if desired. (perhaps more efficient
    /// algorithms for maze generation would need a different internal
    /// representation)
    /// </ImplementationNote>
    public class Maze
    {
        // array of cells where all even numbered rows and columns
        // contain wall information
        byte[] FullMazeGrid;

        /// <summary>Creates a new maze</summary>
        /// <param name="Width">Width of the maze in cells</param>
        /// <param name="Height">Height of the maze in cells</param>
        /// <remarks>
        /// Creates a new maze of the speified size.
        /// </remarks>
        public Maze(int Width, int Height)
            :this(Width, Height, true)
        {
        }

        /// <summary>Creates a new maze</summary>
        /// <param name="Width">Width of the maze in cells</param>
        /// <param name="Height">Height of the maze in cells</param>
        /// <param name="GenMaze">Flag to indicate if RegenerateMaze() should be called</param>
        /// <remarks>
        /// Creates a new maze of the speified size.
        /// </remarks>
        protected Maze(int Width, int Height, bool GenMaze)
        {
            // set up the cells array accounting for the walls
            this._Width = Width * 2 + 1;
            this._Height = Height * 2 + 1;
            this.FullMazeGrid = new byte[this._Width * this._Height];
            if(GenMaze)
                RegenerateMaze();
        }
        /// <summary>Event handled whenever the maze is re-generated</summary>
        public event EventHandler OnMazeChanged;

        ///<summary>width in terms of maze cells or spaces (not counting walls as a cell)</summary> 
        public int Width
        {
            get { return (_Width - 1) / 2; }
        }
        private int _Width;

        ///<summary>Height in terms of maze cells or spaces (not counting walls as a cell)</summary> 
        public int Height
        {
            get { return (_Height - 1) / 2; }
        }
        private int _Height;

        /// <summary>Flags used to indicate walls/Edges</summary>
        [Flags]
        public enum Edges
        {
            /// <summary>No walls on any edges</summary>
            None   = 0,
            /// <summary>Wall on the left edge</summary>
            Left   = 1,
            /// <summary>Wall on the right edge</summary>
            Right = 2,
            /// <summary>Wall on the top edge</summary>
            Top    = 4,
            /// <summary>Wall on the bottom edge</summary>
            Bottom = 8,
            /// <summary>Wall along all four edges</summary>
            All    = Left | Right | Bottom | Top
        }

        /// <summary>Gets all the information about the edges of the wall</summary>
        /// <param name="GridLocation">Maze grid cell location</param>
        /// <returns>Flags indicating the edges that have a wall</returns>
        public Edges GetCellInfo(Point GridLocation)
        {
            int cellindex = GetCellIndex(GridLocation);

            Edges retVal = 0;

            if(this.FullMazeGrid[cellindex - this._Width] == 0)
                retVal |= Edges.Top;

            if(this.FullMazeGrid[cellindex + this._Width] == 0)
                retVal |= Edges.Bottom;

            if(this.FullMazeGrid[cellindex + 1] == 0)
                retVal |= Edges.Right;

            if(this.FullMazeGrid[cellindex - 1] == 0)
                retVal |= Edges.Left;

            return retVal;
        }

        // gets the index into the FullMazeGrid Array of the maze cell
        // at the specified public grid coordinates. 
        private int GetCellIndex(Point GridLocation)
        {
            if((GridLocation.y > this.Height || GridLocation.y < 0)
              || (GridLocation.x > this.Width || GridLocation.x < 0)
              )
            {
                throw new IndexOutOfRangeException();
            }

            return GetIndex(new Point(GridLocation.x *2 + 1, GridLocation.y * 2 + 1));
        }

        // gets the index into the FullMazeGrid Array of the maze cell
        // at the specified internal matrix coordinates. 
        private int GetIndex(Point MatrixLocation)
        {
            return MatrixLocation.y * this._Width + MatrixLocation.x;
        }

        /// <summary>Generates a new maze with the same grid cell dimensions as this maze</summary>
        /// <remarks>
        /// This method wipes out all maze wall data for this instance and generates a new maze
        /// within the same grid cell deimensions. This does not create a new instance of a Maze
        /// object, instead it simply generates new interior wall/path content for the current one. 
        /// </remarks>
        public virtual void RegenerateMaze()
        {
            for(int i = 0; i < this.FullMazeGrid.Length; ++i)
                this.FullMazeGrid[i] = 0;

            // start the recursive call chain
            mazegen((this._Width + 1));
#if DEBUG
            Microsoft.SPOT.Debug.Print(this.ToString());
#endif
        }

        /// <summary>Recursive decent maze generation</summary>
        /// <param name="pos">Starting index in the Cells array</param>
        /// <remarks>
        /// Generates a "perfect" maze with no loops, no open areas (e.g. rooms)
        /// no closed areas and exactly one path from any point in the maze to
        /// any other. 
        /// 
        /// Basic idea is to start at one position and recursively trace a
        /// random path, marking each cell as used as you go, until you get
        /// to a point where there are no unused neighbors. Then back track
        /// the path until a cell is found that has unused neighbors and
        /// continue on down that. Until no more unused neighbors exist, and
        /// back tracking again etc... until all cells in the grid are used
        /// Eventually you end up with a perfect maze with no closed loops,
        /// no open areas and only one path between any 2 grid cells in the
        /// maze. 
        /// 
        /// Recursive decent is not the most efficient algorithm in terms of 
        /// speed or memory, however it is the simplest to understand and
        /// implement, which is why it was chosen for this sample application.
        /// Implementation of more efficient algorithhms is left as an
        /// excercise for the reader. 8^) 
        /// </remarks>
        void mazegen(int pos)
        {
            ArrayList neighbors;
            int offset;

            this.FullMazeGrid[pos] = 1;
            for(neighbors = FindUnusedNeighbors(pos); neighbors.Count != 0; neighbors = FindUnusedNeighbors(pos))
            {
                // pick a random neighbor from the set of valid unused neighbors
                offset = (int)neighbors[Microsoft.SPOT.Math.Random(neighbors.Count)];
                this.FullMazeGrid[pos + offset] = 1;
                mazegen(pos + 2 * offset);
            }

            if(this.OnMazeChanged!=null)
                OnMazeChanged(this, null);
        }

        // returns a list of all valid unused neighbors. 
        // all grid cells are created as unused (e.g. set to 0)
        // as each one is processed in mazegen() it is marked
        // as used by setting the value to 1. 
        ArrayList FindUnusedNeighbors(int pos)
        {
            ArrayList retVal = new ArrayList();

            if((pos > this._Width * 2) && (this.FullMazeGrid[pos - this._Width - this._Width] == 0))
                retVal.Add(-this._Width); // Up

            if((pos < this._Width * (this._Height - 2) && this.FullMazeGrid[pos + this._Width + this._Width] == 0))
                retVal.Add(this._Width); // Down

            if((pos % this._Width != this._Width - 2) && (this.FullMazeGrid[pos + 2] == 0))
                retVal.Add(1); // Right

            if((pos % this._Width != 1) && (this.FullMazeGrid[pos - 2] == 0))
                retVal.Add(-1); //Left

            return retVal;
        }

        /// <summary>Converts the internal maze binary structure into a text based representation</summary>
        /// <returns>String representation of the maze</returns>
        public override string ToString()
        {
            // look up table based on; or = Odd Row, oc = Odd Column, cv = Cell Value (0/1)
            // or oc cv r
            // 1  1  1  Space
            // 1  1  0  Space (Invalid)
            // 1  0  1  Space
            // 1  0  0  |
            // 0  1  1  Space
            // 0  1  0  -
            // 0  0  1  o
            // 0  0  0  o
            // Using this lookup table eliminates multi layered complex if statement 
            // condition testing to determine the correct character.
            char[] charMap = new char[] { 'o', 'o', '-', ' ', '|', ' ', ' ', ' ' };
            string result = string.Empty;
            
            Point matrixLocation = new Point(0,0);

            for(matrixLocation.y = 0; matrixLocation.y < this._Height; ++matrixLocation.y)
            {
                for(matrixLocation.x = 0; matrixLocation.x < this._Width; ++matrixLocation.x)
                {
                    int index = GetIndex(matrixLocation);
                    int mapIndex = ((matrixLocation.y & 1) << 2) | ((matrixLocation.x & 1) << 1) | this.FullMazeGrid[index];
                    result += charMap[mapIndex];
                }
                result += '\n';
            }

            return result;
        }
    }
}