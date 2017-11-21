# docker-ansible
Pre-installed ansible on a docker container, ready to go... configured for GCE

# Usage

To download the latest image:

    docker pull garethjevans/ansible:latest

To run a playbook with a static inventory:

    docker run \
        --env ANSIBLE_HOST_KEY_CHECKING=False \
        --interactive \
        --name ansible \
        --rm \
        --tty \
        --volume `pwd`/hosts:/etc/ansible/hosts \
        --volume `pwd`/playbooks:/home/ansible/playbooks \
        --volume `pwd`/roles:/etc/ansible/roles \
        --workdir "/home/ansible" \
        garethjevans/ansible:latest ansible-playbook playbooks/myplaybook.yml

To run a playbook that uses the GCE dynamic inventory:

    docker run \
        --env ANSIBLE_HOST_KEY_CHECKING=False \
        --env GCE_CREDENTIALS_FILE_PATH="your-gcp-credentials-file-path" \
        --env GCE_EMAIL="your-gcp-service-account-email" \
        --env GCE_PROJECT="your-gcp-project-name" \
        --interactive \
        --name ansible \
        --rm \
        --tty \
        --volume `pwd`/playbooks:/home/ansible/playbooks \
        --volume `pwd`/roles:/etc/ansible/roles \
        --workdir "/home/ansible" \
        garethjevans/ansible:latest ansible-playbook playbooks/myplaybook.yml

To run a playbook that uses the SoftLayer dynamic inventory:

    docker run \
        --env ANSIBLE_HOST_KEY_CHECKING=False \
        --env SL_API_KEY="your-softlayer-portal-api-key" \
        --env SL_USERNAME="softlayer@username.com" \
        --interactive \
        --name ansible \
        --rm \
        --tty \
        --volume `pwd`/playbooks:/home/ansible/playbooks \
        --volume `pwd`/roles:/etc/ansible/roles \
        --workdir "/home/ansible" \
        garethjevans/ansible:latest ansible-playbook playbooks/myplaybook.yml -i /etc/ansible/softlayer.py
