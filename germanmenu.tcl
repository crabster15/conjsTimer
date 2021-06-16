package require Tk
#set demensions of gui window

set width 403
set height 300

set x [expr { ( [winfo vrootwidth  .] - $width  ) / 2 }]
set y [expr { ( [winfo vrootheight .] - $height ) / 2 }]
wm title . "PassWordfront" 
wm geometry . ${width}x${height}+${x}+${y}

ttk::frame .fr -width $width -height $height

ttk::entry .fr.ich -textvariable ich
ttk::entry .fr.du -textvariable du
ttk::entry .fr.esSieEr -textvariable esSieEr
ttk::entry .fr.ihr -textvariable ihr
ttk::entry .fr.sie -textvariable sie
ttk::entry .fr.wir -textvariable wir
ttk::entry .fr.verb -textvariable verb


ttk::label .fr.ichlb -text Ich
ttk::label .fr.dulb -text Du
ttk::label .fr.erSieEslb -text Er/Sie/Es
ttk::label .fr.wirlb -text Wir
ttk::label .fr.sielb -text Sie
ttk::label .fr.ihrlb -text Ihr
ttk::label .fr.descriptionlb -text des
ttk::label .fr.timelb -text clocktime
ttk::label .fr.verblb -text verb

ttk::label .fr.empty1 -text " " 
ttk::label .fr.empty2 -text  " " 
ttk::label .fr.empty3 -text " "

#clock functionality
button .fr.start -text Start -command Start
label  .fr.time -textvar time -width 9 -font "Sans 20"
set time 00:00.00
button .fr.stop -text Stop -command Stop
button .fr.zero -text Zero -command Zero
set state 0
bind . <Key-space> {
    if {$state} {.stop invoke
    } else {
        .start invoke
    }
}
bind . <Key-0> {
    .zero invoke
}
eval pack [winfo children .] -side left -fill y

proc every {ms body} {eval $body; after $ms [namespace code [info level 0]]}

proc Start {} {
    if {$::time eq {00:00.00}} {
        set ::time0 [clock clicks -milliseconds]
    }
    every 20 {
        set m [expr {[clock clicks -milliseconds] - $::time0}]
        set ::time [format %2.2d:%2.2d.%2.2d \
            [expr {$m/60000}] [expr {($m/1000)%60}] [expr {$m%1000/10}]]
        incr ::titleskip
        if {$::titleskip >= 12} {
            wm title . "Timer $::time"
            set ::titleskip 0
        }
    }
    .fr.start config -state disabled
    set ::state 1
}
proc Stop {} {
    if {[llength [after info]]} {
        after cancel [after info]
    }
    .fr.start config -state normal
    set ::state 0
}
proc Zero {} {
    set ::time 00:00.00
    set ::time0 [clock clicks -milliseconds]
}


# binded functions

grid .fr -column 0 -row 0 
grid .fr.descriptionlb -column 1 -row 0
grid .fr.verblb -column 1 -row 1
grid .fr.verb -column 1 -row 2
grid .fr.ichlb -column 0 -row 3
grid .fr.ich -column 0 -row 4
grid .fr.dulb -column 0 -row 5
grid .fr.du -column 0 -row 6
grid .fr.erSieEslb -column 0 -row 7
grid .fr.esSieEr -column 0 -row 8
grid .fr.sielb -column 2 -row 7
grid .fr.sie -column 2 -row 8
grid .fr.ihrlb -column 2 -row 5
grid .fr.ihr -column 2 -row 6
grid .fr.wirlb -column 2 -row 3
grid .fr.wir -column 2 -row 4
grid .fr.time -column 1 -row 9
grid .fr.stop -column 2 -row 9
grid .fr.start -column 0 -row 9


grid columnconfigure .fr 0 -weight 1
grid columnconfigure .fr 1 -weight 1
grid columnconfigure .fr 2 -weight 1
grid rowconfigure .fr 0 -weight 1
grid rowconfigure .fr 1 -weight 1
grid rowconfigure .fr 2 -weight 1
grid rowconfigure .fr 3 -weight 1
grid rowconfigure .fr 4 -weight 1
grid rowconfigure .fr 5 -weight 1
grid rowconfigure .fr 6 -weight 1
grid rowconfigure .fr 7 -weight 1
grid rowconfigure .fr 8 -weight 1
grid rowconfigure .fr 9 -weight 1


