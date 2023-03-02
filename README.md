# logic_analyzer


* [Agilent - Probing Solutions for Logic Analyzers](https://xdevs.com/doc/HP_Agilent_Keysight/agilentprobing.pdf)

    * HP/Agilent 01650-61608 - Sixteen-channel probe lead set
        * Also known as E5383A
        * 40 pins: 16 data input, 1 clk input, 2 +5V, 1 DNC, 18 signal ground, 2 +5V ground
        * RC network: 90k ohm/8.2pF
        * Need board connector that is 0.425" tall
    * [3M 8540-4500PL board connector](https://www.digikey.com/en/products/detail/3m/8540-4500PL/1306252)

* [Bidirectional TVS diode for protecting dual-rail power](https://electronics.stackexchange.com/questions/653141/bidirectional-tvs-diode-for-protecting-dual-rail-power)

# Cyclone II LVDS

* [AN 479: Design Guidelines for Implementing LVDS Interfaces in Cyclone Series Devices](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwi85qzynZn9AhXWIkQIHaqIBsoQFnoECDIQAQ&url=https%3A%2F%2Fcdrdv2-public.intel.com%2F653866%2Fan479.pdf)

* [Cyclone® II Device Handbook, Volume 1, Chapter 11: High-Speed Differential Interfaces in Cyclone II Devices](https://www.intel.com/content/www/us/en/content-details/655206/cyclone-ii-device-handbook-volume-1-chapter-11-high-speed-differential-interfaces-in-cyclone-ii-devices.html)

    * RX max 805 Mpbs, TX max 640 Mpbs.
    * No Vref needed
    * 100 Ohm termination resistor at RX input buffer.
    * (De)serialization is done in core logic.
    * Page 5-63: LVDS receiver timing specification
    * Page 10-27: Pad Placement and DC Guidelines
        * single-ended input no closer than 4 pads away from LVDS I/O
        * single-ended output no closer than 5 pads away from LVDS I/O
        * Maximum 4 155MHz+ LVDS output channels per VCCIO and ground pair
        * Maximum 3 311MHz+ LVDS output channels per VCCIO and ground pair
        * LVDS outputs are 5 or more pads away from LVDS input pad


* [ALTLVDS_TX](https://www.intel.com/content/www/us/en/docs/programmable/683062/17-1/parameter-settings-22420.html)

* [Intel Pin List](https://www.intel.com/content/www/us/en/support/programmable/support-resources/devices/lit-dp.html)

* [LVDS PCB design guidelines](https://madpcb.com/glossary/lvds/)

* [TI - SNx5LVDSxx High-Speed Differential Line Drivers](https://www.ti.com/lit/ds/symlink/sn65lvds31.pdf)

    This datasheet is great for practical layout guidelines. See section 12.

* [TI - LVDS Design Notes](https://www.ti.com/lit/an/slla014a/slla014a.pdf)

    More design guidelines...

* [TI - LVDS Owner’s Manual](https://www.ti.com/lit/ug/snla187/snla187.pdf)


# Soldering

* Individual soldering tips on Aliexpress: https://www.aliexpress.us/item/3256802408178790.html
* Drag soldering: https://www.youtube.com/watch?v=5uiroWBkdFY 
* Soldering tips: 
    * Fat/round tip: TS-C4 - reballing
    * Ultra-fin tip: TS-I - fine SMD soldering/fixes
* Mini hotplate
    * https://hackspace.raspberrypi.com/articles/review-miniware-mhp30-mini-hot-plate-preheater
    * 
* BGA Reballing: https://www.youtube.com/watch?v=u8QLlpkyCpc
    * Uses a different jig that doesn't require screws: https://www.aliexpress.us/item/2251832660851140.html
        * magnets
        * rotating knob

* Direct heat reballing (using my jig): https://youtu.be/VTAU647jzzk?t=598
* EP2C35 on AliExpress: https://www.aliexpress.us/item/3256804913471850.html
* 3-in-1 desoldering station: https://www.aliexpress.us/item/3256803049300994.html

# Various

* [Schematic of RISC-V board that uses FT601Q](http://riskfive.com/RiskFive_devel_rev0_board_July_24_2018.pdf)

    * Uses the Xtal that I selected.
    * Uses 25MHz oscillator
    

    
