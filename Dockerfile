# Docker image for running ansible configuration
FROM ubuntu:14.04

RUN apt-get install -y software-properties-common && \
	apt-add-repository ppa:ansible/ansible && \
	apt-get update #redoit && \
	apt-get install -y python-pip ansible && \
	pip install softlayer && \
	adduser --disabled-password --gecos '' ansible
