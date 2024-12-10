#!/bin/bash

dossier(){
mkdir test_git/projet/
}
dossier

ROUGE='\033[0;31m'
BLANC='\033[0m'

# Menu interactif
echo ""
echo -e "${ROUGE}Choisissez une action :${BLANC}"
echo ""
echo "1) Lister les services"
echo "2) Installer un service"
echo "3) Modifier un service"
echo "4) Démarrer un service"
echo "5) Arreter un service"
echo "6) Redémarrer un service"
echo "7) Quitter"
echo ""
# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
        # Lister les services
        bash /projet/bash/list/list_svc.sh
        ;;
    2)
        # Installer un service
        bash /projet/bash/install/install_svc.sh
        ;;
    3)
        # Modifier un service
        bash /projet/bash/modify/modify_svc.sh
        ;;
    4)
        # Démarrer un service
        bash /projet/bash/start/start_svc.sh
        ;;
    5)
        # Arrêter un service
        bash /projet/bash/stop/stop_svc.sh
        ;;
    6)
        # Redémarrer un service
        bash /projet/bash/restart/restart_svc.sh
        ;;
    7)
        # Quitter
        echo "Au revoir !"
        exit 0
        ;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;

esac
