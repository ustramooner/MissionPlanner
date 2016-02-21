using System;

namespace MissionPlanner
{
    public class JoystickState
    {
        private int id;
        private OpenTK.Input.JoystickState _state;
        internal JoystickState (int id)
        {
            this.id = id;
        }

        internal void Poll(){
            _state = OpenTK.Input.Joystick.GetState(id);
        }

        public int[] GetSlider(){
            return null;
        }
        public int[] GetPointOfView(){
            return null;
        }

        public byte[] GetButtons(){
            return null;
        }

        public int None { get { return 0; } }
        public int Pass { get { return 0; } }
        public int ARx { get { return 0; } }
        public int ARy { get { return 0; } }
        public int ARz { get { return 0; } }
        public int AX { get { return 0; } }
        public int AY { get { return 0; } }
        public int AZ { get { return 0; } }
        public int FRx { get { return 0; } }
        public int FRy { get { return 0; } }
        public int FRz { get { return 0; } }
        public int FX { get { return 0; } }
        public int FY { get { return 0; } }
        public int FZ { get { return 0; } }
        public int Rx { get { return 0; } }
        public int Ry { get { return 0; } }
        public int Rz { get { return 0; } }
        public int VRx { get { return 0; } }
        public int VRy { get { return 0; } }
        public int VRz { get { return 0; } }
        public int VX { get { return 0; } }
        public int VY { get { return 0; } }
        public int VZ { get { return 0; } }
        public int X { get { return 0; } }
        public int Y { get { return 0; } }
        public int Z { get { return 0; } }
        public int Slider1 { get { return 0; } }
        public int Slider2 { get { return 0; } }
        public int Hatud1 { get { return 0; } }
        public int Hatlr2 { get { return 0; } }
        public int Custom1 { get { return 0; } }
        public int Custom2 { get { return 0; } }

    }
}

