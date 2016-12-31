using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace CybeR_CryptZ
{

    public class Draw
    {

        [DebuggerNonUserCode]
        public Draw()
        {
        }

        public static void BackGround(int width, int height, Graphics G)
        {
            // trial
        }

        public static void Blend(Graphics g, Color c1, Color c2, Color c3, float c, int d, int x, int y, int width, int height)
        {
            // trial
        }

        public static void Gradient(Graphics g, Color c1, Color c2, int x, int y, int width, int height)
        {
            // trial
        }

        public static void Gradient(Graphics g, Color c1, Color c2, Rectangle r)
        {
            LinearGradientBrush linearGradientBrush = new LinearGradientBrush(r, c1, c2, LinearGradientMode.Vertical);
            try
            {
                g.FillRectangle(linearGradientBrush, r);
            }
            finally
            {
                bool flag = linearGradientBrush != null;
                if (flag)
                    linearGradientBrush.Dispose();
            }
        }

        public static GraphicsPath RoundedRectangle(int x, int y, int width, int height, int cornerwidth, int PenWidth)
        {
            GraphicsPath graphicsPath1 = new GraphicsPath();
            graphicsPath1.StartFigure();
            Rectangle rectangle = new Rectangle(x, y, cornerwidth, cornerwidth);
            graphicsPath1.AddArc(rectangle, 180.0F, 90.0F);
            graphicsPath1.AddLine(cornerwidth, y, checked(checked(width - cornerwidth) - PenWidth), y);
            rectangle = new Rectangle(checked(checked(width - cornerwidth) - PenWidth), y, cornerwidth, cornerwidth);
            graphicsPath1.AddArc(rectangle, -90.0F, 90.0F);
            graphicsPath1.AddLine(checked(width - PenWidth), cornerwidth, checked(width - PenWidth), checked(checked(height - cornerwidth) - PenWidth));
            rectangle = new Rectangle(checked(checked(width - cornerwidth) - PenWidth), checked(checked(height - cornerwidth) - PenWidth), cornerwidth, cornerwidth);
            graphicsPath1.AddArc(rectangle, 0.0F, 90.0F);
            graphicsPath1.AddLine(checked(checked(width - cornerwidth) - PenWidth), checked(height - PenWidth), cornerwidth, checked(height - PenWidth));
            rectangle = new Rectangle(x, checked(checked(height - cornerwidth) - PenWidth), cornerwidth, cornerwidth);
            graphicsPath1.AddArc(rectangle, 90.0F, 90.0F);
            graphicsPath1.CloseFigure();
            return graphicsPath1;
        }

    } // class Draw

}

