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
    /^<description>/,/^<\/description>/b do_env
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
# flush previous trailer
            x
            p
            x
# make trailer </DIV_SPAN_classname> first
            h
            x
            s/^||{{\([^}][^}]*\)}}.*$/  <\/DIV_SPAN_\1>\
<\/div>/
            x
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>\
  <span class="\1-option4">\6<\/span>\
  <div class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)||\([^|].*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <span class="\1-option3">\5<\/span>\
  <div class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <div class="\1-desc">\
        \5 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <span class="\1-option2">\4<\/span>\
  <div class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <div class="\1-desc">\
        \4 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-option1">\3<\/span>\
  <div class="\1-desc">/
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <span class="\1-desc">\
        \3 /
            s/^||{{\([^}]*\)}}||\([^|][^|]*\)|| *$/<div class="\1-grid">\
  <span class="\1-word"><code>\2<\/code><\/span>\
  <DIV_SPAN_\1 class="\1-desc">/
        }
    }
' |
sed '# postprocess for dpan94 only
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
'
# end of script
