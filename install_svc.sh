#!/bin/bash

ROUGE='\033[0;31m'
BLANC='\033[0m'

# Menu interactif
echo ""
echo -e "${ROUGE}Sur quel serveur voulez vous installer des services ?${BLANC}"
echo ""
echo "1) Debian_Serveur (local)"
echo "2) Debian_Client_01"
echo "3) Quitter"
echo ""

# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
        # Lancement vers le script bash local_install_choix_svc.sh
        bash /projet/bash/install/local_install_choix_svc.sh
        ;;
    2)
        # Lancement vers le script bash client_install_choix_svc.sh
        bash /projet/bash/install/client_install_choix_svc.sh
        ;;
    3)
        echo "Au revoir !"
        exit 0
        ;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        exit 0
        ;;

esac
