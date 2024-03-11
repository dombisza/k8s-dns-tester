## k8s-dns-tester
Simple script to test dns from kubernetes pods. By default it summarizes 1000 queires into a single line of log:  
```
[2024-03-11T08:54:17Z --- 2024-03-11T09:02:39Z] Success: 1000 Failed: 0 Rate: 100.00% Epoch: 502s
```
It does not return errors like `NXDOMAIN` or timeout, its just calculates the success rate of the dns queries.

## Deploy
Create a `configmap` from the script
```
kubectl create configmap query-script --from-file=test-dns.sh
```
Deploy the `busybox` pod
```
kubectl apply -f busybox.yaml
```
