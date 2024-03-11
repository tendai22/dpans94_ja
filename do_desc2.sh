#! /bin/sh
cat "$@" |
sed '
# figure
    /^!\[/{
        s/^!\[\([^]]*\)\]\[\([^]][^]]*\)\](\([^)][^)]*\)){\([^}][^}]*\)}/<figure style="\4">\
<img width=\2, src="\3">\
<figcaption>\1<\/figcaption>\
<\/figure>/
        s/^!\[\([^]]*\)\]\[\([^]][^]]*\)\](\([^)][^)]*\))/<figure>\
<img width=\2, src="\3">\
<figcaption>\1<\/figcaption>\
<\/figure>/
    }
# word/desc environment
    /^<std-glossary>/,/^<\/std-glossary>/{
        b do_env
    }
    /^<app-glossary>/,/^<\/app-glossary>/{
        s/||{{[^}][^}]*}}||\([^|][^|]*\)||\([^|][^|]*\)||/#### \1 `\2`/
        b
    }
    /^<foreword>/,/^<\/foreword>/{
        b do_env
    }
    /^<miniterm>/,/^<\/miniterm>/{
        b do_env
    }
    /^<description>/,/^<\/description>/b do_env
    b
    {
:do_env
        /^<\/[^>][^>]*>/{
# close last div/span
            H
            s/.*//
            x
            b
        }
        /^<[^>][^>]*>/{
            b
        }
        /^||/{
# close current grid by <\div>
            x
            /./p
            s/.*/<\/div>\
/
            x
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>\
  <span class="\1-option4">\6<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>\
  <span class="\1-option1">\3<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word">\2<\/span>/
            b
        }
        /^|/{
# word-desc body
            s/^|\([^\][^|]*\)|\(.*\)$/  <word>\1<\/word>\
  <desc>\
\2\
  <\/desc>/
            b
        }
# blank line, intentionary pass-through
        /^ *$/{
            s/^  *$//
            b
        }
# pre line, intentionary pass-through
        /<pre>.*<\/pre>/{
            b
        }
        /<pre>/,/<\/pre>/{
            b
        }
        /^    /b
        /^ |/b
# normal/non-entry line, encluse <desc> ... </desc>
        {
            s/\(.*\)$/  <desc>\
\1\
  <\/desc>/
        }
    }
' |sed '
# do font evects
/^ *<word>.*<\/word>$/b deco
/^ *<desc>/,/^ *<\/desc>/{
    /^ *<desc> *$/N
:deco
    s/\*\*\([^*][^*]*\)\*\*/<bold>\1<\/bold>/g
    s/\*\([^*][^*]*\)\*/<em>\1<\/em>/g
    s/`\([^`][^`]*\)`/<code>\1<\/code>/g
}
' |
sed '# postprocess for dpan94 only
    /std-glossary-option4/{
        s/<span [^>]*>/<desc>/
        s/<\/span>/<\/desc>/
        b
    }
    /std-glossary-word/s/<\/*code>//g
    /std-glossary-option1/s/>\([^<]*\)</><code>\1<\/code></g
    # description for dpan94 only
    /description-word/s/<\/*code>//g
    # basically, use <span ... in some cases, use <div
    s/DIV_SPAN_description/div/
    s/DIV_SPAN_[^ >][^ >]*/span/
' |
sed '/^<table>/,/<\table>/{
        /^<table>/s/<table>/<div class="table">/
        /^<\/table>/s/<\/table>/<\/div>/
    }
    s/<figcaption> *<\/figcaption>//
    s/<div><\/div>//
    # put some space between ### and A.2.1
    /^#/s/^\(##* [0-9A-Z.][0-9A-Z.]*\) /\1\&emsp; /
'
# end of script
