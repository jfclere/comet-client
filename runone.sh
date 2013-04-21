i=$1
(cd /tmp/PROXY/comet-client
nohup bash /tmp/PROXY/comet-client/run.sh http://172.17.7.254:8080/comet//CometServletTest 1000 $i 1000000 5000 &
)
