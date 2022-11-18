link: https://cloud.google.com/compute/docs/connect/add-ssh-keys

***************************************************************************************************************************
**** successfull statement ********************************************************************
gcloud compute os-login ssh-keys add --key-file=./.ssh/id_rsa.pub --project=quark-serverless
**** step 1: touch a file(gce.pub), then copy pub key to the file. use following command to run add to google project.
***********************************************************************************************************************
gcloud compute os-login ssh-keys add --key-file=./.ssh/gce.pub --project=quark-serverless
***********************************************************************************************
gcloud compute instances add-metadata VM_NAME --metadata-from-file ssh-keys=KEY_FILE

gcloud compute instances create VM_NAME --metadata=ssh-keys=PUBLIC_KEY
