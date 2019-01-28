AGPM Injector
=============
#### Master branch build status:
![](https://travis-ci.com/Pavo-IM/AGPMInjector.svg?branch=master)
##### This is a AGPM (Apple Graphics Power Management) Injector kext generator.

#### Installation
- Select the SMBIOS you are using from the dropdown menu and click Generate. the AGPMInjector kext will be generated on to your Desktop.
- Copy the AGPMInjector.kext to EFI/Clover/kexts/Other folder and reboot.

#### Features
- Notifies user if there is an update on Github (App version 2.3.4).
- Supports High Sierra and Mojave. Please test on older OS versions and give feedback if it doesn't work on a certain OS version.
- Fixes GPU Power Management settings for *desktop* GPUs on supported SMBIOS (Systems that are in the dropdown menu).
- Automatically parses /System/Library/Extensions/AppleGraphicsPowerManagement.kext to generate the most up to date injector kext.

#### Important Information
- X86PlatformPlugin must be loaded in order for this injector to work.
- Your GPU device must be labeled as GFX0 in order for the injector to hook into the AGPMController. This can be done by using [Lilu](https://github.com/acidanthera/Lilu) with [WhateverGreen](https://github.com/acidanthera/WhateverGreen), SSDT/DSDT property injection or by Device Properties in Clover config.plist.

#### Credits
- [toleda](https://github.com/toleda) and others for layout.
- [vidda#7908](https://discord.gg/fSSmfq) for the help with Update Notification feature.
