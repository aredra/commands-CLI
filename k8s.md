[쿠버네티스 공식문서](https://kubernetes.io/docs/home/)

# 단축어
- node: no
- namespace: ns
- deployment: deploy
- pod: pd
- service: svc

# 업그레이드
1. kubeadm 업그레이드
2. kubelet 업그레이드

```sh
kubeadm version
kubeadm upgrade plan
yum upgrade kubeadm-$version -y
kubeadm upgrade apply $version
# or
kubeadm upgrade node

kubelet --version
yum upgrade kubelet-$version -y
systemctl restart kubelet
systemctl daemon-reload
```
# deployment
```sh
kubectl create deployment $deployName --image=$imageName
kubectl scale deployment $deployName --replicas=3
kubectl apply -f ~/path
```

# pod 기본
```sh
kubectl run $podName --image=$imageName # run 은 단일
kubectl get pod
kubectl get pod -o wide -w
kubectl get pods -n $namespace
kubectl exec $podName -it -- /bin/bash
```

# 삭제
```sh
kubectl delete service $name
kubectl delete deployment $name
kubectl delete pod $name -n $namespace
kubectl delete -f ~/path
```

# 외부로 열기
```sh
kubectl expose pod $podName --type=NodePort --port=$portNumber
kubectl expose deployment $deployName --type=NodePort --port=$portNumber
kubectl expose deployment $deployName --type=LoadBalancer --port=$portNumber
# 확인
kubectl get service
kubectl get nodes -o wide
```

# 설정 편집
```sh
kubectl edit deployment $deployName
```

# kubelet, containerd
```sh
systemctl status kubelet
systemctl status containerd
```