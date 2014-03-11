#! /usr/bin/env bash

set -e
set -u

echo '--------------------' >> /go_sf/make-repo-snapshot.log
echo 'env:' >> /go_sf/make-repo-snapshot.log
env | sort >> /go_sf/make-repo-snapshot.log
echo '====================' >> /go_sf/make-repo-snapshot.log
