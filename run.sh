#!/bin/bash
#########################################################################
## Sample input file by Heedong Goh <wellposed@gmail.com>              ##
#########################################################################
## USER PROGRAM AND ITS ARGUMENTS
EXE=./bin/run
CPUSIZE=1
TITLE=test
NEV=1
ARG="-pep_nev $NEV -log_view :$TITLE.log"
## PETSC AND MPIEXE PATHS
export PETSC_DIR=/terra3/heedong/software/petsc-3.7.5
export PETSC_ARCH=arch-icc-opt
export SLEPC_DIR=/terra3/heedong/software/slepc-3.7.3
export MPIEXE=$PETSC_DIR/bin/petscmpiexec
## DO NOT CHANGE ########################################################
case $1 in
    --help )
	echo "Usage: bash run.sh [OPTION]"
	echo " "
	echo "  --nohup   ignore HUP signal"
	echo "  --clean   remove .log and .out" 
	echo "  --help    display this help and exit" ;;
    --nohup )
	echo "nohup $MPIEXE -n $CPUSIZE $EXE $ARG > $TITLE.out 2>&1 &"
	nohup $MPIEXE -n $CPUSIZE $EXE $ARG > $TITLE.out 2>&1 &
	echo "$TITLE.out is created." ;;
    --clean )
	echo "rm $TITLE.log $TITLE.out"
	rm $TITLE.log $TITLE.out ;;
    * )
	echo "$MPIEXE -n $CPUSIZE $EXE $ARG"
	$MPIEXE -n $CPUSIZE $EXE $ARG ;;
esac
exit $?
#########################################################################
