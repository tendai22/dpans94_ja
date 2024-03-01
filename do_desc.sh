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
# word/desc
    /^<glossary>/,/^<\/glossary>/{
        /^<glossary>/{
            s/.*/<div class="glossary">/
            x
            s/.*//
            x
            b
        }
        /^<\/glossary>/{
            x
            p
            x
            s/.*/<\/div>/
            b
        }
        /^||/!{
            /^ *$/b
            #s/^/<div>/
            #s/$/<\/div>/
            s/\([^ ]\)$/\1 /
            b
        }
        /^||/{
            x
            p
            x
            s/^||\([^|][^|]*\)|| *-- \(.*\)$/<div class="x2-grid">\
  <div class="x-word"><code>\1<\/code><\/div>\
  <div class="x-desc">\
        \2 /
            s/^||\([^|][^|]*\)|| *\([^ ].*\)$/<div class="x3-grid">\
  <div class="x-word"><code>\1<\/code><\/div>\
  <div class="x-stack">\2<\/div>\
  <div class="x-desc">/
            s/^||\([^|][^|]*\)|| *$/<div class="x2-grid">\
  <div class="x-word"><code>\1<\/code><\/div> \
  <div class="x-desc">/
            x
            s/^$/  <\/div>\
<\/div>/
            x
        }
    }
# handy-hint
    /^<handy-hint>/{
        s/<handy-hint>[^{]*{/<div class="handy-hint">{/
        s/{\([^}][^}]*\)}/\
<h4 style="text-align: center;">\1<\/h4>}/
        s/}.*$//
    }
    /^<\/handy-hint>/{
        s/<\/handy-hint>/<\/div>/
    }
' |
sed '/^<review-of-terms*>/,/^<\/review-of-terms*>/{
        /^<review-of-terms*>/{
            s/.*/<div class="review-of-terms">/
            x
            s/.*//
            x
            b
        }
        /^<\/review-of-terms*>/{
            x
            p
            x
            s/.*/<\/div>/
            b
        }
        /^||/!{
            /^> /{
                s/^/\
\
/
                s/$/\
\
/
            }
            /^ *$/b
            s/^/<div>/
            s/$/<\/div>/
            b
        }
        /^||/{
            x
            p
            x
            s/^||\([^|][^|]*\)||\(.*\)$/<div class="x2-grid">\
  <span class="x-word">\1<\/span>\
  <span class="x-desc">\
        \2/
            x
            s/^$/  <\/span>\
<\/div>/
            x
        }
    }
' |
sed '/^<foreword>/,/^<\/foreword>/{
        /^<foreword>/{
            s/.*/<foreword>/
            x
            s/.*//
            x
            b
        }
        /^<\/foreword>/{
            x
            p
            x
            s/.*/<\/foreword>/
            b
        }
        /^||/!{
            /^ *$/b
            b
        }
        /^||/{
            x
            p
            x
            s/^||\([^|][^|]*\)||\(.*\)$/<div class="foreword-grid">\
  <span class="foreword-word">\1<\/span>\
  <span class="x-desc">\
        \2/
            x
            s/^$/  <\/span>\
<\/div>/
            x
        }
    }
/^<miniterm>/,/^<\/miniterm>/{
        /^<miniterm>/{
            s/.*/<miniterm>/
            x
            s/.*//
            x
            b
        }
        /^<\/miniterm>/{
            x
            p
            x
            s/.*/<\/miniterm>/
            b
        }
        /^||/!{
            /^ *$/b
            s/^/<p style="margin-left: 0;">/
            s/$/<\/p>/
            b
        }
        /^||/{
            x
            p
            x
            /^||[^|][^|]*|| *$/N
            s/\n/ /
            s/^||\([^|][^|]*\)||\(.*\)$/<div class="miniterm-grid">\
  <span class="miniterm-word">\1<\/span>\
  <span style="display: inline-block; width: 0.5em;"> <\/span>\
  <span class="miniterm-desc">\
\2/
            x
            s/^$/  <\/span>\
<\/div>/
            x
        }
    }
/^<table>/,/<\table>/{
    /^<table>/s/<table>/<div class="table">/
    /^<\/table>/s/<\/table>/<\/div>/
}
' |
sed '/^<membership>/,/^<\/membership>/{
    /|/{
        s/^\([^|]*\)|\(.*\)$/<div><div class="membership-line">\
  <span class="membership-organization">\1 <hr> <\/span>\
  <span class="membership-name">\2<\/span>\
<\/div><\/div>\
a \
/
        s/>  */>/g
        s/  *</</g
        s/^<span/^  <span/
    }
}' |
sed 's/<figcaption> *<\/figcaption>//
         s/<div><\/div>//'


