#! /bin/sh
cat "$@" |
sed '/^<membership>/,/^<\/membership>/{
    /<membership>/{
        s/$/\
<div class="membership">/
    }
    /<\/membership>/{
        s/^/<\/div>\
/
    }
    /|/{
        s/^|//
        s/|$//
    }
    /|/{
        s/^\([^|]*\)|\(.*\)$/  <div class="membership-grid">\
    <span class="membership-organization">\1<\/span>\
    <span class="membership-name">\2<\/span>\
  <\/div>/
        s/>  */>/
        s/  *</</
    }
}
' |sed '/std-glossary-option2/{
    /"xxxxx"/d
}'