##### A.3.3.3.6 Other transient regions 

多くの既存のForthシステムでは、これらの領域は`HERE`か、そのすぐ先にあり、それゆえに多くの制限があります。

<p><math xmlns="http://www.w3.org/1998/Math/MathML">
  <mfenced><mrow><mn>2</mn>
    <mi>n</mi>
    </mrow></mfenced>
  <mo>+</mo>
  <mn>2</mn>
</math>は、先頭のマイナス記号と末尾の空白を含み、区切り文字を含まない最大の倍長2進数の文字列表現を含む文字列のサイズです。</p>

$(2n)+2$は、先頭のマイナス記号と末尾の空白を含み、区切り文字を含まない最大の倍長2進数の文字列表現を含む文字列のサイズです。

Implementation note: Since the minimum value of *n* is 16, the absolute minimum size of the pictured  numeric output string is 34 characters. But if your implementation has a larger *n*, you must also increase the  size of the pictured numeric output string.

実装上の注意:  *n*の最小値は16であるため、絵に描いたような数値出力文字列の絶対的な最小サイズは34文字です。しかし、実装で *n* を大きくする場合は、絵の数値出力文字列のサイズも大きくする必要があります。
