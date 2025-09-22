# Déploiement_Terraform_Azure
Référentiel présentant la création d'un cluster AKS avec Terraform et déploiement d'une application sur AKS

## 1. Présentation de AKS et contexte 
Azure Kubernetes Service (AKS) est un service Kubernetes géré qui vous permet de déployer et de gérer rapidement des clusters. Azure gère entièrement le plan de contrôle, incluant l'API server, l'ordonnanceur et l'ETCD, vous libérant ainsi de la complexité opérationnelle. Vous bénéficiez d'une intégration native avec les services Azure comme le réseau, le stockage et la sécurité. Le service propose des fonctionnalités d'auto-scaling automatique des nœuds et des pods pour optimiser les coûts et les performances. La sécurité est renforcée par des identités managées, des politiques de sécurité des pods et un registre de conteneurs privé via Azure Container Registry. Enfin, AKS simplifie le déploiement d'applications conteneurisées avec une haute disponibilité, des mises à jour sans interruption et une supervision intégrée via Azure Monitor.


<div align="center">
  <img src="https://miro.medium.com/v2/resize:fit:644/1*EwqiVKo9w2ocGD2tjl9UOA.png"/>
</div>

Dans notre démonstration nous :

- déployons un cluster AKS à l'aide de Terraform, un outil d'IaC (infrastructure as code),

- exécutons un exemple d'application multi-conteneurs avec un groupe de microservices et des interfaces web simulant un scénario de vente au détail.

## 2. Exécution du projet 
Vous trouverez certaines explications des différents fichiers utilisés en commentaire dans ceux ci. 

````
terraform init -upgrade 
````

Le paramètre -upgrade met à niveau les plugins fournisseurs nécessaires vers la dernière version compatible avec les contraintes de version de la configuration.

````
terraform plan -out main.tfplan

terraform apply main.tfplan
````

terraform plan -out main.tfplan analyse l'infrastructure et crée un plan d'exécution détaillé qu'il sauvegarde dans un fichier. terraform apply main.tfplan applique précisément ce plan sauvegardé sans recalcul, garantissant un déploiement identique à ce qui était prévu. Cette méthode est cruciale pour les environnements de production afin d'éviter les surprises entre la planification et l'application.

Nous présentons l'architecture de notre application à déployer.

- Store front : application Web permettant aux clients de consulter les produits et de passer des commandes.
- Product service : affiche les informations sur les produits.
- Order service : passe les commandes.
- Rabbit MQ : file d'attente de messages pour une file d'attente de commandes.

Nous exécutons la commande kubectl apply : 

````
kubectl apply -f aks-store-quickstart.yaml
````
Nous exécutons notre manifest de déploiement et nous obtenons le déploiement des différents objets kubernetes entre autre nos déploiements et nos services. Ensuite on utilise les commandes suivantes pour vérifier que tous les élements fonctionnent comme prévu : 

````
kubectl get pods

kubectl get service store-front --watch
````
Et comme vous pouvez le voir l'application est bien déployée : 

<div align="center">
  <img src="https://learn.microsoft.com/en-us/azure/aks/learn/media/quick-kubernetes-deploy-terraform/aks-store-application.png#lightbox"/>
</div>



