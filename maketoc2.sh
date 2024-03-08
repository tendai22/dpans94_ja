#!/bin/sh

grep '^#' /dev/null "$@" |
sed '1i\
<nav id="toc" role="doc-toc">\
<h1>Contents</h1>\

    /{[^{}}]*}$/!d
    s/<span class="ref\([^<][^<]*\)<\/span>//
    s/\^\^[XYZ]//
    s/:##### / XXXXXXXXXX /
    s/:#### / XXXXXXXX /
    s/:### / XXXXXX /
    s/:## / XXXX /
    s/:# / XX /
    s/^\([^ ]*\) \(XX*\) \([^{}]*\){\([^{}]*\)}/\2 - [\3](\1#\4)/
    /^XX /s/$/{.toc-chapter}/
    /^XXXX /s/$/{.toc-section}/
    /^XXXXXX /s/$/{.toc-subsection}/
    /^XXXXXXXX /s/$/{.toc-subsection}/
    /^XXXXXXXXXX /s/$/{.toc-column}/
    s/^XX //
    s/^XXXX /  /
    s/^XXXXXX /    /
    s/^XXXXXXXX /      /
    s/^XXXXXXXXXX /      /
    s/\.md#id=/.html#/
    $a\
\
</nav>
'
echo
