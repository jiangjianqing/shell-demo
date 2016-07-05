#!/bin/bash

echo " \n ------------new test is starting!!!--------------"


source ./test_lib.sh

ret=$(funcSum 1 100)

echo "2 to 200 \`s sum : ${ret}"
