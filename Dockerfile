FROM ubuntu:latest

RUN apt-get install -y software-properties-common && \
	apt-add-repository ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y python-pip ansible && \
	pip install softlayer && \
	pip install docker-py && \
	pip install pysphere && \
	adduser --disabled-password --gecos '' ansible

COPY hosts/softlayer.py /etc/ansible/hosts
 
RUN chmod +x /etc/ansible/hosts

