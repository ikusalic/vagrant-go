#! /usr/bin/env bash

set -e
set -u

cat >> /vagrant/results/make-repo-snapshot.log <<HERE
--------------------
env:
----
$( env | sort )
====================
HERE
