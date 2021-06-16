namespace eval ::Backend {
  
  namespace export load_file 
  variable lines 
  variable index
  variable list

}

proc Backend::load_file {} {
  variable lines
  set csvfile [open verbs.csv] 
  set lines [split $csv "\n"]
  close $csvfile
}

proc Backend::load_dict { index } {
  variable lines
  variable list
  set list {}
  set list [lindex $lines $index]
  return $list
}

proc check_for_end {} {

}

proc Backend::check_input { ich du esErSie sie wir ihr verb} {
  set inputlist { ich du esErSie sie wir ihr verb }
  set incorrectlist {}
  for { set a 0}  {$a < 7} {incr a} {
    set pushedindex [expr $a + 2]
    if {[lindex $Backend::list $pushedindex] != [lindex $inputlist $a] } {
      lappend $incorrectlist [lindex $inputlist $a]
    }
  }
  return $incorrectlist
}

namespace eval ::Backend { variable version 1.0 }
package provide Backend $Backend::version
package require Tcl 8.5-
