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