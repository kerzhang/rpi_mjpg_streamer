#!/bin/bash
clear

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

echo

# Cargamos el fichero de configuración:
. project_path.cfg

# Guardar el estado:
echo -n 1 > "$rpi_mjpg_streamer_path/public/resources/estado_mjpgstreamer.txt"

# Start Motion JPEG

cd /usr/src/mjpg-streamer/mjpg-streamer-experimental/
export LD_LIBRARY_PATH=.
# ./mjpg_streamer -o "output_http.so -w /home/odamae/prueba/camera/www -p 8081" -i "input_raspicam.so -rot 270 -fps 15 -q 50 -x 640 -y 480 ex night"
./mjpg_streamer -o "output_http.so -w $rpi_mjpg_streamer_path/mjpg-streamer/www -p 8081 -c etxea:etxean3sb" -i "input_raspicam.so -rot 270 -fps 25 -q 50 -x 320 -y 240 ex night"
