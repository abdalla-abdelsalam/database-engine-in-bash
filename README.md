# database-engine-in-bash
Table of Contents
==================

- [database-engine-in-bash](#database-engine-in-bash)
- [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Prerequisites](#prerequisites)
  - [Build and Run](#build-and-run)
  - [Tools \& Technologies used 🛠](#tools--technologies-used-)
  - [Fix json struct fields not exported bug](#fix-json-struct-fields-not-exported-bug)
  - [Docker file key highlights](#docker-file-key-highlights)
  - [Docker compose file](#docker-compose-file)
  - [Jenkins workflow](#jenkins-workflow)
  - [Helm charts](#helm-charts)
  - [Argocd](#argocd)



## Description 
This Bash project provides a simple database engine with basic functionality for managing databases and tables. It allows you to create, drop, list, and connect to databases. When connected to a database, you can perform various operations on tables including creating, inserting, dropping, selecting, listing, deleting, and updating.


## Prerequisites

1. Make sure you have Bash installed on your system.
2. Download or clone this repository to your local machine.
3. Clone the repo on your machine
```bash
git clone https://github.com/abdalla-abdelsalam/internship-challenge
```
4. Navigate to the directory containing the script files.

## Build and Run 

After setting the environment variables that is required for mysql connection follow these steps:
- build the project

```bash
    go build -o app .
```

- Run the project

```bash
    ./app
```


- (Optional) if you prefer docker-compose

```bash
    docker-compose up -d
```
## Tools & Technologies used 🛠
* Go programming language
* mysql
* Docker
* Jenkins 
* Kubernetes
* argocd

## Fix json struct fields not exported bug
Struct fields must start with a capital letter to translate them to json

![bug](https://github.com/abdalla-abdelsalam/internship-challenge/assets/51873396/6aec031e-e483-459a-b850-b1d0503ee64e)


## Docker file key highlights
* It uses golang:1.17-alpine as a minimal base image
* Copy the Go modules files first before copying the rest of the source code to enable caching of dependencies
* Use multi-stage technique to reduce the size of the image and also increase the security of the image 
* Create a non-root user with a specific UID to run the container as non-root user to increase the security of the image
* Sleep for a while until the database is fully initialized then run the application
  
## Docker compose file
* Build the local image using the docker file
* Set the required env variables for the image
* Get mysql image and set the required env variables

## Jenkins workflow
1. Checkout github repo
2. Build the docker image using dockerfile
3. Push the Image to Dockerhub
4. Remove Unused docker image
5. All the previous steps will report if any error happens
<div style="width: 800px">

![jenkins workflow](https://github.com/abdalla-abdelsalam/internship-challenge/assets/51873396/f37f25ed-c941-4cd1-96f9-5d0910eb31c9)
</div>
6. send the status of the build via email

<div style="width: 800px">

![sending email](https://github.com/abdalla-abdelsalam/internship-challenge/assets/51873396/97a95db3-1172-4360-aa64-3776280e1074)

</div>

## Helm charts
To deploy the charts to k8s run the following command:
```bash
helm install RELEASE_NAME ./helm-charts
```

* mysql manifests will be deployed first to initialize the database, it include:
  * pv
  * pvc
  * service
  * secret
  * statefulset
* app manifests include:
  * deployment
  * Horizontal Pod Autoscaler
  * secret
  * service

## Argocd
after installing argocd server into the cluster you can deploy argocd configfile to the cluster:

```bash
    kubectl apply -f ./argocd/argocd.yaml
```
make it accessable to the public with port forwarding
```bash
    kubectl port-forward -n argocd svc/argocd-server 7070:443
```
<div style="width: 800px">

![argocd](https://github.com/abdalla-abdelsalam/internship-challenge/assets/51873396/fa676983-5e62-4818-9e5b-696294b8301a)
</div>