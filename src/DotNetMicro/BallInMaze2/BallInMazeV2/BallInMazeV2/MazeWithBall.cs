using System;
using Microsoft.SPOT;
using DeviceSolutions.SPOT;
using System.Collections;

namespace BallInMazeV2
{
    /// <summary>Extension of Maze class to include a ball within the maze</summary>
    /// <remarks>
    /// The ball begins in the center of cell grid location (0,0) the ball is
    /// moved by changing the ball acceleration property. Acceleration is the number
    /// of units the ball should move in 2 dimensions in a single tick. 
    /// </remarks>
    class MazeWithBall : Maze
    {
        /// <summary>Creates a new maze with a ball</summary>
        /// <param name="Width">Width of the maze in terms of cell grids</param>
        /// <param name="Height">Height of the maze in terms of cell grids</param>
        /// <param name="Accelerometer">Interface to the acceleromerometer</param>
        /// <remarks>
        /// <para>Creates a new maze with a ball in the upper left corner of the maze.
        /// The CellWidth, CellHeight and BallRadius properties are set to the
        /// defaults of 20,20, 10 respectively. The actual unit for these are not
        /// relevent to this maze model except that a value of 1 such unit is the
        /// smallest increment the ball can make. Thus it is up to the calling
        /// application to define the translation to any real world coordinate
        /// system. (Just using a pixel height and width is common for use on
        /// screen but is not required, thus allowing for scaling the view without
        /// needing to make changes to the model)</para>
        /// 
        /// <para>The ball radius must always be less than 90% the size of the cell in 
        /// either direction. This allows for some room to move.</para>
        /// </remarks>
        public MazeWithBall(int Width, int Height, IPanTiltProvider Accelerometer)
            : base(Width, Height, false)
        {
            // set up defaults
            this._CellWidth = 20;
            this._CellHeight = 20;
            this._BallRadius = 10;
            this.RadiusOffset = new Point(this._BallRadius, this._BallRadius);
            this.Accelerometer = Accelerometer;
            RegenerateMaze();
        }

        /// <summary>Event fired whenever the ball position changes</summary>
        public event EventHandler OnBallPositionChanged;

        #region Public property Accessors
        public int CellWidth
        {
            get { return _CellWidth; }
            set { ThrowIfSizeTooSmall(value); this._CellWidth = value; }
        }
        private int _CellWidth;

        public int CellHeight
        {
            get { return _CellHeight; }
            set { ThrowIfSizeTooSmall(value); this._CellHeight = value; }
        }
        private int _CellHeight;

        public int BallRadius
        {
            get { return _BallRadius; }
            set { ThrowIfRadiusTooBig(value); this._BallRadius = value; }
        }
        private int _BallRadius;

        public Point BallPosition
        {
            get { return _BallPosition; }
        }
        private Point _BallPosition;

        public Point BallVelocity
        {
            get { return _BallVelocity; }
            set { _BallVelocity = value; }
        }
        private Point _BallVelocity;

	
        #endregion


        /// <summary>Resets the ball to the upper left cell and sets velocity and acceleration to 0</summary>
        public override void RegenerateMaze()
        {
            this._BallPosition = new Point(this._BallRadius, this._BallRadius);
            this._BallVelocity = new Point(0, 0);
            base.RegenerateMaze();
        }




        /// <summary>Updates the ball position based on internal Physics properties</summary>
        public void UpdateTick()
        {
            this._BallVelocity += this.Accelerometer.Acceleration;
            int MaxXSpeed = (int)(this._CellWidth * 0.8);
            int MaxYSpeed = (int)(this._CellHeight * 0.8);

            if (this._BallVelocity.x > MaxXSpeed)  this._BallVelocity.x = MaxXSpeed;
            if (this._BallVelocity.x < -MaxXSpeed) this._BallVelocity.x = -MaxXSpeed;
            if (this._BallVelocity.y > MaxYSpeed)  this._BallVelocity.y = MaxYSpeed;
            if (this._BallVelocity.y < -MaxYSpeed) this._BallVelocity.y = -MaxYSpeed;
            Point newPos = this._BallPosition + this._BallVelocity;

            CheckForWalls(ref newPos);

            // if no movement occured; just return.
            if(newPos == this._BallPosition)
                return;

            // save the new position
            this._BallPosition = newPos;

            // the ball has moved - notify anyone that cares.
            if(OnBallPositionChanged!=null)
                OnBallPositionChanged(this, null);
        }

