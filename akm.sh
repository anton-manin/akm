#!/usr/bin/env bash 

AKM_FILE="akm.txt"


function usage()
{
    echo "Usage: akm [COMMAND] [ACRONYM]"
    echo
    echo "Commands:"
    echo "      help    display this help text"
    echo "      find    search for the meaning of an ACRONYM"
    echo "      add     prompts the meaning and adds an ACRONYM to the list"
    echo
}


function exit_if_file_does_not_exist()
{
    if [ ! -f "$AKM_FILE" ]; then
        echo Acronym file does not exist!
        exit
    fi
}


function find_acronym()
{
    fgrep -i $1 $AKM_FILE
}


function add_acronym()
{
    ACRONYM=$1

    read -p "MEANING: " MEANING
   
    echo "$ACRONYM - $MEANING" >> $AKM_FILE
}


### Main script

if (($# == 0)); then
    usage
else 
    exit_if_file_does_not_exist

    case "$1" in
        find)
            find_acronym $2
            ;;
        add)
            add_acronym $2
            ;;
        help)
            usage
            ;;
        *)
            echo Invalid command!
            echo
            usage
            ;;
    esac
fi