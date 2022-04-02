# Great Barrier Reef Model
Depth = 1.5m,
Timestamp = 2022-03-10 14:00:00
![Output_img](https://github.com/HarveyBates/gbr_model_map/blob/master/figures/sst_current_gbr.png)

# Installation
Installation can either be on your own computer or using docker. The docker method is recommended as it provides as standard operating environment. 
If you are lucky you may be able to run the program `src/spatial_temperature.ipynb` using already installed dependencies (but most likely not).

## Docker
Requires [docker](https://docs.docker.com/engine/install/) and docker cli.

## Clone
Clone the directory.
```bash
git clone https://github.com/HarveyBates/gbr_model_map
cd gbr_model_map
```

## Build
Build the docker image (may take several minutes as cmake, geos and proj are built from source (latest stable versions)).
This creates a docker image called gbr_map. 

The build process only needs to be run once, but its a good time to go get a coffee :coffee:
```bash
docker build -t gbr_map .
```

## Run
Run the docker container using port forwarding (`-p 8888:8888`) and a volume containing the current working dir (`-v ${PWD}:/root/gbr_model_map gbr_map`).
This will execute the file `entrypoint.sh` and install python dependencies through a standard python vitual environment. 
The purpose of `entrypoint.sh` is to simulate a users workflow and normally wouldnt exist.

*If you dont want to download the* [dataset](https://dapds00.nci.org.au/thredds/fileServer/fx3/gbr1_2.0/gbr1_simple_2022-03-11.nc)
*you can create a directory called* `dataset` *in the root of this directory and put the* `gbr1_simple_2022-03-11.nc` *file there. 
You will also need to comment out lines 19-21 in* `entrypoint.sh`.

```bash
docker run -it -p 8888:8888 -v ${PWD}:/root/gbr_model_map gbr_map
```
This command will create a jupyter lab instance within the docker container that can be accessed through `localhost`. 
As such, while you are working on the docker container, all files are stored locally (through docker volumes) and are 
therefore saved if the container crashes.

The terminal will output a url that can be navigated to on the host computer. Something like: `127.0.0.1:8888/lab/<unique_key>`. 
Or you can navigate to `localhost:8888/lab` and enter the key provided to you.

Once in jupyter lab you can navigate to `src/spatial_temperature.ipynb` and run the program.
