#!/bin/bash

tag="${1:-}"

hc() {
    #echo "hc $@" >&2 ;
    herbstclient "$@" ;
}

mrect=( $(hc monitor_rect -p "" ) )
termwidth=$(((${mrect[2]}*45)/100))
termheight=755

rect=(
    $termwidth
    $termheight
    $((${mrect[0]}+(${mrect[2]}-termwidth)/2))
    $((${mrect[1]}-termheight))
)

y_line=${mrect[1]}


hc add 


monitor=notepad

exists2=false
if ! hc add_monitor $(printf "%dx%d%+d%+d" "${rect[@]}") \
                    "$tag" $monitor 2> /dev/null ; then
    exists2=true
else
    # remember which monitor was focused previously
    hc chain \
        , new_attr string monitors.by-name.$monitor.my_prev_focus \
        , substitute M monitors.focus.index \
            set_attr monitors.by-name.$monitor.my_prev_focus M
fi

update_geom() {
    local geom=$(printf "%dx%d%+d%+d" "${rect[@]}")
    hc move_monitor "$monitor" $geom
}

steps=32
interval=0.0

animate() {
    progress=( "$@" )
    for i in "${progress[@]}" ; do
        rect[3]=$((${y_line}-(i*termheight)/$steps))
        update_geom
        sleep "$interval"
    done
}

show() {

    hc lock
    hc set focus_follows_mouse 0
    hc raise_monitor $monitor
    hc focus_monitor $monitor
    hc unlock
    hc lock_tag $monitor
    animate $(seq $steps -1 0)
}

hide() {
    rect=( $(hc monitor_rect "$monitor" ) )
    local tmp=${rect[0]}
    rect[0]=${rect[2]}
    rect[2]=${tmp}
    local tmp=${rect[1]}
    rect[1]=${rect[3]}
    rect[3]=${tmp}
    termheight=${rect[1]}
    y_line=${rect[3]} # height of the upper screen border

    animate $(seq 0 +1 $steps)
    hc substitute M monitors.by-name.$monitor.my_prev_focus \
        and + compare monitors.focus.name = $monitor \
            + focus_monitor M
    hc remove_monitor $monitor
    hc set focus_follows_mouse 1
}

[ $exists2 = true ] && hide || show
