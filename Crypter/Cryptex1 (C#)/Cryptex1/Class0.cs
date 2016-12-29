
using System;
using System.Drawing;
namespace Cryptex1
{
    internal class Class0
    {
        private string string_0;
        private Color color_0;
        public string String_0
        {
            get
            {
                return this.string_0;
            }
            set
            {
                this.string_0 = value;
            }
        }
        public Color Color_0
        {
            get
            {
                return this.color_0;
            }
            set
            {
                this.color_0 = value;
            }
        }
        public Class0()
        {
        }
        public Class0(string name, Color value)
        {
            this.string_0 = name;
            this.color_0 = value;
        }
    }
}
