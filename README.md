# docker-sonarqube
Dockerized Sonarqube Applicaiton

You can have issues with the max_map_count and file-max variables. In those cases you must execute on your localhost the following commands :

```bash
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536
ulimit -n 65536
ulimit -u 4096
```

## Start the container

```bash
make start
```

## Stop the container

```bash
make stop
```