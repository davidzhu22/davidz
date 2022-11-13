**************************************************************************
***** Create new user account: ubuntu ************************************
**************************************************************************
*** add super user to system *********************************************
sudo adduser ubuntu
sudo usermod -aG sudo ubuntu
sudo vi /etc/ssh/sshd_config
sudo service ssh restart
**** add following line change ubuntu to sudo user reference: https://lynxbee.com/solved-is-not-in-the-sudoers-file-this-incident-will-be-reported/#.Y3AeQ8fMKUk***
sudo adduser ubuntu sudo

**************************************************************************
****install git ***********
sudo apt update
sudo apt install git
git --version


**************** change own : chown *************************************************************
Add user to docker group: sudo usermod -a -G docker ${USER}
sudo -s
sudo chown -R $USER: .
sudo chown -R ubuntu .
sudo nc -zv 10.218.233.95 1024

*************************************************************************************************
**********************************************************************************************
*****  session-wrappre docker image build ****************************************************
change on test.go line 45: 			Image: "512811/sessionwrapper:latest",
**********************************************************************************************
Chang docker permission: sudo chmod 666 /var/run/docker.sock
**********************************************************************************************
sudo chmod 666 /var/run/docker.sock
sudo chmod o+rw /var/run/docker.sock; ls -al /var/run/docker.sock   (from sonya)
lscpu
lsmem
***********************************************************
step 1:
make docker-build

step 2:
make

step 3:
make containerd-local-push

step 4:
about command have a error: comment containerd-local-push mid line
then run: make containerd-local-push

step 5:

$ docker run -it --rm busybox
docker search 
docker pull
test performance: https://www.techtarget.com/searchitoperations/tutorial/Kubernetes-performance-testing-tutorial-Load-test-a-cluster
https://blog.csdn.net/weixin_37844885/article/details/125756926
*************************************************************************************************************************************
Uploal or push or pull docker image for docker hub
*************************************************************************************************************************************
*** tag image
docker tag centaurusinfra.io/fornax-serverless/session-wrapper:v0.1.0 512811/sessionwrapper:v0.1.0
docker tag centaurusinfra.io/fornax-serverless/session-wrapper:v0.1.0 512811/sessionwrapper:latest

docker push 512811/sessionwrapper:v0.1.0
docker push 512811/sessionwrapper:latest

*** untag image or remove image
docker rmi 512811/sessionwrapper:v0.1.0
docker rmi 512811/sessionwrapper:latest

*** pull docker image
docker pull 512811/sessionwrapper:v0.1.0
docker pull 512811/sessionwrapper:latest


****************************
*** set vim file number ************************
************************************************
vim ~/.vimrc

:set number
:set relativenumber


*** change folder owner
chown -R root fornax-serverless/
cd fornax-serverless
make docker-build

sudo -s
*** change back myselft
chown -R ubuntu fornax-serverless
exit
cd

*****************************************************************
*** Scp copy command *********************************************
*****************************************************************
*** copy file *****
scp ubuntu@10.218.233.95:/var/log/quark/quark1.log c:/temp
*** copy 95 file to local machine **********************************************************************
scp ubuntu@10.218.233.95:~/tmp/fornaxcore.logs.gz c:/temp
scp ubuntu@10.218.233.95:~/tmp/nodeagent.logs.gz c:/temp
*** copy google vm to ubuntu@10.218.233.95 machine *****************************************************
** zip file: gzip **************************************************************************************
name=fornaxcore
gcloud compute scp $name:~/go/src/centaurusinfra.io/fornax-serverless/fornaxcore.logs.gz ~/tmp/ --project=quark-serverless --zone=us-central1-a

name=nodeagent-1
gcloud compute scp $name:~/go/src/centaurusinfra.io/fornax-serverless/nodeagent.logs.gz ~/tmp/ --project=quark-serverless --zone=us-central1-a


***************************************************************************************************************************
**** get ubuntu ip addres: ***
curl -w "\n" -s https://api.ipify.org
***************************************************************************************************************************

****************************
#! /bin/bash
sudo ufw allow 22
*************

***************************************************************************************************************************
*****************  Change Owner of git owner: sudo chown -R $USER: . ******************************************************
***************************************************************************************************************************

*** check space  https://askubuntu.com/questions/432836/how-can-i-check-disk-space-used-in-a-partition-using-the-terminal-in-ubuntu-12-0***********************************
*** df -h *****************************************************************************************************************
***************************************************************************************************************************

Allocatable:     map[v1.ResourceName]resource.Quantity{v1.ResourceCPU: *k8sresource.NewMilliQuantity(1000, k8sresource.DecimalSI), v1.ResourceMemory: k8sresource.MustParse("16Gi"), v1.ResourceStorage: *k8sresource.NewQuantity(100, k8sresource.DecimalSI)}
Allocatable:     map[v1.ResourceName]resource.Quantity{v1.ResourceCPU: *k8sresource.NewMilliQuantity(1000, k8sresource.DecimalSI), v1.ResourceMemory: k8sresource.MustParse("16Gi"), v1.ResourceStorage: *k8sresource.NewQuantity(100, k8sresource.DecimalSI)},
******************** API server IP ********************************		
FornaxCoreIPs:            []string{"localhost:18001"},
*** root dir ***************************************
centaurusinfra.io/fornax-serverless
	s := fmt.Sprintf("%08s", count1)
	hostname = hostname + "-" + s

********** git hard reset **************************
git reset --hard read-code
********************************************************************************
******   git remove branch: freecodecamp.org/news/how-to-delete-a-git-branch-both-locally-and-remotely/*****************************************************
Delete a branch with git branch -d <branch>. (local)

Example: git branch -d fix/authentication
git branch -D dz-api-client1 (force)
git branch -d dz-api-client1 (have pushed and merged with the remote branch)

The -d option will delete the branch only if it has already been pushed and merged with the remote branch. Use -D instead if you want to force the branch to be deleted, even if it hasn't been pushed or merged yet.

Deleting a branch REMOTELY
git push <remote> --delete <branch>.(remote)
For example: git push origin --delete fix/authentication
git push orgin --delete dz-api-test

or short for 
git push origin :dz-api-test

*****************************
*** fixed vs code connection issues: https://superuser.com/questions/421004/how-to-fix-warning-about-ecdsa-host-key

del %USERPROFILE%\.ssh\known_hosts`
********************************************************************************************************************

*** clear etcd file or data *****************************
1. stop etcd
2. go /var/lib/etcd/member/rm -rf ./*

********************************************************************************************************************

********************************************************************************************************************
***** How to get latest code in main branch ************************************************************************
git stash  (tempory close your new file)
git pull --rebase (get latested code from github)
git stash apply  (apply or put your file change back to your code)
make
make all


*******************************************************************************************************************
Check memory: grep MemTotal /proc/meminfo
Check cpu: lscpu
check memory: lsmem

****************************************************************
***********************************************************************************************
********************** Simulation Test ********************************************************
go build -o bin/simulation cmd/simulation/main.go
***********************************************************************************************
cmd/simulation/
cmd/simulation/main.go

Makefile
cmd/simulation/app/sdependency/dependency.go
****** commit code ****************************************************************************
git commit -m "simulation init v01"
git commit -m "simulation init v06 update code"

*** new code **********
git commit -m "simulation_new v01"
