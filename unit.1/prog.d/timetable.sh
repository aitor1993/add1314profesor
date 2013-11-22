#!/bin/bash

EXITCMD='logout'
TIMECMD=`date +%H%M`

echo "Ejecutando $0..."

echo "HoraMinuto=$TIMECMD"

if [ "0940" < "$TIMECMD" ] && [ "$TIMECMD" < "1115" ]; 
then
	echo 'Vete al descanso!!!'
	logout
	exit 0
if	

