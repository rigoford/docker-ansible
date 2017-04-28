# docker-ansible
Preinstalled ansible on a docker container, ready to go... configured for softlayer

# Usage

To download the latest image:

    docker pull garethjevans/ansible:latest

To run a playbook:

    docker run --rm -it \
        --name ansible \
        -e ANSIBLE_HOST_KEY_CHECKING=False \
        -v `pwd`/roles:/etc/ansible/roles \
        -v `pwd`/playbooks:/home/ansible/playbooks \
        -w="/home/ansible" \
        garethjevans/ansible:latest ansible-playbook playbooks/myplaybook.yml

To run a playbook that uses the softlayer inventry:

    docker run --rm -it \
        --name ansible \
        -e SL_USERNAME="softlayer@username.com" \
        -e SL_API_KEY="your-softlayer-portal-api-key" \
        -e ANSIBLE_HOST_KEY_CHECKING=False \
        -v `pwd`/roles:/etc/ansible/roles \
        -v `pwd`/playbooks:/home/ansible/playbooks \
        -w="/home/ansible" \
        garethjevans/ansible:latest ansible-playbook playbooks/softlayer.yml
