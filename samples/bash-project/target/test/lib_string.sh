#!/usr/bin/env bash
#####
## COPYRIGHT © ITAMETIS - TOUS DROITS RÉSERVÉS
## Pour plus d'information veuillez contacter : copyright@itametis.com
#####

#####
## Determines whether or not the "$1" parameter contains the "$2" pattern. Returns true if it's the case, false
## otherwise.
##
## Usage : result=`STRING_contains "The text containing the paTtErn to find" "paTtErn"`
##
## $1 - The string into which process the research.
## $2 - The pattern to find.
###
STRING_contains() {
    local result=""

    if [ "${1}" == "" ] || [ "${2}" == "" ]; then
        result="false"
    else
        local exec=`echo ${1} | grep "${2}"`

        if [ "${exec}" == "" ]; then
            result="false"
        else
            result="true"
        fi
    fi

    echo "${result}"
}
