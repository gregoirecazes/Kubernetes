#!/bin/bash

## Déclaration des variables

afficher_port(){
kubectl get svc -n webservers -o custom-columns=PORT:.spec.ports[*].nodePort --no-headers
}

client_install_apache(){
ssh root@IP_DU_CLIENT kubectl run apache --image=httpd:latest --restart=Never --port=80 -n webservers
sleep 2
ssh root@IP_DU_CLIENT kubectl expose pod apache --type=NodePort --port=80 --name=apache-service -n webservers
sleep 3
local port=$(afficher_port)
echo -e "${ROUGE}Le port du pod Apache est : ${port} ${BLANC}"
}

ROUGE='\033[0;31m'
BLANC='\033[0m'
# Menu interactif
echo ""
echo -e "${ROUGE}Quel service voulez installer ?${BLANC}"
echo ""
echo "1) Docker"
echo "2) Kubernetes"
echo "3) SSH"
echo "4) Ansible"
echo "5) Pod Apache"
echo "Quitter"
echo ""

# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
        # Installation de Docker
        ansible-playbook /projet/ansible/client/client_docker.yml --ask-pass
        ;;
    2)
        # Installation de Kubernetes
        ansible-playbook /projet/ansible/client/client_kubernetes.yml --ask-pass
        ;;
    3)
        # Installation du SSH
        ansible-playbook /projet/ansible/client/client_ssh.yml --ask-pass
        ;;
    4)
        # Installation de Ansible
        ansible-playbook /projet/ansible/client/client_ansible.yml --ask-pass
        ;;
    5)
        # Déploiement du pod Apache
        client_install_apache
        ;;
    6)
        # Quitter
        echo "Au revoir !"
        exit 0
        ;;
    *)
        # Mauvaise touche
        echo "Choix incorrect ! Reessayer !"
        exit 0
        ;;
esac
