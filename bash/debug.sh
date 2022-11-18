 tail -f nodeagent.logs
 
 grep -i 'pod state' fornaxcore.logs | grep 'pod phase' | grep Fail | wc -l
 
  grep -i 'pod state' fornaxcore.logs | grep 'pod phase' | grep Running | wc -l
 
