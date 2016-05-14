#!/bin/bash

##
# Prepare a minimal environment for condor jobs.
##
export HOME=/root
export PATH=$PATH:/opt/cctools/cctools-5.2.3-x86_64-redhat6/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# export PARROT_CVMFS_ALIEN_CACHE=/tmp/planctoncache 

export PARROT_ALLOW_SWITCHING_CVMFS_REPOSITORIES=yes
export PARROT_CVMFS_REPO="<default-repositories> \
 alice-ocdb.cern.ch:url=${CERN_S1}/alice-ocdb.cern.ch,pubkey=/etc/cvmfs/keys/cern.ch/cern-it1.cern.ch.pub \
 ilc.desy.de:url=${DESY_S1}/ilc.desy.de,pubkey=/etc/cvmfs/keys/desy.de/desy.de.pub"
export HTTP_PROXY=t2-squid-01.to.infn.it:3128

exec parrot_run -U1234 "$@" 2> _CONDOR_WRAPPER_ERROR_FILE
error=$?
echo " ---- Failed to exec($error): $@ ----" > $_CONDOR_WRAPPER_ERROR_FILE

