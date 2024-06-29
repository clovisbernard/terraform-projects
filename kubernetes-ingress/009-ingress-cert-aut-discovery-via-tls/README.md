## ingress-cert-aut-discovery-via-tls
- Automatically disover SSL Certificate from AWS Certificate Manager Service using spec.tls.host
In this approach, with the specified domain name if we have the SSL Certificate created in AWS - Certificate Manager, that certificate will be automatically detected and associated to Application Load Balancer.
- We don't need to get the SSL Certificate ARN and update it in Kubernetes Ingress Manifest
- Discovers via Ingress rule host and attaches a cert for  *.tclovis.com to the ALB

## URL
```
dev.tclovis.com/

https://articles.tclovis.com/

https://covid19.tclovis.com/

https://creative.tclovis.com/

https://halloween.tclovis.com/

https://phone.tclovis.com/

https://static.tclovis.com/

https://website.tclovis.com/
```