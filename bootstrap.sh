#!/bin/bash

TC="swift-3.0.1-RELEASE-ubuntu16.04"

echo "📦  Installing Dependencies"
sudo apt-get update -y

# libpython2.7-dev - https://bugs.swift.org/browse/SR-2743
# libcurl3 - http://stackoverflow.com/a/39813691/2117550
sudo apt-get -yq install clang libicu-dev git wget libpython2.7-dev libcurl3

echo "⬇️  Downloading Swift"
wget -q https://swift.org/builds/swift-3.0.1-release/ubuntu1604/swift-3.0.1-RELEASE/$TC.tar.gz

echo "🔧  Untarring Swift"
tar zxf $TC.tar.gz
rm -rf $TC.tar.gz

echo "🚀  Installing Swift"
sudo rm -rf /swift-3.0.1
sudo mv $TC /swift-3.0.1

echo "💾  Export Swift Path"

# http://askubuntu.com/a/376386/306042
sudo su ubuntu -c 'echo "export PATH=/swift-3.0.1/usr/bin:\${PATH}" >> ~/.bashrc'
which swift

echo "💧  Installing Vapor Toolbox"
curl -sL toolbox.vapor.sh | bash
vapor --help

echo "✅  Done"
