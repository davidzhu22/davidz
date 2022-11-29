#! /bin/bash

set -e

pushd $HOME/go/src/centaurusinfra.io/fornax-serverless

# cold test
# current use 20000 session for 67 node

test_start() {
	./bin/fornaxtest --test-case session_create --num-of-session-per-app 5 --num-of-app 67 --num-of-init-pod-per-app 0 --num-of-test-cycle 60
}

clear_app_pods() {
    # delete application
    names=`kubectl get application --kubeconfig kubeconfig --namespace fornaxtest | awk '{if(NR>1) print $1}'`
    for name in $names
    do
        kubectl delete application --kubeconfig kubeconfig --namespace fornaxtest $name &
    done
}
check_app(){
	kubectl get application --kubeconfig kubeconfig --namespace fornaxtest	
}

cold_test(){
    for i in {0..0}
    do
        test_start
		sleep 120
		clear_app_pods
		sleep 240
		check_app
		Sleep 30
    done
}

cold_test

# https://www.centaurusinfra.io/
# https://github.com/futurewei-cloud
