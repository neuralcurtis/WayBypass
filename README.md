# WayBypass
A "Bypass charge" module for waybar.
Allows switching between full charge (100%) and limited charge (e.g., 80%) modes on click.

![bp1](https://github.com/user-attachments/assets/6afd537a-6f18-41fe-9d04-a6456ce5595a)

---

## Features

- Shows current battery charge limit status in Waybar  
- Toggle charging threshold between 80% and 100% by clicking the module  
- Uses `/sys/class/power_supply/BAT0/charge_control_end_threshold`  
- Requires appropriate permissions to write to the sysfs file

---

## Requirements

- Waybar  
- Linux laptop supporting charge control via `/sys/class/power_supply/BAT0/charge_control_end_threshold`  
- `sudo` configured for passwordless write access to the charge control file

---

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/neuralcurtis/WayBypass.git
   mkdir -p ~/scripts
   cp waybypass/*.sh ~/scripts/
   chmod +x ~/scripts/*.sh

2. Configure sudoers to allow writing without password (important):
   ```bash
   sudo visudo -f /etc/sudoers.d/waybypass
   ```

   ```visudo
   yourusername ALL=(ALL) NOPASSWD: /usr/bin/tee /sys/class/power_supply/BAT0/charge_control_end_threshold
   ```
   Replace `yourusername` with your actual username (`whoami`).

3. Finally, update your waybar config with:
   ```config
    "custom/bypass_charge": {
	  "exec": "~/scripts/bypasstatus.sh",
	  "interval": 20,
	  "on-click": "~/scripts/togglebypass.sh",
	  "return-type": "json"
    },
   ```
   And add
   ```config
   custom/bypass_charge
   ```
   to "modules" for it to appear.

   

   
