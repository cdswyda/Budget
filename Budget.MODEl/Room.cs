using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Budget.MODEl
{
    public  class Room
    {
        int _roomID;

        public int RoomID
        {
            get { return _roomID; }
            set { _roomID = value; }
        }
        int _houseID;

        public int HouseID
        {
            get { return _houseID; }
            set { _houseID = value; }
        }
        string _roomName;

        public string RoomName
        {
            get { return _roomName; }
            set { _roomName = value; }
        }
        double _length;

        public double Length
        {
            get { return _length; }
            set { _length = value; }
        }
        double _width;

        public double Width
        {
            get { return _width; }
            set { _width = value; }
        }
        double _doorArea;

        public double DoorArea
        {
            get { return _doorArea; }
            set { _doorArea = value; }
        }
        double _windowArea;

        public double WindowArea
        {
            get { return _windowArea; }
            set { _windowArea = value; }
        }
        double _wallArea;

        public double WallArea
        {
            get { return _wallArea; }
            set { _wallArea = value; }
        }
        double _area;

        public double Area
        {
            get { return _area; }
            set { _area = value; }
        }
        double _total;

        public double Total
        {
            get { return _total; }
            set { _total = value; }
        }
    }
}
