#! /bin/sh
cat "$@" |
sed '
/^<std-glossary>/,/^<\/std-glossary>/{
    s/^\(Interpretation:\) /|\1|/
    s/^\(Initiation:\) /|\1|/
    s/^\(Compilation:\) /|\1|/
    s/^\(Run-time:\) /|\1|/
    s/^\(Execution:\) /|\1|/
    s/^\(See:\) /|\1|/
    s/^\(Note:\) /|\1|/
    s/^\([a-z][a-z]* Execution:\) /|\1|/
}
' |sed '
/^<std-glossary>/,/^<\/std-glossary>/{
    /^ *$/!b
    s/^ *$//
    N
    s/^\n|/|/
}' |sed '
/^<std-glossary>/,/^<\/std-glossary>/{
    s/^\(|[^|][^|]*| *([^)][^)]*)\)  */\1\
\
/
}
'