# housing-prices ![](https://circleci.com/gh/dev-daeun/housing-prices.svg?style=svg)

Flask application in this repo provides housing prices prediction in Boston.

Model data & flask application is provided by [udacity/DevOps_Microservices](https://github.com/udacity/DevOps_Microservices)

## API specification
```
* Request *
POST localhost:8000/predict/

{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}


* Response *
{
  "prediction": [
    20.35373177134412
  ]
}

```


## How to setup
If you want to run Flask application server in your host, execute commands below.
```
$ cd ~/housing-prices
$ make setup
$ make install
$ python app.py
$ sh make_prediction.sh
```
If you want to run Flask application server in docker container, execute commands below.
```
$ sh run_docker.sh
$ sh make_prediction.sh
```

If you want to run Flask application server in Kubernetes cluster, execute commands below.
(Minikube should be installed and started on your local PC.)
```
# Run the Docker Hub container with kubernetes
$ kubectl create deployment housing-prices --image=kde6260/housing-prices:latest
```
```
# List kubernetes pods
$ kubectl get pods | grep housing-prices
$ export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
```
```
# Forward the container port to a host
kubectl port-forward $POD_NAME 8000:80
```
```
$ Call API
$ sh make_prediction.sh
```
