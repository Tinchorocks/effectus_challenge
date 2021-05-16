#!/bin/bash

bundle check || bundle install

rm tmp/pids/server.pid

rails s -e production -b '0.0.0.0'