        private void CheckForWalls(ref Point NewPos)
        {
            Point oldCell = BallCell(this._BallPosition);
            Point newCell = BallCell(NewPos);
            
            // get the edges for the reference cell 
            Edges cellEdges = GetCellInfo(oldCell);

            // Get an offset for the square containing the ball relative
            // to the upper left corner of the original cell the ball was
            // in. This is needed to test against edges of the original cell.
            Point offsetInCell = this.BallOffsetInCell(oldCell, NewPos);
            Point ballBottomRightOffset = offsetInCell + this.RadiusOffset;
            Point ballTopLeftOffset = offsetInCell - this.RadiusOffset;

            CheckNSEW(ref NewPos, cellEdges, ballBottomRightOffset, ballTopLeftOffset);
            CheckDiagonals(ref NewPos, oldCell, newCell, cellEdges, ballBottomRightOffset, ballTopLeftOffset);
        }

        // Test for angular motion to other cells
        // A cell at a 4 way intersection has no
        // walls so the simple NSEW tests will allow
        // movement in any direction without stopping
        // on the walls of the adjacent cells. Thus,
        // allowing cheating!
        // NOTE:
        //    The approach taken here assumes the cell size
        //    and max velocity are such that the ball cannot
        //    move more than 1 cell in any direction for each
        //    tick.
        private void CheckDiagonals(ref Point NewPos, Point oldCell, Point newCell, Edges cellEdges, Point ballBottomRightOffset, Point ballTopLeftOffset)
        {
            // only bother testing if they are not the same cell
            if(oldCell != newCell)
            {
                Edges newCellEdges = this.GetCellInfo(newCell);

                // down and to the right
                if(newCell.x > oldCell.x && newCell.y > oldCell.y)
                {
                    // verify path from old cell to new cell
                    // either of the following is OK
                    // - old cell has no bottom wall AND new cell has no left wall
                    // - old cell has no right wall and new cell has no top wall
                    if(HasWall(cellEdges, Edges.Bottom) || HasWall(newCellEdges, Edges.Left)
                      && HasWall(cellEdges, Edges.Right) || HasWall(newCellEdges, Edges.Top)
                      )
                    {
                        // change position 
                        NewPos.x -= ballBottomRightOffset.x - this._CellWidth - 1;
                        this._BallVelocity.x = 0;
                        NewPos.y -= ballBottomRightOffset.y - this._CellHeight - 1;
                        this._BallVelocity.y = 0;
                    }
                }

                // down and to the left
                if(newCell.x < oldCell.x && newCell.y > oldCell.y)
                {
                    // verify path from old cell to new cell
                    // either of the following is OK
                    // - old cell has no bottom wall AND new cell has no right wall
                    // - old cell has no left wall and new cell has no top wall
                    if(HasWall(cellEdges, Edges.Bottom) || HasWall(newCellEdges, Edges.Right)
                      && HasWall(cellEdges, Edges.Left) || HasWall(newCellEdges, Edges.Top)
                      )
                    {
                        NewPos.y -= ballBottomRightOffset.y - this._CellHeight - 1;
                        this._BallVelocity.y = 0;
                        NewPos.x = (NewPos.x - ballTopLeftOffset.x) + 1;
                        this._BallVelocity.x = 0;
                    }
                }

                // up and to the right
                if(newCell.x > oldCell.x && newCell.y < oldCell.y)
                {
                    // verify path from old cell to new cell
                    // either of the following is OK
                    // - old cell has no top wall AND new cell has no left wall
                    // - old cell has no right wall and new cell has no bottom wall
                    if(HasWall(cellEdges, Edges.Top) || HasWall(newCellEdges, Edges.Left)
                      && HasWall(cellEdges, Edges.Right) || HasWall(newCellEdges, Edges.Bottom)
                      )
                    {
                        NewPos.y = (NewPos.y - ballTopLeftOffset.y) + 1;
                        this._BallVelocity.y = 0;
                        NewPos.x -= ballBottomRightOffset.x - this._CellWidth - 1;
                        this._BallVelocity.x = 0;
                    }
                }

                // up and to the left
                if(newCell.x < oldCell.x && newCell.y < oldCell.y)
                {
                    // verify path from old cell to new cell
                    // either of the following is OK
                    // - old cell has no bottom wall AND new cell has no left wall
                    // - old cell has no right wall and new cell has no top wall
                    if(HasWall(cellEdges, Edges.Bottom) || HasWall(newCellEdges, Edges.Left)
                      && HasWall(cellEdges, Edges.Right) || HasWall(newCellEdges, Edges.Top)
                      )
                    {
                        NewPos.y = (NewPos.y - ballTopLeftOffset.y) + 1;
                        this._BallVelocity.y = 0;
                        NewPos.x = (NewPos.x - ballTopLeftOffset.x) + 1;
                        this._BallVelocity.x = 0;
                    }
                }
            }
        }

