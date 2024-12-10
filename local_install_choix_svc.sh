#!/bin/bash

## Déclaration des variables ##

afficher_port(){
kubectl get svc -n webservers -o custom-columns=PORT:.spec.ports[*].nodePort --no-headers
}

install_dashboard(){
git -c http.sslVerify=false clone https://github.com/gregoirecazes/Kubernetes.git
kubectl delete namespace kubernetes-dashboard
kubectl apply -f /projet/kubernetes/pods/Kubernetes/dashboard.yaml
kubectl apply -f /projet/kubernetes/pods/Kubernetes/admin-user.yaml
sleep 10
kubectl -n kubernetes-dashboard create token admin-user > /tmp/token.txt
kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard 8443:443 &
}

install_apache(){
kubectl run apache --image=nginx --restart=Never --port=80 -n webservers
sleep 2
kubectl expose pod apache --type=NodePort --port=80 --name=apache-service -n webservers
echo -e "Le port du pod est : ${afficher_port}"
}

ROUGE='\033[0;31m'
BLANC='\033[0m'

## Menu interactif
echo ""
echo -e "${ROUGE}Quel service voulez installer ?${BLANC}"
echo ""
echo "1) Docker"
echo "2) Kubernetes"
echo "3) SSH"
echo "4) Ansible"
echo "5) Pod Apache"
echo "6) Pod Kubernetes Dashboard"
echo ""

# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
        # Installation de Docker
        ansible-playbook /projet/ansible/local/local_docker.yml
        ;;
    2)
        # Installation de Kubernetes
        ansible-playbook /projet/ansible/local/local_kubernetes.yml
        ;;
    3)
        # Installation du SSH
        ansible-playbook /projet/ansible/local/local_ssh.yml
        ;;
    4)
        # Installation de Ansible
        ansible-playbook /projet/ansible/local/local_ansible.yml
        ;;
    5)
        # Déploiement du pod Apache
        install_apache
        ;;
    6)
        # Déploiement du pod Kubernetes Dashboard
        install_dashboard
        echo -e "${ROUGE}Le jeton se situe ici /tmp/token.txt${BLANC}"
        ;;

    7)
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
