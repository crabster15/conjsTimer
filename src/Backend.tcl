namespace eval ::Backend {
  
  namespace export load_file 
  variable verb_dict

}

proc Backend::load_file {} {
    ::struct::matrix data
    set csvfile [open verbs.csv] 
    csv::read2matrix $csvfile $data  , auto 
    close $csvfile

    set rows [$data rows]
    puts $rows

    for {set row 0} {$row < $rows} {incr row} {
    puts [$data get row $row]
    }
}

namespace eval ::Backend { variable version 1.0 }
package provide Backend $Backend::version
package require Tcl 8.5-
package require csv
package require struct::matrix


Backend::load_file