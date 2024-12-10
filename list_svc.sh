#!/bin/bash

ROUGE='\033[0;31m'
BLANC='\033[0m'

# Menu interactif
echo ""
echo ""
echo -e "${ROUGE}De quel client voulez vous lister les services ?${BLANC} "
echo ""
echo "1) Serveur Local"
echo "2) Debian_Client_02"
echo "3) Quitter"

# Lire le choix de l'utilisateur
read -p "Entrez votre choix [1-3] : " choix

# Gérer les choix
case $choix in
    1)
        # Lancer un playbook avec --ask-pass
        service --status-all
        ;;
    2)
        # Afficher l'inventaire
        ssh root@172.30.171.41 service --status-all
        ;;
    3)
        echo "Au revoir !"
        exit 0
        ;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;
esac
