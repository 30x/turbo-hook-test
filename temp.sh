#!/bin/bash

# Get Repo
curl -L https://api.github.com/repos/30x/node-test-app/tarball > temp.tar

# Get the zip in the right setup
ls 

tar -xf temp.tar
cd 30x-node-test-app-0cd84c1
tar -cf ../app.tar .

cd ..

rm -rf 30x-node-test-app-0cd84c1
rm -f temp.tar

pwd
