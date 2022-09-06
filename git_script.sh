#!/bin/sh

###Repo_Name=https://github.com/Kamalarasan/golang.git
#### Variables####
branch_name=gogit

###GiT Clone###
sudo git clone -b $branch_name https://github.com/Kamalarasan/golang.git

### Docker Image Build###
sudo docker build -t go-app .

###Docker Tag###
sudo docker tag go-app:latest go-app:$branch_name

###Docker Push###
sudo docker push go-app:$branch_name
