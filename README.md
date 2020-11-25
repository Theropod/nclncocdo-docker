# ncl nco cdo-docker
docker image for NCL, NCO and CDO, based on ubuntu
## Build
- find build steps from Dockerfile
- based on ubuntu:18.04
- NCL installed through precompiled binary (ncl lib/bin paths are messed up in apt install), with NCARG_ROOT and PATH set
- NCO, CDO installed through apt
## Use
### build image and run
1. install docker
2. Download Dockerfile through whatever method
3. build and run
   ```
   docker image build -t nclncocdo:v1 .
   docker container run -it nclncocdo:v1
   ```
4. use NCL, NCO, CDO in the command line
### pull from DockerHub
1. install docker
2. `docker pull theropod/nclncocdo:latest` to pull the image
    or `docker run -it theropod/nclncocdo:latest` to run it directly
## about Ubuntu:latest
Dockerfile to install NCL on ubuntu:20.04. Ubuntu 20.04 has removed support for libgfortran3, so 2 deb packages from 18.04 have to be downloaded and installed (see Dockerfile for further info)
## how to run x11 windows
you can't directly run a X11 window inside docker, here is an alternative approach using x11docker:
- pull image
- install [x11docker](https://github.com/mviereck/x11docker#shortest-way-for-first-installation)
- `x11docker -i theropod/nclncocdo:latest`
- try `ng4ex xy05n -clean`
