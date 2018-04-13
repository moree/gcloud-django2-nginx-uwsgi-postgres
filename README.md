# Gcloud, Django2, uWSGI, postgres, Nginx and Python3

# How to use

## Make a project:

```
Ex. 'django2-200105'
```

## Cloud Shell:

### Config
```
gcloud config set project django2-200105
gcloud config set compute/zone asia-northeast1-a
```

### Create clusters
```
gcloud container clusters create django2-cluster --num-nodes=3
```

### Docker build and push
```
docker-compose build
gcloud docker -- push gcr.io/django2-200105/django_uwsgi:v1
```

### Create configmap
```
kubectl create configmap   nginx-config --from-file=nginx/conf/
kubectl create configmap   init-db-shell --from-file=postgres/docker-entrypoint-initdb.d/
```

### Create persistent disk
```
gcloud compute disks create --size 200GB pg-disk
```

### Create postgres's deployment and service
```
kubectl create -f postgres.yml
kubectl create -f postgres-service.yml
```

### Create uwsgi's deployment and service
```
kubectl create -f uwsgi.yml
kubectl create -f uwsgi-service.yml
```

### Create nginx's deployment and service
```
kubectl create -f nginx.yml
kubectl create -f nginx-service.yml
```

## URL which you can confirm:

```
http://Your Global IP/
```
