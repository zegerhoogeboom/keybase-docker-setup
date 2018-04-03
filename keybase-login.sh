#!/usr/bin/expect
set pass [lindex $argv 0]

spawn keybase login
expect "passphrase for "
sleep 1; send "$pass\r"

interact