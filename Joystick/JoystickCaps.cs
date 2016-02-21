using System;

namespace MissionPlanner
{
    public class JoystickCaps
    {
        private int id;
        public JoystickCaps (int id)
        {
            this.id = id;
        }

        public int NumberButtons {
            get {
                return 0;
            }
        }

        public int NumberPointOfViews {
            get {
                return 0;
            }
        }

    }
}

