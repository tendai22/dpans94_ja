
The number "2" by itself is sometimes used for address calculations as an argument to +LOOP, when the  loop index is an address. When converting the word 2/ which operates on negative dividends, one should  be cognizant of the rounding method used.

ループ・インデックスがアドレスである場合、+LOOPの引数としてアドレス計算に数値「2」単体が使われることがあります。負の配当で動作するワード2/を変換する場合、使用される丸め方法に注意する必要があります。

### D.6.5 Address alignment 

Forth 83 imposes no restriction upon the alignment of addresses to any boundary. ANS Forth specifies that  a Standard System may require alignment of addresses for use with various "@" and "!" operators.

Forth 83 では、アドレスのアライメントに制限はありません。ANS Forthは、標準システムがさまざまな「@」演算子や「!」演算子を使う際にアドレスアライメントを要求してくるかもしれません。

<description>

||Words Affected:||
! +! 2! 2@ @ ? ,

||Reason:||
Many computers have hardware restrictions that favor the use of aligned  addresses. On some machines, the native memory-access instructions will cause an exception trap if used  with an unaligned address. Even on machines where unaligned accesses do not cause exception traps,  aligned accesses are usually faster.

||理由||
多くのコンピュータでは、アライメントされたアドレスの使用を推奨するハードウェア制限があります。一部のマシンでは、アラインされていないアドレスで使用すると、ネイティブのメモリアクセス命令が例外トラップを引き起こす。アンアラインド・アクセスが例外トラップを引き起こさないマシンであっても、アラインド・アクセスの方が通常は高速です。

||Impact:||
All of the ANS Forth words that return addresses suitable for use with aligned "@" and "!" words must return aligned addresses. In most cases, there will be no problem. Problems can arise from the use of user-defined data structures containing a mixture of character data and cell-sized data.

Many existing Forth systems, especially those currently in use on computers with strong alignment  requirements, already require alignment. Much existing Forth code that is currently in use on such  machines has already been converted for use in an aligned environment.

||影響||
アラインされた"@"および"!"ワードの使用に適したアドレスを返すANS Forthワードは、すべてアラインされたアドレスを返さなければなりません。ほとんどの場合、問題はありません。文字データとセル・サイズ・データが混在したユーザ定義のデータ構造を使用すると、問題が発生することがあります。

既存のForthシステムの多く、特に強いアライメント要求を持つコンピュータで現在使用されているものは、すでにアライメントを要求しています。そのようなマシンで現在使用されている既存のForthコードの多くは、アライメント環境で使用するためにすでに変換されています。

||Transition/Conversion:||
There are two possible approaches to conversion of programs for use on a system  requiring address alignment.

||移行/変換:||
アドレス・アライメントを必要とするシステムで使用するためのプログラムの変換には、2つのアプローチが考えられます。

The easiest approach is to redefine the system’s aligned "@" and "!" operators so that they do not require  alignment. For example, on a 16-bit little-endian byte-addressed machine, unaligned "@" and "!" could be  defined:  

最も簡単な方法は、システムの整列演算子"@"と"!"を再定義し、整列を必要としないようにすることです。例えば、16ビットのリトルエンディアン・バイトアドレス・マシンでは、アライメントなしの"@"と"!"を定義することができます。

    : @ ( addr -- x ) DUP C@ SWAP CHAR+ C@ 8 LSHIFT OR ; 
    : ! ( x addr -- ) OVER 8 RSHIFT OVER CHAR+ C! C! ; 

These definitions, and similar ones for "+!", "2@", "2!", ",", and "?" as needed, can be compiled before  an unaligned application, which will then work as expected.

これらの定義、および必要に応じて "+!"、"2@"、"2!"、","、"? "に対応する同様の定義を、アラインされていないアプリケーションの前にコンパイルすることができます。

This approach may conserve memory if the application uses substantial numbers of data structures  containing unaligned fields.

</description>

<hr class="page-wrap" />

<description>

||...||
この方法は、アプリケーションがアラインされていないフィールドを含むデータ構造を大量に使用する場合、メモリを節約することができます。

Another approach is to modify the application’s source code to eliminate unaligned data fields. The ANS  Forth words ALIGN and ALIGNED may be used to force alignment of data fields. The places where such  alignment is needed may be determined by inspecting the parts of the application where data structures  (other than simple variables) are defined, or by "smart compiler" techniques (see the "Smart Compiler" discussion below).

もう1つの方法は、アプリケーションのソースコードを変更して、アラインされていないデータフィールドをなくすことです。ANS Forth のワード ALIGN と ALIGNED を使用して、データ・フィールドを強制的に整列させることができます。このような整列が必要な場所は、アプリケーションのデータ構造(単純な変数以外)が定義されている部分を検査するか、「スマートコンパイラ」技術(後述の「スマートコンパイラ」の説明を参照)によって決定することができます。

This approach will probably result in faster application execution speed, at the possible expense of  increased memory utilization for data structures.

この方法は、データ構造のメモリ使用量を増加させる可能性はありますが、アプリケー ションの実行速度はおそらく速くなります。

</description>

Finally, it is possible to combine the preceding techniques by identifying exactly those data fields that are  unaligned, and using "unaligned" versions of the memory access operators for only those fields. This  "hybrid" approach affects a compromise between execution speed and memory utilization.

最後に、アライメントされていないデータ・フィールドを正確に特定し、そのフィールドだけに「アライメントされていない」バージョンのメモリ・アクセス演算子を使用することで、前述のテクニックを組み合わせることが可能です。この "ハイブリッド" アプローチは、実行速度とメモリ使用率の妥協点に影響を与えます。

### D.6.6 Division/modulus rounding direction 
