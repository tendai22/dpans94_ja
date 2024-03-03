#! /bin/sh
# <foo> ... </foo>環境の中の"||"エントリの先頭に環境名fooを追加する。
# 後処理で環境に合わせたタグを生成する。
cat "$@" |
sed '/^<std-glossary>/,/^<\/std-glossary>/b preprocess
/^<miniterm>/,/^<\/miniterm>/b preprocess
/^<membership>/,/^<\/membership>/b preprocess
/^<foreword>/,/^<\/foreword>/b preprocess
/^<description>/,/^<\/description>/b preprocess
b
{
:preprocess
    /^<[^\/>]*>/{
# hold tag/class name
        h
        x
        s/^<//
        s/>.*$//
        s/^/||{{/
        s/$/}}/
        x
        b
    }
# skip if it is not word entry
    /^||/!b
# add tag name as 1st item
    H
    x
    s/\n//
    p
# restore tag in hold space
    s/}}||.*$/}}/
    x
    d
}'
