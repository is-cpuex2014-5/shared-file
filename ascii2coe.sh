#!/bin/bash

echo "MEMORY_INITIALIZATION_RADIX=16;"
echo "MEMORY_INITIALIZATION_VECTOR="
cat $1 | sed 's/X.*//;s/\(........\)/\1,/g;s/,$/;/'
