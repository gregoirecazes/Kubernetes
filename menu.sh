#!/bin/bash

## Déclaration des variables ##

trie(){
mkdir /test_git/projet/
mkdir /test_git/projet/ansible
mkdir /test_git/projet/bash
mkdir /test_git/projet/kubernetes
mkdir /test_git/projet/bash/install
mkdir /test_git/projet/bash/list
mkdir /test_git/projet/bash/modify
mkdir /test_git/projet/bash/restart
mkdir /test_git/projet/bash/start
mkdir /test_git/projet/bash/stop
mkdir /test_git/projet/ansible/local
mkdir /test_git/projet/ansible/client
mkdir /test_git/projet/ansible/roles

ansible-galaxy init /test_git/projet/ansible/roles/ansible
ansible-galaxy init /test_git/projet/ansible/roles/apache2
ansible-galaxy init /test_git/projet/ansible/roles/docker
ansible-galaxy init /test_git/projet/ansible/roles/kubernetes
ansible-galaxy init /test_git/projet/ansible/roles/ssh

cp menu.sh /test_git/projet/bash

cp client_install_choix_svc.sh /test_git/projet/bash/install
cp install_svc.sh /test_git/projet/bash/install
cp local_install_choix_svc.sh /test_git/projet/bash/install

cp list_svc.sh /test_git/projet/bash/list

cp ansible.cfg /test_git/projet/ansible
cp inventory /test_git/projet/ansible
cp services.yml /test_git/projet/ansible
cp webservers.yml /test_git/projet/ansible

cp client_ansible.yml /test_git/projet/ansible/client
cp client_apache.yml /test_git/projet/ansible/client
cp client_docker.yml /test_git/projet/ansible/client
cp client_kubernetes.yml /test_git/projet/ansible/client
cp client_ssh.yml /test_git/projet/ansible/client

cp local_ansible.yml /test_git/projet/ansible/local
cp local_docker.yml /test_git/projet/ansible/local
cp local_kubernetes.yml /test_git/projet/ansible/local
cp local_ssh.yml /test_git/projet/ansible/local

rm /test_git/projet/ansible/roles/ansible/tasks/main.yml
cp main_ansible.yml /test_git/projet/ansible/roles/ansible/tasks



cd ..
rm -r Kubernetes
cd /test_git/projet
}

ROUGE='\033[0;31m'
BLANC='\033[0m'

# Menu interactif
echo ""
echo -e "${ROUGE}Choisissez une action :${BLANC}"
echo ""
echo "1) Trier les fichiers"
echo "2) Lister les services"
echo "3) Installer un service"
echo "4) Modifier un service"
echo "5) Démarrer un service"
echo "6) Arreter un service"
echo "7) Redémarrer un service"
echo "8) Quitter"
echo ""
# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
        # Trier les fichiers
        trie
        ;;

    2)
        # Lister les services
        bash /projet/bash/list/list_svc.sh
        ;;
    3)
        # Installer un service
        bash /projet/bash/install/install_svc.sh
        ;;
    4)
        # Modifier un service
        bash /projet/bash/modify/modify_svc.sh
        ;;
    5)
        # Démarrer un service
        bash /projet/bash/start/start_svc.sh
        ;;
    6)
        # Arrêter un service
        bash /projet/bash/stop/stop_svc.sh
        ;;
    7)
        # Redémarrer un service
        bash /projet/bash/restart/restart_svc.sh
        ;;
    8)
        # Quitter
        echo "Au revoir !"
        exit 0
        ;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;

esac
