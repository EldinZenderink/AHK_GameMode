# AHK_GameMode

> ⚠️ **Important:**
> * Currently only works on **Windows 11**.
> * Currently only tested on **dual-monitor setups**.

`AHK_GameMode` lets you seamlessly switch between a monitor and a TV (including audio devices) and launch Steam Big Picture mode using an Xbox controller.

This script is ideal for dual-environment setups. For example, if you have a desktop office setup in one room and a gaming setup in another running off the same PC, you can switch between them with a single button press on your controller—no need to walk back and forth between rooms.

*Note: This is a basic script. You are welcome to modify, expand, or experiment with it as needed.*

---

## How It Works

* **Displays:** The script uses the built-in Windows `DisplaySwitch` tool. In **Windows Settings > System > Display**, the monitor identified as "1" is treated as the internal display, while any others are treated as external.
* **Audio:** It uses the command-line tool `nircmd` to swap your default audio devices.
* **Controller Shortcuts:**
  * **Game Mode:** Briefly press the **Menu + View (Change View)** buttons simultaneously.
  * **Desktop Mode:** Press and hold the **Menu + View (Change View)** buttons for more than 3 seconds.
* **Keyboard Shortcuts:**
  * `Ctrl` + `Alt` + `G` to enter Game Mode.
  * `Ctrl` + `Alt` + `D` to enter Desktop Mode.

---

## Setup and Usage

1. Open `config.ini` in any text editor.
2. Configure the **`[GAMEMODE]`** section:
   * **`action_id`**: Check your display IDs in **Windows Settings > System > Display**. If the monitor you want to use for gaming is ID 1, set `action_id = 1`. Otherwise, set it to `4`.
   * **`audio_device`**: Enter the exact name of your gaming audio device from **Windows Settings > System > Sound** (e.g., `Headphones`, `Speakers`, etc...).
3. Configure the **`[DESKTOPMODE]`** section:
   * **`action_id`**: If the monitor you want to use for your desktop is ID 1, set `action_id = 1`. Otherwise, set it to `4`.
   * **`audio_device`**: Enter the exact name of your desktop audio device from your Windows Sound settings.
4. Run `GameMode.ahk`.

## Dependencies

- nircmd (https://www.nirsoft.net/utils/nircmd.html)
- XInput.ahk (https://www.autohotkey.com/boards/viewtopic.php?f=83&t=106254)