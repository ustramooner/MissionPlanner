using System;
using System.Collections.Generic;

namespace MissionPlanner
{
#if noDIRECTX

    public class JoystickDevice : IDisposable
    {
        int id;
        //JoystickAxisCollection axis_collection;
        //JoystickButtonCollection button_collection;
        private JoystickState _state;
        private string _productName;

        public JoystickDevice (int id, int axes, int buttons)
        {
            if (axes < 0)
                throw new ArgumentOutOfRangeException("axes");

            if (buttons < 0)
                throw new ArgumentOutOfRangeException("buttons");

            this.id = id;
            this._state = new JoystickState(id);
                /*
            this.axis_collection = new JoystickAxisCollection(axes);
            this.button_collection = new JoystickButtonCollection(buttons);
            JoystickState state = Joystick.GetState(id);
            for (int axis_index = 0; axis_index < caps.AxisCount; axis_index++)
            {
                JoystickAxis axis = JoystickAxis.Axis0 + axis_index;
                joysticks[i].SetAxis(axis, state.GetAxis(axis));
            }
            for (int button_index = 0; button_index < caps.ButtonCount; button_index++)
            {
                JoystickButton button = JoystickButton.Button0 + button_index;
                joysticks[i].SetButton(button, state.GetButton(button) == ButtonState.Pressed);
            }
            for (int hat_index = 0; hat_index < caps.HatCount; hat_index++)
            {
                // LegacyJoystickDriver report hats as pairs of axes
                // Make sure we have enough axes left for this mapping
                int axis_index = caps.AxisCount + 2 * hat_index;
                if (axis_index < JoystickState.MaxAxes)
                {
                    JoystickHat hat = JoystickHat.Hat0 + hat_index;
                    JoystickHatState hat_state = state.GetHat(hat);
                    JoystickAxis axis = JoystickAxis.Axis0 + axis_index;
                    float x = 0;
                    float y = 0;
                    if (hat_state.IsDown)
                        y--;
                    if (hat_state.IsUp)
                        y++;
                    if (hat_state.IsLeft)
                        x--;
                    if (hat_state.IsRight)
                        x++;

                    joysticks[i].SetAxis(axis, x);
                    joysticks[i].SetAxis(axis + 1, y);
                }
            }*/
        }

        public static IList<JoystickDevice> GetDevices(){
            List<JoystickDevice> joysticks = new List<JoystickDevice>();

            for (int i = 0; i < 4; i++)
            {
                OpenTK.Input.JoystickCapabilities caps = OpenTK.Input.Joystick.GetCapabilities(i);
                if (caps.IsConnected)
                {
                    // New joystick connected
                    JoystickDevice joystick = new JoystickDevice(
                        i,
                        caps.AxisCount + 2 * caps.HatCount,
                        caps.ButtonCount);
                    joystick.ProductName = "Connected Joystick";
                }
            }

            return joysticks;
        }

        public void Acquire(){
        }
        public void Unacquire(){
        }
        public void Dispose(){
        }
        public void Poll(){
        }

        public JoystickState CurrentJoystickState {
            get {
                _state.Poll();
                return _state;
            }
        }
        public JoystickCaps Caps {
            get {
                return new JoystickCaps(id);
            }
        }
        public string ProductName{
            get {
                return _productName;
            }
            set{
                this._productName = value;
            }
        }
        public string InstanceGuid{
            get {
                return "";
            }
        }

        public int Properties {
            get{
                return 0;
            }
        }
    }
#else

    public class JoystickDevice : IDisposable
    {
        public JoystickDevice ()
        {
        }

        public static IList<JoystickDevice> GetDevices(){
            List<JoystickDevice> joysticks = new List<JoystickDevice>();

            return joysticks;
        }

        public void Acquire(){
        j   oystick.SetDataFormat(DeviceDataFormat.Joystick);
        }
        public void Unacquire(){
        }
        public void Dispose(){
        }
        public void Poll(){
        }
        public JoystickState CurrentJoystickState {
            get {
                return null;
            }
        }
        public JoystickCaps Caps {
            get {
                return null;
            }
        }
        public string ProductName{
            get {
                return "";
            }
        }
        public string InstanceGuid{
            get {
                return "";
            }
        }

        public int Properties {
            get{
                return 0;
            }
        }
    }

#endif
}

