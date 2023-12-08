# Coffee App Helm Chart

## Context
This repository is part of the coffee rating application project. The project
provides a rating appliation for coffees where its possible to add/delete and
rate different coffee beans. The project consists of the following repositories:
- [Frontend](https://github.com/andifg/coffee_frontend_ts.git) - A react typescript progressive web app
- [Backend](https://github.com/andifg/coffee_backend.git) - Fastapi based python backend
- [Helm Chart](https://github.com/andifg/coffee-app-chart.git) - Helm Chart deploying front and backend together with database and minio helm charts
- [GitOps](https://github.com/andifg/coffee-app-gitops.git) - Gitops repository for ArgoCD reflecting deployed applications for test and prod env


## TODO:

Add more quality tools like kube-score


## Dependent Resources that need to exist before deploying chart

Secrets:
- minio-credentials: Secret holding minio credentials (keys: root-password, root-user)
- mongodb-root-password: Secret holding mongodb root password (key: mongodb-root-password)