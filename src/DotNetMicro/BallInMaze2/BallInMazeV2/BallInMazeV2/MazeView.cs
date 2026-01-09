using System;
using Microsoft.SPOT;
using DeviceSolutions.SPOT;
using Microsoft.SPOT.Presentation;
using Microsoft.SPOT.Presentation.Media;
using Microsoft.SPOT.Presentation.Controls;

namespace BallInMazeV2
{
#if !USE_FULL_WPF
    /// <summary>UIElement to act as the view for a maze</summary>
    class MazeView : UIElement
    {
        Bitmap BallBitmap;
        Bitmap MazeBitmap;
        Font f;
        MazeWithBall Maze;
        Pen LinePen;
        SolidColorBrush BkgBrush; 

        int BallIndex;

        public MazeView(MazeWithBall Maze)
        {
            
            this.Maze = Maze;
            this.Maze.OnMazeChanged += Maze_OnMazeChanged;
            this.Maze.OnBallPositionChanged += Maze_OnBallPositionChanged;

            // Set the font
            this.f = Resources.GetFont( Resources.FontResources.small );

            // Set the default ball color
            BallIndex = 0;

            // default to white background
            this.BkgBrush = new SolidColorBrush(Color.White);
            this.LinePen = new Pen(Color.Black);

            // Get the ball bitmap
            this.BallBitmap = BitMaps.CompositedBitMap(Resources.BinaryResources.RedBall, this.BkgBrush.Color);
            this.MazeBitmap = null;
        }

        // NOTE This should be using BkgBrush.Color
        Bitmap[] Balls = {
            BitMaps.CompositedBitMap( Resources.BinaryResources.BlueBall, Color.White ),
            BitMaps.CompositedBitMap( Resources.BinaryResources.GreenBall,Color.White ),
            BitMaps.CompositedBitMap( Resources.BinaryResources.YellowBall, Color.White),
            BitMaps.CompositedBitMap( Resources.BinaryResources.RedBall, Color.White )
        };

        public void ChangeBall()
        {
            BallIndex = ( BallIndex + 1 ) % 4;
            this.BallBitmap = Balls[BallIndex];
            this.Invalidate();
        }

        void Maze_OnBallPositionChanged(object Src, EventArgs e)
        {
            this.Invalidate();
        }

        void Maze_OnMazeChanged(object sender, EventArgs e)
        {
            this.MazeBitmap = null;
            this.Invalidate();
        }

        public override void OnRender(DrawingContext dc)
        {
            if(this.MazeBitmap == null)
                GenerateMazeBitmap(dc);
            else
                dc.DrawImage(this.MazeBitmap, 0,0);

            DrawBall(dc, this.Maze.BallPosition);

        }
        
        void DrawBall(DrawingContext dc, Point Pos)
        {
            int left = Pos.x - this.Maze.BallRadius;
            int top = Pos.y - this.Maze.BallRadius;
            int size = this.Maze.BallRadius * 2;

            dc.DrawImage(this.BallBitmap, left, top, 0, 0, size, size);
        }


        void GenerateMazeBitmap(DrawingContext dc)
        {
            // First fill the area for the maze with background color
            dc.DrawRectangle(this.BkgBrush, null, 0, 0, this.ActualWidth, this.ActualHeight);
            
            // Draw edges for each cell in the maze.
            Point gridPos = new Point(0, 0);
            for(gridPos.y = 0; gridPos.y < this.Maze.Height; ++gridPos.y)
            {
                for(gridPos.x = 0; gridPos.x < this.Maze.Width; ++gridPos.x)
                {
                    Maze.Edges edges = this.Maze.GetCellInfo(gridPos);
                    int top = gridPos.y * this.Maze.CellHeight; 
                    int left = gridPos.x * this.Maze.CellWidth;
                    int bottom = top + this.Maze.CellHeight - 1;
                    int right = left + this.Maze.CellWidth - 1;

                    // Draw each edge as specified by the flags...

                    if(0 != (edges & BallInMazeV2.Maze.Edges.Top))
                        dc.DrawLine(this.LinePen, left, top, right, top);

                    if (0 != (edges & BallInMazeV2.Maze.Edges.Bottom))
                        dc.DrawLine(this.LinePen, left, bottom, right, bottom);

                    if (0 != (edges & BallInMazeV2.Maze.Edges.Left))
                        dc.DrawLine(this.LinePen, left, top, left, bottom);

                    if (0 != (edges & BallInMazeV2.Maze.Edges.Right))
                        dc.DrawLine(this.LinePen, right, top, right, bottom);
                }
            }

            // Put the static text on the screen
            dc.DrawText( "[SW1] Calibrate", this.f, Colors.Blue, 3, 225 );
            dc.DrawText( "[SW5] Change ball", this.f, Colors.Blue, 100, 225 );
            dc.DrawText( "[SW7] New Game", this.f, Colors.Blue, 210, 225 );

            // Cache a clone of the bit map as-is for faster rendering later 
            this.MazeBitmap = new Bitmap(dc.Bitmap.Width, dc.Bitmap.Height);

            // cheat here with unsupported method as there is no other way to make a copy of a bitmap
            this.MazeBitmap.DrawImage(0, 0, dc.Bitmap, 0, 0, dc.Bitmap.Width, dc.Bitmap.Height);
        }
    }
#else
    /// <summary>UI Element for a single "cell" in the maze grid</summary>
    class MazeCell : UIElement
    {
        Pen Line;
        Brush Bkg;
        MazeWithBall Maze;
        Point GridLocation;

