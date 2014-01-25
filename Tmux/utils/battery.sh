#! /bin/sh

# A simple battery charge getter. Tested on OpenBSD 5.4

# Watt hours could be amp ours on some other systems, so
# watthour0 & watthour3 need to be changed to amphour
now=$(sysctl hw.sensors.acpibat0.watthour3 | sed s/[^0-9.]//g | cut -c 6-)
full=$(sysctl hw.sensors.acpibat0.watthour0 | sed s/[^0-9.]//g | cut -c 6-)
ac=$(sysctl hw.sensors.acpiac0 | sed -r s/[^On\|Off]//g | cut -c 3-)

prc=`echo "100 * ${now} / ${full}" | bc`

[[ "$ac" = "On" ]] && echo "W" || echo "$prc%"
