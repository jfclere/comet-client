#!/bin/sh
#
#
#
#


url=$1;
n=$2;
#max=$3;
delay=$3;
nb_req=$4;
nb_clients=$5;

printf "Running clients with:\n";
echo "";
printf "\tURL: $url\n";
printf "\tNumber of clients: $n\n";
printf "\tDelay: $delay\n";
printf "\tTotal number of requests: $nb_req\n";
printf "\tTotal number of clients: $nb_clients\n";

printf "\n\t-> Log file: $filename\n";


#filename=$n-$max-$delay-$(date +%s)-log.txt
filename=$n-$delay-$nb_req-$nb_clients-$(date +%s)-log.txt
echo $filename;

log_file=$(date +%s)-log.txt

#mvn exec:java -Dexec.mainClass="org.jboss.web.comet.CometServletClientTest" -Dexec.args="$url $n $max $delay" > $log_file
mvn exec:java -Dexec.mainClass="org.jboss.web.comet.CometServletClientTest" -Dexec.args="$url $n $delay $nb_req $nb_clients" > $log_file

#printf "max \t min \t avg\n" > $filename
#egrep -v '[a-zA-Z]|^\s*$' $log_file >> $filename
cat $log_file | grep ^WRITE >> ~/$n-$delay-$nb_req-$nb_clients-log.txt

#mvn exec:java -Dexec.mainClass="org.jboss.web.comet.LogParser" -Dexec.args="$filename $nb_req"
