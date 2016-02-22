FROM ubuntu:15.10

RUN apt-get install -y software-properties-common && \
	apt-add-repository ppa:ansible/ansible && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y python-pip ansible && \
	pip install softlayer && \
	pip install docker-py && \
	adduser --disabled-password --gecos '' ansible

COPY hosts/softlayer.py /etc/ansible/hosts
 
RUN chmod +x /etc/ansible/hosts

