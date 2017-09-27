# UNDEX MAINTENANCE SITE

## Run via docker

#### Build the image:
```docker
docker build -t under_maintenance:local .
```

#### Stop previous containers:
```docker
docker stop under_maintenance_local
```

#### Remove previous containers:
```docker
docker rm maintenance_local
```

#### Run the container:
```docker
docker run -p 8000:80 --name under_maintenance_local -d under_maintenance:local
```

##### Open in a web browser:
```
http://localhost:8000
```

#### Run the container with an interactve [bash]:
```docker
docker run -it under_maintenance:local bash
```

#### Run [bash] command in a running the container:
```docker
docker exec -it under_maintenance_local /bin/bash
```
