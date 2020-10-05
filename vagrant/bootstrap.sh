#!/usr/bin/env bash
if ! [ -f go1.15.2.linux-amd64.tar.gz ]; then
  wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
  tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz
  rm -f go1.15.2.linux-amd64.tar.gz
fi
export PATH=$PATH:/usr/local/go/bin

cd /vagrant
if ! [ -d websocket ]; then
  git clone https://github.com/joshuazhu78/websocket
fi
cd websocket/examples/chat
nohup go run *.go &>/vagrant/nohup.out&