        /// <summary>Creates a new Maze cell</summary>
        /// <param name="Edges">edge flags indicating which edges of the cell have a wall</param>
        public MazeCell(MazeWithBall Maze, Point GridLocation, Color Bkg)
        {
            this.Line = new Pen(Color.Black);
            this.Bkg = new SolidColorBrush(Bkg);
            this.Maze = Maze;
            this.GridLocation = new Point(GridLocation);
        }

        /// <summary>Renders a cell by drawing the walls</summary>
        /// <param name="dc">Drawing Context for rendering</param>
        public override void OnRender(DrawingContext dc)
        {
            Maze.Edges edges = this.Maze.GetCellInfo(this.GridLocation);
            // First fill the area for the cell with background color
            dc.DrawRectangle(Bkg, null, 0,0, this.ActualWidth, this.ActualHeight);

            // Draw each edge as specified by the flags...

            if(0 != (edges & BallInMaze.Maze.Edges.Top))
                dc.DrawLine(this.Line, 0, 0, this.ActualWidth-1, 0);

            if(0 != (edges & BallInMaze.Maze.Edges.Bottom))
                dc.DrawLine(this.Line, 0, this.ActualHeight-1, this.ActualWidth-1, this.ActualHeight-1);

            if(0 != (edges & BallInMaze.Maze.Edges.Left))
                dc.DrawLine(this.Line, 0, 0, 0, this.ActualHeight-1);

            if(0 != (edges & BallInMaze.Maze.Edges.Right))
                dc.DrawLine(this.Line, this.ActualWidth-1, 0, this.ActualWidth-1, this.ActualHeight-1);
        }
    }

    /// <summary>UIElement to act as the view for a maze</summary>
    class MazeView : Panel
    {
        MazeWithBall Maze;
        Image Ball;

        public MazeView(MazeWithBall Maze)
        {
            this.Maze = Maze;
            this.Maze.OnMazeChanged += Maze_OnMazeChanged;
            this.Maze.OnBallPositionChanged += Maze_OnBallPositionChanged;

            // default to white background
            Color bkg = Color.White;

            // create a MazeCell element child for each cell in the maze.
            Point gridPos = new Point(0, 0);
            for(gridPos.y = 0; gridPos.y < this.Maze.Height; ++gridPos.y )
            {
                for(gridPos.x = 0; gridPos.x < this.Maze.Width; ++gridPos.x )
                {
                    MazeCell cell = new MazeCell(this.Maze, gridPos, bkg);
                    this.Children.Add(cell);
                }
            }

            // add the ball as an Image element
            this.Ball = new Image(BitMaps.CompositedBitMap(Resources.BinaryResources.RedBall, bkg)); 
            this.Children.Add(this.Ball);
        }

        void Maze_OnBallPositionChanged(object Src, EventArgs e)
        {
            ArrangeBall();
        }

        void Maze_OnMazeChanged(object sender, EventArgs e)
        {
            this.InvalidateArrange();
        }
        
        // arranges all the child MazeCells in the view in a grid
        protected override void ArrangeOverride(int arrangeWidth, int arrangeHeight)
        {
            UIElementCollection children  = this.Children;
            if(children != null)
            {
                this.Maze.CellWidth = arrangeWidth / this.Maze.Width;
                this.Maze.CellHeight = arrangeHeight / this.Maze.Height;
                
                for(int i = 0; i < children.Count; ++i)
                {
                    Image img = children[i] as Image;
                    if(img == null)
                    {
                        int x = (i % this.Maze.Width) * this.Maze.CellWidth;
                        int y = (i / this.Maze.Width) * this.Maze.CellHeight;
                        children[i].Arrange(x, y, this.Maze.CellWidth, this.Maze.CellHeight);
                    }
                }

                ArrangeBall();
            }
        }

        private void ArrangeBall()
        {
            Point topLeftOffset = new Point(this.Maze.BallRadius, this.Maze.BallRadius);
            Point pos = this.Maze.BallPosition - topLeftOffset;
            int size = this.Maze.BallRadius * 2;
            Ball.Arrange(pos.x, pos.y, size, size);
        }
    }
#endif

}
