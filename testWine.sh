DEFAULT_WORK_DIR="$HOME/.testWine"
DEFAULT_WORK_DIR_CACHE="${DEFAULT_WORK_DIR}/cache"
DEFAULT_WORK_DIR_WINE_PREFIX="${DEFAULT_WORK_DIR}/wineprefixes"
FORCE_ARCH=win64

# export env WINEPREFIX=$DEFAULT_WORK_DIR
export env WINEDEBUG=-all #Hide the fixme messages intended for Wine developers

mkdir -p "${DEFAULT_WORK_DIR_CACHE}"
mkdir -p "${DEFAULT_WORK_DIR_WINE_PREFIX}"

#WINEPREFIX="$DEFAULT_WORK_DIR_WINE_PREFIX" winecfg
WINEARCH=$FORCE_ARCH WINEPREFIX="$DEFAULT_WORK_DIR_WINE_PREFIX" winetricks


#WINEARCH=win64 WINEPREFIX="$HOME/.testWine/wineprefixes" wine
#WINEARCH=win64 WINEPREFIX="$HOME/.testWine/wineprefixes" winetricks
#WINEARCH=win64 WINEPREFIX="$HOME/.testWine/wineprefixes" wine winefile
#WINEPREFIX="$HOME/.testWine/wineprefixes" wineboot



mkdir $HOME/.testWine/wineprefixes
WINEARCH=win64 WINEPREFIX="$HOME/.testWine/wineprefixes" winecfg

export WINEPREFIX=~/winetest
export WINEDEBUG=-all
wineboot -u
wine winefile
winetricks dx9
wine dxdiag
