#set disassembly-flavor intel
set print pretty on

define asmstep
    si
    x/10i $pc
end

define connect
    target extended-remote localhost:3333
end

define mrh
    monitor reset halt
end

define memprof
    d br
    b mm_malloc.c:188
    set pagination off
    while (1)
      print size
      c
    end
end

define log
    set logging on
    set trace-commands on
end
