# Setup

## RetroPie

1. Install Java
2. Copy 50-pixelcade.rules to /etc/udev/rules.d
3. Copy the remaining files to $HOME/pixelcade/
4. Get the [artwork](https://github.com/alinke/pixelcade)
5. Start pixelcade listener during startup:

    ```pws
    java -jar $HOME/pixelcade/pixelweb.jar -s -b
    ```

6. Browsing artwork should now be available on [localhost](http://localhost:8080)
7. API Documentation is [here](https://pixelcade.org/api/)

## Pixelcade

1. Get the [hardware](https://creativeartsandtechnology.com/product/pixelled-art-makers-kit-arcade/)

    a. [alternate controller](https://www.seeedstudio.com/Pixel-v2-5-maker-kit-p-2451.html)

    b. [alternate panel(s)](https://www.amazon.com/Pixels-Indoor-SMD2121-320x160mm-320160mm/dp/B07SDMWX9R)

2. Copy the firmware to an SD card : [docs](https://pixelcade.org/reset-firmware/)
