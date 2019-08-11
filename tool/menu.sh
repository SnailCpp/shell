#!/bin/bash

function ShowDiskSpace {
        clear;
        df -k;
}

function WhoseOnline {
        clear;
        who;
}

function MemeryUsage {
        clear;
        cat /proc/meminfo | more;
}

function Menu {
        clear;
        echo -e "\t\t\tSys Admin Menu\n";
        echo -e "\t1. Display disk space";
        echo -e "\t2. Display logged on users";
        echo -e "\t3. Display memory usage";
        echo -e "\t0. Exit menu\n\n";
        echo -en "\t\tEnter moption: ";
        read -n 1 option;

        case $option in
                0) 
                        clear;
                        exit;;
                1)
                        ShowDiskSpace;;
                2)
                        WhoseOnline;;
                3)
                        MemeryUsage;;
                *)
                        clear;
                        echo "Sorry, wory selection.";;
        esac
}

function main {
        while [ 1 ]; do
            Menu;
            echo -en "\n\n\t\t\tHit any key to continue";
            read -n 1 line;
        done;
}

main;
