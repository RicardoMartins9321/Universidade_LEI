#!/bin/bash
# This script checks the existence of a file
echo "Checking..."
if [[ -d $1 ]] ; then
    echo "$1 existe."
else
    echo "$1 não existe"
fi
echo "...done."