        // Test each edge of the old cell to see if ball went past one
        // and adjust it back to the edge and stop movement in that direction
        private void CheckNSEW(ref Point NewPos, Edges cellEdges, Point ballBottomRightOffset, Point ballTopLeftOffset)
        {
            if(0 != (cellEdges & Edges.Left) && ballTopLeftOffset.x <= 0)
            {
                NewPos.x = (NewPos.x - ballTopLeftOffset.x) + 1;
                this._BallVelocity.x = 0;
            }

            if(0 != (cellEdges & Edges.Right) && ballBottomRightOffset.x > this._CellWidth)
            {
                NewPos.x -= ballBottomRightOffset.x - this._CellWidth - 1;
                this._BallVelocity.x = 0;
            }

            if(0 != (cellEdges & Edges.Top) && ballTopLeftOffset.y <= 0)
            {
                NewPos.y = (NewPos.y - ballTopLeftOffset.y) + 1;
                this._BallVelocity.y = 0;
            }

            if(0 != (cellEdges & Edges.Bottom) && ballBottomRightOffset.y > this._CellHeight)
            {
                NewPos.y -= ballBottomRightOffset.y - this._CellHeight - 1;
                this._BallVelocity.y = 0;
            }
        }

        // checks a set of edge flags for specifc wall(s)
        private bool HasWall(Edges CellEdges, Edges EdgeFlag)
        {
            return (CellEdges & EdgeFlag)==EdgeFlag;
        }

        // returns the grid cell that contains the ball (center point)
        private Point BallCell(Point BallPos)
        {
            int XPos = BallPos.x / this._CellWidth;
            int YPos = BallPos.y / this._CellHeight;

            if (XPos >= Width)  XPos = Width - 1;
            if (YPos >= Height) YPos = Height - 1;

            return new Point( XPos, YPos );
        }

        // location of the ball as an offset relative to the upper left corner of the specified cell
        private Point BallOffsetInCell(Point CellPos, Point BallPos)
        {
            Point cellTopLeft = new Point(CellPos.x * this._CellWidth, CellPos.y * this._CellHeight);
 
            return BallPos - cellTopLeft;
        }

        private void ThrowIfSizeTooSmall(int Size)
        {
            if(this._BallRadius > Size - Size/10)
                throw new ArgumentOutOfRangeException( "Cell size must be at least 10% greater than the BallRadius");
        }

        private void ThrowIfRadiusTooBig(int value)
        {
            if(this._BallRadius > this._CellHeight - this._CellHeight / 10
              || this._BallRadius > this._CellWidth - this._CellWidth / 10
              )
            {
                throw new ArgumentOutOfRangeException("Cell size must be at least 10% greater than the BallRadius");
            }
        }

        private Point RadiusOffset;
        private IPanTiltProvider Accelerometer; 
    }
}
