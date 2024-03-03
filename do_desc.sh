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
    /^<foreword>/,/^<\/foreword>/{
        b do_env
    }
    /^<miniterm>/,/^<\/miniterm>/{
        b do_env
    }
    b
    {
:do_env
        /^<\/[^>][^>]*>/{
            x
            p
            x
            s/.*/<\/div>/
            b
        }
        /^<[^>][^>]*>/{
            s/<\(.*\)>/<div class="\1">/
            x
            s/.*//
            x
            b
        }
        /^||/!{
# normal/non-entry line, pass-through
            /^ *$/b
            #s/^/<div>/
            #s/$/<\/div>/
            b
        }
        /^||/{
            x
            p
            x
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>\
  <span class="\1-option4">\6<\/span>\
  <span class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>\
  <span class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-desc">\
        \5 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-desc">\
        \4 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-desc">\
        \3 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-desc">/
            x
            s/^$/  <\/span>\
<\/div>/
            x
        }
    }
' |
sed '# postprocess for dpan94 only
    /std-glossary-word/s/<\/*code>//g
    /std-glossary-option1/s/>\([^<]*\)</><code>\1<\/code></g
' |
sed '/^<table>/,/<\table>/{
        /^<table>/s/<table>/<div class="table">/
        /^<\/table>/s/<\/table>/<\/div>/
    }
    s/<figcaption> *<\/figcaption>//
    s/<div><\/div>//
'
# end of script
