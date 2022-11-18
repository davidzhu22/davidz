link: https://cloud.google.com/compute/docs/connect/add-ssh-keys

https://stackoverflow.com/questions/59091502/how-to-add-an-ssh-key-to-google-cloud-using-the-cli

***************************************************************************************************************************
**** successfull statement ********************************************************************
gcloud compute os-login ssh-keys add --key-file=./.ssh/id_rsa.pub --project=quark-serverless
**** step 1: touch a file(gce.pub), then copy pub key to the file. use following command to run add to google project.
***********************************************************************************************************************
gcloud compute os-login ssh-keys add --key-file=./.ssh/gce.pub --project=quark-serverless
***********************************************************************************************
gcloud compute instances add-metadata VM_NAME --metadata-from-file ssh-keys=KEY_FILE

gcloud compute instances create VM_NAME --metadata=ssh-keys=PUBLIC_KEY


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
