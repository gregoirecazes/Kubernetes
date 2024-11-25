#!/bin/bash

dossier(){
mkdir /projet/
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
echo "3) Démarrer un service"
echo "4) Arreter un service"
echo "5) Redémarrer un service"
echo ""
# Lire le choix de l'utilisateur
read -p "Entrez votre choix : " choix

# Gérer les choix
case $choix in

    1)
	#Lancement vers le script bash list_svc.sh
	bash /projet/bash/list_svc.sh
	;;
    2)
        # 
        bash /projet/bash/install_svc.sh
        ;;
    3)
        # Afficher l'inventaire
        bash /projet/lancement2.sh
        ;;
    4)
        echo "Au revoir !"
        exit 0
        ;;
    5)
	#Redémarrer un service
	echo "test"
	;;
    *)
        echo "Choix invalide. Veuillez réessayer."
        ;;

esac
