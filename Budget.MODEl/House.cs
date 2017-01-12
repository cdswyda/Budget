using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Budget.MODEl
{
    public class House
    {
        string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        int _designer;

        public int Designer
        {
            get { return _designer; }
            set { _designer = value; }
        }
        int _owner;

        public int Owner
        {
            get { return _owner; }
            set { _owner = value; }
        }
        string _address;

        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }
        double _area;

        public double Area
        {
            get { return _area; }
            set { _area = value; }
        }
        double _height;

        public double Height
        {
            get { return _height; }
            set { _height = value; }
        }
        int _state;

        public int State
        {
            get { return _state; }
            set { _state = value; }
        }


    }
}
