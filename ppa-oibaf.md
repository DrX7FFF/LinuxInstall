Description :
PLEASE READ: don't email me to report bugs, unless you are sure it's a packaging bug. Not only is email not a good tool for tracking bugs, it also excludes anybody else from tracking or working on the issue. Please read the section "Debugging and reporting problems" below.

Also, please don't ask me to include non-free drivers, I won't do it.

Patches and suggestions are welcomed.

=============

All Ubuntu architectures are supported.

Supported Ubuntu versions:
- 22.04 (jammy) <- obsolete
- 24.04 (noble) <- supported
- 24.10 (oracular) <- supported

For forum support see: http://goo.gl/qoUpWK

=== Introduction ===
This PPA provides updated free graphics drivers (from mesa). Updates packages provide:
 * all driver packages are automagically built every day, when there are upstream changes
 * Vulkan 1.3+ and OpenGL 4.6+ : http://mesamatrix.net
 * gallium-nine support. Read the specific section below
 * VDPAU and VAAPI Gallium3D accelerated video drivers (see below)
 * mesa packages built with gcc LTO for smaller binary size (~10-15%) and improved performance

As an added bonus I may include some updated open source games (backported from Debian or newer Ubuntu).

=== Basic usage ===
See "Adding this PPA to your system" later on, or just do:
sudo add-apt-repository ppa:oibaf/graphics-drivers
and update your Ubuntu with the package here.

=== Using gallium-nine ===
Gallium-nine lets you run DirectX 9 games in a faster way, avoiding the inefficient translation of D3D9 calls to OpenGL. For more info see https://wiki.ixit.cz/d3d9
You need:
 * enable this PPA (see previous paragraph)
 * then follow the instructions to install wine from this PPA: https://launchpad.net/~commendsarnex/+archive/ubuntu/winedri3

=== Using alternative drivers - Here be dragons ===
* zink - OpenGL emulated on a Vulkan driver:
  Set MESA_LOADER_DRIVER_OVERRIDE=zink
* zink + lavapipe - OpenGL emulated on a software Vulkan driver:
  Set VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/lvp_icd.x86_64.json MESA_LOADER_DRIVER_OVERRIDE=zink
* llvmpipe OpenGL software render:
  Set MESA_LOADER_DRIVER_OVERRIDE=llvmpipe
* Other options here: https://www.mesa3d.org/envvars.html

=== Using accelerated video ===
Supported VDPAU drivers: r300, r600, radeonsi, nouveau
Supported VAAPI drivers: r600, radeonsi

* First you need to install mesa-vdpau-drivers package:
sudo apt install mesa-vdpau-drivers

* Then to test the VDPAU driver with mpv use:
$ mpv --hwdec=vdpau yourvideofile

=== Upgrading to a newer Ubuntu ===
It is *strongly* suggested to remove all packages from this PPA before updating to a newer Ubuntu release. See the section "Revert to original drivers" later on.
Then, after the upgrade, you can add again this PPA.

=== Debugging and reporting problems ===
If you have some problem with the drivers try running the application from the command line and see if there are graphics related warnings. Also type dmesg to see if there are other related information here.

If you get crashes install the relevant -dbg pacakges (libgl1-mesa-dri-dbg or libgl1-mesa-dri-experimental-dbg for 3D drivers and xserver-xorg-video-intel-dbg , xserver-xorg-video-nouveau-dbg or xserver-xorg-video-radeon-dbg for X drivers) and reproduce the crash with gdb. Example:
$ gdb glxgears
[...make your application crash and then get a backtrace with:]
(gdb) bt

If X.org crashes look at /var/log/Xorg.0.log (or /var/log/Xorg.0.log.old when a new X session is started after the crash).

With the gathered information try searching at https://bugs.freedesktop.org/query.cgi (also try with google) if someone already reported a similar bug. If not you may want to report a new bug:
for 3D drivers bugs: https://www.mesa3d.org/bugs.html
for X / 2D driver bugs: https://bugs.freedesktop.org/enter_bug.cgi?product=xorg

=== Revert to original drivers ===
To revert to standard Ubuntu drivers type the following in a prompt shell:
$ sudo apt install ppa-purge
$ sudo ppa-purge ppa:oibaf/graphics-drivers

=== Donations ===
Some people asked me if I can accept donations to support this work. I don't, but if you have some spare money I would be happy if you could do a donation to a charity of your choice (for the poors, animals, whatever else you may think it might need it). Then feel free to send me a note about it!
Plus d'informations : https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers
Ajout du dépôt.
