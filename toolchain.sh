sudo apt-get install git build-essential libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 u-boot-tools zlib1g-dev libglib2.0-dev libsdl1.2-dev picocom libncurses5-dev
wget http://eigit.heig-vd.ch/public/toolchains/reptar_toolchain.sh
chmod 755 reptar_toolchain.sh
./reptar_toolchain.sh

sudo apt-get install gcc-arm-linux-gnueabihf
