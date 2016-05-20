#!/bin/bash 

# basicTest.sh
#
# Makes a basic test with instructions
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh



function testInstruction
{
	command="./instructionTest.sh ${1} ";
	expect=${2};
	error=1;
	(exec ${command} | grep "${expect}" > /dev/null ) && error=0;
	if [ "$error" == "0" ] ; then
		echo -n ".";
	else
		echo
		echo
		echo "ERROR in ${command}: Expect (${expect})";
		echo
	fi
}

header "basicTest - Test instructions from jaguaOs Microprocessor";


# Test mov instruction.

testInstruction "mov RA, 2"		A0C12;
testInstruction "mov RA, RB" 	A1C1C2;
testInstruction "mov RA, [1234]" A2C11234;
testInstruction "mov [1234], RA" A31234C1;
testInstruction "mov DR, 1234"	X0C51234;




echo
echo


