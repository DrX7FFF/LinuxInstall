#!/bin/bash

# rsync -avhz --progress --info=progress2 --partial "/media/moi/6FFD-A753/" "root@192.168.1.102:/media/HD1/Films/"
# rsync -avhz --progress --info=progress2 --partial "/media/moi/500exFAT/" "root@192.168.1.102:/media/HD1/Films/"
# rsync -avhz --progress --info=progress2 --partial "/media/moi/500Ext4/" "root@192.168.1.102:/media/HD1/Films/"
rsync -avhz --progress --info=progress2 --remove-source-files --partial "/home/moi/Copie HD1/Animes/" "root@192.168.1.102:/media/HD1/Animes/"
rsync -avhz --progress --info=progress2 --remove-source-files --partial "/home/moi/Copie HD1/Enfants/" "root@192.168.1.102:/media/HD1/Enfants/"
rsync -avhz --progress --info=progress2 --remove-source-files --partial "/home/moi/Copie HD1/Series/" "root@192.168.1.102:/media/HD1/Series/"

rsync -avh --progress --info=progress2 --remove-source-files --partial "/home/moi/Copie HD1/Partage/Software/Windows 7 SP1/" "root@192.168.1.102:/media/HD1/Partage/Software/Windows 7 SP1/"