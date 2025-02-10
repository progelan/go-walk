run app
```bash
go run main.go
```

kind registry examples
```bash
docker tag go-walk:latest localhost:5001/go-walk:latest
docker push localhost:5001/go-walk:latest
```

deploy in kind cluster
```bash
kubectl apply -f deployment.yaml -n default
```