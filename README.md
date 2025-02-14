#### run app
```bash
go run main.go
```

#### install kind
```
./kind-with-registry.sh
```
`kind-with-registry.sh` contains `cluster.yaml`


#### install nginx
```
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/deploy-ingress-nginx.yaml
```

#### kind registry examples
```bash
docker build --tag go-walk-delve -f debug.delve.Dockerfile .
docker tag go-walk-delve:latest localhost:5001/go-walk-delve:1.0
docker push localhost:5001/go-walk-delve:1.0
```


#### deploy to kind cluster
```bash
kubectl apply -f go-walk.yaml
```

#### port forward pod
```shell
kubectl port-forward go-kube-example-app 40000:40000 8080:8080
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


```
root@go-kube-example-app:/# netstat -tulnp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp6       0      0 :::40000                :::*                    LISTEN      1/dlv               
root@go-kube-example-app:/# netstat -tulnp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp6       0      0 :::40000                :::*                    LISTEN      1/dlv               
tcp6       0      0 :::8080                 :::*                    LISTEN      24/server           
```