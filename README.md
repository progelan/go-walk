#### run app
```bash
go run main.go
```

#### kind registry examples
```bash
docker build --tag go-walk .
docker tag go-walk:latest localhost:5001/go-walk:2.0
docker push localhost:5001/go-walk:2.0
```
`kind-with-registry.sh` contains `cluster.yaml`


#### deploy to kind cluster
```bash
kubectl apply -f go-walk.yaml
```

#### port forward pod
```shell
kubectl port-forward go-kube-example-app 40000:40000
```

#### troubleshooting
```
/dlv: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by /dlv)
/dlv: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by /dlv)
```
переключитесь на образ, основанный на glibc, например debian или ubuntu.
```Dockerfile
FROM golang:1.20-bullseye
```

#### air run
```shell
docker run --rm -p 8080:8080 -p 40000:40000 -v $(pwd):/app go-walk-air:latest
```
