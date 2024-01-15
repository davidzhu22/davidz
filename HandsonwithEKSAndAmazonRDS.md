# Hands-on with Elastic Kubernetes Service (EKS) and Amazon RDS
link: https://thecloudbootcamp.notion.site/Hands-on-with-Elastic-Kubernetes-Service-EKS-and-Amazon-RDS-86bce749a4504191af64aba8a40537e8

- Download project files ⬇️

[project-files.zip](https://prod-files-secure.s3.us-west-2.amazonaws.com/0d1b678b-cd91-4256-93c7-73b2e82396d5/353bca5c-e007-4c67-bf88-c0a6de79c36a/project-files.zip)

- Set DB password variable

```
export TF_VAR_db_password="welcome123456"

```

- Provision the resources with Terraform

```
terraform init
terraform plan
terraform apply

```

- Connect to the database

```
mysql --host=<public_ip_address> --port=3306 -u app -p

```

- Prepare database

Create user:

```
CREATE USER app@'%' IDENTIFIED BY 'welcome123456';
GRANT ALL PRIVILEGES ON dbcovidtesting.* TO app@'%';
FLUSH PRIVILEGES;

```

Create table:

```
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_name` varchar(200) NOT NULL,
  `home_country` varchar(200) DEFAULT NULL,
  `testing_type` varchar(200) DEFAULT NULL,
  `testing_result` varchar(200) DEFAULT NULL,
  `pdf` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

```

- Prepare Docker image

```
docker login
docker build -t luxxy-covid-testing-system-app-en:latest .
docker tag luxxy-covid-testing-system-app-en:latest thecloudbootcamp/luxxy-covid-testing-system-app-en:latest
docker push thecloudbootcamp/luxxy-covid-testing-system-app-en:latest

```

- Prepare K8S deployment file
    
    Change bucket name
    Change image name
    
- Connect to AWS EKS K8S

```
rm ~/.kube/config
aws eks update-kubeconfig --name <CLUSTER_NAME> --region <REGION>
kubectl cluster-info
kubectl get nodes

```

- Deploy app to K8s

```
cd ../luxxy-kubernetes
kubectl apply -f luxxy-covid-testing-system.yaml

```

- Test it

```
kubectl get svc

```

- Destroy

```
kubectl delete svc luxxy-covid-testing-system
kubectl delete deployment luxxy-covid-testing-system
terraform destroy

```

---

# Known Issue:

Issue:
External IP is not populated - https://github.com/kubernetes/kubernetes/issues/73906

Solution:
Remove "[kubernetes.io/cluster/](http://kubernetes.io/cluster/)<CLUSTER_NAME>" of security group "EKS node shared security group"
