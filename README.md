[![Docker Automated build](https://img.shields.io/docker/automated/phenompeople/mongodb.svg?style=plastic)](https://hub.docker.com/r/phenompeople/mongodb/)
[![Docker Build Status](https://img.shields.io/docker/build/phenompeople/mongodb.svg?style=plastic)](https://hub.docker.com/r/phenompeople/mongodb/)
[![Docker Pulls](https://img.shields.io/docker/pulls/phenompeople/mongodb.svg?style=plastic)](https://hub.docker.com/r/phenompeople/mongodb/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## mongodb 

MongoDB is a free and open-source cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemas

### Supported tags and respective Dockerfile links

#### phenompeople/mongodb

* **`latest`				([3.4.9/Dockerfile](https://bitbucket.org/phenompeople/mongodb/src/master/3.4.9/Dockerfile))**
* **`3.4.9`				([3.4.9/Dockerfile](https://bitbucket.org/phenompeople/mongodb/src/master/3.4.9/Dockerfile))**
* **`3.4.4`				([3.4.4/Dockerfile](https://bitbucket.org/phenompeople/mongodb/src/master/3.4.4/Dockerfile))**
* **`3.2.12`				([3.2.12/Dockerfile](https://bitbucket.org/phenompeople/mongodb/src/master/3.2.12/Dockerfile))**

#### Pre-Requisites

- install docker-engine [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)

### How to use this image 

1. This image can be used by simply running 

```$ docker run --name=mongodb -p 27017:27017 -td phenompeople/mongodb```

Above command runs mongodb container with port 27017 mapped to host and connecting to local mongodb.conf. 

1. To make image run even after reboot use extra option --restart=always

```$ docker run --restart=always  --name=mongodb -p 27017:27017 -td phenompeople/mongodb```

**Note:** If you remove the container all your data and configurations will be lost, and the next time you run the image the database will be reinitialized.

1. To avoid this loss of data, you should mount a volume that will persist even after the container is removed. If you are using default configuration mount the volume to /var/lib/mongo

```$ docker run --restart=always --name=mongodb -p 9092:9092 -v /data:/var/lib/mongo -td phenompeople/mongodb```
 
 MongoDB’s official guide on deploying to production recommends using the XFS file system on Linux, especially when deploying the WiredTiger storage engine.
 
 * XFS is a highly scalable, high-performance 64-bit journaling file system developed at SGI in 1993 and ported to Linux in 2002. 
 * Parallelized access via allocation groups ensures multiple threads can perform I/O simultaneously on the same volume.
 * Extent based allocation reduces fragmentation, metadata size, and improves I/O performance by allowing fewer and larger I/O operations.
 * Delayed allocation improves data contiguity and performance.
 * Fragmentation is reduced by combining writes and allocating extents in large chunks, and files written randomly (such as those that are memory mapped) can be allocated contiguously
 
1. On your system, use yum to install the xfsprogs and xfsdump packages:

```yum install xfsprogs xfsdu```

1. To avoid this loss of data, you should mount a volume that will persist even after the container is removed. If you are using default configuration mount the volume to /var/lib/mongo

```$ docker run --restart=always --name=mongodb -p 9092:9092 -v /data:/var/lib/mongo -td phenompeople/mongodb```



## Maintainers

* Rajesh Jonnalagadda (<rajesh.jonnalagadda@phenompeople.com>)

## License and Authors

**License:**	Apache License

**Author :** Phenompeople Pvt Ltd (<admin.squad@phenompeople.com>)