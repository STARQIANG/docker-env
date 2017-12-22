#!/usr/bin/expect

set CHECK_PORT [lindex $argv 0]
set p_loop 0
set IS_OK  1
while { $p_loop <= 60 } {
    set p_loop [expr $p_loop+1]
    set timeout 2
    spawn telnet localhost $CHECK_PORT
    expect {
        "*Connected*" {
            send_user "..........................checking start.........................."
            send "\r"; exp_continue
        }
        "*dubbo*" {
           send "status\r";
               expect {
               "*OK*" {
                    send_user "..........................Service is healthy..................."
                    send "ls\r"
                    exit 0
               }

            }
        }
        "*refused*" {
            send_user "...............checking $p_loop .......................\n"
        }

    }
    send "exit\r";
    expect eof
    sleep 1;
}
exit 1