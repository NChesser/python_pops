function hello {
  OUTPUT=$1
  INPUT=$2
  echo $INPUT $OUTPUT
}

function another {

  echo "Something Else"
  ps -ef | grep sshd | grep -v
}

function again {
  cat /etc/passwd
}

uname -a | grep Linux

if uname -a | grep SunOS
then
  HOST_TYPE="Solaris"
else
  HOST_TYPE="Linux"
fi

echo $HOST_TYPE

if [ $HOST_TYPE == "Solaris" ]
then
  echo "Solaris Box"
else
  echo "I see nothing!"
fi

pwd | awk '{ print "working directory", $0 }'
svcs -a | grep application

echo Nick was here

cat index.html | awk '{ print "index.html", $0 }'
hello "UFC" "WATERS" | awk '{ print "Bash Function:", $0 }'
#./asyncio_example.py | awk '{ print "Python Script:", $0 }'

ifconfig -a
mpstat

#sleep 15

another

again