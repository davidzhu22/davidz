#remove container
docker rm --force fce626371825aae3ace5431bf8ad4524ff4c0906f2fbffb61072b842eecf2e74

ls /usr/local/bin/containerd* -l

#remove pod
# Delete pods
delete_pods() {
  source ./hack/fornax_curl.zshrc

  pod_ids=`sudo crictl pods | awk '{print $1}'`

  for pod_id in $pod_ids
  do
    if [ $pod_id == "POD" ]; then
      continue
    fi
    
    echo $pod_id
    sudo crictl stopp $pod_id
    sleep 1
    sudo crictl rmp $pod_id
  done
}
