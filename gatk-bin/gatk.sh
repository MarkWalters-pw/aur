#!/usr/bin/env bash

set -eou pipefail
export LC_ALL=en_US.UTF-8

default_jvm_mem_opts="-Xms512m -Xmx1g"
jvm_mem_opts=""
jvm_prop_opts=""
pass_args=""

for arg in "$@"; do
  case $arg in
    '-D'*)
      jvm_prop_opts="$jvm_prop_opts $arg"
      ;;
    '-XX'*)
      jvm_prop_opts="$jvm_prop_opts $arg"
      ;;
     '-Xm'*)
      jvm_mem_opts="$jvm_mem_opts $arg"
      ;;
     *)
      pass_args="$pass_args $arg"
      ;;
  esac
done

if [ "$jvm_mem_opts" == "" ]; then
  jvm_mem_opts="$default_jvm_mem_opts"
fi

pass_arr=($pass_args)
if [[ ${pass_arr[0]:=} == org* ]]
then
  eval java $jvm_mem_opts $jvm_prop_opts -cp '/usr/share/java/gatk-bin/GenomeAnalysisTK.jar' $pass_args
else
  eval java $jvm_mem_opts $jvm_prop_opts -jar '/usr/share/java/gatk-bin/GenomeAnalysisTK.jar' $pass_args
fi
exit
