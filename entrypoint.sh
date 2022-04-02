#!/usr/bin/env bash

# As mentioned in the Dockerfile these processes would normally be carried out by the user
# But to make things easier and since this program is quite static this shell script is provided
# to simulate a users workflow

# Install venv (create python virtual environment)
cd /root
python3.9 -m venv gbr_venv
cd gbr_venv
chmod +x bin/activate
source bin/activate 

# Install requirements.txt in the container
cd /root/gbr_model_map
pip install -r requirements.txt

# Download the dataset
mkdir dataset
cd dataset
wget https://dapds00.nci.org.au/thredds/fileServer/fx3/gbr1_2.0/gbr1_simple_2022-03-11.nc

# Run jupyter lab (it opens the volume) 
# To see/run the program navigate to src/spatial_temperature.ipynb
cd /root/gbr_model_map
jupyter lab --ip 0.0.0.0 --port 8888 --no-browser --allow-root
