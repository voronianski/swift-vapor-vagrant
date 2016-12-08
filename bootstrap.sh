#!/usr/bin/env bash

TC="swift-3.0.1-RELEASE-ubuntu16.04"

echo "📦  Installing Dependencies"
sudo apt-get update --yes

# libpython2.7-dev - https://bugs.swift.org/browse/SR-2743
# libcurl3 - http://stackoverflow.com/questions/39812998/swift-build-error-on-ubuntu-15-10
sudo apt-get -yq install clang libicu-dev git wget libpython2.7-dev libcurl3

echo "⬇️  Downloading Swift"
wget -q https://swift.org/builds/swift-3.0.1-release/ubuntu1604/swift-3.0.1-RELEASE/$TC.tar.gz

echo "🔧  Untarring Swift"
tar zxf $TC.tar.gz
rm -rf $TC.tar.gz

echo "🚀  Installing Swift"
sudo mv $TC /swift-3.0.1

echo "export PATH=/swift-3.0.1/usr/bin:\${PATH}" >> ~/.bashrc
source .bashrc

echo "🔄  Checking Swift"
curl -sL check.vapor.sh | sudo bash

echo "💧  Installing Vapor Toolbox"
curl -sL toolbox.vapor.sh | sudo bash
vapor --help

echo "✅  Done"
