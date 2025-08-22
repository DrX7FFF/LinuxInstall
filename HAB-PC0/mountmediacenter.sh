MOUNTEDPATH=/home/moi/HD1

sudo mkdir -p "$MOUNTEDPATH"
if ! grep -q "$MOUNTEDPATH" /etc/fstab; then
  echo "### Add HD1 automount in /etc/fstab ###"
  #echo "//mediacenter.local/HD1 /mnt/hd1 cifs guest 0 0" | sudo tee -a /etc/fstab
  echo "mediacenter.local:/var/media/HD1 $MOUNTEDPATH nfs defaults,rw,nofail,uid=0,gid=0 0 0" | sudo tee -a /etc/fstab

  echo "### Mount HD1 folders ###"
  sudo systemctl daemon-reload
  sudo mount -a
  #sudo mount -t nfs mediacenter.local:/var/media ~/mediacenter
  #sudo mount -t nfs4 mediacenter.local:/media ~/mediacenter
fi
