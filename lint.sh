#!/bin/bash
FILES=`find . -name "Dockerfile"`
for file in $FILES
do
  docker run --rm --privileged -v `pwd`:/root/ projectatomic/dockerfile-lint dockerfile_lint -r basic_rules.yaml -f "$file" ';' > /dev/null
  echo $?
done
exit 1
