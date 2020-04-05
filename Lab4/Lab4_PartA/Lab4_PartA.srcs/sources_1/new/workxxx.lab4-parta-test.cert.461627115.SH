#!/bin/sh

#PBS -l pmem=15gb
#PBS -l walltime=240:00

echo >> 'lab4-parta-test.cert.out'
pwd >> 'lab4-parta-test.cert.out'
echo -n 'HOST: ' >> 'lab4-parta-test.cert.out'
hostname >> 'lab4-parta-test.cert.out'
echo >> 'lab4-parta-test.cert.out'
echo Environment variables: >> 'lab4-parta-test.cert.out'
echo ACL2_CUSTOMIZATION=NONE >> 'lab4-parta-test.cert.out'
echo ACL2_SYSTEM_BOOKS=/home/ecelrc/students/mtemel/acl2/books >> 'lab4-parta-test.cert.out'
echo ACL2=/home/ecelrc/students/mtemel/acl2/ccl-saved_acl2 >> 'lab4-parta-test.cert.out'
echo >> 'lab4-parta-test.cert.out'
echo Temp lisp file: >> 'lab4-parta-test.cert.out'
cat 'workxxx.lab4-parta-test.cert.461627115.LISP' >> 'lab4-parta-test.cert.out'
echo --- End temp lisp file --- >> 'lab4-parta-test.cert.out'
echo >> 'lab4-parta-test.cert.out'
echo TARGET: lab4-parta-test >> 'lab4-parta-test.cert.out'
echo STEP: certify >> 'lab4-parta-test.cert.out'
echo Start of output: >> 'lab4-parta-test.cert.out'
echo >> 'lab4-parta-test.cert.out'
export ACL2_WRITE_PORT=t
(/home/ecelrc/students/mtemel/acl2/ccl-saved_acl2 < 'workxxx.lab4-parta-test.cert.461627115.LISP' 2>&1) >> 'lab4-parta-test.cert.out'
EXITCODE=$?
echo Exit code from ACL2 is $EXITCODE >> 'lab4-parta-test.cert.out'
ls -l 'lab4-parta-test.cert' >> 'lab4-parta-test.cert.out' || echo 'lab4-parta-test.cert' seems to be missing >> 'lab4-parta-test.cert.out'
exit $EXITCODE
