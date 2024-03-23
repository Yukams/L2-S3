#! /bin/sh

nbTxt=`ls -A | grep -c ".txt$"`
nbSh=`ls -A | grep -c ".sh$"`
nbHidden=`ls -A | grep -c "^\."`
nbOthers=`ls -A | grep -v ".txt$" | grep -v ".sh$" | grep -cv "^\."`

echo "nbTxt = $nbTxt"
echo "nbSh = $nbSh"
echo "nbHidden = $nbHidden"
echo "nbOthers = $nbOthers"
