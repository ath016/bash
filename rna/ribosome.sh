#!/bin/bash

function tRNA {
	case $1 in
	uuu)	echo -n Phe ;;
	uuc)	echo -n Phe ;;
	uua)	echo -n Leu ;;
	uug)	echo -n Leu ;;

	ucu)	echo -n Ser ;;
	ucc)	echo -n Ser ;;
	uca)	echo -n Ser ;;
	ucg)	echo -n Ser ;;

	uau)	echo -n Tyr ;;
	uac)	echo -n Tyr ;;
	uaa)	echo -n "Ter(stop)" ;;
	uag)	echo -n "Ter(stop)" ;;

	ugu)	echo -n Cys ;;
	ugc)	echo -n Cys ;;
	uga)	echo -n "Ter(stop)" ;;
	ugg)	echo -n Trp ;;

	cuu)	echo -n Leu ;;
	cuc)	echo -n Leu ;;
	cua)	echo -n Leu ;;
	cug)	echo -n Leu ;;

	ccu)	echo -n Pro ;;
	ccc)	echo -n Pro ;;
	cca)	echo -n Pro ;;
	ccg)	echo -n Pro ;;

	cau)	echo -n His ;;
	cac)	echo -n His ;;
	caa)	echo -n Gln ;;
	cag)	echo -n Gln ;;

	cgu)	echo -n Arg ;;
	cgc)	echo -n Arg ;;
	cga)	echo -n Arg ;;
	cgg)	echo -n Arg ;;

	auu)	echo -n Ile ;;
	auc)	echo -n Ile ;;
	aua)	echo -n Ile ;;
	aug)	echo -n "Met(start)" ;;

	acu)	echo -n Thr ;;
	acc)	echo -n Thr ;;
	aca)	echo -n Thr ;;
	acg)	echo -n Thr ;;

	aau)	echo -n Asn ;;
	aac)	echo -n Asn ;;
	aaa)	echo -n Lys ;;
	aag)	echo -n Lys ;;

	agu)	echo -n Ser ;;
	agc)	echo -n Ser ;;
	aga)	echo -n Arg ;;
	agg)	echo -n Arg ;;

	guu)	echo -n Val ;;
	guc)	echo -n Val ;;
	gua)	echo -n Val ;;
	gug)	echo -n Val ;;

	gcu)	echo -n Ala ;;
	gcc)	echo -n Ala ;;
	gca)	echo -n Ala ;;
	gcg)	echo -n Ala ;;

	gau)	echo -n Asp ;;
	gac)	echo -n Asp ;;
	gaa)	echo -n Glu ;;
	gag)	echo -n Glu ;;

	ggu)	echo -n Gly ;;
	ggc)	echo -n Gly ;;
	gga)	echo -n Gly ;;
	ggg)	echo -n Gly ;;
	esac
}

# setup variables
codon=z
l=${#1}
n=0

# skip to Met
while [[ ! "$codon" == "aug" ]]
do
	if [[ $n -ge $l ]]
	then
		break
	fi
	
	codon=${1:n:3}

	let "n = n + 1"
done

# fix indexing
let "n = n - 1"

# start at Met
while [[ ! "$codon" == "uaa" && ! "$codon" == "uag" && ! "$codon" == "uga" ]]
do
	if [[ $n -ge $l ]]
	then
		break
	fi
	
	codon=${1:n:3}

	echo -n " - "
	tRNA $codon
	
	let "n = n + 3"
done

# formatting
echo ""

