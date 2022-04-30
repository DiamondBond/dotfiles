#!/bin/bash

#powertop --auto-tune

methods="
\_SB.PCI0.RP05.PXSX._OFF
"

for m in $methods; do
    echo -n "Trying $m: "
    echo $m > /proc/acpi/call
    result=$(cat /proc/acpi/call | tr -d \\0) #for bash 4.4: removes null bytes
    case "$result" in
        Error*)
            echo "failed"
        ;;
        *)
            echo "works!"
            break #stop at first working code
        ;;
    esac
done
