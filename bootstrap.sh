#!/usr/bin/env bash

OS="ubuntu1604"
TC="swift-3.0.1-RELEASE-ubuntu16.04"

echo "📦  Installing Dependencies"
sudo apt-get update --yes

# libpython2.7-dev - https://bugs.swift.org/browse/SR-2743
# libcurl3 - http://stackoverflow.com/questions/39812998/swift-build-error-on-ubuntu-15-10
sudo apt-get -yq install clang libicu-dev git wget libpython2.7-dev libcurl3

echo "⬇️  Downloading"
wget https://swift.org/builds/swift-3.0.1-release/$OS/swift-3.0.1-RELEASE/$TC.tar.gz

echo "🔧  Untarring"
tar zxf $TC.tar.gz
rm -rf $TC.tar.gz

echo "🚀  Installing"
sudo mv $TC /swift-3.0.1

echo "export PATH=/swift-3.0.1/usr/bin:$PATH" >> ~/.bashrc
exec bash

curl -sL check.vapor.sh | sudo bash
curl -sL toolbox.vapor.sh | sudo bash

vapor --help

echo "✅  Done"
