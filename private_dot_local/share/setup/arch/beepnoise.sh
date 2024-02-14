rmmod pcspkr
rmmod snd_pcsp

sudo touch /etc/modprobe.d/nobeep.conf

# cat "blacklist pcspkr" ==>  /etc/modprobe.d/nobeep.conf
