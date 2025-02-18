#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="phyOS"
iso_label="phyOS_$(date +%Y%m)"
iso_publisher="FTLabs <arda@phyos.su>"
iso_application="PhyOS Linux Live/Rescue CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-ia32.grub.esp' 'uefi-x64.grub.esp')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
#airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')   #xz for final image, compresses more than zstd
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1')  #zstd for debugging, burns iso fast (uses multi threads)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:600"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/etc/skel/"]="0:0:744"
)
