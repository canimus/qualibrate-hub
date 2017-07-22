# Qualibrate Docker Registry

This repository contains the files to initialise and setup a docker registry for the Qualibrate Foundation Platform allowing authenticated users to pull the platform for testing purposes.

The steps to make use of the images require the following steps:

## AWS Setup
The first step requires the initialisation of a public instance where the registry will be running. For this an Ubuntu instance has been selected, together with an initialisation script that automatically install certificates and runs the docker registry with the credentials specified in a basic auth file.

## Building Dockerfiles
This repository contains also the Dockerfiles required to build the application from scratch. To do so, there is a missing component in this repository which is the .ear file that contains the platform software itself. For that you need to contact our __license__ terms.

#### qualibrate-app
```sh
# Cloning this repository
git clone https://github.com/canimus/qualibrate-hub

# Locating the parent folder
cd qualibrate-hub/qualibrate-app

# Building the images
docker build -t qualibrate-app:2.3.1 .

```

#### qualibrate-db
```sh
# Cloning this repository
git clone https://github.com/canimus/qualibrate-hub

# Locating the parent folder
cd qualibrate-hub/qualibrate-db

# Building the images
docker build -t qualibrate-db:2.3.1 .

```
