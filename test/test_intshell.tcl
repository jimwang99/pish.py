
proc echo { str } {
    puts $str
}

proc run { name {proc_time_sec 1.0} } {
    puts "$name: start"
    after [expr int($proc_time_sec * 500)]
    puts "$name: intermediate"
    puts stderr "$name: error message"
    after [expr int($proc_time_sec * 500)]
    puts "$name: end"
}

run init 0.2
puts "<<PISH::CMD_END>>"

while {[gets stdin line] >= 0} {
#     puts $line
    eval $line
}

