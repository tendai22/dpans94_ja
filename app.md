# Rationale (informative annex)

## A.1 Introduction 

### A.1.1 Purpose 

### A.1.2 Scope 

This Standard is more extensive than previous industory standards for the Forth language.  Several things made this necessary:

- the desire to resolve conflicts between previous standards; 
- the need to eliminate semantic ambiguities and other inadequacies; 
- the requirement to standardize common practice, where possible resolving divergences in a way that minimizes the cost of compliance;
- the desire to standardize common system techniques, including those germane to hardware.

The result of the effort to satisfy all of these objectives is a Standard arranged so that the required word set  remains small. Thus ANS Forth can be provided for resource-constrained embedded systems. Words  beyond those in the required word set are organized into a number of optional word sets and their  extensions, enabling implementation of tailored systems that are Standard.

When judging relative merits, the members of the X3J14 Technical Committee were guided by the  following goals (listed in alphabetic order):

この規格は、これまでのForth言語の工業規格よりも広範囲に及んでいる。 これは、いくつかの理由から必要となった：

- 以前の標準間の矛盾を解決したい； 
- 意味上の曖昧さやその他の不備を解消する必要性； 
- 共通プラクティスを標準化し、可能であればコンプライアンス・コストを最小化する方法で相違を解決すること；
- ハードウェアに関連するものも含め、一般的なシステム技術を標準化すること。

これらの目的をすべて満たすための努力の結果、必要な単語数が少なくなるように配置された規格が完成しました。このため、リソースに制約のある組込みシステムにもANS Forthを提供することができます。必要な単語セット以外の単語は、いくつかのオプションの単語セットとその拡張に整理され、Standardでありながらカスタマイズされたシステムの実装を可能にしています。

X3J14技術委員会のメンバーは、相対的な優劣を判断する際、以下の目標（アルファベット順）を指針とした：

<description>
||Consistency||The Standard provides a functionally complete set of words with minimal  functional overlap.

||Consistency||規格は、機能的重複を最小限に抑えた、機能的に完全な語句の集合を提供する。

||Cost of compliance||This goal includes such issues as common practice, how much existing code  would be broken by the proposed change, and the amount of effort required to  bring existing applications and systems into conformity with the Standard.

||準拠のコスト(Cost of compliance)||この目標には、一般的な慣習、提案された変更によって既存のコードがどの程度壊れるか、既存のアプリケーションやシステムを規格に準拠させるために必要な労力などの問題が含まれる。

||Efficiency||Execution speed, memory compactness.

||効率性(Efficiency)||実行速度、メモリのコンパクトさ。

||Portability||Words chosen for inclusion should be free of system-dependent features.

||移植性(Portability)||システムに依存しない単語であること。

||Readability||Forth definition names should clearly delineate their behavior. That behavior  should have an apparent simplicity which supports rapid understanding. Forth  should be easily taught and support readily maintained code.

||可読性(Readability) ||前方定義名はその動作を明確に区別すべきである。その動作は、迅速な理解をサポートする見かけ上の単純さを持つべきである。Forthは簡単に教えることができ、容易に保守できるコードでなければならない。

||Utility||Be judged to have sufficiently essential functionality and frequency of use to be  deemed suitable for inclusion.

||ユーティリティ(Utility)|| 必要不可欠な機能と使用頻度が十分にあると判断されること。

</description>

### A.1.3 Document organization 

#### A.1.3.1 Word sets 

From the beginning, the X3J14 Technical Committee faced not only conflicting ideas as to what "real"  Forth is, but also conflicting needs of the various groups within the Forth community. At one extreme were  those who pressed for a "bare" Forth. At the other extreme were those who wanted a "fat" Forth. Many  were somewhere in between. All were convinced of the rightness of their own position and of the  wrongness of at least one of the two extremes. The committee’s composition reflected this full range of  interests.

The approach we have taken is to define a Core word set establishing a greatest lower bound for required  system functionality and to provide a portfolio of optional word sets for special purposes. This simple  approach parallels the fundamental nature of Forth as an extensible language, and thereby achieves a kind of  meta-extensibility.

With this key, high-level compromise, regardless of the actual makeup of the individual word sets, a firm  and workable framework is established for the long term. One may or may not agree that there should be a  Locals word set, or that the word COMPILE, belongs in the Core Extensions word set. But at least there is  a mechanism whereby such things can be included in a logical and orderly manner.

当初から、X3J14技術委員会は、「本当の」Forthとは何かという点で、相反する考え方に直面していただけでなく、Forthコミュニティ内のさまざまなグループのニーズも相反していた。ある極端な例では、"素の "Forthを求める人々がいた。もう一方の極端な例では、"太った "Forthを求める人々がいた。多くはその中間であった。全員が、自分たちの立場の正しさと、両極端の少なくともどちらかが間違っていることを確信していた。委員会の構成は、このようなあらゆる利害を反映したものであった。

私たちがとったアプローチは、必要なシステム機能の最大の下限を確立するコア・ワードセットを定義し、特別な目的のためにオプションのワードセットのポートフォリオを提供するというものです。このシンプルなアプローチは、拡張可能な言語としてのForthの基本的な性質と類似しており、それによって一種のメタ拡張性を実現しています。

この重要でハイレベルな妥協点によって、個々の単語セットの実際の構成にかかわらず、長期にわたって堅固で実行可能なフレームワークが確立される。Localsという単語セットがあるべきだとか、COMPILEという単語がCore Extensionsという単語セットに属するべきだとか、そういうことに同意する人もしない人もいるかもしれない。しかし、少なくともそのようなものを論理的かつ整然と含めることができるメカニズムがある。

Several implications of this scheme of optional word sets are significant.

First, ANS Forth systems can continue to be implemented on a greater range of hardware than could be  claimed by almost any other single language. Since only the Core word set is required, very limited  hardware will be able to accommodate an ANS Forth implementation.

Second, a greater degree of portability of applications, and of programmers, is anticipated. The optional  word sets standardize various functions (e.g., floating point) that were widely implemented before, but not  with uniform definition names and methodologies, nor the same levels of completeness. With such words  now standardized in the optional word sets, communications between programmers - verbally, via magazine  or journal articles, etc. - will leap to a new level of facility, and the shareability of code and applications  should rise dramatically.

Third, ANS Forth systems may be designed to offer the user the power to selectively, even dynamically,  include or exclude one or more of the optional word sets or portions thereof. Also, lower-priced products  may be offered for the user who needs the Core word set and not much more. Thus, virtually unlimited  flexibility will be available to the user.

このオプションのワードセットのスキームには、いくつかの重要な意味があります。

第一に、ANS Forthシステムは、他のどの言語よりも幅広いハードウェアに実装することができます。必要なのはCoreワードセットだけなので、ANS Forthの実装に対応できるハードウェアは非常に限られます。

第二に、アプリケーションとプログラマの移植性がより高くなることが期待されます。オプションのワードセットは、以前は広く実装されていたさまざまな関数（浮動小数点など）を標準化するものですが、統一された定義名や方法論、同じレベルの完全性を持つものではありませんでした。このような言葉がオプショナル・ワードセットで標準化されたことで、プログラマー間のコミュニケーションは、口頭、雑誌やジャーナルの記事などを通じて、新たなレベルに飛躍するでしょう。- また、コードやアプリケーションの共有性も飛躍的に向上するはずです。

第3に、ANS Forthシステムは、ユーザーが選択的に、さらには動的に、1つ以上のオプションの単語セットまたはその一部を含めたり除外したりできるように設計されているかもしれない。また、Coreワードセットを必要とし、それ以上を必要としないユーザー向けに、低価格の製品を提供することもできる。このように、実質的に無制限の柔軟性がユーザーに提供されます。

But these advantages have a price. The burden is on the user to decide what capabilities are desired, and to  select product offerings accordingly, especially when portability of applications is important. We do not  expect most implementors to attempt to provide all word sets, but rather to select those most valuable to  their intended markets.

The basic requirement is that if the implementor claims to have a particular optional word set the entire  required portion of that word set must be available. If the implementor wishes to offer only part of an  optional word set, it is acceptable to say, for example, "This system offers portions of the [named] word  set", particularly if the selected or excluded words are itemized clearly.

Each optional word set will probably appeal to a particular constituency. For example, scientists  performing complex mathematical analysis may place a higher value on the Floating-Point word set than  programmers developing simple embedded controllers. As in the case of the core extensions, we expect  implementors to offer those word sets they expect will be valued by their users.

しかし、これらの利点には代償がある。特にアプリケーションの移植性が重要な場合、どのような機能が必要かを判断し、それに応じて製品を選択する責任はユーザーにある。私たちは、ほとんどの実装者がすべての単語セットを提供しようとするのではなく、意図する市場にとって最も価値のあるものを選択することを期待しています。

基本的な要件は、実装者が特定のオプションの単語セットを持つと主張する場合、その単語セットの必要な部分全体が利用可能でなければならないということです。実装者がオプションの単語セットの一部だけを提供したい場合、特に選択または除外された単語が明確に項目化されていれば、例えば「このシステムは[名前付き]単語セットの一部を提供します」と言うことは許容される。

各オプション単語セットは、おそらく特定の利用者にアピールするだろう。例えば、複雑な数学的解析を行う科学者は、単純な組み込みコントローラを開発するプログラマよりも、浮動小数点ワードセットに高い価値を置くかもしれません。コア拡張の場合と同じように、実装者は、ユーザによって評価されると予想される単語セットを提供することを期待する。

Optional word sets may be offered in source form or otherwise factored so that the user may selectively load  them.

The extensions to the optional word sets include words which are deemed less essential to performing the  primary activity supported by the word set, though clearly relevant to it. As in the case of the Core  Extensions, implementors may selectively add itemized subsets of a word set extension providing the  labeling doesn’t mislead the user into thinking incorrectly that all words are present.

オプションの単語セットは、ソース形式で提供されるか、またはユーザーが選択的にロードできるようにファクタリングされる。

オプションの単語セットの拡張機能には、単語セットによってサポートされる主要なアクティビティを実行するために、明らかに関連性があるにもかかわらず、それほど不可欠ではないとみなされる単語が含まれる。コア拡張の場合と同様に、実装者は、ラベル付けがすべての単語が存在するとユーザーに誤解を与えない限り、単語セットの拡張の項目化されたサブセットを選択的に追加することができる。

## A.2 Terms and notation 


### A.2.1 Definitions of terms 

<miniterm>
||ambiguous condition||
The response of a Standard System to an ambiguous condition is left to the discretion of the implementor.
A Standard System need not explicitly detect or report the occurrence of ambiguous conditions.

||cross compiler||
Cross-compilers may be used to prepare a program for execution in an embedded system, or may be used to  generate Forth kernels either for the same or a different run-time environment.

||data field||
In earlier standards, data fields were known as "parameter fields".
On subroutine threaded Forth systems, everything is object code. There are no traditional code or data  fields. Only a word defined by CREATE or by a word that calls CREATE has a data field. Only a data field  defined via CREATE can be manipulated portably.

||曖昧な条件||
曖昧な状態に対する標準システムの対応は、実装者の裁量に任されている。
標準システムは曖昧な状態の発生を明示的に検出したり報告したりする必要はない。

||クロスコンパイラ||
クロス・コンパイラは、組み込みシステムで実行されるプログラムを準備するために使用されることがあり、また、同じランタイム環境または異なるランタイム環境用の Forth カーネルを生成するために使用されることもあります。

||データ・フィールド||
以前の標準では、データフィールドは「パラメータフィールド」と呼ばれていました。
サブルーチン・スレッドのForthシステムでは、すべてがオブジェクト・コードです。従来のコード・フィールドやデータ・フィールドはありません。CREATEで定義された単語、またはCREATEを呼び出す単語だけがデータフィールドを持ちます。CREATE によって定義されたデータフィールドのみが移植可能な操作が可能です。

||word set||
This Standard recognizes that some functions, while useful in certain application areas, are not sufficiently  general to justify requiring them in all Forth systems. Further, it is helpful to group Forth words according  to related functions. These issues are dealt with using the concept of word sets.

The "Core" word set contains the essential body of words in a Forth system. It is the only "required" word  set. Other word sets defined in this Standard are optional additions to make it possible to provide Standard  Systems with tailored levels of functionality.

||ワードセット||
本標準では、一部の関数は特定の応用分野で有用である一方、すべての Forth システムで必要であることを正当化するには十分な汎用性がないことを認識しています。さらに、関連する関数に従って Forth 単語をグループ化すると便利です。これらの問題は、単語セットの概念を使用して処理されます。

コア」単語セットには、Forthシステムで必要不可欠な単語が含まれています。これは唯一の「必須」単語セットです。本標準で定義されている他の単語セットは、標準システムに合わせたレベルの機能を提供できるようにするためのオプションの追加である。

</miniterm>

### A.2.2 Notation 

#### A.2.2.2 Stack notation 

The use of *-sys*, *orig*, and *dest* data types in stack effect diagrams conveys two pieces of information. First,  it warns the reader that many implementations use the data stack in unspecified ways for those purposes, so  that items underneath on either the control-flow or data stacks are unavailable. Second, in cases where orig and dest are used, explicit pairing rules are documented on the assumption that all systems will implement  that model so that its results are equivalent to employment of some stack, and that in fact many  implementations do use the data stack for this purpose. However, nothing in this Standard requires that  implementations actually employ the data stack (or any other) for this purpose so long as the implied  behavior of the model is maintained.

スタック効果図で *sys*、*orig*、*dest* データ型を使用することは、2つの情報を伝える。第一に、多くの実装がこれらの目的のために不特定の方法でデータスタックを使用するため、制御フロースタックまたはデータスタックの下の項目が利用できないことを読者に警告する。第2に、origとdestが使用される場合、明示的なペアリング規則は、その結果が何らかのスタックの使用と等価になるように、すべてのシステムがそのモデルを実装し、実際に多くの実装がこの目的のためにデータスタックを使用するという前提で文書化されている。しかし、本標準では、モデルの暗黙の動作が維持される限り、この目的のためにデータスタック(またはその他)を実際に使用することを実装に要求するものはない。

## A.3 Usage requirements 

Forth systems are unusually simple to develop, in comparison with compilers for more conventional  languages such as C. In addition to Forth systems supported by vendors, public-domain implementations  and implementation guides have been widely available for nearly twenty years, and a large number of  individuals have developed their own Forth systems. As a result, a variety of implementation approaches  have developed, each optimized for a particular platform or target market.

ベンダーがサポートする Forth システムに加えて、パブリックドメインの実装と実装ガイドが 20 年近くにわたって広く利用可能であり、多数の個人が独自の Forth システムを開発してきました。その結果、さまざまな実装アプローチが開発され、それぞれが特定のプラットフォームやターゲット市場向けに最適化されてきました。

The X3J14 Technical Committee has endeavored to accommodate this diversity by constraining  implementors as little as possible, consistent with a goal of defining a standard interface between an  underlying Forth System and an application program being developed on it.

X3J14技術委員会は、基礎となるForthシステムとその上で開発されるアプリケーションプログラムとの間の標準インターフェースを定義するという目標に合致するように、実装者をできる限り制約しないことによって、この多様性に対応するように努めてきた。

Similarly, we will not undertake in this section to tell you how to implement a Forth System, but rather will  provide some guidance as to what the minimum requirements are for systems that can properly claim  compliance with this Standard.

同様に、このセクションではForthシステムの実装方法について説明するのではなく、本基準への準拠を適切に主張できるシステムの最低要件について、いくつかのガイダンスを提供します。

### A.3.1 Data-types 

Most computers deal with arbitrary bit patterns. There is no way to determine by inspection whether a cell  contains an address or an unsigned integer. The only meaning a datum possesses is the meaning assigned by  an application.

ほとんどのコンピュータは任意のビットパターンを扱う。セルがアドレスを含むか符号なし整数を含むかを検査で判断する方法はない。データが持つ唯一の意味は、アプリケーションによって割り当てられた意味である。

When data are operated upon, the meaning of the result depends on the meaning assigned to the input  values. Some combinations of input values produce meaningless results: for instance, what meaning can be  assigned to the arithmetic sum of the ASCII representation of the character "A" and a TRUE flag? The  answer may be "no meaning"; or alternatively, that operation might be the first step in producing a  checksum. Context is the determiner.

データが操作されるとき、結果の意味は入力値に割り当てられた意味に依存する。例えば、文字 "A "のASCII表現とTRUEフラグの算術和にどのような意味があるでしょうか。あるいは、その演算がチェックサムを生成する最初のステップになるかもしれない。文脈が決定するのである。

The discipline of circumscribing meaning which a program may assign to various combinations of bit  patterns is sometimes called data typing. Many computer languages impose explicit data typing and have  compilers that prevent ill-defined operations.

プログラムがさまざまなビットパターンの組み合わせに割り当てる意味を規定する学問は、データ型付けと呼ばれることがある。多くのコンピュータ言語では、明示的なデータ型付けが行われ、コンパイラが不定義の演算を防ぐようになっている。

Forth rarely explicitly imposes data-type restrictions. Still, data types implicitly do exist, and discipline is  required, particularly if portability of programs is a goal. In Forth, it is incumbent upon the programmer  (rather than the compiler) to determine that data are accurately typed.
This section attempts to offer guidance regarding de facto data typing in Forth.

Forthが明示的にデータ型の制限を課すことはほとんどない。しかし、データ型は暗黙のうちに存在するものであり、特にプログラムの移植性を目標とする場合には、その規律が求められます。Forthでは、データが正確に型付けされているかどうかを判断するのは、（コンパイラではなく）プログラマに任されています。
このセクションでは、Forth における事実上のデータ型付けに関するガイダンスを示します。

#### A.3.1.2 Character types 

The correct identification and proper manipulation of the character data type is beyond the purview of  Forth’s enforcement of data type by means of stack depth. Characters do not necessarily occupy the entire  width of their single stack entry with meaningful data. While the distinction between signed and unsigned  character is entirely absent from the formal specification of Forth, the tendency in practice is to treat  characters as short positive integers when mathematical operations come into play.

文字データ型の正しい識別と適切な操作は、スタック深度による Forth のデータ型強制の範 囲を超えています。文字は、意味のあるデータで、1 つのスタックエントリの幅全体を占めるとは限りません。符号付き文字と符号なし文字の区別は、Forth の正式な仕様にはまったくありませんが、実際の傾向として、数学的な演算を行う場合には、文字を短い正の整数として扱います。

##### a) Standard Character Set

<itemize>

1) The storage unit for the character data type (C@, C!, FILL, etc.) must be able to contain unsigned numbers from 0 through 255.

2) An implementation is not required to restrict character storage to that range, but a Standard Program without environmental dependencies cannot assume the ability to store numbers outside that range in a  "char" location.

3) The allowed number representations are two’s-complement, one’s-complement, and signed-magnitude.  Note that all of these number systems agree on the representation of positive numbers.

4) Since a "char" can store small positive numbers and since the character data type is a sub-range of the unsigned integer data type, `C!` must store the n least-significant bits of a cell (8 &le; n &lt;= bits/cell).  Given  the enumeration of allowed number representations and their known encodings, "`TRUE xx C! xx C@`"  must leave a stack item with some number of bits set, which will thus will be accepted as non-zero by IF.

1) 文字データ型（C@、C！、FILLなど）の記憶単位は、0から255までの符号なし数値を格納できなければならない。

2) 実装は、文字格納をその範囲に制限する必要はないが、環境依存のない標準プログラムは、"char "位置にその範囲外の数値を格納する能力を仮定することはできない。

3) 許容される数値表現は、2の補数、1の補数、符号付きマグニチュードである。 これらの数システムはすべて正の数の表現に同意していることに注意。

4) "char" は小さな正の数を格納でき、文字データ型は符号なし整数データ型の下位範囲なので、`C!`はセルの最下位ビットn個を格納しなければならない（8 ≤ n <=ビット/セル）。 許容される数値表現とその既知のエンコーディングの列挙を考えると、「`TRUE xx C! xx C@`」は、ある数のビットがセットされたスタック項目を残さなければならない。

5) For the purposes of input (KEY, ACCEPT, etc.) and output (EMIT, TYPE, etc.), the encoding between numbers and human-readable symbols is ISO646/IRV (ASCII) within the range from 32 to 126 (space to ~).  EBCDIC is out (most "EBCDIC" computer systems support ASCII too). Outside that range, it is up to the  implementation. The obvious implementation choice is to use ASCII control characters for the range from 0  to 31, at least for the "displayable" characters in that range (TAB, RETURN, LINEFEED, FORMFEED).  However, this is not as clear-cut as it may seem, because of the variation between operating systems on the  treatment of those characters. For example, some systems TAB to 4 character boundaries, others to 8  character boundaries, and others to preset tab stops. Some systems perform an automatic linefeed after a  carriage return, others perform an automatic carriage return after a linefeed, and others do neither.

5) 入力(KEY、ACCEPTなど)と出力(EMIT、TYPEなど)のために、数字と人間が読める記号の間のエンコーディングは、32から126(スペースから~)までの範囲内のISO646/IRV(ASCII)である。 EBCDICはアウトです（ほとんどの "EBCDIC "コンピュータシステムはASCIIもサポートしています）。その範囲外では、実装次第です。明らかな実装上の選択肢は、0から31の範囲で、少なくともその範囲の「表示可能な」文字（TAB、RETURN、LINEFEED、FORMFEED）についてはASCII制御文字を使用することです。 しかし、これらの文字の扱いはオペレーティング・システムによって異なるため、これは見た目ほど明確ではありません。例えば、あるシステムでは4文字の境界でTABし、あるシステムでは8文字の境界でTABし、あるシステムではあらかじめ設定されたタブストップでTABする。また、改行後に自動改行を行うシステムもあれば、改行後に自動改行を行うシステムもあれば、どちらも行わないシステムもある。

The codes from 128 to 255 may eventually be standardized, either formally or informally, for use as  international characters, such as the letters with diacritical marks found in many European languages. One  such encoding is the 8-bit ISO Latin-1 character set. The computer marketplace at large will eventually  decide which encoding set of those characters prevails. For Forth implementations running under an  operating system (the majority of those running on standard platforms these days), most Forth implementors  will probably choose to do whatever the system does, without performing any remapping within the domain  of the Forth system itself.

128から255までのコードは、多くのヨーロッパ言語に見られるダイアクリティカルマーク付きの文字のような国際的な文字として使用するために、公式または非公式に標準化されるかもしれません。そのようなエンコーディングの一つが8ビットのISO Latin-1文字セットである。これらの文字のどのエンコーディング・セットが優先されるかは、最終的にはコンピュータ市場全体で決定されることになります。オペレーティング・システム上で動作するForthの実装（最近の標準的なプラットフォーム上で動作する実装の大部分）では、おそらくほとんどのForth実装者は、システムで使用されているものであれば何でも選択するでしょう。

6) A Standard Program can depend on the ability to receive any character in the range 32 ... 126 through `KEY`, and similarly to display the same set of characters with `EMIT`. If a program must be able to receive or  display any particular character outside that range, it can declare an environmental dependency on the  ability to receive or display that character.

6) 標準プログラムは、`KEY`を通して32 ... 126の範囲内の任意の文字を受信する能力に依存することができる。126 の文字を `KEY` で受信し、同様に `EMIT` で表示することができます。プログラムがその範囲外の特定の文字を受信または表示できなければならない場合は、その文字を受信または表示する能力に対する環境依存を宣言することができます。

7) A Standard Program cannot use control characters in definition names. However, a Standard System is not required to enforce this prohibition. Thus, existing systems that currently allow control characters in  words names from `BLOCK` source may continue to allow them, and programs running on those systems will  continue to work. In text file source, the parsing action with space as a delimiter (e.g., `BL` `WORD`) treats  control characters the same as spaces. This effectively implies that you cannot use control characters in  definition names from text-file source, since the text interpreter will treat the control characters as  delimiters. Note that this "control-character folding" applies only when space is the delimiter, thus the  phrase "`CHAR ) WORD`" may collect a string containing control characters.

7) 標準プログラムでは、定義名に制御文字を使用することはできない。しかし、標準システムはこの禁止を強制する必要はない。したがって、現在`BLOCK`ソースからの単語名に制御文字を許可している既存のシステムは、引き続きそれを許可することができ、それらのシステム上で実行されるプログラムは引き続き動作する。テキストファイルのソースでは、スペースを区切り文字とする解析動作（例えば、 `BL` `WORD`）は制御文字をスペースと同じように扱います。このため、テキストファイルソースからの定義名では制御文字を使用できないことになります。テキストインタプリタは制御文字を区切り文字として扱うからです。この「制御文字の折りたたみ」はスペースが区切り文字である場合にのみ適用されることに注意してください。

</itemize>

##### b) Storage and retrieval 

Characters are transferred from the data stack to memory by `C!` and from memory to the data stack by `C@`.  A number of lower-significance bits equivalent to the implementation-dependent width of a character are  transferred from a popped data stack entry to an address by the action of `C!` without affecting any bits  which may comprise the higher-significance portion of the cell at the destination address; however, the  action of `C@` clears all higher-significance bits of the data stack entry which it pushes that are beyond the  implementation-dependent width of a character (which may include implementation-defined display  information in the higher-significance bits). The programmer should keep in mind that operating upon  arbitrary stack entries with words intended for the character data type may result in truncation of such data.

文字は `C!` によってデータスタックからメモリに転送され、`C@` によってメモリからデータスタックに転送される。 しかし、`C@`の動作は、それがプッシュしたデータスタックエントリーの、キャラクタの実装依存の幅を超えるすべての上位のビットをクリアします（上位のビットに実装で定義された表示情報が含まれる場合があります）。プログラマは、キャラクタ・データ・タイプを意図したワードで任意のスタック・エントリを操作すると、そのようなデータが切り捨てられる可能性があることに留意すべきである。

##### c) Manipulation on the stack 

In addition to C@ and C!, characters are moved to, from and upon the data stack by the following words:  

C@とC! に加えて、文字は以下の単語によってデータ・スタックへ、またはデータ・スタックから、あるいはデータ・スタック上に移動される：

    >R ?DUP DROP DUP OVER PICK R> R@ ROLL ROT SWAP 

##### d) Additional operations  

    + - * / /MOD MOD 

The following mathematical operators are valid for character data:  The following comparison and bitwise operators may be valid for characters, keeping in mind that display  information cached in the most significant bits of characters in an implementation-defined fashion may have  to be masked or otherwise dealt with:  

以下の数学演算子は文字データに対して有効である：  以下の比較演算子およびビット演算子は文字に対して有効であるが、実装で定義された方法で文字の最上位ビットにキャッシュされた表示情報をマスクするか、その他の方法で処理しなければならない場合があることに留意されたい：

    AND OR > < U> U< = <> 0= 0<> MAX MIN  LSHIFT RSHIFT  

#### A.3.1.3 Single-cell types 

A single-cell stack entry viewed without regard to typing is the fundamental data type of Forth. All other  data types are actually represented by one or more single-cell stack entries.

型付けを無視して見たシングルセル・スタック・エントリーは、Forth の基本的なデータ型です。他のすべてのデータ型は、実際には1つ以上のシングルセル・スタック・エントリで表されます。

##### a) Storage and retrieval 

Single-cell data are transferred from the stack to memory by !; from memory to the stack by @. All bits are  transferred in both directions and no type checking of any sort is performed, nor does the Standard System  check that a memory address used by ! or @ is properly aligned or properly sized to hold the datum thus  transferred.

によってスタックからメモリへ、@によってメモリからスタックへ転送される。すべてのビットは双方向に転送され、型チェックは一切行われない。

##### b) Manipulation on the stack  

Here is a selection of the most important words which move single-cell data to, from and upon the data  stack:  

ここでは、シングルセルのデータをデータ・スタックへ、またはデータ・スタックから、あるいはデータ・スタック上に移動させる最も重要な単語を紹介する：

    ! @ >R ?DUP DROP DUP OVER PICK R> R@ ROLL ROT SWAP 

##### c) Comparison operators

The following comparison operators are universally valid for one or more single cells:  

    = <> 0= 0<> 

##### A.3.1.3.1 Flags 

A `FALSE` flag is a single-cell datum with all bits unset, and a `TRUE` flag is a single-cell datum with all bits  set. While Forth words which test flags accept any non-null bit pattern as true, there exists the concept of the  well-formed flag. If an operation whose result is to be used as a flag may produce any bit-mask other than  `TRUE` or `FALSE`, the recommended discipline is to convert the result to a well-formed flag by means of the  Forth word `0<>` so that the result of any subsequent logical operations on the flag will be predictable.

In addition to the words which move, fetch and store single-cell items, the following words are valid for  operations on one or more flag data residing on the data stack:  

`FALSE`フラグはすべてのビットがセットされていない単一セルのデータであり、`TRUE`フラグはすべてのビットがセットされている単一セルのデータである。フラグをテストするForthワードは、NULL以外のビットパターンを真として受け入れますが、整形式フラグという概念もあります。フラグとして使用される演算結果が `TRUE` または `FALSE` 以外のビットマスクを生成する可能性がある場合、推奨される規律は、フラグに対する後続の論理演算の結果が予測できるように、`0<>` という Forth ワードを使用して結果を整形済みフラグに変換することです。

単一セルの項目を移動、フェッチ、格納する単語に加えて、以下の単語はデータスタックに存在する1つ以上のフラグデータに対する操作に有効です：

    AND OR XOR INVERT  

##### A.3.1.3.2 Integers 

A single-cell datum may be treated by a Standard Program as a signed integer. Moving and storing such  data is performed as for any single-cell data. In addition to the universally-applicable operators for single-cell data specified above, the following mathematical and comparison operators are valid for single-cell  signed integers:  

シングルセルのデータは、標準プログラムでは符号付き整数として扱われる。このようなデータの移動と保存は、他のシングルセルデータと同様に実行される。上記のシングルセルデータに普遍的に適用可能な演算子に加えて、以下の数学演算子および比較演算子がシングルセルの符号付き整数に対して有効である：

    * */ */MOD /MOD MOD + +! - / 1+ 1- ABS MAX MIN NEGATE 
    0< 0> < > 

Given the same number of bits, unsigned integers usually represent twice the number of absolute values  representable by signed integers.

A single-cell datum may be treated by a Standard Program as an unsigned integer. Moving and storing such  data is performed as for any single-cell data. In addition, the following mathematical and comparison  operators are valid for single-cell unsigned integers:  

同じビット数であれば、符号なし整数は通常、符号付き整数で表現可能な絶対値の数の2倍を表現する。

標準プログラムではシングルセルのデータを符号なし整数として扱うことができる。このようなデータの移動と保存は他のシングルセルデータと同様に実行される。さらに、以下の数学演算子や比較演算子はシングルセルの符号なし整数に対して有効である：

    UM* UM/MOD + +! - 1+ 1- * U< U>  

##### A.3.1.3.3 Addresses 

An address is uniquely represented as a single cell unsigned number and can be treated as such when being  moved to, from, or upon the stack. Conversely, each unsigned number represents a unique address (which  is not necessarily an address of accessible memory). This one-to-one relationship between addresses and  unsigned numbers forces an equivalence between address arithmetic and the corresponding operations on  unsigned numbers.

Several operators are provided specifically for address arithmetic:  

アドレスはシングルセルの符号なし数値として一意に表現され、スタックへの移動、スタックからの移動、スタック上への移動の際にそのように扱うことができる。逆に、各符号なし数は一意なアドレス（必ずしもアクセス可能なメモリーのアドレスではない）を表す。アドレスと符号なし数値の間のこの1対1の関係は、アドレス演算と符号なし数値の対応する演算の間に等価性を強制する。

アドレス演算用にいくつかの演算子が用意されている：

    CHAR+ CHARS CELL+ CELLS  

and, if the floating-point word set is present:  

    FLOAT+ FLOATS SFLOAT+ SFLOATS DFLOAT+ DFLOATS  

A Standard Program may never assume a particular correspondence between a Forth address and the  physical address to which it is mapped.

標準プログラムでは、Forthアドレスとそれがマッピングされる物理アドレスの間に特定の対応を想定することはできません。

##### A.3.1.3.4 Counted strings 

The trend in ANS Forth is to move toward the consistent use of the "c-addr u" representation of strings on  the stack. The use of the alternate "address of counted string" stack representation is discouraged. The  traditional Forth words `WORD` and `FIND` continue to use the "address of counted string" representation for  historical reasons. The new word `C"` , added as a porting aid for existing programs, also uses the counted  string representation.

Counted strings remain useful as a way to store strings in memory. This use is not discouraged, but when  references to such strings appear on the stack, it is preferable to use the "*c-addr u*" representation.

ANS Forth のトレンドは、スタック上の文字列の「c-addr u」表現を一貫して使用することです。代替の「カウントされた文字列のアドレス」スタック表現の使用は推奨されません。伝統的なForthの単語である `WORD` と `FIND` は、歴史的な理由から引き続き「カウントされた文字列のアドレス」表現を使用しています。既存のプログラムの移植の補助として追加された新しい単語 `C"` も、カウントされた文字列表現を使用します。

カウント文字列は、文字列をメモリに格納する方法として有用であることに変わりはない。この使用は推奨されないが、このような文字列への参照がスタック上に現れる場合は、 "*c-addr u*"表現を使用することが望ましい。

##### A.3.1.3.5 Execution tokens 

The association between an execution token and a definition is static. Once made, it does not change with  changes in the search order or anything else. However it may not be unique, e.g., the phrases  

実行トークンと定義の関連は静的である。一度作成されれば、検索順序の変更などによって変わることはない。しかし、それは一意ではないかもしれない。

    `' 1+` and 
    `' CHAR+` 

might return the same value.

#### A.3.1.4 Cell-pair types 

##### a) Storage and retrieval

Two operators are provided to fetch and store cell pairs:  

    2@ 2!

##### b) Manipulation on the stack  

Additionally, these operators may be used to move cell pairs from, to and upon the stack:  

    2>R 2DROP 2DUP 2OVER 2R> 2SWAP 2ROT 

##### c) Comparison  

The following comparison operations are universally valid for cell pairs:  

    D= D0=  

##### A.3.1.4.1 Double-Cell Integers 

If a double-cell integer is to be treated as signed, the following comparison and mathematical operations are  valid:  

    D+ D- D< D0< DABS DMAX DMIN DNEGATE M*/ M+  

If a double-cell integer is to be treated as unsigned, the following comparison and mathematical operations  are valid:  

    D+ D- UM/MOD DU<  

##### A.3.1.4.2 Character strings 

See: **A.3.1.3.4 Counted Strings**.

### A.3.2 The Implementation environment 

#### A.3.2.1 Numbers 

Traditionally, Forth has been implemented on two’s-complement machines where there is a one-to-one  mapping of signed numbers to unsigned numbers - any single cell item can be viewed either as a signed or  unsigned number. Indeed, the signed representation of any positive number is identical to the equivalent  unsigned representation. Further, addresses are treated as unsigned numbers: there is no distinct pointer  type. Arithmetic ordering on two’s complement machines allows + and - to work on both signed and  unsigned numbers. This arithmetic behavior is deeply embedded in common Forth practice. As a  consequence of these behaviors, the likely ranges of signed and unsigned numbers for implementations  hosted on each of the permissible arithmetic architectures is:  

伝統的に、Forthは符号付き数値と符号なし数値が一対一に対応する2相補マシンで実装されてきました。実際、任意の正の数の符号付き表現は、等価な符号なし表現と同一である。さらに、アドレスは符号なし数として扱われる。2の補数マシンの算術順序では、+と-は符号付きと符号なしの両方の数で動作する。この算術演算の動作は、一般的なForthの慣習に深く組み込まれています。これらの動作の結果として、許容される各演算アーキテクチャ上でホストされる実装の符号付き数と符号なし数の範囲は次のようになります：

<table>

 |Arithmetic architecture|signed numbers|unsigned numbers  
 |--|--|--|
 |Two’s complement|-n-1 to n|0 to 2n+1  
 |One’s complement|-n to n|0 to n
 |Signed magnitude|-n to n|0 to n|
 
</table>

where *n* is the largest positive signed number. For all three architectures, signed numbers in the 0 to n range  are bitwise identical to the corresponding unsigned number. Note that unsigned numbers on a signed  magnitude machine are equivalent to signed non-negative numbers as a consequence of the forced  correspondence between addresses and unsigned numbers and of the required behavior of `+` and `-`.

For reference, these number representations may be defined by the way that `NEGATE` is implemented:  

ここで *n* は最大の正の符号付き数値である。3つのアーキテクチャすべてにおいて、0からnの範囲の符号付き数値は、対応する符号なし数値とビット単位で同一である。アドレスと符号なし数値の間の強制的な対応、および `+` と `-` の必要な動作の結果として、符号付きマグニチュード・マシン上の符号なし数値は、符号付き非負数値と等価であることに注意してください。

参考までに、これらの数値表現は `NEGATE` の実装方法によって定義することができる：

    two’s complement: : `NEGATE INVERT 1+ ;` 
    one’s complement: : `NEGATE INVERT ;` 
    signed-magnitude: : `NEGATE HIGH-BIT XOR ;` 

where `HIGH-BIT` is a bit mask with only the most-significant bit set. Note that all of these number systems  agree on the representation of non-negative numbers.

ここで`HIGH-BIT`は最上位ビットのみをセットしたビットマスクである。これらの数システムはすべて、非負数の表現に同意していることに注意してください。

Per **3.2.1.1  Internal number representation** and **6.1.0270  0=**, the implementor must ensure that no  standard or supported word return negative zero for any numeric (non-Boolean or flag) result. Many  existing programmer assumptions will be violated otherwise.

**3.2.1.1内部的な数値表現**と**6.1.0270 0=**により、実装者は、どのような数値（非ブール値またはフラグ）結果に対しても、標準またはサポートされているワードが負の0を返さないようにしなければなりません。そうでなければ、多くの既存のプログラマの仮定が破られることになる。

There is no requirement to implement circular unsigned arithmetic, nor to set the range of unsigned numbers  to the full size of a cell. There is historical precedent for limiting the range of u to that of +n, which is  permissible when the cell size is greater than 16 bits.

符号なし循環演算を実装する必要も、符号なし数値の範囲をセルの全サイズに設定する必要もない。u の範囲を +n の範囲に制限する歴史的な前例があり、これはセル・サイズが 16 ビットより大きい場合に許容される。

##### A.3.2.1.2 Digit conversion 

For example, an implementation might convert the characters "a" through "z" identically to the characters "A" through "Z", or it might treat the characters " [ " through "~" as additional digits with decimal values 36 through 71, respectively.

例えば、実装は文字 "a "から "z "までを文字 "A "から "Z "までと同じように変換するかもしれないし、文字" [ "から"~"までをそれぞれ10進数値36から71の追加桁として扱うかもしれない。

#### A.3.2.2 Arithmetic 

##### A.3.2.2.1 Integer division 

The Forth-79 Standard specifies that the signed division operators (`/`, `/MOD`, `MOD`, `*/MOD`, and `*/`) round  non-integer quotients towards zero (symmetric division). Forth 83 changed the semantics of these operators  to round towards negative infinity (floored division). Some in the Forth community have declined to  convert systems and applications from the Forth-79 to the Forth-83 divide. To resolve this issue, an ANS  Forth system is permitted to supply either floored or symmetric operators. In addition, ANS Forth systems  must provide a floored division primitive (`FM/MOD`), a symmetric division primitive (`SM/REM`), and a  mixed precision multiplication operator (`M*`).

Forth-79 Standardでは、符号付き除算演算子（`/`、`/MOD`、`MOD`、`*/MOD`、`*/`）は、非整数の商をゼロに向けて丸める（対称除算）ことが規定されています。Forth 83では、これらの演算子のセマンティクスが変更され、負の無限大に向かって丸められるようになりました（フロアード除算）。Forthコミュニティの中には、システムやアプリケーションをForth-79からForth-83除算に変換することを拒否する人もいます。この問題を解決するために、ANS Forthシステムは、フロアード演算子または対称演算子のいずれかを供給することが許可されています。さらに、ANS Forthシステムは、フロア型除算プリミティブ（`FM/MOD`）、対称除算プリミティブ（`SM/REM`）、および混合精度乗算演算子（`M*`）を提供しなければなりません。

This compromise protects the investment made in current Forth applications; Forth-79 and Forth-83  programs are automatically compliant with ANS Forth with respect to division. In practice, the rounding  direction rarely matters to applications. However, if a program requires a specific rounding direction, it can  use the floored division primitive `FM/MOD` or the symmetric division primitive `SM/REM` to construct a  division operator of the desired flavor. This simple technique can be used to convert Forth-79 and Forth-83  programs to ANS Forth without any analysis of the original programs.

Forth-79とForth-83のプログラムは、除算に関して自動的にANS Forthに準拠します。実際には、丸め方向がアプリケーションに関係することはほとんどありません。しかし、プログラムが特定の丸め方向を必要とする場合、浮動除算プリミティブ `FM/MOD` または対称除算プリミティブ `SM/REM` を使用して、希望するフレーバーの除算演算子を作成することができます。この簡単なテクニックを使えば、元のプログラムを解析することなく、Forth-79やForth-83のプログラムをANS Forthに変換することができます。

##### A.3.2.2.2 Other integer operations 

Whether underflow occurs depends on the data-type of the result. For example, the phrase `1 2 -` underflows if the result is unsigned and produces the valid signed result -1.

アンダーフローが発生するかどうかは、結果のデータ型に依存する。例えば、`1 2 -` というフレーズは、結果が符号なしであればアンダーフローし、有効な符号付き結果 -1 を生成します。

#### A.3.2.3 Stacks 

The only data type in Forth which has concrete rather than abstract existence is the stack entry. Even this  primitive typing Forth only enforces by the hard reality of stack underflow or overflow. The programmer  must have a clear idea of the number of stack entries to be consumed by the execution of a word and the  number of entries that will be pushed back to a stack by the execution of a word. The observation of  anomalous occurrences on the data stack is the first line of defense whereby the programmer may recognize  errors in an application program. It is also worth remembering that multiple stack errors caused by  erroneous application code are frequently of equal and opposite magnitude, causing complementary (and  deceptive) results.

Forth において、抽象的ではなく具象的なデータ型はスタック・エントリだけです。この原始的な型付けでさえ、Forth はスタックのアンダ ーフローやオーバーフローという厳しい現実によってのみ強制します。プログラマは、ワードの実行によって消費されるスタック・エントリーの数と、ワードの実行によってスタックにプッシュ・バックされるエントリーの数について、明確な考えを持っていなければなりません。データ・スタック上の異常発生を観察することは、プログラマがアプリケーション・プログラムの エラーを認識するための最初の防衛線である。また、誤ったアプリケーション・コードによって引き起こされる複数のスタック・エラーは、しばしば等し く反対の大きさであり、相補的な（そして欺瞞的な）結果を引き起こすことを覚えておく価値がある。

For these reasons and a host of other reasons, the one unambiguous, uncontroversial, and indispensable  programming discipline observed since the earliest days of Forth is that of providing a stack diagram for all  additions to the application dictionary with the exception of static constructs such as `VARIABLE`s and  `CONSTANT`s.

これらの理由と他の多くの理由から、Forthの初期から観察されている、明確で議論の余地のない、不可欠なプログラミングの規律は、`VARIABLE`や`CONSTANT`のような静的な構成要素を除いて、アプリケーション辞書へのすべての追加にスタックダイアグラムを提供することです。

##### A.3.2.3.2 Control-flow stack 

The simplest use of control-flow words is to implement the basic control structures shown in figure A.1.

コントロール・フロー・ワードの最も単純な使い方は、図A.1に示す基本的な制御構造を実装することである。

<figure>
<img width=400 src="img/fig-A1-the-basic-control-flow-patterns.png">
</figure>

In control flow every branch, or transfer of control, must terminate at some destination. A natural  implementation uses a stack to remember the origin of forward branches and the destination of backward  branches. At a minimum, only the location of each origin or destination must be indicated, although other  implementation-dependent information also may be maintained.

An origin is the location of the branch itself. A destination is where control would continue if the branch  were taken. A destination is needed to resolve the branch address for each origin, and conversely, if every  control-flow path is completed no unused destinations can remain.

With the addition of just three words (`AHEAD`, `CS-ROLL` and `CS-PICK`), the basic control-flow words  supply the primitives necessary to compile a variety of transportable control structures. The abilities  required are compilation of forward and backward conditional and unconditional branches and compile-time  management of branch origins and destinations. Table A.1 shows the desired behavior.

The requirement that control-flow words are properly balanced by other control-flow words makes  reasonable the description of a compile-time implementation-defined control-flow stack. There is no  prescription as to how the control-flow stack is implemented, e.g., data stack, linked list, special array.  Each element of the control-flow stack mentioned above is the same size.

制御フローでは、すべての分岐、つまり制御の転送は、どこかの目的地で終了しなければならない。自然な実装では、スタックを使って前方分岐の始点と後方分岐の終点を記憶する。最低限、それぞれの始点または終点の位置だけは示さなければならないが、実装に依存する他の情報を保持することもできる。

原点とは、分岐の場所そのものである。目的地とは、分岐が行われた場合に制御が継続される場所である。デスティネーションは、各起点の分岐アドレスを解決するために必要であり、逆に、すべての制御フロー経路が完了すれば、未使用のデスティネーションは残らない。

たった3つの単語（`AHEAD`、`CS-ROLL`、`CS-PICK`）を追加するだけで、基本的なコントロールフロー単語は、さまざまなトランスポート可能な制御構造をコンパイルするのに必要なプリミティブを提供する。必要な能力は、前方および後方の条件分岐と無条件分岐のコンパイルと、分岐の始点と終点のコンパイル時管理である。表A.1に望ましい動作を示す。

制御フロー・ワードが他の制御フロー・ワードによって適切にバランスされるという要件は、コンパイル時実装定義の制御フロー・スタックの記述を妥当なものにしている。データスタック、リンクリスト、特殊配列など、制御フロースタックがどのように実装されるかについての規定はない。 上記のコントロール・フロー・スタックの各要素は同じサイズである。

<table>

Table A.1 - Compilation behavior of control-flow words  

 |at compile time,<br>word:|supplies:|resolves:|is used to:|
 |--|:--:|:--:|--|
 |`IF`|orig|| mark origin of forward conditional branch  
 |`THEN`||orig|resolve IF or AHEAD 
 |`BEGIN`|dest|| mark backward destination  
 |`AGAIN`|| dest|resolve with backward unconditional branch  
 |`UNTIL`|| dest|resolve with backward conditional branch  
 |`AHEAD`|orig||mark origin of forward unconditional branch  
 |`CS-PICK`||| copy item on control-flow stack  
 |`CS-ROLL`|||reorder items on control-flow stack
 
</table>

With these tools, the remaining basic control-structure elements, shown in figure A.2, can be defined. The  stack notation used here for immediate words is ( compilation / execution ).

これらのツールを使って、図A.2に示す残りの基本的な制御構造要素を定義することができる。ここで使用される即時ワードのスタック表記は、( compilation / execution )である。

    : WHILE ( dest -- orig dest / flag -- ) 
        \ conditional exit from loops 
        POSTPONE IF \ conditional forward branch 
        1 CS-ROLL \ keep dest on top 
    ; IMMEDIATE 
    : REPEAT ( orig dest -- / -- ) 
        \ resolve a single WHILE and return to BEGIN 
        POSTPONE AGAIN \ uncond. backward branch to dest 
        POSTPONE THEN \ resolve forward branch from orig 
    ; IMMEDIATE 
    : ELSE ( orig1 -- orig2 / -- ) 
        \ resolve IF supplying alternate execution 
        POSTPONE AHEAD \ unconditional forward branch orig2 
        1 CS-ROLL \ put orig1 back on top 
        POSTPONE THEN \ resolve forward branch from orig1 
    ; IMMEDIATE 

<figure>
<img width=250 src="img/fig-A2-additional-control-flow-pattern.png">
<figcaption>Figure A.2 - Additional basic control-flow patterns.</figcaption>
</figure>

Forth control flow provides a solution for well-known problems with strictly structured programming.

The basic control structures can be supplemented, as shown in the examples in figure A.3, with additional  `WHILE`s in `BEGIN` ... `UNTIL` and `BEGIN` ... `WHILE` ... `REPEAT` structures. However, for  each additional `WHILE` there must be a `THEN` at the end of the structure. `THEN` completes the syntax with  `WHILE` and indicates where to continue execution when the `WHILE` transfers control. The use of more than  one additional `WHILE` is possible but not common. Note that if the user finds this use of THEN undesirable,  an alias with a more likable name could be defined.

Additional actions may be performed between the control flow word (the `REPEAT` or `UNTIL`) and the  `THEN` that matches the additional `WHILE`. Further, if additional actions are desired for normal termination  and early termination, the alternative actions may be separated by the ordinary Forth `ELSE`. The  termination actions are all specified after the body of the loop.

Forthの制御フローは、厳密に構造化されたプログラミングでよく知られている問題に対する解決策を提供する。

基本的な制御構造は、図A.3の例のように、 `BEGIN` ... や `UNTIL` ... の `WHILE` を追加することで補うことができる。UNTIL`や`BEGIN` .... WHILE` ... REPEAT`構造になっている。ただし、それぞれの `WHILE` の最後には `THEN` が必要である。THEN`は `WHILE` との構文を完成させ、`WHILE` が制御を移したときにどこで実行を続行するかを示す。つ以上の `WHILE` を使用することは可能ですが、一般的ではありません。もしユーザーがこのTHENの使い方を好ましくないと思うのであれば、もっと好感の持てる名前のエイリアスを定義することができることに注意してほしい。

制御フローワード（`REPEAT`や`UNTIL`）と追加の`WHILE`にマッチする`THEN`の間に、追加のアクションを実行することができる。さらに、通常の終了と早期終了のために追加のアクションが必要な場合は、通常の Forth の `ELSE` で区切ることができます。終了アクションはすべてループ本体の後に指定する。

<figure>
<img width=250 src="img/fig-A3-extended-control-flow-pattern-examples.png" >
<figcaption>Figure A.3 - Extended control-flow pattern examples.</figcaption>
</figure>

Note that `REPEAT` creates an anomaly when matching the `WHILE` with `ELSE` or `THEN`, most notable when  compared with the `BEGIN`...`UNTIL` case. That is, there will be one less `ELSE` or `THEN` than there are  WHILEs because `REPEAT` resolves one `THEN`. As above, if the user finds this count mismatch undesirable,  `REPEAT` could be replaced in-line by its own definition.

Other loop-exit control-flow words, and even other loops, can be defined. The only requirements are that  the control-flow stack is properly maintained and manipulated.

The simple implementation of the ANS Forth `CASE` structure below is an example of control structure  extension. Note the maintenance of the data stack to prevent interference with the possible control-flow  stack usage.

`REPEAT`は `WHILE` と `ELSE` または `THEN` をマッチさせるときに異常が発生することに注意してください。つまり、`REPEAT`が1つの`THEN`を解決するため、WHILEの数より1つ少ない`ELSE`または`THEN`が存在することになる。上記のように、もしユーザーがこのカウントの不一致を望ましくないと思うのであれば、 `REPEAT` をインラインで独自の定義に置き換えることができる。

他のループ終了制御フロー語や、他のループを定義することもできる。唯一の要件は、制御フロースタックが適切に維持され、操作されることである。

以下のANS Forth `CASE`構造の簡単な実装は、制御構造拡張の例である。可能な制御フロースタックの使用と干渉しないように、データスタックのメンテナンスに注意してください。

    0 CONSTANT CASE IMMEDIATE ( init count of OFs ) 

    : OF    ( #of -- orig #of+1 / x -- ) 
         1+     ( count OFs ) 
         >R     ( move off the stack in case the control-flow ) 
                ( stack is the data stack. ) 
        POSTPONE OVER  POSTPONE =   ( copy and test case value) 
        POSTPONE IF                 ( add orig to control flow stack ) 
        POSTPONE DROP               ( discards case value if = ) 
        R>                          ( we can bring count back now ) 
    ; IMMEDIATE 

    : ENDOF ( orig1 #of -- orig2 #of ) 
        >R  ( move off the stack in case the control-flow ) 
            ( stack is the data stack. ) 
        POSTPONE ELSE 
        R>  ( we can bring count back now ) 
    ; IMMEDIATE 

    : ENDCASE ( orig1..orign #of -- ) 
        POSTPONE DROP ( discard case value ) 
        0 ?DO 
            POSTPONE THEN 
        LOOP 
    ; IMMEDIATE 

##### A.3.2.3.3 Return stack 

The restrictions in section **3.2.3.3  Return stack** are necessary if implementations are to be allowed to place  loop parameters on the return stack.

3.2.3.3リターンスタック**節の制限は、実装がループパラメータをリターンスタックに置くことを許可する場合に必要である。

#### A.3.2.6 Environmental queries 

The size in address units of various data types may be determined by phrases such as 1 CHARS. Similarly,  alignment may be determined by phrases such as 1 ALIGNED.

様々なデータ型のアドレス単位でのサイズは、1 CHARSのようなフレーズで決定される。同様に、アライメントも 1 ALIGNED のようなフレーズで決定される。

The environmental queries are divided into two groups: those that always produce the same value and those  that might not. The former groups include entries such as MAX-N. This information is fixed by the  hardware or by the design of the Forth system; a user is guaranteed that asking the question once is  sufficient.

環境クエリは2つのグループに分けられる。前者のグループには、MAX-Nのようなエントリーが含まれる。この情報は、ハードウェアまたはForthシステムの設計によって固定されており、ユーザーは一度質問すれば十分であることが保証されています。

The other group of queries are for things that may legitimately change over time. For example an  application might test for the presence of the Double Number word set using an environment query. If it is  missing, the system could invoke a system-dependent process to load the word set. The system is permitted  to change `ENVIRONMENT?`'s database so that subsequent queries about it indicate that it is present.

もう1つのグループは、時間の経過とともに正当に変化する可能性のあるものに対する問い合わせです。例えば、アプリケーションは環境クエリを使ってダブルナンバーの単語セットの有無をテストするかもしれません。もしそれがなければ、システムは単語セットをロードするためにシス テム依存のプロセスを呼び出すかもしれない。システムは `ENVIRONMENT?

Note that a query that returns an "unknown" response could produce a "known" result on a subsequent  query.

"unknown "の応答を返す問い合わせは、その後の問い合わせで "known "の結果を返す可能性があることに注意すること。

### A.3.3 The Forth dictionary 

A Standard Program may redefine a standard word with a non-standard definition. The program is still  Standard (since it can be built on any Standard System), but the effect is to make the combined entity  (Standard System plus Standard Program) a non-standard system.

標準プログラム(Standard Program)は、標準語を非標準の定義で再定義することができる。プログラムは依然として標準であるが(どの標準システム上でも構築できるので)、 その効果は、結合された実体(標準システム＋標準プログラム)を非標準システムにすることである。

#### A.3.3.1 Name space 

##### A.3.3.1.2 Definition names 

The language in this section is there to ensure the portability of Standard Programs. If a program uses  something outside the Standard that it does not provide itself, there is no guarantee that another  implementation will have what the program needs to run. There is no intent whatsoever to imply that all  Forth programs will be somehow lacking or inferior because they are not standard; some of the finest jewels  of the programmer’s art will be non-standard. At the same time, the committee is trying to ensure that a  program labeled "Standard" will meet certain expectations, particularly with regard to portability.

このセクションの文言は、標準プログラムの移植性を保証するためにあります。あるプログラムが、それ自身が提供しない標準規格外のものを使用する場合、他の実装が そのプログラムの実行に必要なものを持っているという保証はありません。プログラマーの芸術の最も素晴らしい宝石のいくつかは、非標準のものでしょう。同時に委員会は、"Standard "とラベル付けされたプログラムが、特に移植性に関して一定の期待に応えることを保証しようとしている。

In many system environments the input source is unable to supply certain non-graphic characters due to  external factors, such as the use of those characters for flow control or editing. In addition, when  interpreting from a text file, the parsing function specifically treats non-graphic characters like spaces; thus  words received by the text interpreter will not contain embedded non-graphic characters. To allow  implementations in such environments to call themselves Standard, this minor restriction on Standard  Programs is necessary.

多くのシステム環境では、入力ソースは、フロー制御や編集のためにそれらの文字を使用するなどの外部要因のために、特定の非グラフィック文字を供給することができません。さらに、テキストファイルから解釈する場合、構文解析機能は非図形文字を空白文字のように特別に扱います。従って、テキストインタプリタが受け取る単語には非図形文字が埋め込まれません。このような環境での実装がStandardを名乗ることを許可するために、Standard Programsに対するこの小さな制限が必要である。

A Standard System is allowed to permit the creation of definition names containing non-graphic characters.  Historically, such names were used for keyboard editing functions and "invisible" words.

Standard Systemは、非図形文字を含む定義名の作成を許可する。 歴史的に、このような名前はキーボード編集機能や "見えない "単語に使用されてきた。

#### A.3.3.2 Code space 


#### A.3.3.3 Data space 

The words `#TIB`, `>IN`, `BASE`, `BLK`, `SCR`, `SOURCE`, `SOURCE-ID`, `STATE`, and `TIB` contain information  used by the Forth system in its operation and may be of use to the application. Any assumption made by the  application about data available in the Forth system it did not store other than the data just listed is an  environmental dependency.

TIB`、`>IN`、`BASE`、`BLK`、`SCR`、`SOURCE`、`SOURCE-ID`、`STATE`、および `TIB` には、Forth システムの動作で使用される情報が含まれており、アプリケーショ ンが使用する可能性があります。アプリケーションは、Forthシステムで利用可能なデータについて、今挙げたデータ以外を保存していないと仮定することは、環境依存である。

There is no point in specifying (in the Standard) both what is and what is not addressable.

何がアドレス指定可能で何がアドレス指定不可能かを(規格で)指定することに意味はない。

A Standard Program may NOT address:  

標準プログラムは以下のアドレス指定をしてはならない。

- Directly into the data or return stacks; 
- Into a definition’s data field if not stored by the application.

- データスタックやリターンスタックへの直接のアドレス指定； 
- アプリケーションによって保存されていない場合は、定義のデータフィールドに。

The read-only restrictions arise because some Forth systems run from ROM and some share I/O buffers with  other users or systems. Portable programs cannot know which areas are affected, hence the general  restrictions.

一部の Forth システムは ROM から実行され、他のユーザーやシステムと I/O バッファを共有しているため、読み取り専用の制限が発生します。ポータブル・プログラムでは、どの領域が影響を受けるかを知ることはできません。

##### A.3.3.3.1 Address alignment 

Many processors have restrictions on the addresses that can be used by memory access instructions. For  example, on a Motorola 68000, 16-bit or 32-bit data can be accessed only at even addresses. Other  examples include RISC architectures where 16-bit data can be loaded or stored only at even addresses and  32-bit data only at addresses that are multiples of four.

多くのプロセッサでは、メモリ・アクセス命令で使用できるアドレスに制限があります。例えば、モトローラ 68000 では、16 ビットまたは 32 ビットのデータは偶数アドレスでのみアクセスできます。他の例として、RISCアーキテクチャでは16ビット・データは偶数アドレスでのみ、32ビット・データは4の倍数のアドレスでのみロードまたはストアできます。

An implementor of ANS Forth can handle these alignment restrictions in one of two ways. Forth’s memory  access words (@, !, +!, etc.) could be implemented in terms of smaller-width access instructions which  have no alignment restrictions. For example, on a 68000 Forth with 16-bit cells, @ could be implemented  with two 68000 byte-fetch instructions and a reassembly of the bytes into a 16-bit cell. Although this  conceals hardware restrictions from the programmer, it is inefficient, and may have unintended side effects  in some hardware environments. An alternate implementation of ANS Forth could define each memory access word using the native instructions that most closely match the word’s function. On a 68000 Forth  with 16-bit cells, @ would use the 68000’s 16-bit move instruction. In this case, responsibility for giving @ a  correctly-aligned address falls on the programmer. A portable ANS Forth program must assume that  alignment may be required and follow the requirements of this section.

ANS Forthの実装者は、このアラインメント制限を2つの方法のいずれかで処理できます。Forthのメモリアクセスワード（@、! 例えば、16ビットセルを持つ68000 Forthでは、@は2つの68000バイトフェッチ命令と16ビットセルへのバイトの再組み立てで実装できます。これは、ハードウェアの制約をプログラマから隠すことができますが、非効率的であり、ハードウェア環境によっては意図しない副作用が生じる可能性があります。ANS Forthの別の実装では、ワードの機能に最も近いネイティブ命令を使用して、各メモリアクセスワードを定義できます。16 ビットセルを持つ 68000 Forth では、@ は 68000 の 16 ビット移動命令を使用します。この場合、@に正しく整列されたアドレスを与える責任はプログラマにあります。移植可能な ANS Forth プログラムは、アライメントが必要な場合があることを想定し、本節の要件に従わなければなりません。

##### A.3.3.3.2 Contiguous regions 

The data space of a Forth system comes in discontinuous regions! The location of some regions is provided  by the system, some by the program. Data space is contiguous within regions, allowing address arithmetic  to generate valid addresses only within a single region. A Standard Program cannot make any assumptions  about the relative placement of multiple regions in memory.

Forth システムのデータ空間は、不連続な領域で構成されています！一部の領域はシステムによって提供され、一部の領域はプログラムによって提供されま す。データ空間は領域内で連続しているため、アドレス演算は1つの領域内でのみ有効なアドレスを生成することができます。標準プログラムでは、メモリ内の複数の領域の相対的な配置を仮定することはできません。

Section **3.3.3.2**  does prescribe conditions under which contiguous regions of data space may be obtained.

セクション**3.3.3.2**では、データ空間の連続した領域を取得できる条件を規定している。

For example:  

    CREATE TABLE 1 C, 2 C, ALIGN 1000 , 2000 ,  

makes a table whose address is returned by TABLE. In accessing this table,  

    TABLE C@                            will return 1  
    TABLE CHAR+ C@                      will return 2  
    TABLE 2 CHARS + ALIGNED @           will return 1000  
    TABLE 2 CHARS + ALIGNED CELL+ @     will return 2000.

Similarly,  

    CREATE DATA 1000 ALLOT  

makes an array 1000 address units in size. A more portable strategy would define the array in application  units, such as:      

は1000アドレス・ユニットの配列になる。より移植性の高い戦略としては、以下のようにアプリケーション単位で配列を定義する：

    500 CONSTANT NCELLS 
    CREATE CELL-DATA NCELLS CELLS ALLOT  

This array can be indexed like this:  

    : LOOK NCELLS 0 DO CELL-DATA I CELLS + ? LOOP ; 

##### A.3.3.3.6 Other transient regions 

In many existing Forth systems, these areas are at `HERE` or just beyond it, hence the many restrictions.

多くの既存のForthシステムでは、これらの領域は`HERE`にあるか、そのすぐ先にあり、それゆえに多くの制限がある。

(2**n*)+2 is the size of a character string containing the unpunctuated binary representation of the maximum double number with a leading minus sign and a trailing space.

*(2\*\*n)+2*は、先頭のマイナス記号と末尾の空白を含む最大2進数の非区切り2進数表現を含む文字列のサイズである。

Implementation note: Since the minimum value of *n* is 16, the absolute minimum size of the pictured  numeric output string is 34 characters. But if your implementation has a larger *n*, you must also increase the  size of the pictured numeric output string.

実装上の注意： *n*の最小値は16であるため、絵に描いたような数値出力文字列の絶対的な最小サイズは34文字である。しかし、実装で *n* を大きくする場合は、絵の数値出力文字列のサイズも大きくする必要があります。

### A.3.4 The Forth text interpreter 

#### A.3.4.3 Semantics 

The "initiation semantics" correspond to the code that is executed upon entering a definition, analogous to  the code executed by `EXIT` upon leaving a definition. The "run-time semantics" correspond to code  fragments, such as literals or branches, that are compiled inside colon definitions by words with explicit  compilation semantics.

開始セマンティクス」は、定義に入るときに実行されるコードに対応し、定義を抜けるときに `EXIT` によって実行されるコードに似ています。実行時セマンティクス」は、明示的なコンパイル・セマンティクスを持つ単語によってコロン定義の内部でコンパイルされる、リテラルやブランチなどのコード・フラグメントに対応する。

In a Forth cross-compiler, the execution semantics may be specified to occur in the host system only, the  target system only, or in both systems. For example, it may be appropriate for words such as `CELLS` to  execute on the host system returning a value describing the target, for colon definitions to execute only on  the target, and for `CONSTANT` and `VARIABLE` to have execution behaviors on both systems. Details of  cross-compiler behavior are beyond the scope of this Standard.

Forth クロスコンパイラでは、実行セマンティクスをホストシステムのみ、ターゲットシステムのみ、または両方のシステムで発生するように指定することができます。例えば、`CELLS`のような単語はホストシステムで実行され、ターゲットに記述された値を返します。また、コロン定義はターゲットでのみ実行され、`CONSTANT`と`VARIABLE`は両方のシステムで実行動作を持つことが適切かもしれません。クロスコンパイラの動作の詳細は、本標準の範囲外です。

##### A.3.4.3.2 Interpretation semantics 

For a variety of reasons, this Standard does not define interpretation semantics for every word. Examples of  these words are `>R`, `."`, `DO`, and `IF`. Nothing in this Standard precludes an implementation from providing  interpretation semantics for these words, such as interactive control-flow words. However, a Standard  Program may not use them in interpretation state.

さまざまな理由から、本標準ではすべての単語の解釈セマンティクスを定義していません。これらの単語の例としては、`>R`、`."`、`DO`、`IF`などがある。本標準のいかなる規定も、対話的制御フロー語のようなこれらの語に対する解釈セマンティクスを実装が提供することを妨げるものではない。しかし、標準プログラムは解釈状態でこれらを使用してはならない。

#### A.3.4.5 Compilation 

Compiler recursion at the definition level consumes excessive resources, especially to support locals. The  Technical Committee does not believe that the benefits justify the costs. Nesting definitions is also not  common practice and won’t work on many systems.

定義レベルでのコンパイラ再帰は、特にローカルのサポートに過剰なリソースを消費する。技術委員会は、そのメリットがコストを正当化するとは考えていません。また、定義を入れ子にすることは一般的ではなく、多くのシステムでは機能しません。

## A.4 Documentation requirements 

### A.4.1 System documentation 

### A.4.2 Program documentation 

## A.5 Compliance and labeling 

### A.5.1 ANS Forth systems 

Section 5.1 defines the criteria that a system must meet in order to justify the label "ANS Forth System".  Briefly, the minimum requirement is that the system must "implement" the Core word set. There are several  ways in which this requirement may be met. The most obvious is that all Core words may be in a pre-compiled kernel. This is not the only way of satisfying the requirement, however. For example, some  words may be provided in source blocks or files with instructions explaining how to add them to the system  if they are needed. So long as the words are provided in such a way that the user can obtain access to them  with a clear and straightforward procedure, they may be considered to be present.

セクション5.1では、「ANS Forth System」というラベルを正当化するためにシステムが満たすべき基準を定義しています。 簡単に説明すると、最小要件は、システムがCoreワードセットを「実装」していることです。この要件を満たすには、いくつかの方法があります。最も明白なのは、すべてのCoreワードがコンパイル済みのカーネルに含まれていることです。しかし、要件を満たす方法はこれだけではない。例えば、いくつかの単語はソースブロックやファイルで提供され、それらが必要な場合にシステムに追加する方法を説明した説明書が付いていてもよい。ユーザが明確でわかりやすい手順でアクセスできるような方法で単語が提供されている限り、単語は存在するとみなすことができます。

A Forth cross-compiler has many characteristics in common with an ANS Forth System, in that both use  similar compiling tools to process a program. However, in order to fully specify an ANS Forth cross  compiler it would be necessary to address complex issues dealing with compilation and execution semantics  in both host and target environments as well as ROMability issues. The level of effort to do this properly  has proved to be impractical at this time. As a result, although it may be possible for a Forth cross-compiler  to correctly prepare an ANS Forth program for execution in a target environment, it is inappropriate for a  cross-compiler to be labeled an ANS Forth System.

Forth クロスコンパイラと ANS Forth システムには、プログラムを処理するために同様のコンパイルツールを使用するという点で、多くの共通点があります。しかし、ANS Forthクロスコンパイラを完全に仕様化するには、ホスト環境とターゲット環境の両方におけるコンパイルと実行のセマンティクス、およびROM互換性の問題を扱う複雑な問題に対処する必要があります。これを適切に行うための労力は、現時点では非現実的であることが判明しています。その結果、ForthクロスコンパイラがANS Forthプログラムをターゲット環境で実行できるように正しく準備することは可能かもしれませんが、クロスコンパイラにANS Forth Systemのラベルを付けることは不適切です。

### A.5.2 ANS Forth programs 

#### A.5.2.2 Program labeling 

Declaring an environmental dependency should not be considered undesirable, merely an acknowledgment  that the author has taken advantage of some assumed architecture. For example, most computers in  common use are based on two’s complement binary arithmetic. By acknowledging an environmental  dependency on this architecture, a programmer becomes entitled to use the number -1 to represent all bits  set without significantly restricting the portability of the program.

Because all programs require space for data and instructions, and time to execute those instructions, they  depend on the presence of an environment providing those resources. It is impossible to predict how little  of some of these resources (e.g. stack space) might be necessary to perform some task, so this Standard does  not do so.

On the other hand, as a program requires increasing levels of resources, there will probably be sucessively  fewer systems on which it will execute sucessfully. An algorithm requiring an array of 109 cells might run  on fewer computers than one requiring only 103.

Since there is also no way of knowing what minimum level of resources will be implemented in a system  useful for at least some tasks, any program performing real work labeled simply an "ANS Forth Program" is  unlikely to be labeled correctly.

環境依存を宣言することは望ましくないことではなく、単に作者が想定されるアーキテクチャを利用したことを認めることに過ぎないと考えるべきである。例えば、一般に使用されているほとんどのコンピュータは2の補数2進演算に基づいている。このアーキテクチャへの環境依存を認めることで、プログラマはプログラムの移植性を大幅に制限することなく、セットされたすべてのビットを表すために数値-1を使用する権利を得る。

すべてのプログラムは、データと命令のためのスペースと、それらの命令を実行するための時間を必要とするため、これらのリソースを提供する環境の存在に依存する。あるタスクを実行するために、これらの資源（例えばスタック空間）のうちどれだけの量が必要になるかを予測することは不可能であるため、本標準ではそのようなことは行わない。

一方、プログラムが必要とする資源のレベルが高くなるにつれて、そのプログラムが正常に実行されるシステムは次第に少なくなっていくだろう。109個のセルの配列を必要とするアルゴリズムは、103個しか必要としないものより少ないコンピュータで実行されるかもしれない。

また、少なくともいくつかのタスクに有用なシステムに実装されるリソースの最小レベルを知る方法もないため、単に「ANS Forthプログラム」とラベル付けされた実際の作業を実行するプログラムは、正しくラベル付けされる可能性は低い。

## A.6 Glossary 

In this and following sections we present rationales for the handling of specific words: why we included  them, why we placed them in certain word sets, or why we specified their names or meaning as we did.

Words in this section are organized by word set, retaining their index numbers for easy cross-referencing to  the glossary.

Historically, many Forth systems have been written in Forth. Many of the words in Forth originally had as  their primary purpose support of the Forth system itself. For example, `WORD` and `FIND` are often used as  the principle instruments of the Forth text interpreter, and `CREATE` in many systems is the primitive for  building dictionary entries. In defining words such as these in a standard way, we have endeavored not to  do so in such a way as to preclude their use by implementors. One of the features of Forth that has endeared  it to its users is that the same tools that are used to implement the system are available to the application  programmer - a result of this approach is the compactness and efficiency that characterizes most Forth  implementations.

このセクションと次のセクションで、特定の単語を扱った理由、特定の単語セットに入れた理由、またはその単語の名前や意味を指定した理由を説明します。

このセクションの単語は、用語集との相互参照を容易にするため、インデックス番号を保持したまま、単語セットごとに整理されています。

歴史的に、多くのForthシステムはForthで書かれてきました。Forthの単語の多くは、もともとForthシステム自体のサポートを主な目的としていました。例えば、`WORD`と`FIND`はForthのテキストインタプリタの主要な道具としてよく使われ、`CREATE`は多くのシステムで辞書エントリを構築するためのプリミティブである。これらのような単語を標準的な方法で定義する際、実装者による使用を妨げないように努めた。Forthがユーザーに愛されている特徴の1つは、システムの実装に使用されるのと同じツールがアプリケーション・プログラマーにも利用可能であることである。

### A.6.1 Core words 

#### A.6.1.0070 `'` 

Typical use: `... ' name `.

Many Forth systems use a state-smart tick. Many do not. ANS Forth follows the usage of Forth 83.

**See: A.3.4.3..2 Interpretation semantics, A.6.1.1550 FIND**.

#### A.6.1.0080 `(` 

Typical use: `... ( ccc) ...`

#### A.6.1.0140 `+LOOP` 

Typical use:

    : X ... limit first DO ... step +LOOP ; 

#### A.6.1.0150 `,` 

Typical use:  

The use of , (comma) for compiling execution tokens is not portable.

See: **6.2.0945 COMPILE,**.

#### A.6.1.0190 ." 

Typical use: `: X ... ." ccc" ... ;` 

An implementation may define interpretation semantics for `."` if desired. In one plausible implementation,  interpreting `."` would display the delimited message. In another plausible implementation, interpreting `."` would compile code to display the message later. In still another plausible implementation, interpreting `."` would be treated as an exception. Given this variation a Standard Program may not use `."` while  interpreting. Similarly, a Standard Program may not compile `POSTPONE` `."` inside a new word, and then  use that word while interpreting.

実装は必要に応じて `."` の解釈セマンティクスを定義することができる。あるもっともらしい実装では、`."`を解釈すると区切られたメッセージが表示される。別のもっともらしい実装では、`."`を解釈すると、後でメッセージを表示するためにコードをコンパイルする。さらに別のもっともらしい実装では、`."`の解釈は例外として扱われる。このようなバリエーションがある場合、標準プログラムは `."` を解釈中に使用してはならない。同様に、標準プログラムは `POSTPONE` `."` を新しい単語の中にコンパイルして、その単語を解釈中に使用してはならない。

#### A.6.1.0320 `2*` 

Historically, `2*` has been implemented on two's-complement machines as a logical left-shift instruction.  Multiplication by two is an efficient side-effect on these machines. However, shifting implies a knowledge  of the significance and position of bits in a cell. While the name implies multiplication, most implementors  have used a hardware left shift to implement `2*`.

歴史的に、`2*` は論理左シフト命令として 2 の補数マシンに実装されてきた。 これらのマシンでは、2による乗算は効率的な副作用です。しかし、シフトにはセル内のビットの意味と位置の知識が必要である。その名前は乗算を意味するが、ほとんどの実装者は`2*`を実装するためにハードウェア左シフトを使用してきた。

#### A.6.1.0330 `2/` 

This word has the same common usage and misnaming implications as `2*`. It is often implemented on  two's-complement machines with a hardware right shift that propagates the sign bit.

この単語は`2*`と同じ一般的な用法と誤った命名の意味を持っている。符号ビットを伝播するハードウェア右シフトを持つ2補数マシンでよく実装される。

#### A.6.1.0350 `2@` 

With `2@` the storage order is specified by the Standard.

`2@`では、格納順序は標準によって指定される。

#### A.6.1.0450 `:` 

Typical use: `: name ... ;` 

In Forth 83, this word was specified to alter the search order. This specification is explicitly removed in this  Standard. We believe that in most cases this has no effect; however, systems that allow many search orders  found the Forth-83 behavior of colon very undesirable.

Forth 83 では、この単語は検索順序を変更するために指定されていた。この仕様は、本標準では明示的に削除されています。しかし、多くの検索順序を許可しているシステムでは、コロンのForth-83の動作は非常に望ましくないものでした。

Note that colon does not itself invoke the compiler. Colon sets compilation state so that later words in the  parse area are compiled.

コロン自体はコンパイラを起動しないことに注意してください。コロンはコンパイル状態を設定し、解析領域内の後の単語がコンパイルされるようにします。

#### A.6.1.0460 `;` 

Typical use: `: name ... ;` 

One function performed by both `;` and `;CODE` is to allow the current definition to be found in the  dictionary. If the current definition was created by `:NONAME` the current definition has no definition name  and thus cannot be found in the dictionary. If `:NONAME` is implemented the Forth compiler must maintain  enough information about the current definition to allow `;` and `;CODE` to determine whether or not any  action must be taken to allow it to be found.

#### A.6.1.0550 `>BODY` 

*a-addr* is the address that `HERE` would have returned had it been executed immediately after the execution  of the `CREATE` that defined *xt*.

と`;CODE`の両方が実行する機能の1つは、現在の定義を辞書で見つけられるようにすることである。現在の定義が `:NONAME` によって作成された場合、現在の定義には定義名がないため、辞書で見つけることができない。NONAME`が実装されている場合、Forthコンパイラーは現在の定義に関する十分な情報を保持し、`;`と`;CODE`が現在の定義を見つけられるようにするために何らかのアクションを実行しなければならないかどうかを判断できるようにする必要があります。

#### a.6.1.0550 `>body` 

*a-addr* は、*xt* を定義した `CREATE` の実行直後に `HERE` が実行された場合に返されたであろうアドレスである。

#### A.6.1.0680 ABORT" 

Typical use: `: X ... test ABORT" ccc" ... ; `

#### A.6.1.0695 ACCEPT 

Previous standards specified that collection of the input string terminates when either a "return" is received  or when +n1 characters have been received. Terminating when +n1 characters have been received is  difficult, expensive, or impossible to implement in some system environments. Consequently, a number of  existing implementations do not comply with this requirement. Since line-editing and collection functions  are often implemented by system components beyond the control of the Forth implementation, this Standard  imposes no such requirement. A Standard Program may only assume that it can receive an input string with  `ACCEPT` or `EXPECT`. The detailed sequence of user actions necessary to prepare and transmit that line are  beyond the scope of this Standard.

以前の規格では、入力文字列の収集は、"return "を受信するか、+n1文字を受信したとき に終了すると規定されていた。n1文字を受信したときに終了することは、システム環境によっては実装が困難であったり、高価であったり、不可能であったりする。そのため、多くの既存の実装はこの要件に準拠していない。行の編集や収集機能は、Forth 実装の制御を超えたシステムコンポーネントによって実装されることが多いため、本標準ではそのような要件を課していません。標準プログラムは `ACCEPT` または `EXPECT` で入力文字列を受け取ることができると仮定するだけでよい。その行を準備して送信するために必要なユーザーアクションの詳細なシーケンスは、本標準の範囲外である。

Specification of a non-zero, positive integer count (+n1) for ACCEPT allows some implementors to  continue their practice of using a zero or negative value as a flag to trigger special behavior. Insofar as such  behavior is outside the Standard, Standard Programs cannot depend upon it, but the Technical Committee  doesn't wish to preclude it unnecessarily. Since actual values are almost always small integers, no  functionality is impaired by this restriction.

ACCEPTにゼロでない正の整数カウント(+n1)を指定することで、実装者によっては、 特別な動作をトリガーするフラグとしてゼロまたは負の値を使用する習慣を継続す ることができる。そのような動作が標準の外にある限り、標準プログラ ムはそれに依存することはできないが、技術委員会は不必要に排除することは 望まない。実際の値はほとんど常に小さな整数であるため、この制限によって機能が損なわれることはない。

`ACCEPT` and `EXPECT` perform similar functions. `ACCEPT` is recommended for new programs, and future  use of `EXPECT` is discouraged.

It is recommended that all non-graphic characters be reserved for editing or control functions and not be  stored in the input string.

Commonly, when the user is preparing an input string to be transmitted to a program, the system allows the  user to edit that string and correct mistakes before transmitting the final version of the string. The editing  function is supplied sometimes by the Forth system itself, and sometimes by external system software or  hardware. Thus, control characters and functions may not be available on all systems. In the usual case, the  end of the editing process and final transmission of the string is signified by the user pressing a "Return" or  "Enter" key.

As in previous standards, `EXPECT` returns the input string immediately after the requested number of  characters are entered, as well as when a line terminator is received. The "automatic termination after  specified count of characters have been entered" behavior is widely considered undesirable because the user "loses control" of the input editing process at a potentially unknown time (the user does not necessarily know how many characters were requested from `EXPECT`). Thus `EXPECT` and `SPAN` have been made  obsolescent and exist in the Standard only as a concession to existing implementations. If `EXPECT` exists in  a Standard System it must have the "automatic termination" behavior.

ACCEPT` と `EXPECT` は似たような機能を果たす。新しいプログラムでは `ACCEPT` が推奨され、将来的に `EXPECT` を使用することは推奨されない。

グラフィック以外の文字はすべて編集や制御機能のために予約しておき、入力文字列に保存しないことを推奨する。

一般的に、ユーザがプログラムに送信する入力文字列を準備しているとき、システムは最終版の文字列を送信する前にユーザがその文字列を編集して間違いを修正することを許可する。編集機能は、Forthシステム自体から提供されることもあれば、外部のシステム・ソフトウェアやハードウェアから提供されることもあります。したがって、制御文字や制御機能は、すべてのシステムで利用できるとは限りません。通常の場合、編集処理の終了と文字列の最終的な送信は、ユーザーが "Return" または "Enter" キーを押すことによって示される。

これまでの標準と同様に、`EXPECT`は要求された文字数が入力された直後と、行終端文字を受信したときに入力文字列を返します。指定された文字数が入力された後に自動的に終了する」動作は、ユーザーが未知の可能性のある時点で入力編集プロセスの「コントロールを失う」（ユーザーは `EXPECT` から要求された文字数を必ずしも知らない）ため、広く望ましくないと考えられています。そのため `EXPECT` と `SPAN` は廃止され、既存の実装に対する譲歩としてのみ標準に存在している。もし `EXPECT` が標準システムに存在するなら、それは "

`ACCEPT` does not have the "automatic termination" behavior of `EXPECT`. However, because external  system hardware and software may perform the `ACCEPT` function, when a line terminator is received the  action of the cursor, and therefore the display, is implementation-defined. It is recommended that the cursor  remain immediately following the entered text after a line terminator is received.

`ACCEPT` は `EXPECT` のような「自動終了」の動作を持たない。しかし、外部システムのハードウェアとソフトウェアが `ACCEPT` 機能を実行するかもしれないので、行終端を受信したときのカーソルの動作、したがって表示は実装によって定義されます。行終端を受信した後、カーソルは入力されたテキストの直後に残ることが推奨される。

#### A.6.1.0705 ALIGN 

In this Standard we have attempted to provide transportability across various CPU architectures. One of the  frequent causes of transportability problems is the requirement of cell-aligned addresses on some CPUs. On  these systems, `ALIGN` and `ALIGNED` may be required to build and traverse data structures built with `C,`.  Implementors may define these words as no-ops on systems for which they aren't functional.

本標準では、様々なCPUアーキテクチャ間での移植性を提供することを試みた。移植性の問題の頻繁な原因の1つは、いくつかのCPUでセル揃えのアドレスが要求されることである。このようなシステムでは、`C,`で構築されたデータ構造をビルドしたりトラバースしたりするために `ALIGN` と `ALIGNED` が必要になることがある。 実装者は、これらの単語が機能しないシステムでは、これらの単語をno-opsとして定義することができる。

#### A.6.1.0706 `ALIGNED` 

See: **A.6.1.0705 `ALIGN`**.

#### A.6.1.0760 `BEGIN` 

Typical use:

    : X ... BEGIN ... test UNTIL ; 

or

    : X ... BEGIN ... test WHILE ... REPEAT ;

#### A.6.1.0770 `BL` 

Because space is used throughout Forth as the standard delimiter, this word is the only way a program has to  find and use the system value of "space". The value of a space character can not be obtained with `CHAR`,  for instance.

スペースはForth全体で標準的な区切り文字として使用されているため、この単語はプログラムが「スペース」のシステム値を検索して使用する唯一の方法です。スペース文字の値は、例えば `CHAR` では取得できない。

#### A.6.1.0880 `CELL+` 

As with `ALIGN` and `ALIGNED`, the words `CELL` and `CELL+` were added to aid in transportability across  systems with different cell sizes. They are intended to be used in manipulating indexes and addresses in  integral numbers of cell-widths.

`ALIGN`と`ALIGNED`と同様に、`CELL`と`CELL+`という単語は、異なるセルサ イズを持つシステム間での移動性を助けるために追加された。これらは、整数個のセル幅でインデックスやアドレスを操作する際に使用することを意図している。

Example:

    2VARIABLE DATA 
    0 100 DATA 2! 
    DATA @ . 100  
    DATA CELL+ @ . 0  

#### A.6.1.0890 CELLS 

See: **A.6.1.0880 CELL+**.

Example: `CREATE NUMBERS 100 CELLS ALLOT` 

(Allots space in the array `NUMBERS` for 100 cells of data.) 

#### A.6.1.0895 CHAR 

Typical use: ... `CHAR A CONSTANT "A"` ...

#### A.6.1.0950 CONSTANT 

Typical use: ... `DECIMAL 10 CONSTANT TEN` ...

#### A.6.1.1000 `CREATE` 

The data-field address of a word defined by `CREATE` is given by the data-space pointer immediately  following the execution of `CREATE` Reservation of data field space is typically done with `ALLOT`.

`CREATE` で定義されたワードのデータ・フィールド・アドレスは、`CREATE` の実行直後のデータ・スペース・ポインタによって与えられる。 データ・フィールド・スペースの予約は、通常 `ALLOT` で行われる。

Typical use: ... `CREATE SOMETHING` ...

#### A.6.1.1240 `DO` 

Typical use:  

    : X ... limit first DO ... LOOP ; 

or  

    : X ... limit first DO ... step +LOOP ; 

#### A.6.1.1250 `DOES>` 

Typical use: `: X ... DOES> ... ;` 

Following `DOES>`, a Standard Program may not make any assumptions regarding the ability to find either  the name of the definition containing the `DOES>` or any previous definition whose name may be concealed  by it. `DOES>` effectively ends one definition and begins another as far as local variables and control-flow  structures are concerned. The compilation behavior makes it clear that the user is not entitled to place  `DOES>` inside any control-flow structures.

`DOES>`の後では、標準プログラムは`DOES>`を含む定義名や、その定義名によって隠されている可能性のある以前の定義名を見つける能力に関して、いかなる仮定も置くことはできません。ローカル変数と制御フロー構造に関する限り、`DOES>`は事実上1つの定義を終了し、別の定義を開始します。コンパイルの動作は、ユーザーが `DOES>` をコントロールフロー構造体の中に置く権利がないことを明確にしている。

#### A.6.1.1310 `ELSE` 

Typical use: : `X ... test IF ... ELSE ... THEN ;` 

#### A.6.1.1345 `ENVIRONMENT?` 

In a Standard System that contains only the Core word set, effective use of ENVIRONMENT? requires either  its use within a definition, or the use of user-supplied auxiliary definitions. The Core word set lacks both a  direct method for collecting a string in interpretation state (**11.6.1.2165  `S"`** is in an optional word set) and  also a means to test the returned flag in interpretation state (e.g. the optional 15.6.2.2532 `[IF]`).

Core語集合のみを含む標準システムでは、ENVIRONMENT?を効果的に使用するには、定義内で使用するか、ユーザーが提供する補助定義を使用する必要があります。Core語集合には、解釈状態で文字列を収集する直接的な方法（**11.6.1.2165 `S"`**はオプションの語集合にある）と、解釈状態で返されたフラグをテストする手段（オプションの15.6.2.2532 `[IF]`など）の両方が欠けている。

The combination of **6.1.1345 ENVIRONMENT?**, **11.6.1.2165 `S"`**, **15.6.2.2532 `[IF]`**, **15.6.2.2531 `[ELSE]`**,  and **15.6.2.2533 `[THEN]`** constitutes an effective suite of words for conditional compilation that works in  interpretation state.

**6.1.1345 ENVIRONMENT?**, **11.6.1.2165 `S"`**, **15.6.2.2532 `[IF]`**, **15.6.2.2531 `[ELSE]`**, **15.6.2.2533 `[THEN]`** の組み合わせは、解釈状態において機能する条件付きコンパイルのための効果的な語群を構成します。

#### A.6.1.1360 `EVALUATE` 

The Technical Committee is aware that this function is commonly spelled EVAL. However, there exist  implementations that could suffer by defining the word as is done here. We also find EVALUATE to be  more readable and explicit. There was some sentiment for calling this INTERPRET, but that too would  have undesirable effects on existing code. The longer spelling was not deemed significant since this is not a  word that should be used frequently in source code.

技術委員会は、この関数が一般的にEVALと表記されることを認識している。しかし、ここで行われているように単語を定義することで苦しむ実装が存在する。また、我々はEVALUATEの方が読みやすく明示的であると考える。これをINTERPRETと呼ぼうという意見もあったが、これも既存のコードに望ましくない影響を与えるだろう。長いスペルは、ソースコードで頻繁に使用されるべき単語ではないため、重要ではないと判断された。

#### A.6.1.1380 EX`IT 

Typical use: `: X ... test IF ... EXIT THEN ... ;` 

#### A.6.1.1550 `FIND` 

 One of the more difficult issues which the Committee took on was the problem of divorcing the  specification of implementation mechanisms from the specification of the Forth language. Three basic  implementation approaches can be quickly enumerated:

1) Threaded code mechanisms. These are the traditional approaches to implementing Forth, but other techniques may be used.
2) Subroutine threading with "macro-expansion" (code copying). Short routines, like the code for DUP, are copied into a definition rather than compiling a JSR reference.
3) Native coding with optimization. This may include stack optimization (replacing such phrases as SWAP ROT + with one or two machine instructions, for example), parallelization (the trend in the  newer RISC chips is to have several functional subunits which can execute in parallel), and so on.

The initial requirement (inherited from Forth 83) that compilation addresses be compiled into the dictionary  disallowed type 2 and type 3 implementations.

Type 3 mechanisms and optimizations of type 2 implementations were hampered by the explicit  specification of immediacy or non-immediacy of all standard words. POSTPONE allowed de-specification  of immediacy or non-immediacy for all but a few Forth words whose behavior must be STATE-independent.

委員会が取り上げたより困難な問題の1つは、Forth言語の仕様から実装メカニズムの仕様を切り離す問題であった。3つの基本的な実装アプローチがすぐに列挙できる：

1) スレッドコードメカニズム。これらは、Forthを実装するための伝統的なアプローチであるが、他のテクニックを使用することもできる。
2) 「マクロ拡張」（コードコピー）によるサブルーチンのスレッド化。DUPのコードのような短いルーチンは、JSR参照をコンパイルするのではなく、定義にコピーされます。
3) 最適化を伴うネイティブ・コーディング。これには、スタックの最適化（例えば、SWAP ROT +のようなフレーズを1つか2つのマシン命令で置き換える）、並列化（新しいRISCチップのトレンドは、並列実行可能な複数の機能サブユニットを持つことである）などが含まれる。

コンパイルアドレスが辞書にコンパイルされるという最初の要件（Forth 83から継承）は、タイプ2やタイプ3の実装を認めませんでした。

タイプ3のメカニズムやタイプ2の実装の最適化は、すべての標準語の即時性または非即時性の明示的な指定によって妨げられていた。POSTPONEでは、STATEに依存しない動作が必要な一部のForth語を除き、即時性または非即時性の指定を解除することができた。

One type 3 implementation, Charles Moore's cmForth, has both compiling and interpreting versions of  many Forth words. At the present, this appears to be a common approach for type 3 implementations. The  Committee felt that this implementation approach must be allowed. Consequently, it is possible that words  without interpretation semantics can be found only during compilation, and other words may exist in two  versions: a compiling version and an interpreting version. Hence the values returned by FIND may depend  on `STATE`, and ` and `[']` may be unable to find words without interpretation semantics.

タイプ3の実装の1つであるCharles MooreのcmForthは、多くのForthワードのコンパイル版と解釈版の両方を持っている。現在のところ、これはタイプ3実装の一般的なアプローチのようである。委員会は、このような実装方法を認めなければならないと考えた。その結果、解釈セマンティクスのない単語はコンパイル中にしか見つからない可能性があり、他の単語はコンパイル版と解釈版の2つのバージョンが存在する可能性がある。したがって、FINDが返す値は`STATE`に依存し、`と`[']`は解釈セマンティクスを持たない単語を見つけることができないかもしれません。

#### A.6.1.1561 `FM/MOD` 

By introducing the requirement for "floored" division, Forth 83 produced much controversy and concern on  the part of those who preferred the more common practice followed in other languages of implementing  division according to the behavior of the host CPU, which is most often symmetric (rounded toward zero).  In attempting to find a compromise position, this Standard provides primitives for both common varieties,  floored and symmetric (see `SM/REM`). `FM/MOD` is the floored version.

Forth 83 は、"floored" 除算の要件を導入することで、ホスト CPU の動作に従って除算を実装するという、他の言語ではより一般的な慣行を好む人々から、多くの論争と懸念を生み出しました。 妥協点を見出すために、この標準は一般的なフロアー型と対称型の両方のプリミティブを提供する（`SM/REM`を参照）。FM/MOD`はフロアードバージョンである。

The Technical Committee considered providing two complete sets of explicitly named division operators,  and declined to do so on the grounds that this would unduly enlarge and complicate the Standard. Instead,  implementors may define the normal division words in terms of either `FM/MOD` or `SM/REM` providing they  document their choice. People wishing to have explicitly named sets of operators are encouraged to do so.  `FM/MOD` may be used, for example, to define:

技術委員会は、明示的に命名された2つの除算演算子の完全なセットを提供することを検討したが、これは規格を不当に拡大し複雑にするという理由で、そのようなことはしなかった。その代わりに、実装者は通常の除算語を `FM/MOD` または `SM/REM` のどちらかで定義することができる。明示的に命名された演算子のセットを持ちたい人は、そうすることを推奨する。 FM/MOD`は例えば次のように定義するために使用することができる。

    : /_MOD ( n1 n2 -- n3 n4) >R S>D R> FM/MOD ; 
    : /_ ( n1 n2 -- n3) /_MOD SWAP DROP ; 
    : _MOD ( n1 n2 -- n3) /_MOD DROP ; 
    : */_MOD ( n1 n2 n3 -- n4 n5) >R M* R> FM/MOD ; 
    : */_ ( n1 n2 n3 -- n4 ) */_MOD SWAP DROP ; 

#### A.6.1.1700 IF 

Typical use:

    : X ... test IF ... THEN ... ; 

or

    : X ... test IF ... ELSE ... THEN ... ; 

#### A.6.1.1710 IMMEDIATE 

Typical use: `Typical use: : X ... ; IMMEDIATE `

#### A.6.1.1720 INVERT 

The word NOT was originally provided in Forth as a flag operator to make control structures readable.  Under its intended usage the following two definitions would produce identical results:

NOTはもともと、制御構造を読みやすくするためのフラグ演算子としてForthに用意された。 その意図された用法では、次の2つの定義は同じ結果を生むことになる：

    : ONE ( flag -- ) 
        IF ." true" ELSE ." false" THEN ; 
    : TWO ( flag -- ) 
        NOT IF ." false" ELSE ." true" THEN ; 

This was common usage prior to the Forth-83 Standard which redefined NOT as a cell-wide one's-complement operation, functionally equivalent to the phrase -1 XOR. At the same time, the data type  manipulated by this word was changed from a flag to a cell-wide collection of bits and the standard value  for true was changed from "1" (rightmost bit only set) to "-1" (all bits set). As these definitions of TRUE and NOT were incompatible with their previous definitions, many Forth users continue to rely on the old  definitions. Hence both versions are in common use.

Therefore, usage of NOT cannot be standardized at this time. The two traditional meanings of NOT - that of  negating the sense of a flag and that of doing a one's complement operation - are made available by 0= and  INVERT, respectively.

これは、NOT をセル全体の 1 の補数演算として再定義した Forth-83 Standard より前の一般的な用法であり、機能的には -1 XOR と同等である。同時に、この単語によって操作されるデータ型はフラグからセル全体のビットの集合に変更され、TRUE の標準値は "1"（右端のビットだけがセットされる）から "-1"（すべてのビットがセットされる）に変更された。これらのTRUEとNOTの定義は、以前の定義と互換性がないため、多くのForthユーザーは古い定義に依存し続けている。したがって、両方のバージョンが一般的に使用されている。

したがって、現時点ではNOTの用法を標準化することはできない。NOTの2つの伝統的な意味（フラグの意味を否定する意味と1補数演算を行う意味）は、それぞれ0=とINVERTによって利用可能になる。

#### A.6.1.1730 J 

J may only be used with a nested DO...LOOP, DO...+LOOP, ?DO...LOOP, or ?DO...+LOOP, for example, in  the form:  

Jは、入れ子になったDO...LOOP、DO...+LOOP、?

    : X ... DO ... DO ... J ... LOOP ... +LOOP ... ; 

#### A.6.1.1760 LEAVE 

Note that LEAVE immediately exits the loop. No words following LEAVE within the loop will be executed.

LEAVEは直ちにループを抜けることに注意。ループ内でLEAVEに続く単語は実行されない。

Typical use:

    : X ... DO ... IF ... LEAVE THEN ... LOOP ... ; 

#### A.6.1.1780 LITERAL 

Typical use: : X ... [ x ] LITERAL ... ; 

#### A.6.1.1800 LOOP 

Typical use:

    : X ... limit first DO ... LOOP ... ; 

or

    : X ... limit first ?DO ... LOOP ... ; 

#### A.6.1.1810 M* 

This word is a useful early step in calculation, going to extra precision conveniently. It has been in use  since the Forth systems of the early 1970's.

この単語は、計算の初期段階で便利なもので、超精密な計算を便利に行うことができる。1970年代初期のForthシステムから使われている。

#### A.6.1.1900 MOVE 

CMOVE and CMOVE> are the primary move operators in Forth 83. They specify a behavior for moving that  implies propagation if the move is suitably invoked. In some hardware, this specific behavior cannot be  achieved using the best move instruction. Further, CMOVE and CMOVE> move characters; ANS Forth needs  a move instruction capable of dealing with address units. Thus MOVE has been defined and added to the  Core word set, and CMOVE and CMOVE> have been moved to the String word set.


`CMOVE` および `CMOVE>` は、Forth 83 の主要な移動演算子です。これらは、移動が適切に呼び出された場合に伝搬を意味する移動の動作を指定します。一部のハードウェアでは、この特定の動作は最良の移動命令を使用して達成することはできません。さらに、`CMOVE`と`CMOVE>`は文字を移動します。ANS Forthには、アドレス単位を扱うことができる移動命令が必要です。このため、MOVEが定義されてCoreワードセットに追加され、`CMOVE`と`CMOVE>`はStringワードセットに移動しました。

#### A.6.1.2033 POSTPONE 

Typical use:  

    : ENDIF POSTPONE THEN ; IMMEDIATE 
    : X ... IF ... ENDIF ... ; 


POSTPONE replaces most of the functionality of COMPILE and [COMPILE]. COMPILE and [COMPILE] are used for the same purpose: postpone the compilation behavior of the next word in the parse area. COMPILE was designed to be applied to non-immediate words and [COMPILE] to immediate  words. This burdens the programmer with needing to know which words in a system are immediate.

Consequently, Forth standards have had to specify the immediacy or non-immediacy of all words covered  by the Standard. This unnecessarily constrains implementors.

A second problem with COMPILE is that some programmers have come to expect and exploit a particular  implementation, namely:  

POSTPONEはCOMPILEと[COMPILE]の機能のほとんどを置き換える。COMPILEと[COMPILE]は同じ目的で使用され、解析領域内の次の単語のコンパイル動作を延期します。COMPILEは非即値語に、[COMPILE]は即値語に適用されるように設計されている。このため、プログラマーはシステム内のどの単語が即時単語であるかを知る必要があり、負担が大きい。

その結果、Forth標準は、標準がカバーするすべての単語の即時性または非即時性を指定しなければなりませんでした。これは、実装者を不必要に制約することになります。

COMPILEに関する2つ目の問題は、一部のプログラマが特定の実装、つまり、COMPILEを期待し、利用するようになったことです：

    : COMPILE R> DUP @ , CELL+ >R ; 

This implementation will not work on native code Forth systems. In a native code Forth using inline code  expansion and peephole optimization, the size of the object code produced varies; this information is  difficult to communicate to a "dumb" COMPILE. A "smart" (i.e., immediate) COMPILE would not have  this problem, but this was forbidden in previous standards.

For these reasons, COMPILE has not been included in the Standard and [COMPILE] has been moved in  favor of POSTPONE. Additional discussion can be found in Hayes, J.R., "Postpone", *Proceedings of the 1989 Rochester Forth Conference.*

この実装は、ネイティブ・コードのForthシステムでは動作しません。インラインコード展開とピーホール最適化を使用するネイティブコードForthでは、生成されるオブジェクトコードのサイズが変化します。この情報を「ダム」COMPILEに伝えることは困難です。この情報は、"間抜けな "COMPILEに伝えるのは困難です。"スマートな"（すなわち、即時的な）COMPILEにはこの問題はありませんが、これは以前の標準では禁止されていました。

これらの理由から、COMPILEは規格に含まれず、[COMPILE]はPOSTPONEを優先して移動された。追加の議論は、Hayes, J.R., "Postpone", *Proceedings of the 1989 Rochester Forth Conference.*にある。

#### A.6.1.2120 RECURSE 

Typical use: : X ... RECURSE ... ; 

This is Forth's recursion operator; in some implementations it is called MYSELF. The usual example is the  coding of the factorial function.

これはForthの再帰演算子で、実装によってはMYSELFと呼ばれることもある。通常の例は階乗関数のコーディングです。

    : FACTORIAL ( +n1 -- +n2) 
        DUP 2 < IF DROP 1 EXIT THEN 
        DUP 1- RECURSE * 
    ;
 
*n2 = n1(n1-1)(n1-2)...*(2)(1), the product of n1 with all positive integers less than itself (as a special case,  zero factorial equals one). While beloved of computer scientists, recursion makes unusually heavy use of  both stacks and should therefore be used with caution. See alternate definition in A.6.1.2140 REPEAT.

*n2 = n1(n1-1)(n1-2)...*(2)(1)、n1とそれ自身より小さいすべての正の整数の積（特殊なケースとして、階乗ゼロは1に等しい）。コンピュータ科学者に愛されているが、再帰は両方のスタックを異常に多用するので、使用には注意が必要である。A.6.1.2140 REPEATの代替定義を参照のこと。

#### A.6.1.2140 REPEAT 

Typical use:  

    : FACTORIAL ( +n1 -- +n2) 
        DUP 2 < IF DROP 1 EXIT THEN 
        DUP 
        BEGIN DUP 2 > WHILE 
            1- SWAP OVER * SWAP 
        REPEAT DROP 
    ; 

#### A.6.1.2165 S" 

Typical use: : X ... S" ccc" ... ; 

This word is found in many systems under the name " (quote). However, current practice is almost evenly  divided on the use of ", with many systems using the execution semantics given here, while others return the  address of a counted string. We attempt here to satisfy both camps by providing two words, S" and the  Core Extension word C" so that users may have whichever behavior they expect with a simple renaming  operation.

この単語は多くのシステムで"(引用符)という名前で使われている。しかし、" の使用法については、多くのシステムでここで示した実行セマンティクスが使用されている一方で、カウントされた文字列のアドレスを返すシステムもあり、現在の慣行はほぼ均等に分かれている。ここでは、S "とCore ExtensionのC "という2つの単語を提供することで、両陣営を 満たそうと試みている。

#### A.6.1.2214 SM/REM 

See the previous discussion of division under FM/MOD. SM/REM is the symmetric-division primitive,  which allows programs to define the following symmetric-division operators:  

FM/MODでの除算については前述の説明を参照のこと。SM/REM は対称除算プリミティブであり、以下の対称除算演算子をプログラムで定義できる：

    : /-REM ( n1 n2 -- n3 n4 ) >R S>D R> SM/REM ; 
    : /- ( n1 n2 -- n3 ) /-REM SWAP DROP ; 
    : -REM ( n1 n2 -- n3 ) /-REM DROP ; 
    : */-REM ( n1 n2 n3 -- n4 n5 ) >R M* R> SM/REM ; 
    : */- ( n1 n2 n3 -- n4 ) */-REM SWAP DROP ; 

#### A.6.1.2216 SOURCE 

SOURCE simplifies the process of directly accessing the input buffer by hiding the differences between its  location for different input sources. This also gives implementors more flexibility in their implementation  of buffering mechanisms for different input sources. The committee moved away from an input buffer  specification consisting of a collection of individual variables, declaring TIB and #TIB obsolescent.

SOURCE in this form exists in F83, POLYFORTH, LMI's Forths and others. In conventional systems it is  equivalent to the phrase  

SOURCEは、異なる入力ソースに対する入力バッファの位置の違いを隠すことで、入力バッファに直接アクセスするプロセスを簡素化する。これにより、実装者は、異なる入力ソースに対するバッファリング・メカニズムをより柔軟に実装することができる。委員会は、個々の変数の集まりからなる入力バッファ仕様から脱却し、TIBと#TIBの廃止を宣言した。

この形式のSOURCEは、F83、POLYFORTH、LMIのForthsなどに存在する。従来のシステムでは

    BLK @ IF BLK @ BLOCK 1024 ELSE TIB #TIB @ THEN  

#### A.6.1.2250 STATE 

Although EVALUATE, LOAD, INCLUDE-FILE, and INCLUDED are not listed as words which alter  STATE, the text interpreted by any one of these words could include one or more words which explicitly  alter STATE. EVALUATE, LOAD, INCLUDE-FILE, and INCLUDED do not in themselves alter STATE.

STATE does not nest with text interpreter nesting. For example, the code sequence:  

EVALUATE、LOAD、INCLUDE-FILE、およびINCLUDEDは、STATEを変更する単語としてリストされていないが、これらの単語のいずれか1つによって解釈されるテキストには、STATEを明示的に変更する単語が1つ以上含まれる可能性がある。EVALUATE、LOAD、INCLUDE-FILE、およびINCLUDEDは、それ自体がSTATEを変更することはない。

STATEは、テキストインタプリタのネストとは連動しません。例えば、次のようなコード列がある：

    : FOO S" ]" EVALUATE ; FOO 

will leave the system in compilation state. Similarly, after LOADing a block containing ], the system will be  in compilation state.

を含むブロックをLOADすると、システムはコンパイル状態になる。同様に、]を含むブロックをLOADした後、システムはコンパイル状態になる。

Note that ] does not affect the parse area and that the only effect that : has on the parse area is to parse a  word. This entitles a program to use these words to set the state with known side-effects on the parse area.

また、:が構文解析領域に与える影響は、単語を構文解析することだけである。これは、解析領域への副作用が知られている状態を設定するために、これらの単語を使用するプログラムの権利を与える。

For example:  

    : NOP : POSTPONE ; IMMEDIATE ; 
    NOP ALIGN NOP ALIGNED  
    
Some non-ANS Forth compliant systems have ] invoke a compiler loop in addition to setting STATE. Such  a system would inappropriately attempt to compile the second use of NOP.

Also note that nothing in the Standard prevents a program from finding the execution tokens of ] or [ and  using these to affect STATE. These facts suggest that implementations of ] will do nothing but set STATE and a single interpreter/compiler loop will monitor STATE.

ANS Forthに準拠していないシステムの中には、STATEの設定に加えてコンパイラ・ループを呼び出さなければならないものがあります。このようなシステムは、NOPの2回目の使用を不適切にコンパイルしようとします。

また、標準では、プログラムが ] や [ の実行トークンを見つけ、これらを使用して STATE に影響を与えることを妨げるものは何もないことに注意してください。これらの事実は、[ ]の実装はSTATEを設定する以外には何も行わず、単一のインタプリタ/コンパイラ・ループがSTATEを監視することを示唆している。

#### A.6.1.2270 THEN 

Typical use:  

    : X ... test IF ... THEN ... ; 

or  

    : X ... test IF ... ELSE ... THEN ... ; 

#### A.6.1.2380 UNLOOP 

Typical use:  

    : X ...
        limit first DO 
          ... test IF ... UNLOOP EXIT THEN ...
        LOOP ...
    ;
 
UNLOOP allows the use of EXIT within the context of DO ... LOOP and related do-loop constructs.  UNLOOP as a function has been called UNDO. UNLOOP is more indicative of the action: nothing gets  undone -- we simply stop doing it.

UNLOOPは、DO ... のコンテキスト内でEXITを使用できるようにする。LOOPおよび関連するDO-LOOP構文の中でEXITを使うことができる。 関数としてのUNLOOPはUNDOと呼ばれてきた。UNLOOPの方がより動作を表している：何も取り消されることはなく、単に実行を止めるだけである。

#### A.6.1.2390 UNTIL 

Typical use: : X ... BEGIN ... test UNTIL ... ; 

#### A.6.1.2410 VARIABLE 

Typical use: ... VARIABLE XYZ ...

#### A.6.1.2430 WHILE 

Typical use: : X ... BEGIN ... test WHILE ... REPEAT ... ; 

#### A.6.1.2450 WORD 

Typical use: *char* `WORD` *ccc&lt;char>* 

#### A.6.1.2500 [ 

Typical use: : X ... [ 4321 ] LITERAL ... ; 

#### A.6.1.2510 ['] 

Typical use: : X ... ['] name ... ; 

See: **A.6.1.1550 FIND**.

#### A.6.1.2520 [CHAR] 

Typical use: : X ... [CHAR] ccc ... ; 

#### A.6.1.2540 ] 

Typical use: : X ... [ 1234 ] LITERAL ... ; 

### A.6.2 Core extension words 

The words in this collection fall into several categories:  

このコレクションに含まれる単語は、いくつかのカテゴリーに分類される。

- Words that are in common use but are deemed less essential than Core words (e.g., 0&lt;>); 
- Words that are in common use but can be trivially defined from Core words (e.g., FALSE); 
- Words that are primarily useful in narrowly defined types of applications or are in less frequent use (e.g., PARSE); 
- Words that are being deprecated in favor of new words introduced to solve specific problems (e.g., CONVERT).

Because of the varied justifications for inclusion of these words, the Technical Committee does not  encourage implementors to offer the complete collection, but to select those words deemed most valuable to  their clientele.

- 一般的に使用されているが、Core単語よりも本質的ではないと考えられる単語（例：0<>）； 
- 一般的に使用されているが、Core単語から簡単に定義できる単語（例：FALSE）； 
- 主に限定された種類のアプリケーションで有用な単語、または使用頻度が低い単語（例：PARSE）； 
- 特定の問題を解決するために導入された新しい単語（例：CONVERT）を優先して非推奨とされる単語。

これらの単語を含める正当な理由は様々であるため、技術委員会は、実装者が完全なコレクションを提供することを推奨しておらず、顧客にとって最も価値があると考えられる単語を選択することを推奨している。

#### A.6.2.0060 #TIB 

The function of #TIB has been superseded by SOURCE.

#### A.6.2.0200 .( 

Typical use: .( ccc) 

#### A.6.2.0210 .R 

In .R, "R" is short for RIGHT.

#### A.6.2.0340 2>R 

Historically, 2>R has been used to implement DO. Hence the order of parameters on the return stack.

歴史的に、DOの実装には2>Rが使われてきた。従って、リターン・スタック上のパラメーターの順序も同じである。

The primary advantage of 2>R is that it puts the top stack entry on the top of the return stack. For instance,  a double-cell number may be transferred to the return stack and still have the most significant cell accessible  on the top of the return stack.

2>R の主な利点は、リターン・スタックの最上位にスタック・エントリーを置くことである。例えば、ダブル・セル数がリターン・スタックに転送されても、最上位セルがリターン・ スタックの最上位にアクセスできる。

#### A.6.2.0410 2R> 

2R>はR> R>と等価ではないことに注意。その代わり、2>R(A.6.2.0340参照)の動作を反映する。

#### A.6.2.0455 :NONAME 

:NONAME allows a user to create an execution token with the semantics of a colon definition without an associated name. Previously, only : (colon) could create an execution token with these semantics. Thus,  Forth code could only be compiled using the syntax of :, that is:

NONAMEを使用すると、コロン定義のセマンティクスを持つ実行トークンを、関連する名前なしで作成できます。これまでは、: (コロン) だけがこれらのセマンティクスを持つ実行トークンを作成できました。したがって、Forthコードは:の構文を使用してのみコンパイルできました：

    : NAME ... ; 

:NONAME removes this constraint and places the Forth compiler in the hands of the programmer.

:NONAMEはこの制約を取り除き、Forthコンパイラをプログラマの手に委ねる。

:NONAME can be used to create application-specific programming languages. One technique is to mix Forth code fragments with application-specific constructs. The application-specific constructs use  :NONAME to compile the Forth code and store the corresponding execution tokens in data structures.

:NONAMEはアプリケーション固有のプログラミング言語を作成するために使用できます。一つのテクニックはForthのコードフラグメントとアプリケーション固有の構成要素を混ぜることです。アプリケーション固有の構成要素は:NONAMEを使ってForthコードをコンパイルし、対応する実行トークンをデータ構造に格納します。

The functionality of :NONAME can be built on any Forth system. For years, expert Forth programmers have  exploited intimate knowledge of their systems to generate unnamed code fragments. Now, this function has  been named and can be used in a portable program.

:NONAMEの機能はどんなForthシステムでも構築可能です。何年もの間、熟練したForthプログラマーはシステムの深い知識を利用して、名前のないコードフラグメントを生成してきた。今、この関数は名前が付けられ、移植可能なプログラムで使用することができる。

For example, :NONAME can be used to build a table of code fragments where indexing into the table allows  executing a particular fragment. The declaration syntax of the table is:  

例えば、:NONAMEを使ってコード・フラグメントのテーブルを作成し、そのテーブルにインデックスを付けることで、特定のフラグメントを実行することができる。テーブルの宣言構文は以下の通りである：

    :NONAME .. code for command 0 .. ; 0 CMD ! 
    :NONAME .. code for command 1 .. ; 1 CMD ! 
        ...
    :NONAME .. code for command 99 .. ; 99 CMD ! 

    ... 5 CMD @ EXECUTE ...

The definitions of the table building words are:  

    CREATE CMD-TABLE \ table for command execution tokens  
       100 CELLS ALLOT 

    : CMD ( n -- a-addr ) \ nth element address in table 
       CELLS CMD-TABLE + ; 

As a further example, a defining word can be created to allow performance monitoring. In the example  below, the number of times a word is executed is counted. : must first be renamed to allow the definition of  the new ;.

さらなる例として、パフォーマンス・モニターを可能にする定義語を作成することができる。以下の例では、ワードの実行回数をカウントしている。

    : DOCOLON ( -- ) 
    \ Modify CREATEd word to execute like a colon def 
      DOES> ( i*x a-addr -- j*x ) 
       1 OVER +! \ count executions 
       CELL+ @ EXECUTE \ execute :NONAME definition 
    ;
    : OLD: : ; \ just an alias 
    OLD: : ( "name" -- a-addr xt colon-sys )
    \ begins an execution-counting colon definition 
        CREATE HERE 0 ,     \ storage for execution counter 
        0 ,                 \ storage for execution token 
        DOCOLON             \ set run time for CREATEd word 
        :NONAME             \ begin unnamed colon definition 
    ;

(Note the placement of DOES>: DOES> must modify the CREATEd word and not the :NONAME definition, so DOES> must execute before :NONAME.)  

(DOES>の配置に注意： DOES>は:NONAMEの定義ではなくCREATEdの単語を変更しなければならないので、DOES>は:NONAMEの前に実行されなければならない)。

    OLD: ; ( a-addr xt colon-sys -- )  
    \ ends an execution-counting colon definition ) 
        POSTPONE ; \ complete compilation of colon def 
        SWAP CELL+ ! \ save execution token 
    ; IMMEDIATE 

The new : and ; are used just like the standard ones to define words:  

新しい`:`と`;`は、単語を定義するために標準的なものと同じように使われる：

    ... : xxx ... ; ... xxx ...

Now however, these words may be "ticked" to retrieve the count (and execution token):  

しかし現在では、これらの単語を "チック"してカウント（と実行トークン）を取り出すことができる。

    ... ' xxx >BODY ? ...

#### A.6.2.0620 ?DO 

Typical use: 

    : FACTORIAL ( +n1 -- +n2 ) 1 SWAP 1+ ?DO I * LOOP ; 

This word was added in response to many requests for a resolution of the difficulty introduced by Forth-83's  DO, which on a 16-bit system will loop 65,535 times if given equal arguments. As this Standard also  encourages 32-bit systems, this behavior can be intolerable. The Technical Committee considered applying  these semantics to DO, but declined on the grounds that it might break existing code.

この単語は、Forth-83のDOによってもたらされた難題を解決してほしいという多くの要望に応えて追加されたもので、16ビット・システム上では、等しい引数が与えられると65,535回ループしてしまいます。本標準は32ビット・システムも推奨しているため、この動作は耐え難いものです。技術委員会はこれらのセマンティクスをDOに適用することを検討したが、既存のコードを壊すかもしれないという理由で断念した。

#### A.6.2.0700 AGAIN 

Typical use: : X ... BEGIN ... AGAIN ... ; 

Unless word-sequence has a way to terminate, this is an endless loop.

#### A.6.2.0855 C" 

Typical use: : X ... C" ccc" ... ; 

It is easy to convert counted strings to pointer/length but hard to do the opposite. C" is the only new word  that uses the "address of counted string" stack representation. It is provided as an aid to porting existing  programs to ANS Forth systems. It is relatively difficult to implement C" in terms of other standard words,  considering its "compile string into the current definition" semantics.

カウントされた文字列をポインタ／長さに変換するのは簡単だが、その逆は難しい。C」は、「カウント文字列のアドレス」スタック表現を使用する唯一の新しい単語です。これは、既存のプログラムをANS Forthシステムに移植するための補助として提供される。C "の「文字列を現在の定義にコンパイルする」というセマンティクスを考慮すると、他の標準語の観点からC "を実装することは比較的困難である。

Users of C" are encouraged to migrate their application code toward the consistent use of the preferred "c-addr u" stack representation with the alternate word S". This may be accomplished by converting application words with counted string input arguments to use the preferred "c-addr u" representation, thus  eliminating the need for C" .

C"のユーザは、代替語S"を使用した好ましい "c-addr u"スタック表現の一貫した使用に向けて、アプリケーションコードを移行することが推奨される。これは、カウントされた文字列入力引数を持つアプリケーションワードを、好ましい "c-addr u "表現を使用するように変換することによって達成することができる。

See: **A.3.1.3.4 Counted strings**.

#### A.6.2.0873 CASE 

Typical use:  

    : X ...
        CASE 
            test1 OF ... ENDOF 
            testn OF ... ENDOF 
            ... ( default ) 
        ENDCASE ...
    ; 

#### A.6.2.0945 COMPILE, 

COMPILE, is the compilation equivalent of EXECUTE. In many cases, it is possible to compile a word by  using POSTPONE without resorting to the use of COMPILE,. However, the use of POSTPONE requires  that the name of the word must be known at compile time, whereas COMPILE, allows the word to be  located at any time. It is sometime possible to use EVALUATE to compile a word whose name is not known  until run time. This has two possible problems:  

- EVALUATE is slower than COMPILE, because a dictionary search is required.
- The current search order affects the outcome of EVALUATE.

In traditional threaded-code implementations, compilation is performed by , (comma). This usage is not  portable; it doesn't work for subroutine-threaded, native code, or relocatable implementations. Use of  COMPILE, is portable.

COMPILE,はEXECUTEに相当するコンパイルである。多くの場合、COMPILE,を使用しなくても、POSTPONEを使用して単語をコンパイルすることが可能である。しかし、POSTPONEを使うには、コンパイル時に単語の名前がわかっていなければならない。EVALUATEを使用して、実行時まで名前がわからない単語をコンパイルすることができる。これには2つの問題がある：  

- 辞書検索が必要なため、EVALUATEはCOMPILEよりも遅い。
- 現在の検索順序はEVALUATEの結果に影響する。

従来のスレッド・コード実装では、コンパイルは , (コンマ) で実行される。この使用法は移植性がなく、サブルーチン・スレッド、ネイティブ・コード、再配置可能な実装では機能しない。COMPILE,の使用は移植性がある。

In most systems it is possible to implement COMPILE, so it will generate code that is optimized to the  same extent as code that is generated by the normal compilation process. However, in some  implementations there are two different "tokens" corresponding to a particular definition name: the normal "execution token" that is used while interpreting or with EXECUTE, and another "compilation token" that is used while compiling. It is not always possible to obtain the compilation token from the execution token.  In these implementations, COMPILE, might not generate code that is as efficient as normally compiled  code.

ほとんどのシステムでは、COMPILEを実装することで、通常のコンパイル処理で生成されるコードと同程度に最適化されたコードを生成することが可能です。しかし、実装によっては、特定の定義名に対応する2つの異なる "トークン "が存在します。解釈中またはEXECUTE中に使用される通常の "実行トークン "と、コンパイル中に使用されるもう1つの "コンパイル・トークン "です。実行トークンからコンパイル・トークンを取得できるとは限りません。 このような実装では、COMPILEは通常のコンパイルされたコードほど効率的なコードを生成しないかもしれない。

#### A.6.2.0970 CONVERT 

CONVERT may be defined as follows:  

    : CONVERT CHAR+ 65535 >NUMBER DROP ; 

#### A.6.2.1342 ENDCASE 

Typical use:  

    : X ...
        CASE 
            test1 OF ... ENDOF 
            testn OF ... ENDOF 
            ... ( default ) 
        ENDCASE ...
    ; 

#### A.6.2.1343 ENDOF 

Typical use:  

    : X ...
        CASE 
            test1 OF ... ENDOF 
            testn OF ... ENDOF 
            ... ( default ) 
        ENDCASE ...
    ; 

#### A.6.2.1390 EXPECT 

Specification of positive integer counts (+n) for EXPECT allows some implementors to continue their  practice of using a zero or negative value as a flag to trigger special behavior. Insofar as such behavior is  outside the Standard, Standard Programs cannot depend upon it, but the Technical Committee doesn't wish  to preclude it unnecessarily. Since actual values are almost always small integers, no functionality is  impaired by this restriction.

EXPECTに正の整数カウント(+n)を指定することで、一部の実装者は特別な動作を引き起こすフラグとして0または負の値を使用する習慣を継続することができます。そのような動作が標準の外にある限り、標準プログラムはそれに依存することはできませんが、技術委員会は不必要にそれを排除することは望んでいません。実際の値はほとんど常に小さな整数であるため、この制限によって機能が損なわれることはない。

#### A.6.2.1850 MARKER 

As dictionary implementations have gotten more elaborate and in some cases have used multiple address  spaces, FORGET has become prohibitively difficult or impossible to implement on many Forth systems.  MARKER greatly eases the problem by making it possible for the system to remember "landmark  information" in advance that specifically marks the spots where the dictionary may at some future time have  to be rearranged.

辞書の実装がより精巧になり、場合によっては複数のアドレス空間が使用されるようになると、 FORGET は多くの Forth システムで実装することが法外に難しくなったり、不可能になったりしました。 MARKERは、将来辞書を並べ替えなければならなくなる可能性のある場所を具体的に示す 「ランドマーク情報」をシステムに事前に記憶させることで、この問題を大幅に緩和します。

#### A.6.2.1950 OF 

Typical use:  

    : X ...
        CASE 
            test1 OF ... ENDOF 
            testn OF ... ENDOF 
            ... ( default ) 
        ENDCASE ...
    ; 

#### A.6.2.2000 PAD 

PAD has been available as scratch storage for strings since the earliest Forth implementations. It was  brought to our attention that many programmers are reluctant to use PAD, fearing incompatibilities with  system uses. PAD is specifically intended as a programmer convenience, however, which is why we  documented the fact that no standard words use it.

PADは、初期のForth実装から文字列のスクラッチ・ストレージとして利用可能でした。多くのプログラマが、システム用途との非互換性を恐れてPADの使用に消極的であることが、私たちの知るところとなりました。しかし、PADは特にプログラマーの利便性を意図したものであり、標準的な単語では使用されていないという事実を文書化したのはそのためです。

#### A.6.2.2008 PARSE 

Typical use: char PARSE ccc&lt;char> 

The traditional Forth word for parsing is WORD. PARSE solves the following problems with WORD:  

a) WORD always skips leading delimiters. This behavior is appropriate for use by the text interpreter,  which looks for sequences of non-blank characters, but is inappropriate for use by words like ( , .( ,  and ." . Consider the following (flawed) definition of .( :  

伝統的なForthの構文解析のための単語はWORDです。PARSE は WORD の以下の問題を解決します：  

a) WORDは常に先頭の区切り文字をスキップする。この動作は、空白でない文字のシーケンスを検索するテキスト・インタプリタの使用には適していますが、( , .( , .")のような単語の使用には不適切です。. 次のような（欠陥のある） .( )の定義を考えてみよう：

    : .( [CHAR] ) WORD COUNT TYPE ; IMMEDIATE 

This works fine when used in a line like:  

    .( HELLO) 5 .

but consider what happens if the user enters an empty string:  

    .( ) 5 .

The definition of .( shown above would treat the ) as a leading delimiter, skip it, and continue  consuming characters until it located another ) that followed a non-) character, or until the parse area  was empty. In the example shown, the 5 . would be treated as part of the string to be printed.

With PARSE, we could write a correct definition of .( :  

上に示した.の定義は、)を先頭の区切り文字として扱い、それをスキップして、)でない文字に続く別の)を見つけるまで、あるいは解析領域が空になるまで、文字の消費を続ける。この例では、5 . は出力される文字列の一部として扱われます。

PARSEを使えば、.PARSEの正しい定義を書くことができる。

    : .( [CHAR] ) PARSE TYPE ; IMMEDIATE 

This definition avoids the "empty string" anomaly.

この定義により、「空文字列」の異常が回避される。

b) WORD returns its result as a counted string. This has four bad effects:  

b) WORDはその結果をカウントされた文字列として返す。これには4つの悪い影響がある：  

1) The characters accepted by WORD must be copied from the input buffer into a temporary buffer, in order to make room for the count character that must be at the beginning of the counted string. The  copy step is inefficient, compared to PARSE, which leaves the string in the input buffer and doesn't  need to copy it anywhere.

1) WORDが受け付けた文字は、カウントされた文字列の先頭になければならな いカウント文字のスペースを確保するために、入力バッファから一時バッファにコピー されなければならない。文字列を入力バッファに残し、どこにもコピーする必要がないPARSEに比べ、コピーステップは非効率的である。

2) WORD must be careful not to store too many characters into the temporary buffer, thus overwriting something beyond the end of the buffer. This adds to the overhead of the copy step. (WORD may have  to scan a lot of characters before finding the trailing delimiter.)

2) WORDは、一時バッファにあまり多くの文字を格納しないように注意する必要があり、その結果、バッファの終端を超えて何かを上書きしてしまう。これはコピー・ステップのオーバーヘッドを増やすことになる。(WORDは、末尾の区切り文字を見つける前に、多くの文字をスキャンしなければならないかもしれない)。

3) The count character limits the length of the string returned by WORD to 255 characters (longer strings can easily be stored in blocks!). This limitation does not exist for PARSE.

3) カウント文字により、WORDが返す文字列の長さは255文字に制限される（より長い文字列はブロックに簡単に格納できる！）。この制限はPARSEには存在しない。

4) The temporary buffer is typically overwritten by the next use of WORD. This introduces a temporal dependency; the value returned by WORD is only valid for a limited duration. PARSE has a temporal  dependency, too, related to the lifetime of the input buffer, but that is less severe in most cases than  WORD's temporal dependency.

4) 一時バッファは通常、次の WORD の使用で上書きされる。WORD が返す値は限られた期間しか有効ではありません。PARSEにも、入力バッファの寿命に関連する時間依存性がありますが、ほとんどの場合、WORDの時間依存性よりも深刻ではありません。

The behavior of WORD with respect to skipping leading delimiters is useful for parsing blank-delimited  names. Many system implementations include an additional word for this purpose, similar to PARSE with  respect to the "c-addr u" return value, but without an explicit delimiter argument (the delimiter set is  implicitly "white space"), and which does skip leading delimiters. A common description for this word is:  

先頭の区切り文字をスキップするWORDの動作は、空白で区切られた名前の解析に有用である。多くのシステム実装では、この目的のために、"c-addr u "戻り値に関してはPARSEに似ているが、明示的なデリミタ引数を持たず（デリミタセットは暗黙的に "空白 "である）、先頭のデリミタをスキップする追加語を含んでいる。この単語の一般的な説明は以下の通りである：

    PARSE-WORD ( "<spaces>name" -- c-addr u )  

Skip leading spaces and parse name delimited by a space. c-addr is the address within the input buffer  and u is the length of the selected string. If the parse area is empty, the resulting string has a zero  length.

c-addrは入力バッファ内のアドレス、uは選択された文字列の長さである。パース領域が空の場合、結果の文字列の長さは0である。

If both PARSE and PARSE-WORD are present, the need for WORD is largely eliminated.

PARSEとPARSE-WORDの両方が存在する場合、WORDの必要性はほとんどなくなる。

#### A.6.2.2030 PICK 

0 PICK is equivalent to DUP and 1 PICK is equivalent to OVER.

0 PICKはDUPと同等であり、1 PICKはOVERと同等である。

#### A.6.2.2040 QUERY 

The function of QUERY may be performed with ACCEPT and EVALUATE.

QUERYの機能は、ACCEPTとEVALUATEで実行することができる。

#### A.6.2.2125 REFILL 

This word is a useful generalization of QUERY. Re-defining QUERY to meet this specification would have  broken existing code. REFILL is designed to behave reasonably for all possible input sources. If the input  source is coming from the user, as with QUERY, REFILL could still return a false value if, for instance, a  communication channel closes so that the system knows that no more input will be available.

この単語はQUERYの有用な一般化である。この仕様に合わせてQUERYを再定義すると、既存のコードが壊れてしまう。REFILLは、すべての入力ソースに対して合理的に動作するように設計されている。入力ソースがユーザーからの場合、QUERYと同様に、REFILLは、例えば、通信チャネルが閉じ、それ以上入力ができないことをシステムが知っている場合でも、偽の値を返す可能性がある。

#### A.6.2.2150 ROLL 

2 ROLL is equivalent to ROT, 1 ROLL is equivalent to SWAP and 0 ROLL is a null operation.

2 ROLLはROTと等価、1 ROLLはSWAPと等価、0 ROLLはNULL操作である。

#### A.6.2.2182 SAVE-INPUT 

SAVE-INPUT and RESTORE-INPUT allow the same degree of input source repositioning within a text  file as is available with BLOCK input. SAVE-INPUT and RESTORE-INPUT "hide the details" of the  operations necessary to accomplish this repositioning, and are used the same way with all input sources.  This makes it easier for programs to reposition the input source, because they do not have to inspect several  variables and take different action depending on the values of those variables.

SAVE-INPUTとRESTORE-INPUTは、BLOCK入力と同程度の入力ソースのテキストファイル内での再配置を可能にします。SAVE-INPUTとRESTORE-INPUTは、この再配置を達成するために必要な操作の「詳細を隠す」ものであり、すべての入力ソースで同じように使用される。 このため、プログラムは複数の変数を検査し、それらの変数の値によって異なるアクションを取る必要がないため、入力ソースの再配置が容易になる。

SAVE-INPUT and RESTORE-INPUT are intended for repositioning within a single input source; for  example, the following scenario is NOT allowed for a Standard Program:  

SAVE-INPUTとRESTORE-INPUTは、1つの入力ソース内での再配置を目的としている。例えば、以下のシナリオは標準規格のプログラムとして*許されない*。

    : XX 
        SAVE-INPUT CREATE 
        S" RESTORE-INPUT" EVALUATE 
        ABORT" couldn't restore input" 
    ;
 
This is incorrect because, at the time RESTORE-INPUT is executed, the input source is the string via  EVALUATE, which is not the same input source that was in effect when SAVE-INPUT was executed.

The following code is allowed:  

なぜなら、RESTORE-INPUTが実行された時点で、入力ソースはEVALUATE経由の文字列であり、SAVE-INPUTが実行されたときと同じ入力ソースではないからである。

次のコードは許される：

    : XX 
        SAVE-INPUT CREATE 
        S" .( Hello)" EVALUATE 
        RESTORE-INPUT ABORT" couldn't restore input" 
    ;
 
After EVALUATE returns, the input source specification is restored to its previous state, thus SAVE-INPUT and RESTORE-INPUT are called with the same input source in effect.

In the above examples, the EVALUATE phrase could have been replaced by a phrase involving INCLUDE-FILE and the same rules would apply.

The Standard does not specify what happens if a program violates the above rules. A Standard System  might check for the violation and return an exception indication from RESTORE-INPUT, or it might fail in  an unpredictable way.

The return value from RESTORE-INPUT is primarily intended to report the case where the program  attempts to restore the position of an input source whose position cannot be restored. The keyboard might  be such an input source.

Nesting of SAVE-INPUT and RESTORE-INPUT is allowed. For example, the following situation works  as expected:   

EVALUATEが戻った後、入力ソースの指定は以前の状態に戻されるため、SAVE-INPUTとRESTORE-INPUTは同じ入力ソースを有効にして呼び出される。

上記の例では、EVALUATEフレーズをINCLUDE-FILEを含むフレーズに置き換えても、同じ規則が適用される。

標準は、プログラムが上記の規則に違反した場合に何が起こるかを規定していない。標準システムは違反をチェックし、RESTORE-INPUTから例外表示を返すかもしれないし、予測できない方法で失敗するかもしれない。

RESTORE-INPUTからの戻り値は、主に、位置が復元できない入力ソースの位置をプログラムが復元しようとした場合を報告することを意図している。キーボードはそのような入力ソースかもしれない。

SAVE-INPUTとRESTORE-INPUTの入れ子は許される。例えば、次の状況は期待通りに動作する：

    : XX 
        SAVE-INPUT 
            S" f1" INCLUDED 
            \ The file "f1" includes: 
            \ ... SAVE-INPUT ... RESTORE-INPUT ...
            \ End of file "f1" 
        RESTORE-INPUT ABORT" couldn't restore input" 
    ;
 
In principle, RESTORE-INPUT could be implemented to "always fail", e.g.:  

    : RESTORE-INPUT ( x1 ... xn n -- flag ) 
        0 ?DO DROP LOOP TRUE 
    ;
 
Such an implementation would not be useful in most cases. It would be preferable for a system to leave  SAVE-INPUT and RESTORE-INPUT undefined, rather than to create a useless implementation. In the  absence of the words, the application programmer could choose whether or not to create "dummy"  implementations or to work-around the problem in some other way.

Examples of how an implementation might use the return values from SAVE-INPUT to accomplish the  save/restore function:  

そのような実装はほとんどの場合役に立たないだろう。無駄な実装を作るよりも、SAVE-INPUTとRESTORE-INPUTを未定義のままにすることがシステムにとって望ましいだろう。この言葉がない場合、アプリケーションプログラマーは「ダミー」実装を作るかどうか、あるいは他の方法で問題を回避するかどうかを選択できる。

セーブ/リストア機能を達成するために、実装がSAVE-INPUTからの戻り値をどのように使用するかの例：

 |Input Source|possible stack values  
 |--|--|
 |block|>IN @ BLK @ 2 
 |EVALUATE|>IN @ 1 
 |keyboard|>IN @ 1 
 |text file|>IN @ lo-pos hi-pos 3

These are examples only; a Standard Program may not assume any particular meaning for the individual  stack items returned by SAVE-INPUT.

標準プログラムは、SAVE-INPUTによって返される個々のスタック項目の特定の意味を想定してはならない。

#### A.6.2.2290 TIB 

The function of TIB has been superseded by SOURCE.

#### A.6.2.2295 TO 

Historically, some implementations of TO have not explicitly parsed. Instead, they set a mode flag that is  tested by the subsequent execution of name. ANS Forth explicitly requires that TO must parse, so that TO's  effect will be predictable when it is used at the end of the parse area.

歴史的に、TOのいくつかの実装は明示的に解析を行ってこなかった。その代わりに、モード・フラグを設定し、その後の name の実行でテストされます。ANS Forthは、TOが解析領域の最後で使用されたときにTOの効果が予測できるように、TOが解析されなければならないことを明示的に要求しています。

Typical use: x TO name 

#### A.6.2.2298 TRUE 

TRUE is equivalent to the phrase 0 0=.

#### A.6.2.2405 VALUE 

Typical use:  

    0 VALUE DATA 
    : EXCHANGE ( n1 -- n2 ) DATA SWAP TO DATA ; 

EXCHANGE leaves n1 in DATA and returns the prior value n2.

#### A.6.2.2440 WITHIN 

We describe WITHIN without mentioning circular number spaces (an undefined term) or providing the  code. Here is a number line with the overflow point (o) at the far right and the underflow point (u) at the far  left:  

循環数空間（未定義の用語）については言及せず、コードも提供せずに、WITHINについて説明する。右端にオーバーフロー点(o)、左端にアンダーフロー点(u)を持つ数直線：

u--------------------------------------------------------------o  

There are two cases to consider: either the n2|u2..n3|u3 range straddles the overflow/underflow points or it  does not. Lets examine the non-straddle case first:  

n2|u2..n3|u3の範囲がオーバーフロー/アンダーフローのポイントをまたぐ場合と、またがない場合です。まず、跨がない場合を検証してみよう：

u-------------------[.....................)------------------------o  

The [ denotes n2|u2, the ) denotes n3|u3, and the dots and [ are numbers WITHIN the range. n3|u3 is greater  than n2|u2, so the following tests will determine if n1|u1 is WITHIN n2|u2 and n3|u3:  

n3|u3はn2|u2より大きいので、以下のテストはn1|u1がn2|u2およびn3|u3の範囲内にあるかどうかを判定する：

    n2|u2 ≤ n1|u1 and n1|u1 < n3|u3.

In the case where the comparison range straddles the overflow/underflow points:

比較範囲がオーバーフロー/アンダーフローのポイントをまたぐ場合：

u...............)-----------------------------[........................o  

n3|u3 is less than n2|u2 and the following tests will determine if n1|u1 is WITHIN n2|u2 and n3|u3:  

n3|u3はn2|u2より小さく、次のテストはn1|u1がn2|u2およびn3|u3内にあるかどうかを判定する：

    n2|u2 ≤ n1|u1 or n1|u1 < n3|u3.

WITHIN must work for both signed and unsigned arguments. One obvious implementation does not work:  

WITHINは符号付きと符号なしの両方の引数に対して機能しなければならない。ある明らかな実装は動作しない：

    : WITHIN ( test low high -- flag ) 
        >R OVER < 0= ( test flag1 ) SWAP R> < ( flag1 flag2 ) AND 
    ; 

Assume two's-complement arithmetic on a 16-bit machine, and consider the following test:  

16ビットマシンでの2の補数演算を仮定し、次のテストを考えてみよう：

    33000 32000 34000 WITHIN 

The above implementation returns false for that test, even though the unsigned number 33000 is clearly  within the range {{32000 .. 34000}}.

The problem is that, in the incorrect implementation, the signed comparison &lt; gives the wrong answer when 32000 is compared to 33000, because when those numbers are treated as signed numbers, 33000 is treated as negative 32536, while 32000 remains positive.

上記の実装では、符号なし数33000が明らかに範囲{{32000 .. 34000}}内であるにもかかわらず、このテストでは偽を返します。

なぜなら、これらの数値が符号付き数値として扱われるとき、33000は負の32536として扱われ、32000は正のままだからです。

    1 -5 5 WITHIN 

Replacing &lt; with `U<` in the above implementation makes it work with unsigned numbers, but causes  problems with certain signed number ranges; in particular, the test:  would give an incorrect answer.

For two’s-complement machines that ignore arithmetic overflow (most machines), the following  implementation works in all cases:  

上記の実装で<を`U<`に置き換えると、符号なし数値では動作するが、特定の符号付き数値範囲では問題が発生する。

算術オーバーフローを無視する2の補数マシン（ほとんどのマシン）では、以下の実装はすべてのケースで動作する：

    : WITHIN ( test low high -- flag ) OVER - >R - R> U< ; 

#### A.6.2.2530 [COMPILE] 

Typical use  : name2 ... [COMPILE] name1 ... ; IMMEDIATE

#### A.6.2.2535 \ 

Typical use:  5 CONSTANT THAT  \  THIS IS A COMMENT ABOUT THAT

## A.7 The optional Block word set 

Early Forth systems ran stand-alone, with no host OS. Blocks of 1024 bytes were designed as a convenient  unit of disk, and most native Forth systems still use them. It is relatively easy to write a native disk driver  that maps head/track/sector addresses to block numbers. Such disk drivers are extremely fast in comparison  with conventional file-oriented operating systems, and security is high because there is no reliance on a disk  map.

Today many Forth implementations run under host operating systems, because the compatibility they offer  the user outweighs the performance overhead. Many people who use such systems prefer using host OS  files only; however, people who use both native and non-native Forths need a compatible way of accessing  disk. The Block Word set includes the most common words for accessing program source and data on disk.

In order to guarantee that Standard Programs that need access to mass storage have a mechanism  appropriate for both native and non-native implementations, ANS Forth requires that the Block word set be  available if any mass storage facilities are provided. On non-native implementations, blocks normally  reside in host OS files.

初期のForthシステムは、ホストOSなしでスタンドアロンで動作していた。1024バイトのブロックは、ディスクの便利な単位として設計され、ほとんどのネイティブForthシステムは今でもこれを使用しています。ヘッド/トラック/セクター・アドレスをブロック番号にマッピングするネイティブ・ディスク・ドライバを書くのは比較的簡単だ。このようなディスク・ドライバは、従来のファイル指向オペレーティング・システムと比較して非常に高速であり、ディスク・マップに依存しないためセキュリティも高い。

今日、多くのForth実装はホストOSの下で実行されているが、これは、それらがユーザーに提供する互換性が性能のオーバーヘッドを上回るからである。このようなシステムを使用する多くの人々は、ホストOSのファイルのみを使用することを好みますが、ネイティブと非ネイティブの両方のForthを使用する人々は、互換性のあるディスクアクセス方法を必要とします。ブロックワードセットには、プログラムソースやディスク上のデータにアクセスするための最も一般的なワードが含まれています。

大容量記憶装置へのアクセスが必要な標準プログラムに、ネイティブと非ネイティブの両方の実装に適したメカニズムを保証するために、ANS Forthでは、大容量記憶装置が提供されている場合は、ブロック単語セットを使用できるようにする必要があります。非ネイティブ実装では、ブロックは通常ホストOSのファイルに存在します。

### A.7.2 Additional terms 

<miniterm>

||block||
Many Forth systems use blocks to contain program source. Conventionally such blocks are formatted for  editing as 16 lines of 64 characters. Source blocks are often referred to as "screens".

多くのForthシステムでは、プログラム・ソースを格納するためにブロックを使用します。通常、このようなブロックは64文字の16行として編集できるようにフォーマットされています。ソース・ブロックはしばしば「スクリーン」と呼ばれます。

</miniterm>

### A.7.6 Glossary 

##### A.7.6.2.2190 SCR 

SCR is short for screen.

## A.8 The optional Double-Number word set 

Forth systems on 8-bit and 16-bit processors often find it necessary to deal with double-length numbers.  But many Forths on small embedded systems do not, and many users of Forth on systems with a cell size of  32-bits or more find that the necessity for double-length numbers is much diminished. Therefore, we have factored the words that manipulate double-length entities into this optional word set.

Please note that the naming convention used in this word set conveys some important information:  

1. Words whose names are of the form 2xxx deal with cell pairs, where the relationship between the cells is unspecified. They may be two-vectors, double-length numbers, or any pair of cells that it is  convenient to manipulate together.
2. Words with names of the form Dxxx deal specifically with double-length integers.
3. Words with names of the form Mxxx deal with some combination of single and double integers. The order in which these appear on the stack is determined by long-standing common practice.

8ビットや16ビットのプロセッサ上のForthシステムは、しばしば倍長数を扱う必要性を見出す。 しかし、小さな組み込みシステム上の多くのForthはそうではありませんし、32ビット以上のセルサイズを持つシステム上のForthの多くのユーザーは、倍長数の必要性がかなり減少していることに気づきます。そのため、倍長エンティティを操作する単語をこのオプションの単語セットに組み込みました。

この単語セットで使われている命名規則が、いくつかの重要な情報を伝えていることに注意してください：  

1. 2xxx という形の名前を持つ単語は、セル間の関係が特定されていないセル対を扱 う。これらは2つのベクトルであってもよいし、2つの長さの数であってもよいし、一緒に操作するのに便利なセルのペアであれば何でもよい。
2. Dxxxという形の名前を持つ単語は、特に倍長整数を扱う。
3. Mxxxという形の名前を持つ単語は、単整数と倍長整数の組み合わせを扱う。これらがスタック上に現れる順番は、長年の慣習によって決定される。

Refer to A.3.1 for a discussion of data types in Forth.

### A.8.6 Glossary 

##### A.8.6.1.0360 2CONSTANT 

Typical use: x1 x2 2CONSTANT name 

##### A.8.6.1.0390 2LITERAL 

Typical use: : X ... [ x1 x2 ] 2LITERAL ... ; 

##### A.8.6.1.0440 2VARIABLE 

Typical use: 2VARIABLE name 

##### A.8.6.1.1070 D.R 

In D.R, the "R" is short for RIGHT.

##### A.8.6.1.1090 D2* 

See: **A.6.1.0320 2* for applicable discussion**.

##### A.8.6.1.1100 D2/ 

See: **A.6.1.0330 2/ for applicable discussion**.

##### A.8.6.1.1140 D>S 

There exist number representations, e.g., the sign-magnitude representation, where reduction from double to single-precision cannot simply be done with `DROP`. This word, equivalent to `DROP` on two’s complement  systems, desensitizes application code to number representation and facilitates portability.

倍精度から単精度への変換が単純に `DROP` で行えないような数値表現、例えば符号-倍精度表現が存在する。この単語は、2の補数システムの `DROP` と等価であり、アプリケーションコードを数値表現に鈍感にし、移植性を容易にします。

##### A.8.6.1.1820 M*/ 

`M*/` was once described by Chuck Moore as the most useful arithmetic operator in Forth. It is the main  workhorse in most computations involving double-cell numbers. Note that some systems allow signed  divisors. This can cost a lot in performance on some CPUs. The requirement for a positive divisor has not  proven to be a problem.

`M*/` は、かつて Chuck Moore 氏によって Forth で最も有用な算術演算子であると評されました。`M*/` は、Chuck Moore によって Forth で最も有用な算術演算子であると評 価されたことがあります。システムによっては符号付き除数を許容しているものがあることに注意してください。これは、CPUによっては多くのパフォーマンスを犠牲にする可能性があります。正の約数の要件は、問題であることが証明されていません。

##### A.8.6.1.1830 M+ 

M+ is the classical method for integrating.

`M+` は積分の古典的な方法である。

## A.9 The optional Exception word set 

`CATCH` and `THROW` provide a reliable mechanism for handling exceptions, without having to propagate  exception flags through multiple levels of word nesting. It is similar in spirit to the "non-local return"  mechanisms of many other languages, such as C’s setjmp() and longjmp(), and LISP’s `CATCH` and  `THROW`. In the Forth context, `THROW` may be described as a "multi-level `EXIT`", with `CATCH` marking a  location to which a `THROW` may return.

`CATCH` と `THROW` は、例外フラグを複数のレベルの単語の入れ子に伝搬させることなく、例外を処理するための信頼性の高いメカニズムを提供する。これは、C 言語の setjmp() や longjmp() や LISP の `CATCH` や `THROW` など、他の多くの言語の「非ローカルリターン」メカニズムと精神的に似ている。Forth のコンテキストでは、`THROW` は「マルチレベルの `EXIT`」と表現され、`CATCH` は `THROW` が戻る場所を示す。

Several similar Forth "multi-level `EXIT`" exception-handling schemes have been described and used in past  years. It is not possible to implement such a scheme using only standard words (other than `CATCH` and  `THROW`), because there is no portable way to "unwind" the return stack to a predetermined place.

似たような Forth の「マルチレベル `EXIT`」例外処理スキームが過去にいくつか記述され、使用されてきた。このようなスキームを（`CATCH`と`THROW`以外の）標準的な単語だけで実装することは不可能である。

THROW also provides a convenient implementation technique for the standard words `ABORT` and `ABORT"`,  allowing an application to define, through the use of CATCH, the behavior in the event of a system `ABORT`.

THROWはまた、標準語の`ABORT`と`ABORT"`の便利な実装手法を提供し、アプリケーションがシステムの`ABORT`が発生した場合の動作をCATCHを使用して定義することを可能にします。

This sample implementation of `CATCH` and `THROW` uses the non-standard words described below. They or  their equivalents are available in many systems. Other implementation strategies, including directly saving  the value of `DEPTH`, are possible if such words are not available.

この `CATCH` と `THROW` のサンプル実装では、以下に説明する非標準語を使用している。これらまたは同等のものは多くのシステムで利用可能である。DEPTH` の値を直接保存するなど、他の実装方法も可能である。

<miniterm>

||SP@||
( -- addr )
returns the address corresponding to the top of data stack.

はデータスタックの先頭に対応するアドレスを返す。

||SP!||
( addr -- )
sets the stack pointer to addr, thus restoring the stack depth to the same depth that  existed just before addr was acquired by executing `SP@`.

はスタックポインタを addr に設定するため、スタックの深さを `SP@` を実行して addr を取得する直前の深さに戻す。

||RP@||
( -- addr )
returns the address corresponding to the top of return stack.

は、リターン・スタックの先頭に対応するアドレスを返す。

||RP!||
( addr -- )
sets the return stack pointer to addr, thus restoring the return stack depth to the same  depth that existed just before addr was acquired by executing `RP@`.

戻りスタックポインタを addr に設定し、戻りスタックの深さを `RP@` を実行して addr が取得される直前の深さに戻す。

</miniterm>

    VARIABLE HANDLER 0 HANDLER ! \ last exception handler  
    : CATCH ( xt -- exception# | 0 ) \ return addr on stack 
        SP@ >R ( xt ) \ save data stack pointer 
        HANDLER @ >R ( xt ) \ and previous handler 
        RP@ HANDLER ! ( xt ) \ set current handler 
        EXECUTE ( ) \ execute returns if no THROW 
        R> HANDLER ! ( ) \ restore previous handler 
        R> DROP ( ) \ discard saved stack ptr 
        0 ( 0 ) \ normal completion 
    ;
    : THROW ( ??? exception# -- ??? exception# ) 
        ?DUP IF ( exc# ) \ 0 THROW is no-op 
            HANDLER @ RP! ( exc# ) \ restore prev return stack 
            R> HANDLER ! ( exc# ) \ restore prev handler 
            R> SWAP >R ( saved-sp ) \ exc# on return stack 
            SP! DROP R> ( exc# ) \ restore stack 
            \ Return to the caller of CATCH because return 
            \ stack is restored to the state that existed 
            \ when CATCH began execution 
        THEN 
    ;

In a multi-tasking system, the `HANDLER` variable should be in the per-task variable area (i.e., a user  variable).

マルチタスクシステムでは、 `HANDLER` 変数はタスク単位の変数領域（つまり、ユーザー変数）にあるべきである。

This sample implementation does not explicitly handle the case in which `CATCH` has never been called (i.e.,  the `ABORT` behavior). One solution is to add the following code after the `IF` in `THROW`:  

このサンプルの実装では、 `CATCH` が一度も呼ばれなかった場合（つまり `ABORT` の動作）を明示的に処理していない。一つの解決策は、`THROW`の`IF`の後に以下のコードを追加することである：  

    HANDLER @ 0= IF ( empty the stack ) QUIT THEN  

Another solution is to execute `CATCH` within `QUIT`, so that there is always an "exception handler of last  resort" present. For example:   

もう一つの解決策は、`QUIT` の中で `CATCH` を実行し、常に「最後の手段の例外ハンドラ」が存在するようにすることである。例えば

    : QUIT 
        ( empty the return stack and ) 
        ( set the input source to the user input device ) 
        POSTPONE [ 
        BEGIN 
            REFILL 
        WHILE 
            ['] INTERPRET CATCH 
            CASE 
                0 OF STATE @ 0= IF ." OK" THEN CR ENDOF 
                -1 OF ( Aborted) ENDOF 
                -2 OF ( display message from ABORT" ) ENDOF 
                ( default ) DUP ." Exception # " .
            ENDCASE 
        REPEAT BYE 
    ;
 
This example assumes the existance of a system-implementation word `INTERPRET` that embodies the text  interpreter semantics described in 3.4 The Forth text interpreter. Note that this implementation of `QUIT` automatically handles the emptying of the stack and return stack, due to `THROW`’s inherent restoration of the  data and return stacks. Given this definition of `QUIT`, it’s easy to define:  

この例では、3.4 The Forth text interpreter で説明したテキストインタプリタのセマンティクスを具現化するシステ ム実装語 `INTERPRET` が存在することを想定している。この `QUIT` の実装では、 `THROW` 固有のデータスタックとリターンスタックの復元により、スタックとリターンスタックが空になることを自動的に処理することに注意してください。この `QUIT` の定義があれば、簡単に定義できる：  

    : ABORT -1 THROW ; 

In systems with other stacks in addition to the data and return stacks, the implementation of `CATCH` and  `THROW` must save and restore those stack pointers as well. Such an "extended version" can be built on top  of this basic implementation. For example, with another stack pointer accessed with `FP@` and `FP!` only  `CATCH` needs to be redefined:  

データスタックとリターンスタックに加えて他のスタックを持つシステムでは、 `CATCH` と `THROW` の実装はそれらのスタックポインタを保存してリストアする必要があります。このような「拡張バージョン」は、この基本的な実装の上に構築することができる。例えば、`FP@` と `FP!`でアクセスする別のスタックポインタでは、 `CATCH` のみを再定義する必要がある：

    : CATCH ( xt -- exception# | 0 ) 
        FP@ >R CATCH R> OVER IF FP! ELSE DROP THEN ; 

No change to `THROW` is necessary in this case. Note that, as with all redefinitions, the redefined version of  `CATCH` will only be available to definitions compiled after the redefinition of `CATCH`.

この場合、 `THROW` を変更する必要はない。すべての再定義と同様に、再定義されたバージョンの `CATCH` は `CATCH` の再定義後にコンパイルされた定義でのみ使用できることに注意してください。

`CATCH` and `THROW` provide a convenient way for an implementation to "clean up" the state of open files if  an exception occurs during the text interpretation of a file with `INCLUDE-FILE`. The implementation of  `INCLUDE-FILE` may guard (with `CATCH`) the word that performs the text interpretation, and if `CATCH` returns an exception code, the file may be closed and the exception re`THROW`n so that the files being  included at an outer nesting level may be closed also. Note that the Standard allows, but does not require,  `INCLUDE-FILE` to close its open files if an exception occurs. However, it does require `INCLUDE-FILE` to unnest the input source specification if an exception is THROWn.

CATCH` と `THROW` は、`INCLUDE-FILE` を使用したファイルのテキスト解釈中に例外が発生した場合に、オープンしているファイルの状態を「クリーンアップ」する便利な方法を提供します。INCLUDE-FILE`の実装は、テキスト解釈を行う単語を（`CATCH`で）ガードすることができ、`CATCH`が例外コードを返した場合、ファイルをクローズして例外をre`THROW`nすることができます。スタンダードでは、例外が発生した場合に `INCLUDE-FILE` が開いているファイルをクローズすることを許可しているが、要求していないことに注意してほしい。しかし、例外がスローされた場合、`INCLUDE-FILE`が入力ソース仕様をアンネストすることを要求している。

### A.9.3 Additional usage requirements 

One important use of an exception handler is to maintain program control under many conditions which  `ABORT`. This is practicable only if a range of codes is reserved. Note that an application may overload  many standard words in such a way as to `THROW` ambiguous conditions not normally `THROW`n by a  particular system.

例外ハンドラの重要な使用法の1つは、`ABORT`が発生する多くの条件下でプログラ ムの制御を維持することです。これは、コードの範囲が予約されている場合にのみ実行可能です。アプリケーションは、特定のシステムでは通常 `THROW`n されない曖昧な状態を `THROW` するように、多くの標準語をオーバーロードする可能性があることに注意してください。

#### A.9.3.6 Exception handling 

The method of accomplishing this coupling is implementation dependent. For example, LOAD could "know" about `CATCH` and `THROW` (by using `CATCH` itself, for example), or `CATCH` and `THROW` could "know" about `LOAD` (by maintaining input source nesting information in a data structure known to `THROW`, for example). Under these circumstances it is not possible for a Standard Program to define words such as  `LOAD` in a completely portable way.

この結合を実現する方法は実装に依存する。例えば、LOAD は `CATCH` と `THROW` を（例えば `CATCH` 自身を使うことで）「知っている」かもしれないし、`CATCH` と `THROW` は `LOAD` を（例えば `THROW` が知っているデータ構造で入力ソースのネスティング情報を保持することで）「知っている」かもしれない。このような状況では、標準プログラムでは`LOAD`のような単語を完全に移植可能な方法で 定義することは不可能である。

### A.9.6 Glossary 

##### A.9.6.1.2275 THROW 

If THROW is executed with a non zero argument, the effect is as if the corresponding `CATCH` had returned it.  In that case, the stack depth is the same as it was just before `CATCH` began execution. The values of the *i\*x* stack arguments could have been modified arbitrarily during the execution of xt. In general, nothing useful  may be done with those stack items, but since their number is known (because the stack depth is  deterministic), the application may `DROP` them to return to a predictable stack state.

`THROW` がゼロ以外の引数で実行された場合、対応する `CATCH` がそれを返したかのような効果があります。 この場合、スタックの深さは `CATCH` が実行を開始する直前と同じである。i*x*スタック引数の値は、xtの実行中に任意に変更される可能性がある。一般的に、これらのスタック項目は何の役にも立たないかもしれないが、（スタッ クの深さが決定論的であるため）それらの数はわかっているので、アプリケーションは予 測可能なスタック状態に戻るためにそれらを `DROP` するかもしれない。

Typical use: 

    : could-fail ( -- char ) 
        KEY DUP [CHAR] Q = IF 1 THROW THEN ; 
    : do-it ( a b -- c) 2DROP could-fail ; 
    : try-it ( --) 
        1 2 ['] do-it CATCH IF 
            ( x1 x2 ) 2DROP ." There was an exception" CR 
        ELSE ." The character was " EMIT CR 
        THEN 
    ; 
    : retry-it ( -- ) 
        BEGIN 1 2 ['] do-it CATCH WHILE 
            ( x1 x2) 2DROP ." Exception, keep trying" CR 
        REPEAT ( char ) 
        ." The character was " EMIT CR 
    ; 

## A.10 The optional Facility word set 

### A.10.6 Glossary 

##### A.10.6.1.0742 AT-XY 

Most implementors supply a method of positioning a cursor on a CRT screen, but there is great variance in  names and stack arguments. This version is supported by at least one major vendor.

ほとんどの実装者は、CRT画面上でカーソルを位置決めする方法を提供しているが、名前やスタック引数には大きなばらつきがある。このバージョンは、少なくとも1つの主要ベンダーがサポートしている。

##### A.10.6.1.1755 KEY? 

The Technical Committee has gone around several times on the stack effects. Whatever is decided will  violate somebody’s practice and penalize some machine. This way doesn’t interfere with type-ahead on  some systems, while requiring the implementation of a single-character buffer on machines where polling  the keyboard inevitably results in the destruction of the character.

技術委員会は、スタック効果について何度も議論してきた。決定されたものが何であれ、誰かの慣習に違反し、いくつかのマシンにペナルティを与えることになる。この方法は、キーボードをポーリングすると必然的に文字が破壊されるようなマシンでは1文字バッファの実装を要求する一方で、いくつかのシステムではタイプ・アヘッドに干渉しない。

Use of `KEY` or `KEY?` indicates that the application does not wish to bother with non-character events, so  they are discarded, in anticipation of eventually receiving a valid character. Applications wishing to handle  non-character events must use EKEY and EKEY?. It is possible to mix uses of `KEY?` / `KEY` and `EKEY?` /  `EKEY` within a single application, but the application must use `KEY?` and `KEY` only when it wishes to  discard non-character events until a valid character is received.

`KEY`または`KEY?`の使用は、アプリケーションが文字以外のイベントに煩わされることを望んでいないことを示し、最終的に有効な文字を受信することを見越して、それらは破棄される。文字以外のイベントを処理したいアプリケーションは、EKEYとEKEY? 一つのアプリケーション内で `KEY?` / `KEY` と `EKEY?` / `EKEY` を混在して使用することは可能ですが、アプリケーションは有効な文字を受信するまで非文字イベントを破棄したい場合にのみ `KEY?` と `KEY` を使用しなければなりません。

##### A.10.6.2.1305 EKEY 

`EKEY` provides a standard word to access a system-dependent set of "raw" keyboard events, including  events corresponding to members of the standard character set, events corresponding to other members of  the implementation-defined character set, and keystrokes that do not correspond to members of the  character set.

`EKEY` assumes no particular numerical correspondence between particular event code values and the values  representing standard characters. On some systems, this may allow two separate keys that correspond to the  same standard character to be distinguished from one another.

In systems that combine both keyboard and mouse events into a single "event stream", the single number  returned by `EKEY` may be inadequate to represent the full range of input possibilities. In such systems, a  single "event record" may include a time stamp, the x,y coordinates of the mouse position, the keyboard  state, and the state of the mouse buttons. In such systems, it might be appropriate for `EKEY` to return the  address of an "event record" from which the other information could be extracted.

EKEY`は、システム依存の "生の "キーボードイベントのセットにアクセスするための 標準的な単語を提供します。これには、標準文字セットのメンバーに対応するイベント、 実装で定義された文字セットの他のメンバーに対応するイベント、文字セットのメンバーに 対応しないキーストロークが含まれます。

EKEY`は、特定のイベントコード値と標準文字を表す値の間に特定の数値的な対応関係を仮定していません。システムによっては、これによって同じ標準文字に対応する2つの異なるキーを区別することができるかもしれません。

キーボードとマウスの両方のイベントを1つの「イベントストリーム」にまとめるシス テムでは、`EKEY`が返す1つの数値は、入力の可能性の全範囲を表すには不十分かもしれ ない。そのようなシステムでは、1つの "イベントレコード "は、タイムスタンプ、マウ ス位置のx,y座標、キーボードの状態、マウスボタンの状態を含むかもしれない。そのようなシステムでは、`EKEY`が他の情報を抽出できる「イベントレコード」のアドレスを返すことが適切かもしれない。

Also, consider a hypothetical Forth system running under MS-DOS on a PC-compatible computer. Assume  that the implementation-defined character set is the "normal" 8-bit PC character set. In that character set,  the codes from 0 to 127 correspond to ASCII characters. The codes from 128 to 255 represent characters  from various non-English languages, mathematical symbols, and some graphical symbols used for line  drawing. In addition to those characters, the keyboard can generate various other "scan codes", representing  such non-character events as arrow keys and function keys.

There may be multiple keys, with different scan codes, corresponding to the same standard character. For  example, the character representing the number "1" often appears both in the row of number keys above the  alphabetic keys, and also in the separate numeric keypad.

When a program asks the MS-DOS operating system for a keyboard event, it receives either a single non-zero byte, representing a character, or a zero byte followed by a "scan code" byte, representing a non character keyboard event (e.g., a function key).

また、PC互換コンピュータ上のMS-DOSで動作する仮想のForthシステムを考えてみましょう。実装で定義されている文字セットは、「通常の」8ビットPC文字セットであると仮定します。この文字セットでは、0から127までのコードがASCII文字に対応します。128から255までのコードは、英語以外のさまざまな言語の文字、数学記号、線画に使われるいくつかの図形記号を表しています。これらの文字に加え、キーボードは、矢印キーやファンクションキーなどの非文字イベントを表す様々な「スキャンコード」を生成することができる。

同じ標準文字に対応する、異なるスキャンコードを持つ複数のキーがあってもよい。例えば、数字の「1」を表す文字は、アルファベットキーの上にある数字キーの列と、独立したテンキーパッドの両方に表示されることが多い。

プログラムがMS-DOSオペレーティングシステムにキーボードイベントを要求すると、文字を表すゼロ以外の1バイトか、ゼロバイトの後に「スキャンコード」バイトが続き、文字以外のキーボードイベント（ファンクションキーなど）を表すバイトを受け取ります。

`EKEY` represents each keyboard event as a single number, rather than as a sequence of numbers. For the  system described above, the following would be a reasonable implementation of `EKEY` and related words:  

The MAX-CHAR environmental query would return 255.

Assume the existence of a word DOS-KEY ( -- char ) which executes the MS-DOS "Direct STDIN  Input" system call (Interrupt 21h, Function 07h) and a word `DOS-KEY?` ( -- flag) which executes the  MS-DOS "Check STDIN Status" system call (Interrupt 21h, Function 0Bh).

`EKEY`は各キーボードイベントを一連の数値としてではなく、一つの数値として表します。上記のシステムでは、`EKEY`とそれに関連する単語の実装は以下のようになります：  

MAX-CHAR環境クエリは255を返す。

MS-DOSの "Direct STDIN Input"システムコール(Interrupt 21h, Function 07h)を実行するワードDOS-KEY ( -- char )と、MS-DOSの "Check STDIN Status "システムコール(Interrupt 21h, Function 0Bh)を実行するワード`DOS-KEY?` ( -- flag)が存在すると仮定する。

    : EKEY? ( -- flag ) DOS-KEY? 0<> ; 
    : EKEY ( -- u ) DOS-KEY ?DUP 0= IF DOS-KEY 256 + THEN ; 
    : EKEY>CHAR ( u -- u false | char true ) 
        DUP 255 > IF ( u ) 
            DUP 259 = IF \ 259 is Ctrl-@ (ASCII NUL) 
                DROP 0 TRUE EXIT \ so replace with character 
            THEN FALSE EXIT \ otherwise extended character 
        THEN TRUE \ normal extended ASCII char.
    ; 
    VARIABLE PENDING-CHAR -1 PENDING-CHAR !  
    : KEY? ( -- flag ) 
        PENDING-CHAR @ 0< IF 
            BEGIN EKEY? WHILE 
                EKEY EKEY>CHAR IF 
                    PENDING-CHAR ! TRUE EXIT 
                THEN DROP 
            REPEAT FALSE EXIT 
        THEN TRUE 
    ; 
    : KEY ( -- char ) 
        PENDING-CHAR @ 0< IF 
            BEGIN EKEY EKEY>CHAR 0= WHILE 
                DROP 
            REPEAT EXIT 
        THEN PENDING-CHAR @ -1 PENDING-CHAR ! 
    ;
 
This is a full-featured implementation, providing the application program with an easy way to either handle  non-character events (with `EKEY`), or to ignore them and to only consider "real" characters (with `KEY`).

Note that `EKEY` maps scan codes from 0 to 255 into numbers from 256 to 511. `EKEY` maps the number 259, representing the keyboard combination Ctrl-Shift-@, to the character whose numerical value is 0 (ASCII NUL). Many ASCII keyboards generate ASCII NUL for Ctrl-Shift-@, so we use that key combination for ASCII NUL (which is otherwise unavailable from MS-DOS, because the zero byte signifies  that another scan-code byte follows).

One consequence of using the "Direct STDIN Input" system call (function 7) instead of the "STDIN Input"  system call (function 8) is that the normal DOS "Ctrl-C interrupt" behavior is disabled when the system is  waiting for input (Ctrl-C would still cause an interrupt while characters are being output). On the other  hand, if the "STDIN Input" system call (function 8) were used to implement `EKEY`, Ctrl-C interrupts would  be enabled, but Ctrl-Shift-@ would also cause an interrupt, because the operating system would treat the  second byte of the 0,3 sequence as a Ctrl-C, even though the 3 is really a scan code and not a character.

これはフル機能の実装であり、非文字イベントを(`EKEY`で)処理するか、(`KEY`で)無視して "本当の "文字だけを考慮する簡単な方法をアプリケーションプログラムに提供する。

EKEY`は0から255までのスキャンコードを256から511までの数字にマップすることに注意してください。EKEY` はキーボードの組み合わせである Ctrl-Shift-@ を表す数字 259 を、数値が 0 (ASCII NUL) である文字にマッピングします。多くのASCIIキーボードはCtrl-Shift-@に対してASCII NULを生成するので、このキーの組み合わせをASCII NULに使用する(0バイトは別のスキャンコードバイトが続くことを意味するため、MS-DOSからは使用できない)。

STDIN入力 "システムコール（関数8）の代わりに "直接STDIN入力 "システムコール（関数7）を使用することの結果の1つは、システムが入力を待っているとき、通常のDOSの "Ctrl-C割り込み "動作が無効になることである（文字が出力されている間、Ctrl-Cはまだ割り込みを引き起こす）。一方、"STDIN Input "システムコール(関数8)を使って`EKEY`を実装した場合、Ctrl-C割り込みは有効になりますが、Ctrl-Shift-@も割り込みを引き起こします。これは、オペレーティングシステムが0,3シーケンスの2バイト目をCtrl-Cとして扱うからです。

One "best of both worlds" solution is to use function 8 for the first byte received by `EKEY`, and function 7  for the scan code byte. For example:  

EKEY`が受信した最初のバイトに関数8を使用し、スキャンコードバイトに関数7を使用することで、「両方の良いとこ取り」をすることができます。例えば

    : EKEY ( -- u ) 
        DOS-KEY-FUNCTION-8 ?DUP 0= IF 
            DOS-KEY-FUNCTION-7 DUP 3 = IF 
                DROP 0 ELSE 256 + 
            THEN 
        THEN 
    ;
 
Of course, if the Forth implementor chooses to pass Ctrl-C through to the program, without using it for its  usual interrupt function, then DOS function 7 is appropriate in both cases (and some additional care must be  taken to prevent a typed-ahead Ctrl-C from interrupting the Forth system during output operations).

A Forth system might also choose a simpler implementation of KEY, without implementing `EKEY`, as  follows:  

もちろん、Forthの実装者がCtrl-Cを通常の割り込み機能に使用せずにプログラムに渡すことを選択した場合、DOS関数7はどちらの場合にも適切です（そして、タイプされたCtrl-Cが出力操作中にForthシステムに割り込むのを防ぐために、さらにいくつかの注意を払う必要があります）。

Forthシステムは、`EKEY`を実装することなく、以下のようにKEYをよりシンプルに実装することもできます：

    : KEY ( -- char ) DOS-KEY ; 
    : KEY? ( -- flag ) DOS-KEY? 0<> ; 

The disadvantages of the simpler version are:  

a) An application program that uses `KEY`, expecting to receive only valid characters, might receive a  sequence of bytes (e.g., a zero byte followed by a byte with the same numerical value as the letter "A")  that appears to contain a valid character, even though the user pressed a key (e.g., function key 4) that  does not correspond to any valid character.

b) An application program that wishes to handle non-character events will have to execute `KEY` twice  if it returns zero the first time. This might appear to be a reasonable and easy thing to do. However,  such code is not portable to other systems that do not use a zero byte as an "escape" code. Using the  `EKEY` approach, the algorithm for handling keyboard events can be the same for all systems; the system  dependencies can be reduced to a table or set of constants listing the system-dependent key codes used  to access particular application functions. Without `EKEY`, the algorithm, not just the table, is likely to  be system dependent.

より単純なバージョンの欠点は以下の通りである：  

a) 有効な文字だけを受け取ることを期待して`KEY`を使用するアプリケーションプ ログラムは、ユーザーが有効な文字に対応しないキー（例えばファンクションキー 4）を押したにもかかわらず、有効な文字を含んでいるように見える一連のバイト（例えば、ゼロバイトの後に文字 "A "と同じ数値のバイトが続く）を受け取るかもしれません。

b) 文字以外のイベントを処理したいアプリケーション・プログラムは、 `KEY`を2回実行しなければなりません。これは合理的で簡単に見えるかもしれない。しかし、このようなコードは、ゼロバイトを "エスケープ "コードとして使用しない他のシステムには移植できません。EKEY` アプローチを使うと、キーボードイベントを処理するアルゴリズムはすべてのシス テムで同じにすることができます。システムの依存関係は、特定のアプリケーション機 能にアクセスするために使われるシステム依存のキーコードを列挙したテーブルや定 数セットに減らすことができます。EKEY`がなければ、テーブルだけでなくアルゴリズムもシステム依存になる可能性が高いです。

Another approach to `EKEY` on MS-DOS is to use the BIOS "Read Keyboard Status" function (Interrupt 16h, Function 01h) or the related "Check Keyboard" function (Interrupt 16h, Function 11h). The advantage of this function is that it allows the program to distinguish between different keys that correspond to the  same character (e.g. the two "1" keys). The disadvantage is that the BIOS keyboard functions read only the  keyboard. They cannot be "redirected" to another "standard input" source, as can the DOS STDIN Input  functions.

MS-DOSで`EKEY`を使用するもう1つの方法は、BIOSの "Read Keyboard Status "機能（割り込み16h、ファンクション01h）または関連する "Check Keyboard "機能（割り込み16h、ファンクション11h）を使用することである。この機能の利点は、同じ文字に対応する異なるキー（例えば2つの「1」キー）をプログラムで区別できることです。欠点は、BIOSキーボード機能がキーボードのみを読み取ることである。DOSのSTDIN入力関数のように、別の「標準入力」ソースに「リダイレクト」することはできません。

##### A.10.6.2.1306 EKEY>CHAR 

`EKEY>CHAR` translates a keyboard event into the corresponding member of the character set, if such a  correspondence exists for that event.

`EKEY>CHAR`は、キーボードイベントを文字セットの対応するメンバに変換します。

It is possible that several different keyboard events may correspond to the same character, and other  keyboard events may correspond to no character.

複数の異なるキーボードイベントが同じ文字に対応する可能性があり、他のキーボードイベ ントは文字に対応しない可能性があります。

##### A.10.6.2.1325 EMIT? 

An indefinite delay is a device related condition, such as printer off-line, that requires operator intervention  before the device will accept new data.

不定遅延とは、プリンタがオフラインになっているなど、デバイスに関連する状態であり、 デバイスが新しいデータを受け入れる前にオペレータの操作が必要になることである。

##### A.10.6.2.1905 MS 

Although their frequencies vary, every system has a clock. Since many programs need to time intervals, this  word is offered. Use of milliseconds as an internal unit of time is a practical "least common denominator"  external unit. It is assumed implementors will use "clock ticks" (whatever size they are) as an internal unit  and convert as appropriate.

周波数はさまざまですが、どのシステムにも時計があります。多くのプログラムでは時間間隔を指定する必要があるため、この単語が使用されています。内部時間単位としてのミリ秒の使用は、実用的な "最小公倍数 "の外部単位です。実装者は、内部単位として「時計の目盛り」（その大きさが何であれ）を使用し、適切な変換を行うことを想定しています。

##### A.10.6.2.2292 TIME&DATE 

Most systems have a real-time clock/calendar. This word gives portable access to it.

ほとんどのシステムにはリアルタイム時計/カレンダーがあります。この単語は、この単語へのポータブルなアクセスを提供します。

## A.11 The optional File-Access word set 

Many Forth systems support access to a host file system, and many of these support interpretation of Forth  from source text files. The Forth-83 Standard did not address host OS files. Nevertheless, a degree of  similarity exists among modern implementations.

For example, files must be opened and closed, created and deleted. Forth file-system implementations  differ mostly in the treatment and disposition of the exception codes, and in the format of the file identification strings. The underlying mechanism for creating file-control blocks might or might not be  visible. We have chosen to keep it invisible.

Files must also be read and written. Text files, if supported, must be read and written one line at a time.  Interpretation of text files implies that they are somehow integrated into the text interpreter input  mechanism. These and other requirements have shaped the file-access extensions word set.

Most of the existing implementations studied use simple English words for common host file functions:  OPEN, CLOSE, READ, etc. Although we would have preferred to do likewise, there were so many minor  variations in implementation of these words that adopting any particular meaning would have broken much  existing code. We have used names with a suffix -FILE for most of these words. We encourage  implementors to conform their single-word primitives to the ANS behaviors, and hope that if this is done on  a widespread basis we can adopt better definition names in a future standard.

多くのForthシステムはホスト・ファイル・システムへのアクセスをサポートしており、これらの多くはソース・テキスト・ファイルからのForthの解釈をサポートしています。Forth-83スタンダードでは、ホストOSファイルには対応していませんでした。とはいえ、現代の実装にはある程度の類似性があります。

例えば、ファイルのオープンとクローズ、作成と削除が必要です。Forthファイルシステムの実装は、例外コードの扱いと処理、およびファイル識別文字列の形式において、主に異なっている。ファイル制御ブロックを作成する基本的なメカニズムは、見えるかもしれないし、見えないかもしれない。われわれは見えないようにすることにした。

ファイルは読み書きもできなければならない。テキスト・ファイルをサポートする場合は、1行ずつ読み書きしなければならない。 テキスト・ファイルの解釈は、テキスト・インタープリターの入力メカニズムに何らかの形で組み込まれることを意味する。これらの要件やその他の要件が、ファイルアクセス拡張の単語セットを形成してきた。

研究された既存の実装のほとんどは、一般的なホストファイル機能に単純な英単語を使用している：  OPEN、CLOSE、READなどである。我々もそうしたかったが、これらの単語の実装には非常に多くのマイナーなバリエーションがあり、特定の意味を採用することは多くの既存のコードを壊してしまうことになる。我々は、これらの単語のほとんどに接尾辞-FILEを付けた名前を使用した。私たちは、実装者が自分たちの単一単語プリミティブをANSの動作に適合させることを奨励し、これが広く行われれば、将来のスタンドでより良い定義名を採用できることを望んでいる。

Specific rationales for members of this word set follow.

この単語セットのメンバーに関する具体的な根拠は以下の通りである。

### A.11.3 Additional usage requirements 

#### A.11.3.2 Blocks in files 

Many systems reuse file identifiers; when a file is closed, a subsequently opened file may be given the same  identifier. If the original file has blocks still in block buffers, these will be incorrectly associated with the  newly opened file with disastrous results. The block buffer system must be flushed to avoid this.

多くのシステムではファイル識別子を再利用します。ファイルが閉じられると、その後に開かれるファイルにも同じ識別子が与えられることがあります。元のファイルがブロック・バッファにブロックを残している場合、そのブロックは新しくオープンされたファイルに誤って関連付けられ、悲惨な結果を招きます。これを避けるには、ブロック・バッファ・システムをフラッシュする必要がある。

### A.11.6 Glossary 

##### A.11.6.1.0765 BIN 

Some operating systems require that files be opened in a different mode to access their contents as an  unstructured stream of binary data rather than as a sequence of lines.

オペレーティング・システムによっては、ファイルの内容を一連の行としてではなく、 構造化されていないバイナリ・データのストリームとしてアクセスするために、 異なるモードでファイルを開くことを要求するものがある。

The arguments to `READ-FILE` and `WRITE-FILE` are arrays of character storage elements, each  element consisting of at least 8 bits. The Technical Committee intends that, in BIN mode, the contents of  these storage elements can be written to a file and later read back without alteration. The Technical  Committee has declined to address issues regarding the impact of "wide" characters on the File and Block  word sets.

READ-FILE`と`WRITE-FILE`の引数は文字格納要素の配列であり、各要素は少なくとも8ビットで構成される。技術委員会は、BINモードでは、これらの記憶エレメントの内容をファイルに書き込んで、後でそのまま読み返すことができることを意図している。技術委員会は、"ワイド "文字がファイルとブロックのワードセットに与える影響に関する問題への対処を拒否した。

##### A.11.6.1.1010 CREATE-FILE 

Typical use:  

    : X .. S" TEST.FTH" R/W CREATE-FILE ABORT" CREATE-FILE FAILED" ... ; 

##### A.11.6.1.1717 INCLUDE-FILE 

Here are two implementation alternatives for saving the input source specification in the presence of text file  input:  

1) Save the file position (as returned by `FILE-POSITION`) of the beginning of the line being interpreted. To restore the input source specification, seek to that position and re-read the line into the  input buffer.

2) Allocate a separate line buffer for each active text input file, using that buffer as the input buffer.  This method avoids the "seek and reread" step, and allows the use of "pseudo-files" such as pipes and  other sequential-access-only communication channels.

ここでは、テキストファイル入力がある場合に、入力ソース指定を保存するための2つの実装方法を示します：  

1) 解釈中の行の先頭のファイル位置（`FILE-POSITION`が返す）を保存する。入力ソース指定を復元するには、その位置までシークし、その行を入力バッファに再読み込みする。

2) アクティブなテキスト入力ファイルごとに個別の行バッファを割り当て、そのバッファを入力バッファとして使用する。 この方法は、「シークと再読み込み」のステップを回避し、パイプやその他のシーケンシャル・アクセスのみの通信チャネルなどの「擬似ファイル」の使用を可能にする。

##### A.11.6.1.1718 INCLUDED 

Typical use: ... S" filename" INCLUDED ...

##### A.11.6.1.1970 OPEN-FILE 

Typical use:  

    : X .. S" TEST.FTH" R/W OPEN-FILE ABORT" OPEN-FILE FAILED" ... ; 

##### A.11.6.1.2080 READ-FILE 

A typical sequential file-processing algorithm might look like:  

    BEGIN                   ( )  
        ... READ-FILE THROW ( length ) 
    ?DUP WHILE              ( length ) 
        ...                 ( ) 
    REPEAT                  ( )  

In this example, `THROW` is used to handle (unexpected) exception conditions, which are reported as non-zero values of the ior return value from `READ-FILE`. End-of-file is reported as a zero value of the  "length" return value.

この例では、`THROW`は（予期しない）例外条件を処理するために使用され、 `READ-FILE`の戻り値の0以外の値として報告される。ファイルの終了は、"length" 戻り値のゼロ値として報告される。

##### A.11.6.1.2090 READ-LINE 

Implementations are allowed to store the line terminator in the memory buffer in order to allow the use of  line reading functions provided by host operating systems, some of which store the terminator. Without this  provision, a temporary buffer might be needed. The two-character limitation is sufficient for the vast  majority of existing operating systems. Implementations on host operating systems whose line terminator  sequence is longer than two characters may have to take special action to prevent the storage of more than  two terminator characters.

ホスト・オペレーティング・システムが提供する行読み取り関数を使用できるようにするため、 メモリ・バッファに行終端を格納することが許可されています。この規定がなければ、一時的なバッファが必要になるかもしれない。既存のオペレーティング・システムの大部分では、2文字の制限で十分である。行終端文字列が2文字より長いホストオペレーティングシステムの実装では、2文字以上の終端文字の格納を防ぐために特別な措置を取らなければならないかもしれない。

Standard Programs may not depend on the presence of any such terminator sequence in the buffer.

標準プログラムは、バッファにそのような終端シーケンスがあるかどうかに依存してはならない。

A typical line-oriented sequential file-processing algorithm might look like:  

典型的な行指向シーケンシャル・ファイル処理アルゴリズムは次のようなものである：

    BEGIN               ( )  
        . . . READ-LINE THROW ( length not-eof-flag ) 
    WHILE               ( length )  
        . . .           ( ) 
    REPEAT DROP         ( )  

In this example, THROW is used to handle (unexpected) I/O exception condition, which are reported as non-zero values of the "ior" return value from READ-LINE.

この例では、THROWは（予期しない）I/O例外条件を処理するために使用され、これはREAD-LINEからの "ior "戻り値のゼロ以外の値として報告される。

READ-LINE needs a separate end-of-file flag because empty (zero-length) lines are a routine occurrence,  so a zero-length line cannot be used to signify end-of-file.

READ-LINEは、空の（長さゼロの）行がルーチンで発生するため、別のファイル終了フラグを必要とする。

##### A.11.6.1.2165 S" 

Typical use: ... S" ccc" ...

The interpretation semantics for `S"` are intended to provide a simple mechanism for entering a string in the  interpretation state. Since an implementation may choose to provide only one buffer for interpreted strings,  an interpreted string is subject to being overwritten by the next execution of `S"` in interpretation state. It is  intended that no standard words other than `S"` should in themselves cause the interpreted string to be  overwritten. However, since words such as `EVALUATE`, `LOAD`, `INCLUDE-FILE` and `INCLUDED` can  result in the interpretation of arbitrary text, possibly including instances of `S"`, the interpreted string may be  invalidated by some uses of these words.

`S"`の解釈セマンティクスは、解釈状態に文字列を入力するための単純なメカニズムを提供することを意図している。実装は解釈された文字列のためのバッファを1つだけ提供することを選ぶかもしれないので、解釈された文字列は解釈状態の`S"`の次の実行によって上書きされる可能性がある。S"`以外の標準語は、それ自体で解釈文字列を上書きしないように意図されている。しかし、`EVALUATE`、`LOAD`、`INCLUDE-FILE`、`INCLUDED` などの単語は任意のテキストを解釈する可能性があり、その中には `S"` のインスタンスも含まれる可能性があるため、これらの単語の使用によっては解釈された文字列が無効になる可能性がある。

When the possibility of overwriting a string can arise, it is prudent to copy the string to a "safe" buffer  allocated by the application.

文字列が上書きされる可能性がある場合は、アプリケーションによって割り当てられた「安全な」バッファに文字列をコピーするのが賢明である。

Programs wishing to parse in the fashion of `S"` are advised to use `PARSE` or `WORD` `COUNT` instead of `S"`,  preventing the overwriting of the interpreted string buffer.

`S"`の方法で解析したいプログラムは、`S"`の代わりに `PARSE` または `WORD` `COUNT` を使用し、解釈された文字列バッファの上書きを防ぐことを推奨する。

## A.12 The optional Floating-Point word set 

The Technical Committee has considered many proposals dealing with the inclusion and makeup of the  Floating-Point Word Sets in ANS Forth. Although it has been argued that ANS Forth should not address  floating-point arithmetic and numerous Forth applications do not need floating-point, there are a growing  number of important Forth applications from spread sheets to scientific computations that require the use of  floating-point arithmetic. Initially the Technical Committee adopted proposals that made the Forth Vendors  Group Floating-Point Standard, first published in 1984, the framework for inclusion of Floating-Point in  ANS Forth. There is substantial common practice and experience with the Forth Vendors Group Floating-Point Standard. Subsequently the Technical Committee adopted proposals that placed the basic floating-point arithmetic, stack and support words in the Floating-Point word set and the floating-point  transcendental functions in the Floating-Point Extensions word set. The Technical Committee also adopted  proposals that:  

技術委員会は、ANS Forth における浮動小数点ワードセットの組み込みと構成に関する多くの提案を検討してきました。ANS Forthは浮動小数点演算に対応すべきではなく、多数のForthアプリケーションは浮動小数点を必要としないと主張されてきましたが、表計算シートから科学計算まで、浮動小数点演算の使用を必要とする重要なForthアプリケーションが増えています。当初、技術委員会は、1984 年に初めて発行された Forth Vendors Group Floating-Point Standard を ANS Forth に浮動小数点を組み込むための枠組みとする提案を採択しました。Forth Vendors Group Floating-Point Standardを使用した一般的な慣行と経験はかなりあります。その後、技術委員会は、基本的な浮動小数点演算、スタック、およびサポート語を浮動小数点ワードセットに、浮動小数点超越関数を浮動小数点拡張ワードセットに配置する提案を採択しました。技術委員会はまた、以下の提案も採択した：  

- changed names for clarity and consistency; e.g., `REALS` to `FLOATS`, and `REAL+` to `FLOAT+` .
- removed words; e.g., `FPICK` .
- added words for completeness and increased functionality; e.g., `FSINCOS`, `F~`, `DF@`, `DF!`, `SF@` and `SF!` 

- 例えば、「REALS」は「FLOATS」に、「REAL+」は「FLOAT+」に。
- 単語を削除；例えば、`FPICK` 。
- 例えば、`FSINCOS`、`F~`、`DF@`、`DF!`、`SF@`、`SF!`などである。

Several issues concerning the Floating-Point word set were resolved by consensus in the Technical  Committee:  

浮動小数点ワードセットに関するいくつかの問題は、技術委員会のコンセンサスによって解決された：

<miniterm>

||Floating-point stack:||
By default the floating-point stack is separate from the data and return stacks;  however, an implementation may keep floating-point numbers on the data stack. A program can  determine whether floating-point numbers are kept on the data stack by passing the string `FLOATING-STACK` to `ENVIRONMENT?` It is the experience of several members of the Technical Committee that  with proper coding practices it is possible to write floating-point code that will run identically on  systems with a separate floating-point stack and with floating-point numbers kept on the data stack.

デフォルトでは、浮動小数点スタックはデータスタックとリターンスタックから分離されている。浮動小数点数がデータスタックに保持されるかどうかは、`ENVIRONMENT?` に `FLOATING-STACK` という文字列を渡すことでプログラムが判断できます。技術委員会の何人かのメンバーの経験では、適切なコーディングを行えば、浮動小数点数がデータスタックに保持されている場合と、浮動小数点スタックが分離されているシステムで同じように動作する浮動小数点コードを書くことが可能です。

||Floating-point input:||
The current base must be `DECIMAL`. Floating-point input is not allowed in an  arbitrary base. All floating-point numbers to be interpreted by an ANS Forth system must contain the  exponent indicator "E" (see **12.3.7  Text interpreter input number conversion**). Consensus in the  Technical Committee deemed this form of floating-point input to be in more common use than the  alternative that would have a floating-point input mode that would allow numbers with embedded  decimal points to be treated as floating-point numbers.

現在のベースは `DECIMAL` でなければならない。任意の基数での浮動小数点入力は許されない。ANS Forthシステムで解釈される浮動小数点数は、指数指示子 "E "を含んでいなければならない(**12.3.7 テキストインタプリタ入力数値変換**参照)。技術委員会のコンセンサスでは、この形式の浮動小数点入力は、小数点を埋め込んだ数値を浮動小数点数として扱えるようにする浮動小数点入力モードを持つ代替案よりも、より一般的に使用されているとみなされた。

||Floating-point representation:||
Although the format and precision of the significand and the format and  range of the exponent of a floating-point number are implementation defined in ANS Forth, the  Floating-Point Extensions word set contains the words `DF@`, `SF@`, `DF!`, and `SF!` for fetching and  storing double- and single-precision IEEE floating-point-format numbers to memory. The IEEE  floating-point format is commonly used by numeric math co-processors and for exchange of floating-point data between programs and systems.

浮動小数点数のシグニフィカンドの形式と精度、および指数の形式と範囲は ANS Forth で実装定義されていますが、浮動小数点拡張ワードセットには、倍精度および単精度の IEEE 浮動小数点形式の数値をメモリにフェッチおよび格納するためのワード `DF@`、`SF@`、`DF!`、`SF!` が含まれています。IEEE浮動小数点フォーマットは、数値演算コプロセッサや、プログラムやシステム間の浮動小数点データの交換によく使われる。

</miniterm>

### A.12.3 Additional usage requirements 

#### A.12.3.5 Address alignment 

In defining custom floating-point data structures, be aware that CREATE doesn’t necessarily leave the data  space pointer aligned for various floating-point data types. Programs may comply with the requirement for  the various kinds of floating-point alignment by specifying the appropriate alignment both at compile-time  and execution time. For example:  

カスタム浮動小数点データ構造を定義する際には、CREATEが様々な浮動小数点データ型に対して必ずしもデータ空間ポインタを整列させたままにするとは限らないことに注意してください。プログラムは、コンパイル時と実行時の両方で適切なアライメントを指定することで、様々な種類の浮動小数点アライメントの要件に準拠することができます。例えば

    : FCONSTANT ( F: r -- ) 
        CREATE FALIGN HERE 1 FLOATS ALLOT F! 
        DOES> ( F: -- r ) FALIGNED F@ ; 

#### A.12.3.7 Text interpreter input number conversion 

The Technical Committee has more than once received the suggestion that the text interpreter in Standard  Forth systems should treat numbers that have an embedded decimal point, but no exponent, as floating-point  numbers rather than double cell numbers. This suggestion, although it has merit, has always been voted  down because it would break too much existing code; many existing implementations put the full digit string  on the stack as a double number and use other means to inform the application of the location of the decimal  point.

技術委員会は、Standard Forth システムのテキスト・インタプリタが、小数点は埋め込まれているが指数は埋め込まれていない数値を、ダブル・セル数ではなく浮動小数点数として扱うべきだという提案を何度も受けてきました。既存の実装の多くは、完全な桁数の文字列を 2 倍数としてスタックに置き、小数点 の位置をアプリケーションに知らせるために他の手段を使用しています。

### A.12.6 Glossary 

##### A.12.6.1.0558 >FLOAT 

`>FLOAT` enables programs to read floating-point data in legible ASCII format. It accepts a much broader syntax than does the text interpreter since the latter defines rules for composing source programs whereas `>FLOAT` defines rules for accepting data. >FLOAT is defined as broadly as is feasible to permit input of data from ANS Forth systems as well as other widely used standard programming environments.

プログラムで浮動小数点データを読みやすい ASCII 形式で読み込めるようにします。テキスト・インタープリタがソース・プログラムを作成するためのルールを定義しているのに対して、 `>FLOAT` はデータを受け入れるためのルールを定義しているためです。>FLOATは、ANS Forthシステムや他の広く使われている標準的なプログラミング環境からのデータ入力を可能にするために、可能な限り広く定義されている。

This is a synthesis of common FORTRAN practice. Embedded spaces are explicitly forbidden in much  scientific usage, as are other field separators such as comma or slash.

これは一般的なFORTRANの慣行を統合したものです。コンマやスラッシュのような他のフィールド区切り文字と同様に、埋め込みスペースは多くの科学的使用において明確に禁止されています。

While `>FLOAT` is not required to treat a string of blanks as zero, this behavior is strongly encouraged, since  a future version of ANS Forth may include such a requirement.

`>FLOAT`は空白の文字列をゼロとして扱う必要はないが、将来のANS Forthのバージョンではこのような要件が含まれる可能性があるため、この動作は強く推奨される。

##### A.12.6.1.1427 F.

For example, 1E3 F. displays 1000. .

##### A.12.6.1.1492 FCONSTANT 

Typical use: r FCONSTANT name 

##### A.12.6.1.1552 FLITERAL 

Typical use: : `X ... [ ... ( r ) ] FLITERAL ... ;` 

##### A.12.6.1.1630 FVARIABLE 

Typical use: `FVARIABLE name` 

##### A.12.6.1.2143 REPRESENT 

This word provides a primitive for floating-point display. Some floating-point formats, including those  specified by IEEE-754, allow representations of numbers outside of an implementation-defined range.  These include plus and minus infinities, denormalized numbers, and others. In these cases we expect that  REPRESENT will usually be implemented to return appropriate character strings, such as "+infinity" or  "nan", possibly truncated.

このワードは浮動小数点表示用のプリミティブを提供する。IEEE-754を含むいくつかの浮動小数点フォーマットでは、実装で定義された範囲外の数値を表現することができます。 これにはプラスマイナス無限大、非正規化数などが含まれます。このような場合、REPRESENTは通常、"+infinity "や "nan "などの適切な文字列を返すように実装されることが期待されます。

##### A.12.6.2.1489 FATAN2 

`FSINCOS` and `FATAN2` are a complementary pair of operators which convert angles to 2-vectors and vice-versa. They are essential to most geometric and physical applications since they correctly and  unambiguously handle this conversion in all cases except null vectors, even when the tangent of the angle  would be infinite.

`FSINCOS` と `FATAN2` は、角度を 2 ベクトルに、またはその逆に変換する相補的な演算子のペアである。角度の正接が無限大になる場合でも、ヌルベクトルを除くすべてのケースでこの変換を正しく明確に処理するため、ほとんどの幾何学的および物理的なアプリケーションに不可欠である。

FSINCOS returns a Cartesian unit vector in the direction of the given angle, measured counter-clockwise  from the positive X-axis. The order of results on the stack, namely y underneath x, permits the 2-vector  data type to be additionally viewed and used as a ratio approximating the tangent of the angle. Thus the  phrase `FSINCOS` `F/` is functionally equivalent to `FTAN`, but is useful over only a limited and  discontinuous range of angles, whereas `FSINCOS` and `FATAN2` are useful for all angles. This ordering has  been found convenient for nearly two decades, and has the added benefit of being easy to remember. A  corollary to this observation is that vectors in general should appear on the stack in this order.

`FSINCOS`は、正のX軸から反時計回りに測った、与えられた角度の方向のデカルト単位ベクトルを返す。スタック上の結果の順序、すなわちxの下にyがあることで、2ベクトルデータ型を角度の正接を近似する比率として追加的に見たり使ったりすることができる。したがって、`FSINCOS` `F/` というフレーズは、機能的には `FTAN` と等価であるが、限られた不連続な角度の範囲にのみ有効であり、`FSINCOS` と `FATAN2` はすべての角度に有効である。この順序は20年近く便利であり、覚えやすいという利点もある。この観察の帰結として、一般的にベクトルはこの順序でスタックに現れるはずである。

The argument order for `FATAN2` is the same, converting a vector in the conventional representation to a  scalar angle. Thus, for all angles, `FSINCOS` `FATAN2` is an identity within the accuracy of the arithmetic  and the argument range of `FSINCOS`. Note that while `FSINCOS` always returns a valid unit vector,  `FATAN2` will accept any non-null vector. An ambiguous condition exists if the vector argument to `FATAN2` has zero magnitude.

`FATAN2`の引数の順序は同じで、従来の表現におけるベクトルをスカラー角に変換する。したがって、すべての角度に対して、`FSINCOS` `FATAN2` は `FSINCOS` の算術精度と引数の範囲内で同一である。また、`FSINCOS` は常に有効な単位ベクトルを返すが、`FATAN2` は NULL 以外のベクトルでも受け付けることに注意しよう。FATAN2` へのベクトル引数の大きさがゼロの場合、あいまいな状態が存在する。

##### A.12.6.2.1516 FEXPM1 

This function allows accurate computation when its arguments are close to zero, and provides a useful base  for the standard exponential functions. Hyperbolic functions such as cosh(x) can be efficiently and  accurately implemented by using `FEXPM1`; accuracy is lost in this function for small values of x if the word  `FEXP` is used.

この関数は、引数がゼロに近い場合に正確な計算を可能にし、標準的な指数関数の便利な基数を提供します。cosh(x) のような双曲線関数は `FEXPM1` を使用することで効率的かつ正確に実装することができる。

An important application of this word is in finance; say a loan is repaid at 15% per year; what is the daily  rate? On a computer with single precision (six decimal digit) accuracy:  

この言葉の重要な応用は金融である。あるローンが年率15％で返済されるとする。単精度(小数点以下6桁)の精度を持つコンピュータで：

1. Using `FLN` and `FEXP`: 

    FLN of 1.15 = 0.139762,  
    divide by 365 = 3.82910E-4,  
    form the exponent using FEXP = 1.00038, and  
    subtract one (1) and convert to percentage = 0.038%.

Thus we only have two digit accuracy.

精度は2桁しか確保できない。

2. Using `FLNP1` and `FEXPM1`: 

    FLNP1 of 0.15 = 0.139762, (this is the same value as in the first example, although with the argument  closer to zero it may not be so)  
    divide by 365 = 3.82910E-4,  
    form the exponent and subtract one (1) using FEXPM1 = 3.82983E-4, and  
    convert to percentage = 0.0382983%.

This is full six digit accuracy.

これは制度フルの6桁です。

The presence of this word allows the hyperbolic functions to be computed with usable accuracy. For  example, the hyperbolic sine can be defined as:  

この単語があることで、双曲線関数を使用可能な精度で計算することができる。例えば、ハイパーボリック・サインは次のように定義できる：

    : FSINH ( r1 -- r2 ) 
        FEXPM1 FDUP FDUP 1.0E0 F+ F/ F+ 2.0E0 F/ ; 

##### A.12.6.2.1554 FLNP1 

This function allows accurate compilation when its arguments are close to zero, and provides a useful base  for the standard logarithmic functions. For example, FLN can be implemented as:  

この関数は、引数がゼロに近い場合に正確なコンパイルを可能にし、標準対数関数の便利なベースを提供する。例えば、FLNは次のように実装できる：

    : FLN 1.0E0 F- FLNP1 ; 

**See: A.12.6.2.1516 FEXPM1**.

##### A.12.6.2.1616 FSINCOS 

See: **A.12.6.2.1489 FATAN2**.

##### A.12.6.2.1640 F~ 

This provides the three types of "floating point equality" in common use -- "close" in absolute terms, exact  equality as represented, and "relatively close".

これは、一般的に使用される3種類の「浮動小数点の等値性」を提供するものである。絶対的な意味での「近い」、表現上の完全な等値性、そして「比較的近い」である。

## A.13 The optional Locals word set 

The Technical Committee has had a problem with locals. It has been argued forcefully that ANS Forth  should say nothing about locals since:  

技術委員会では、ロカールに問題があった。ANS Forthはロカールに ついて何も言うべきではない、と強く主張されてきました：  

- there is no clear accepted practice in this area; 
- not all Forth programmers use them or even know what they are; and 
- few implementations use the same syntax, let alone the same broad usage rules and general approaches.

- この分野で受け入れられている明確な慣習がない； 
- すべてのForthプログラマーがロカールを使用しているわけではなく、またロカールが何であるかすら知らない。
- 同じ構文を使用する実装はほとんどなく、ましてや同じ広範な使用規則や一般的なアプローチを使用する実装はほとんどない。

It has also been argued, it would seem equally forcefully, that the lack of any standard approach to locals is  precisely the reason for this lack of accepted practice since locals are at best non-trivial to implement in a  portable and useful way. It has been further argued that users who have elected to become dependent on  locals tend to be locked into a single vendor and have little motivation to join the group that it is hoped will  "broadly accept" ANS Forth unless the Standard addresses their problems.

また、ローカ ルは移植可能で有用な方法で実装するのがせいぜい非自明であるため、ローカ ルに対する標準的なアプローチが存在しないことこそが、このような慣行が受け入れら れていない原因であるとも、同様に力強く主張されてきた。さらに、ローカルに依存することを選択したユーザーは、単一のベンダーに固定される傾向があり、標準が彼らの問題を解決しない限り、ANS Forthを「広く受け入れる」ことが期待されるグループに参加する動機がほとんどないと主張されてきた。

Since the Technical Committee has been unable to reach a strong consensus on either leaving locals out or  on adopting any particular vendor’s syntax, it has sought some way to deal with an issue that it has been  unable to simply dismiss. Realizing that no single mechanism or syntax can simultaneously meet the desires  expressed in all the locals proposals that have been received, it has simplified the problem statement to be to  define a locals mechanism that:  

技術委員会は、ロカールを除外することでも、特定のベンダーの構文を採用する ことでも、強力なコンセンサスを得ることができなかったため、単純に却下するこ とのできない問題に対処する方法を模索してきた。単一のメカニズムやシンタックスでは、これまでに寄せられたすべてのロカールの提案に示された要望を同時に満たすことはできないと考え、以下のようなロカールのメカニズムを定義することを問題提起として単純化した：  

- is independent of any particular syntax; 
- is user extensible; 
- enables use of arbitrary identifiers, local in scope to a single definition; 
- supports the fundamental cell size data types of Forth; and 
- works consistently, especially with respect to re-entrancy and recursion.

- 特定の構文に依存しない； 
- ユーザが拡張可能である； 
- 単一の定義に対してローカルな範囲で、任意の識別子を使用できる； 
- Forthの基本的なセル・サイズのデータ型をサポートする。
- 特に再入可能性と再帰に関して一貫して動作する。

This appears to the Technical Committee to be what most of those who actively use locals are trying to  achieve with them, and it is at present the consensus of the Technical Committee that if ANS Forth has  anything to say on the subject this is an acceptable thing for it to say.

技術委員会では、ローカルを積極的に使用するほとんどの人が、ローカルを使用して達成しようとしているのはこのようなことだと考えており、ANS Forthがこのテーマについて何か言うのであれば、このようなことを言ってもよいというのが、現時点での技術委員会の総意である。

This approach, defining `(LOCAL)`, is proposed as one that can be used with a small amount of user coding  to implement some, but not all, of the locals schemes in use. The following coding examples illustrate how  it can be used to implement two syntaxes.

`(LOCAL)`を定義するこのアプローチは、使用されているロカールスキーマのすべてではないが、一部を実装するために少量のユーザーコーディングで使用できるものとして提案されている。以下のコーディング例では、2つの構文を実装するためにどのように使用できるかを説明する。

- The syntax defined by this Standard and used in the systems of Creative Solutions, Inc.: 

- 本標準で定義され、Creative Solutions, Inc.のシステムで使用されている構文：

    : LOCALS| ( "name...name |" -- ) 
        BEGIN 
            BL WORD COUNT OVER C@ 
            [CHAR] | - OVER 1 - OR WHILE 
            (LOCAL) 
        REPEAT 2DROP 0 0 (LOCAL) 
    ; IMMEDIATE 
    : EXAMPLE ( n -- n**2 n**3 ) 
        LOCALS| N | N DUP N * DUP N * ; 

- A proposed syntax: ( LOCAL name ) with additional usage rules: 

    : LOCAL ( "name" -- ) BL WORD COUNT (LOCAL) ; IMMEDIATE 
    : END-LOCALS ( -- ) 0 0 (LOCAL) ; IMMEDIATE 
    : EXAMPLE ( n -- n n**2 n**3 ) 
        LOCAL N END-LOCALS N DUP N * DUP N * ; 

Other syntaxes can be implemented, although some will admittedly require considerably greater effort or in  some cases program conversion. Yet other approaches to locals are completely incompatible due to gross  differences in usage rules and in some cases even scope identifiers. For example, the complete local scheme  in use at Johns Hopkins had elaborate semantics that cannot be duplicated in terms of this model.

他の構文を実装することも可能だが、かなり大きな労力や、場合によってはプログラムの変換が必要になるものもある。しかし、ローカルに対する他のアプローチは、使用ルールや場合によってはスコープ識別子さえも大きく異なるため、完全に互換性がない。例えば、ジョンズ・ホプキンスで使用されていた完全なローカル・スキームは、このモデルでは再現できない精巧なセマンティクスを持っていた。

To reinforce the intent of section 13, here are two examples of actual use of locals. The first illustrates  correct usage:  

第13節の意図を補強するために、ローカルの実際の使用例を2つ紹介しよう。最初の例は、正しい使い方を示している：

a) : { ( "name ... }" - )  
        BEGIN BL WORD COUNT 
            OVER C@ [CHAR] } - OVER 1 - OR WHILE 
            (LOCAL) 
        REPEAT 2DROP 0 0 (LOCAL) 
    ; IMMEDIATE 

b) : JOE ( a b c -- n )  
        >R 2* R> 2DUP + 0 
        { ANS 2B+C C 2B A } 
        2 0 DO 1 ANS + I + TO ANS ANS . CR LOOP 
        ANS . 2B+C . C . 2B . A . CR ANS 
    ; 

c) 100 300 10 JOE .

The word \{ at a) defines a local declaration syntax that surrounds the list of locals with braces. It doesn’t  do anything fancy, such as reordering locals or providing initial values for some of them, so locals are  initialized from the stack in the default order. The definition of JOE at b) illustrates a use of this syntax.  Note that work is performed at execution time in that definition before locals are declared. It’s OK to use  the return stack as long as whatever is placed there is removed before the declarations begin.

この単語は、ローカルのリストを中括弧で囲むローカル宣言構文を定義します。この構文では、ロカールの順番を入れ替えたり、ロカールのいくつかに初期 値を与えたりといった派手なことは何もしないので、ロカールはスタックからデフォ ルトの順番で初期化されます。b)のJOEの定義は、この構文の使い方を示している。 この定義では、ロカールが宣言される前に実行時に作業が行われることに注意してください。宣言が始まる前にスタックに置かれたものが取り除かれる限り、リターンスタックを使っても構わない。

Note that before declaring locals, B is doubled, a subexpression (2B+C) is computed, and an initial value (zero) for ANS is provided. After locals have been declared, JOE proceeds to use them. Note that locals may be accessed and updated within do-loops. The effect of interpreting line c) is to display the following  values:  

ローカルを宣言する前に、Bが2倍され、部分式（2B+C）が計算され、ANSの初期値（ゼロ）が提供されることに注意。ローカルが宣言された後、JOEはそれらを使用する。ロカールは、doループの中でアクセスされ、更新される可能性があることに注意。c)行の解釈の効果は、以下の値を表示することである：

    1 (ANS the first time through the loop), 
    3 (ANS the second time), 
    3 (ANS), 610 (2B+C), 10 (C), 600 (2B), 100 (A), and 
    3 (ANS left on the stack by JOE).

The names of the locals vanish after JOE has been compiled. The storage and meaning of locals appear  when JOE’s locals are declared and vanish as JOE returns to its caller at ; (semicolon).

A second set of examples illustrates various things that break the rules. We assume that the definitions of  LOCAL and END-LOCALS above are present, along with \{ from the preceding example.

ロカールの名前は、JOEがコンパイルされた後に消える。JOEのローカルが宣言されたときに、ローカルの格納場所と意味が現れ、JOEが ; （セミコロン）で呼び出し元に戻るときに消える。

2つ目の例では、ルールを破る様々なことを説明する。ここでは、上記のLOCALとEND-LOCALSの定義と、前の例の{が存在すると仮定する。

d) : ZERO 0 POSTPONE LITERAL POSTPONE LOCAL ; IMMEDIATE  

e) : MOE ( a b )  
        ZERO TEMP LOCAL B 1+ LOCAL A+ ZERO ANSWER ; 

f) : BOB ( a b c d ) \{ D C } \{ B A } ;  

Here are two definitions with various violations of rule 13.3.3.2a. In e) the declaration of TEMP is legal and  creates a local whose initial value is zero. It’s OK because the executable code that ZERO generates  precedes the first use of (LOCAL) in the definition. However, the 1+ preceding the declaration of A+ is  illegal. Likewise the use of ZERO to define ANSWER is illegal because it generates executable code  between uses of (LOCAL). Finally, MOE terminates illegally (no END-LOCALS). BOB inf) violates the  rule against declaring two sets of locals.

以下は、規則13.3.3.2aに違反する2つの定義である。e)のTEMPの宣言は合法で、初期値がゼロのローカルを作成します。定義中の(LOCAL)の最初の使用の前にZEROが生成する実行可能コードがあるので問題ありません。しかし、A+の宣言に先立つ1+は違法である。同様に、ANSWER を定義するための ZERO の使用も、(LOCAL) の使用と使用の間に実行可能コードを生成しているので違法である。最後に、MOE は不正に終了する（END-LOCALS がない）。BOB inf) は、2 組のローカルを宣言してはならないという規則に違反する。

g) : ANN ( a b -- b ) DUP >R DUP IF \{ B A } THEN R> ;  

h) : JANE ( a b -- n ) \{ B A } A B + >R A B - R> / ;  

ANN in g) violates two rules. The IF ... THEN around the declaration of its locals violates 13.3.3.2b, and  the copy of B left on the return stack before declaring locals violates 13.3.3.2c. JANE in h) violates  13.3.3.2d by accessing locals after placing the sum of A and B on the return stack without first removing that sum.

g)のANNは2つのルールに違反している。IF ... THENは13.3.3.2bに違反し、ロカールを宣言する前にBのコピーをリターンスタックに残すことは13.3.3.2cに違反する。h)のJANEは、AとBの和を最初に取り除かずにリターンスタックに置いた後にロカールにアクセスすることで、13.3.3.2dに違反する。

i) : CHRIS ( a b)  
        { B A } ['] A EXECUTE 5 ['] B >BODY ! [ ' A ] LITERAL LEE ; 

CHRIS in i) illustrates three violations of 13.3.3.2e. The attempt to EXECUTE the local called A is  inconsistent with some implementations. The store into B via >BODY is likely to cause tragic results with  many implementations; moreover, if locals are in registers they can’t be addressed as memory no matter  what is written.

i)のCHRISは13.3.3.2eの3つの違反を示している。AというローカルをEXECUTEしようとする試みは、いくつかの実装と矛盾している。BODYを経由してBに格納することは、多くの実装で悲劇的な結果を引き起こす可能性がある。

The third violation, in which an execution token for a definition’s local is passed as an argument to the word  LEE, would, if allowed, have the unpleasant implication that LEE could EXECUTE the token and obtain a  value for A from the particular execution of CHRIS that called LEE this time.

3つ目の違反は、定義のローカルに対する実行トークンがLEEの引数として渡されるというもので、これが許可されると、LEEがトークンを実行し、今回LEEを呼び出したCHRISの特定の実行からAの値を取得できるという不愉快な意味になる。

### A.13.3 Additional usage requirements 

Rule 13.3.3.2d could be relaxed without affecting the integrity of the rest of this structure. 13.3.3.2c could  not be.

規則13.3.3.2dは、この構造の残りの部分の完全性に影響を与えることなく緩和できる。13.3.3.2cは緩和できない。

13.3.3.2b forbids the use of the data stack for local storage because no usage rules have been articulated for programmer users in such a case. Of course, if the data stack is somehow employed in such a way that there  are no usage rules, then the locals are invisible to the programmer, are logically not on the stack, and the  implementation conforms.

13.3.3.2bは、データスタックをローカルストレージに使用することを禁止する。もちろん、データ・スタックが何らかの方法で使用ルールがないように使用される場合、ローカルはプログラマには見えず、論理的にはスタック上になく、実装は適合する。

The minimum required number of locals can (and should) be adjusted to minimize the cost of compliance  for existing users of locals.

最低限必要なロカールの数は、既存のロカール使用者のコンプライアンス・コストを最小化するように調整することができる（そして、そうすべきである）。

Access to previously declared local variables is prohibited by Section 13.3.3.2d until any data placed onto  the return stack by the application has been removed, due to the possible use of the return stack for storage  of locals.

アプリケーションによってリターンスタックに置かれたデータが削除されるまで、以前に宣言されたローカル変数へのアクセスは、セクション 13.3.3.2d によって禁止されている。

Authorization for a Standard Program to manipulate the return stack (e.g., via >R R>) while local variables  are active overly constrains implementation possibilities. The consensus of users of locals was that Local  facilities represent an effective functional replacement for return stack manipulation, and restriction of  standard usage to only one method was reasonable.

ローカル変数がアクティブである間、標準プログラムが（例えば >R R> を介して）リターンスタックを操作することを許可することは、実装の可能性を過度に制限することになる。ローカル変数の使用者のコンセンサスは、ローカル機能はリターン・スタック操作の効果的な機能的代替であり、標準的な使用方法を1つの方法のみに制限することは合理的であるというものであった。

Access to Locals within DO..LOOPs is expressly permitted as an additional requirement of conforming  systems by Section 13.3.3.2g. Although words, such as (LOCALS), written by a System Implementor, may  require inside knowledge of the internal structure of the return stack, such knowledge is not required of a  user of compliant Forth systems.

DO...LOOP内でのローカルへのアクセスは、セクション13.3.3.2gにより、適合システムの追加要件として明示的に許可されている。システム実装者によって記述された(LOCALS)のような単語は、リターンスタックの内部構造の内部知識を必要とするかもしれませんが、そのような知識は準拠Forthシステムのユーザーには要求されません。

### A.13.6 Glossary 

##### A.13.6.1.2295 TO 

Typical use: `x TO name` 

See: **A.6.2.2295 TO**.

##### A.13.6.2.1795 LOCALS| 

A possible implementation of this word and an example of usage is given in A.13, above. It is intended as  an example only; any implementation yielding the described semantics is acceptable.

この語の可能な実装と使用例は、上記のA.13に示されている。これはあくまで例であり、記述されたセマンティクスを実現する実装であれば、どのようなもの でも構わない。

## A.14 The optional Memory-Allocation word set 

The Memory-Allocation word set provides a means for acquiring memory other than the contiguous data  space that is allocated by ALLOT. In many operating system environments it is inappropriate for a process  to pre-allocate large amounts of contiguous memory (as would be necessary for the use of ALLOT). The  Memory-Allocation word set can acquire memory from the system at any time, without knowing in advance  the address of the memory that will be acquired.

A.14.オプションのメモリ確保ワードセットは、ALLOTで確保される連続データ空間以外のメモリを確保する手段を提供する。多くのオペレーティング・システム環境では、（ALLOTを使用するために必要な）大容量の連続メモリーをプロセスが事前に割り当てることは不適切です。メモリアロケーション・ワードセットは、獲得されるメモリーのアドレスを事前に知らなくても、いつでもシステムからメモリーを獲得することができる。

## A.15 The optional Programming-Tools word set 

These words have been in widespread common use since the earliest Forth systems.

これらの単語は、初期のForthシステムから広く一般的に使用されています。

Although there are environmental dependencies intrinsic to programs using an assembler, virtually all Forth  systems provide such a capability. Insofar as many Forth programs are intended for real-time applications  and are intrinsically non-portable for this reason, the Technical Committee believes that providing a  standard window into assemblers is a useful contribution to Forth programmers.

アセンブラを使用するプログラムには本質的に環境依存性がありますが、事実上すべての Forth システムはこのような機能を提供しています。多くの Forth プログラムがリアルタイム・アプリケーションを目的としており、そのために本質的に移植不可能である限り、技術委員会は、アセンブラへの標準的なウィンドウを提供することは、Forth プログラマにとって有用な貢献であると考えています。

Similarly, the programming aids DUMP, etc., are valuable tools even though their specific formats will differ  between CPUs and Forth implementations. These words are primarily intended for use by the programmer,  and are rarely invoked in programs.

同様に、プログラミング補助ツールである DUMP などは、CPU や Forth 実装によって具体的な形式が異なるとはいえ、貴重なツールです。これらの単語は、主にプログラマーが使用することを目的としており、プログラムで呼び出されることはほとんどありません。

One of the original aims of Forth was to erase the boundary between "user" and "programmer" - to give all  possible power to anyone who had occasion to use a computer. Nothing in the above labeling or remarks  should be construed to mean that this goal has been abandoned.

Forthの当初の目的のひとつは、「ユーザー」と「プログラマー」の境界をなくすこと、つまり、コンピュータを使う機会のあるすべての人に可能な限りの力を与えることでした。上記の表示や発言は、この目標が放棄されたと解釈されるべきではありません。

### A.15.6 Glossary 

##### A.15.6.1.0220 .S 

`.S` is a debugging convenience found on almost all Forth systems. It is universally mentioned in Forth texts.

.S` は、ほとんどすべての Forth システムで見られるデバッグの利便性です。これは、Forth のテキストで普遍的に言及されています。

##### A.15.6.1.2194 SEE 

`SEE` acts as an on-line form of documentation of words, allowing modification of words by decompiling  and regenerating with appropriate changes.

SEE`は単語のオンラインドキュメントとして機能し、デコンパイルして適切な変更を加えて再生成することで、単語を修正することができます。

##### A.15.6.1.2465 WORDS 

`WORDS` is a debugging convenience found on almost all Forth systems. It is universally referred to in Forth  texts.

`WORDS` は、ほとんどすべての Forth システムで見られるデバッグ用の便利な機能です。これは、Forth のテキストで普遍的に参照されています。

##### A.15.6.2.0470 ;CODE 

Typical use: : namex ... &lt;create> ... ;CODE ...

典型的な使用法: : namex ... <create> ... ;CODE ...

where namex is a defining word, and &lt;create> is CREATE or any user defined word that calls `CREATE`.

ここで、namex は定義語で、<create> は CREATE または `CREATE` を呼び出すユーザー定義語です。

##### A.15.6.2.0930 CODE 

Some Forth systems implement the assembly function by adding an ASSEMBLER word list to the search  order, using the text interpreter to parse a postfix assembly language with lexical characteristics similar to  Forth source code. Typically, in such systems, assembly ends when a word END-CODE is interpreted.

一部の Forth システムでは、ASSEMBLER 単語リストを検索順序に追加してアセンブリ機能を実装し、テキスト・インタプリタを使用して、Forth ソース・コードに似た字句特性を持つポストフィックス・アセンブリ言語を解析します。通常、このようなシステムでは、単語END-CODEが解釈されるとアセンブリが終了します。

##### A.15.6.2.1015 CS-PICK 

The intent is to reiterate a dest on the control-flow stack so that it can be resolved more than once. For  example:  

その意図は、コントロール・フロー・スタック上のデスティネーションを繰り返し、複数回解決できるようにすることである。例えば

    \ Conditionally transfer control to beginning of loop 
    \ This is similar in spirit to C's "continue" statement.
    : ?REPEAT ( dest -- dest ) \ Compilation 
            ( flag -- ) \ Execution 
        0 CS-PICK POSTPONE UNTIL 
    ; IMMEDIATE 
    : XX ( -- ) \ Example use of ?REPEAT 
        BEGIN 
        ...
        flag ?REPEAT ( Go back to BEGIN if flag is false ) 
        ...
        flag ?REPEAT ( Go back to BEGIN if flag is false ) 
        ...
        flag UNTIL ( Go back to BEGIN if flag is false ) 
        ...
    ; 

##### A.15.6.2.1020 CS-ROLL 

The intent is to modify the order in which the origs and dests on the control-flow stack are to be resolved by  subsequent control-flow words. For example, WHILE could be implemented in terms of IF and CS-ROLL,  as follows:  

その意図は、制御フロー・スタック上の起点と終点が、後続の制御フロー・ワードによって解決される順序を変更することである。例えば、WHILEをIFとCS-ROLLで実装すると次のようになる：

    : WHILE ( dest -- orig dest ) 
        POSTPONE IF 1 CS-ROLL 
    ; IMMEDIATE 

##### A.15.6.2.1580 FORGET 

Typical use: ... FORGET name ...

FORGET assumes that all the information needed to restore the dictionary to its previous state is inferable  somehow from the forgotten word. While this may be true in simple linear dictionary models, it is difficult  to implement in other Forth systems; e.g., those with multiple address spaces. For example, if Forth is  embedded in ROM, how does FORGET know how much RAM to recover when an array is forgotten? A  general and preferred solution is provided by MARKER.

FORGETは、辞書を以前の状態に復元するために必要なすべての情報が、忘れた単語から何らかの方法で推論可能であると仮定している。これは単純な線形辞書モデルにおいては正しいかもしれませんが、他の Forth システム、たとえば複数のアドレス空間を持つシステムでは実装が困難です。例えば、ForthがROMに組み込まれている場合、配列が忘れられたときに回復すべきRAMの量を、FORGETはどうやって知るのでしょうか？一般的で好ましい解決策は、MARKERによって提供されます。

##### A.15.6.2.2531 [ELSE] 

Typical use: ... flag [IF] ... [ELSE] ... [THEN] ...

##### A.15.6.2.2532 [IF] 

Typical use: ... flag [IF] ... [ELSE] ... [THEN] ...

##### A.15.6.2.2533 [THEN] 

Typical use: ... flag [IF] ... [ELSE] ... [THEN] ...

Software that runs in several system environments often contains some source code that is environmentally  dependent. Conditional compilation - the selective inclusion or exclusion of portions of the source code at  compile time - is one technique that is often used to assist in the maintenance of such source code.

複数のシステム環境で動作するソフトウェアには、環境に依存するソースコードが含まれていることが多い。条件付きコンパイル（コンパイル時にソースコードの一部を選択的に包含または除外すること）は、そのようなソースコードの保守を支援するためによく使われる手法の1つである。

Conditional compilation is sometimes done with "smart comments" - definitions that either skip or do not  skip the remainder of the line based on some test. For example:  

条件付きコンパイルは、「スマート・コメント」（何らかのテストに基づいて、行の残りをスキップしたりスキップしなかったりする定義）を使って行われることもある。例えば

    \ If 16-Bit? contains TRUE, lines preceded by 16BIT\ 
    \ will be skipped. Otherwise, they will not be skipped.
    VARIABLE 16-BIT?  
    : 16BIT\ ( -- ) 16-BIT? @ IF POSTPONE \ THEN 
    ; IMMEDIATE 

This technique works on a line by line basis, and is good for short, isolated variant code sequences.

このテクニックは行単位で動作し、短くて孤立したバリアントコードのシーケンスに適している。

More complicated conditional compilation problems suggest a nestable method that can encompass more  than one source line at a time. The words included in the ANS Forth optional Programming tools  extensions word set are useful for this purpose. The implementation given below works with any input  source (keyboard, EVALUATE, BLOCK, or text file).

より複雑な条件付きコンパイルの問題では、一度に複数のソース行を包含できるネスト可能な方法をお勧めします。ANS Forthオプショナル・プログラミング・ツール拡張の単語セットに含まれている単語は、この目的に便利です。以下に示す実装は、どの入力ソース（キーボード、EVALUATE、BLOCK、またはテキストファイル）でも動作します。

    : [ELSE] ( -- ) 
        1 BEGIN \ level 
            BEGIN BL WORD COUNT DUP WHILE \ level adr len 
                2DUP S" [IF]" COMPARE 0= IF \ level adr len 
                    2DROP 1+ \ level' 
                ELSE \ level adr len 
                    2DUP S" [ELSE]" COMPARE 0= IF \ level adr len 
                        2DROP 1- DUP IF 1+ THEN \ level' 
                    ELSE \ level adr len 
                        S" [THEN]" COMPARE 0= IF \ level 
                            1- \ level' 
                        THEN 
                    THEN 
                THEN ?DUP 0= IF EXIT THEN \ level' 
            REPEAT 2DROP \ level 
        REFILL 0= UNTIL \ level 
        DROP 
    ; IMMEDIATE 
    : [IF] ( flag -- ) 
        0= IF POSTPONE [ELSE] THEN 
    ; IMMEDIATE 
    : [THEN] ( -- ) ; IMMEDIATE 


## A.16 The optional Search-Order word set 

Search-order specification and control mechanisms vary widely. The FIG-Forth, Forth-79, polyFORTH,  and Forth-83 vocabulary and search order mechanisms are all mutually incompatible. The complete list of  incompatible mechanisms, in use or proposed, is much longer. The ALSO/ONLY scheme described in a  Forth-83 Experimental Proposal has substantial community support. However, many consider it to be  fundamentally flawed, and oppose it vigorously.

Recognizing this variation, this Standard specifies a new "primitive" set of tools from which various  schemes may be constructed. This primitive search-order word set is intended to be a portable  "construction set" from which search-order words may be built, rather than a user interface. ALSO/ONLY or the various "vocabulary" schemes supported by the major Forth vendors can be defined in terms of the  primitive search-order word set.

The encoding for word list identifiers wid might be a small-integer index into an array of word-list  definition records, the data-space address of such a record, a user-area offset, the execution token of a  Forth-83 style sealed vocabulary, the link-field address of the first definition in a word list, or anything else.  It is entirely up to the system implementor.

検索順序の指定と制御機構は大きく異なる。FIG-Forth、Forth-79、polyFORTH、Forth-83の語彙と検索順序メカニズムは、すべて相互に互換性がありません。使用されている、あるいは提案されている互換性のないメカニズムの完全なリストは、もっと長い。Forth-83 Experimental Proposalに記述されているALSO/ONLYスキームは、コミュニティから大きな支持を得ています。しかし、多くの人が根本的な欠陥があると考え、激しく反対しています。

このばらつきを認識し、本標準は、さまざまなスキームを構築することができる新しい「原始的な」ツールセットを規定する。この原始的な検索語集合は、ユーザーインターフェースではなく、検索語を構築するための移植可能な "構築集合 "であることを意図している。ALSO/ONLYや主要なForthベンダーがサポートする様々な "語彙 "スキームは、原始的な検索順序単語セットで定義することができます。

単語リスト識別子のエンコーディングは、単語リスト定義レコードの配列への小整数のインデックス、そのようなレコードのデータ空間アドレス、ユーザー領域のオフセット、Forth-83スタイルの封印された語彙の実行トークン、単語リストの最初の定義のリンクフィールドアドレス、または他のものであるかもしれません。 システム実装者次第である。

In some systems the interpretation of numeric literals is controlled by including "pseudo word lists" that  recognize numbers at the end of the search order. This technique is accommodated by the "default search  order" behavior of SET-ORDER when given an argument of -1. In a system using the traditional  implementation of ALSO/ONLY , the minimum search order would be equivalent to the word ONLY.

There has never been a portable way to restore a saved search order. F83 (not Forth 83) introduced the  word PREVIOUS , which almost made it possible to "unload" the search order by repeatedly executing the  phrase CONTEXT @ PREVIOUS. The search order could be "reloaded" by repeating ALSO CONTEXT  !. Unfortunately there was no portable way to determine how many word lists were in the search order.

ANS Forth has removed the word CONTEXT because in many systems its contents refer to more than one  word list, compounding portability problems.

Note that : (colon) no longer affects the search order. The previous behavior, where the compilation word  list replaces the first word list of the search order, can be emulated with the following redefinition of : (colon).

システムによっては、検索順序の最後に数字を認識する「擬似単語リスト」を含めることで、数値リテラルの解釈を制御している。このテクニックは、引数に-1が与えられた時のSET-ORDERの "デフォルトの検索順序 "動作によって対応される。従来のALSO/ONLYの実装を使用するシステムでは、最小の検索順序は、単語ONLYと等価である。

保存された検索順序を復元するポータブルな方法はこれまでなかった。F83（Forth83ではない）ではPREVIOUSという単語が導入され、CONTEXT @ PREVIOUSというフレーズを繰り返し実行することで、検索順序を「アンロード」することがほぼ可能になった。ALSO CONTEXT !を繰り返すことで、検索順序を「再ロード」することができた。残念ながら、検索順序にいくつの単語リストが含まれているかを判断するポータブルな方法はありませんでした。

ANS ForthはCONTEXTという単語を削除しましたが、これは多くのシステムでCONTEXTの内容が複数の単語リストを参照しており、移植性の問題を複雑にしているためです。

コロン）が検索順序に影響しなくなったことに注意してください。コンパイルの単語リストが検索順序の最初の単語リストを置き換えるという以前の動作は、次のように: (colon)を再定義することでエミュレートできます。

    : : GET-ORDER SWAP DROP GET-CURRENT SWAP SET-ORDER : ; 

### A.16.2 Additional terms 

<term>
||search order||
Note that the use of the term "list" does not necessarily imply implementation as a linked list.

「リスト」という用語の使用は、必ずしもリンクリストとしての実装を意味しないことに注意。

</term>

#### A.16.3.3 Finding definition names 

In other words, the following is not guaranteed to work:  

    : FOO ... [ ... SET-CURRENT ] ... RECURSE ...
    ; IMMEDIATE 

RECURSE, ; (semicolon), and IMMEDIATE may or may not need information stored in the compilation  word list.

### A.16.6 Glossary 

##### A.16.6.1.2192 SEARCH-WORDLIST 

The string argument to SEARCH-WORDLIST is represented by c-addr u, rather than by just c-addr as with  FIND. The committee wishes to establish c-addr u as the preferred representation of a string on the stack,  and has adopted that representation for all new functions that accept string arguments. While this decision  may cause the implementation of SEARCH-WORDLIST to be somewhat more difficult in existing systems,  the committee feels that the additional difficulty is minor.

SEARCH-WORDLISTの文字列引数は、FINDのように単なるc-addrではなく、c-addr uで表現される。委員会は、c-addr uをスタック上の文字列の好ましい表現として確立することを望み、文字列引数を受け付けるすべての新しい関数にこの表現を採用した。この決定により、既存のシステムではSEARCH-WORDLISTの実装がいくらか難しくなるかもしれないが、委員会は、追加の難しさは軽微であると感じている。

When SEARCH-WORDLIST fails to find the word, it does not return the string, as does FIND. This is in  accordance with the general principle that Forth words consume their arguments.

SEARCH-WORDLISTが単語を見つけられなかった場合、FINDのように文字列を返さない。これは、Forth の単語は引数を消費するという一般的な原則に従っている。

##### A.16.6.2.0715 ALSO 

Here is an implementation of ALSO/ONLY in terms of the primitive search-order word set.

以下は、プリミティブ検索語集合の観点から ALSO/ONLY を実装したものです。

    WORDLIST CONSTANT ROOT ROOT SET-CURRENT  
    : DO-VOCABULARY ( -- ) \ Implementation factor 
        DOES> @ >R ( ) ( R: widnew ) 
            GET-ORDER SWAP DROP ( wid1 ... widn-1 n ) 
        R> SWAP SET-ORDER 
    ; 
    : DISCARD ( x1 .. xu u - ) \ Implementation factor 
        0 ?DO DROP LOOP \ DROP u+1 stack items 
    ; 
    CREATE FORTH FORTH-WORDLIST , DO-VOCABULARY  
    : VOCABULARY ( name -- ) WORDLIST CREATE , DO-VOCABULARY ; 
    : ALSO ( -- ) GET-ORDER OVER SWAP 1+ SET-ORDER ; 
    : PREVIOUS ( -- ) GET-ORDER SWAP DROP 1- SET-ORDER ; 
    : DEFINITIONS ( -- ) GET-ORDER OVER SET-CURRENT DISCARD ; 
    : ONLY ( -- ) ROOT ROOT 2 SET-ORDER ; 
    \ Forth-83 version; just removes ONLY 
    : SEAL ( -- ) GET-ORDER 1- SET-ORDER DROP ; 
    \ F83 and F-PC version; leaves only CONTEXT 
    : SEAL ( -- ) GET-ORDER OVER 1 SET-ORDER DISCARD ; 

The preceding definition of ONLY in terms of a "ROOT" word list follows F83 usage, and assumes that the  default search order just includes ROOT and FORTH. A more portable definition of FORTH and ONLY,  without the assumptions, is:  

前述の「ROOT」単語リストによるONLYの定義は、F83の用法に従ったもので、デフォルトの検索順序がROOTとFORTHを含むだけであると仮定している。FORTHとONLYのよりポータブルな定義（仮定なし）は以下の通りである：

    <omit the ... WORDLIST CONSTANT ROOT ... line> 
    CREATE FORTH GET-ORDER OVER , DISCARD DO-VOCABULARY  
    : ONLY ( -- ) -1 SET-ORDER ; 

Here is a simple implementation of GET-ORDER and SET-ORDER, including a corresponding definition of  FIND. The implementations of WORDLIST, SEARCH-WORDLIST, GET-CURRENT and SET-CURRENT depend on system details and are not given here.

ここでは、GET-ORDERとSET-ORDERの簡単な実装と、それに対応するFINDの定義を示す。WORDDLIST、SEARCH-WORDLIST、GET-CURRENT、SET-CURRENTの実装は、システムの詳細に依存するので、ここでは示さない。

    16 CONSTANT #VOCS 
    VARIABLE #ORDER  
    CREATE CONTEXT  #VOCS CELLS ALLOT  
    : GET-ORDER   ( -- wid1 .. widn n ) 
        #ORDER @ 0 ?DO 
            #ORDER @   I - 1- CELLS CONTEXT + @ 
        LOOP 
        #ORDER @ 
    ; 
    : SET-ORDER ( wid1 .. widn n -- ) 
        DUP -1 = IF 
            DROP <push system default word lists and n> 
        THEN 
        DUP #ORDER ! 
        0 ?DO I CELLS CONTEXT + ! LOOP 
    ; 
    : FIND ( c-addr -- c-addr 0 | w 1 | w -1 ) 
        0                       ( c-addr 0 ) 
        #ORDER @ 0 ?DO 
            OVER COUNT          ( c-addr 0 c-addr' u ) 
            I CELLS CONTEXT + @ ( c-addr 0 c-addr' u wid) 
            SEARCH-WORDLIST     ( c-addr 0; 0 | w 1 | w -1 ) 
            ?DUP IF             ( c-addr 0; w 1 | w -1 ) 
                2SWAP 2DROP LEAVE ( w 1 | w -1 ) 
            THEN                ( c-addr 0 ) 
        LOOP                    ( c-addr 0 | w 1 | w -1 ) 
    ; 

In an implementation where the dictionary search mechanism uses a hash table or lookup cache to reduce  the search time, SET-ORDER might need to reconstruct the hash table or flush the cache.

辞書検索メカニズムが検索時間を短縮するためにハッシュテーブルまたはルックアップ キャッシュを使用する実装では、SET-ORDERはハッシュテーブルを再構築するか、キャッシュをフラッシュ する必要があるかもしれない。

## A.17 The optional String word set 


### A.17.6 Glossary 


##### A.17.6.1.0245 /STRING 

/STRING is used to remove or add characters relative to the "left" end of the character string. Positive values of n will exclude characters from the string while negative values of n will include characters to the  left of the string. /STRING is a natural factor of WORD and commonly available.

`/STRING`は、文字列の "左 "端から相対的に文字を削除または追加するために使用される。nの正の値は文字列から文字を除外し、nの負の値は文字列の左端に文字を含めます。`/STRING`は`WORD`の自然数であり、一般的に使用できる。

##### A.17.6.1.0910 CMOVE 

If c-addr2 lies within the source region (i.e., when c-addr2 is not less than c-addr1 and c-addr2 is less than  the quantity c-addr1 u CHARS +), memory propagation occurs.

c-addr2 がソース領域内にある場合（つまり、c-addr2 が c-addr1 よりも小さくなく、かつ c-addr2 が量 c-addr1 u CHARS + よりも小さい場合）、メモリ伝搬が発生する。

Typical use: Assume a character string at address 100: "ABCD". Then after  

典型的な使用例： アドレス100に "ABCD "という文字列があるとする。次に

    100 DUP CHAR+ 3 CMOVE the string at address 100 is "AAAA".

Rationale for CMOVE and CMOVE> follows MOVE.

##### A.17.6.1.0920 CMOVE> 

If c-addr1 lies within the destination region (i.e., when c-addr1 is greater than or equal to c-addr2 and c-addr2 is less than the quantity c-addr1 u CHARS +), memory propagation occurs.

c-addr1がデスティネーション領域内にある場合（すなわち、c-addr1がc-addr2以上であり、かつc-addr2が量c-addr1 u CHARS +より小さい場合）、メモリ伝搬が起こる。

Typical use: Assume a character string at address 100: "ABCD". Then after   

    100 DUP CHAR+ SWAP 3 CMOVE> the string at address 100 is "DDDD".

##### A.17.6.1.0935 COMPARE 

Existing Forth systems perform string comparison operations using words that differ in spelling, input and  output arguments, and case sensitivity. One in widespread use was chosen.

既存のForthシステムは、スペル、入力引数、出力引数、大文字と小文字の区別が異なる単語を使って文字列比較演算を行う。広く使われているものを選んだ。

##### A.17.6.1.2191 SEARCH 

Existing Forth systems perform string searching operations using words that differ in spelling, input and  output arguments, and case sensitivity. One in widespread use was chosen.

既存のForthシステムは、スペル、入出力引数、大文字と小文字の区別が異なる単語を使って文字列検索操作を行う。広く使われているものを選んだ。

##### A.17.6.1.2212 SLITERAL 

The current functionality of **6.1.2165  S"** may be provided by the following definition:  

    : S" ( "ccc<quote>" -- ) 
        [CHAR] " PARSE POSTPONE SLITERAL 
    ; IMMEDIATE 

# B. Bibliography (informative annex)  

## Industry standards

Forth-77 Standard, Forth Users Group, FST-780314.

Forth-78 Standard, Forth International Standards Team.

Forth-79 Standard, Forth Standards Team.

Forth-83 Standard and Appendices, Forth Standards Team.

The standards referenced in this section were developed by the Forth Standards Team, a volunteer group  which included both implementors and users. This was a volunteer organization operating under its own  charter and without any formal ties to ANSI, IEEE or any similar standards body. Several members of the  Forth Standards Team have also been members of the X3J14 Technical Committee.

このセクションで言及されている標準は、実装者とユーザーの両方を含むボランティアグループであるForth Standards Teamによって開発された。これは、ANSI、IEEE、または類似の標準化団体と正式な関係を持たず、独自の憲章の下で運営されるボランティア団体であった。Forth標準化チームのメンバーの何人かは、X3J14技術委員会のメンバーでもあった。

## Books  

Brodie, L. Starting FORTH (2nd ed). Englewood Cliffs, NJ: Prentice Hall, 1987.

Brodie, L. Thinking FORTH. Englewood Cliffs, NJ: Prentice Hall, 1984.

Feierbach, G. and Thomas, P. Forth Tools & Applications. Reston, VA: Reston Computer Books, 1985.

Haydon, Dr. Glen B. All About FORTH, Third Edition. La Honda, CA: 1990.

Kelly, Mahlon G. and Spies, N. FORTH: A Text and Reference. Englewood Cliffs, NJ: Prentice Hall,  1986.

Knecht, K. Introduction to Forth. Indiana: Howard Sams & Co., 1982.

Koopman, P. Stack Computers, The New Wave. Chichester, West Sussex, England: Ellis Horwood Ltd. 1989 

Martin, Thea, editor. A Bibliography of Forth References, Third Edition. Rochester, New York: Institute  of Applied Forth Research, 1987.

McCabe, C. K. Forth Fundamentals (2 volumes). Oregon: Dilithium Press, 1983.

Pountain, R. Object Oriented Forth. London, England: Academic Press, 1987.

Ouverson, Marlin, editor. Dr. Dobbs Toolbook of Forth. Redwood City, CA: M&T Press, Vol. 1, 1986;  Vol. 2, 1987.

Terry, J. D. Library of Forth Routines and Utilities. New York: Shadow Lawn Press, 1986  

Tracy, M. and Anderson, A. Mastering FORTH (revised ed). New York: Brady Books, 1989.

Winfield, A. The Complete Forth. New York: Wiley Books, 1983.

## Journals, magazines and newsletters  

Forsley, Lawrence P., Conference Chairman. Rochester Forth Conference Proceedings. Rochester, New  York: Institute of Applied Forth Research, 1981 to present.

Forsley, Lawrence P., Editor-in-Chief. The Journal of Forth Application and Research. Rochester, New  York: Institute of Applied Forth Research, 1983 to present.

Frenger, Paul, editor. SIGForth Newsletter. New York, NY: Association for Computing Machinery, 1989  to present.

Ouverson, Marlin, editor. Forth Dimensions. San Jose, CA: The Forth Interest Group, 1978 to present.

Reiling, Robert, editor. FORML Conference Proceedings. San Jose, CA: The Forth Interest Group, 1980  to present.

Ting, Dr. C. H., editor. More on Forth Engines. San Mateo, CA: Offete Enterprises, 1986 to present.

## Selected articles  

Hayes, J.R. "Postpone" Proceedings of the 1989 Rochester Forth Conference. Rochester, New York:  Institute for Applied Forth Research, 1989.

Kelly, Guy M. "Forth." McGraw-Hill Personal Computer Programming Encyclopedia - Languages and Operation Systems. New York: McGraw-Hill, 1985.

Kogge, P. M. "An Architectural Trail to Threaded Code Systems." IEEE Computer (March, 1982).

Moore, C. H. "The Evolution of FORTH - An Unusual Language." Byte (August 1980).

Rather, E. D. "Forth Programming Language." Encyclopedia of Physical Science & Technology (Vol. 5).
New York: Academic Press, 1987.

Rather, E. D. "FORTH." Computer Programming Management. Auerbach Publishers, Inc., 1985.

Rather, E. D.; Colburn, D. R.; Moore, C. H. "The Evolution of FORTH." ACM SIGPLAN Notices.
(Vol. 28, No. 3, March 1993).

# C. Perspective (informative annex)  

The purpose of this section is to provide an informal overview of Forth as a language, illustrating its history,  most prominent features, usage, and common implementation techniques. Nothing in this section should be  considered as binding upon either implementors or users. A list of books and articles is given in Annex B for those interested in learning more about Forth.

このセクションの目的は、言語としてのForthの非公式な概要を提供し、その歴史、最も顕著な特徴、使用法、および一般的な実装技術を説明することです。このセクションの内容は、実装者やユーザーを拘束するものではありません。Forthについてもっと知りたいという人のために、書籍と記事のリストを付録Bに示します。

## C.1 Features of Forth 

Forth provides an interactive programming environment. Its primary uses have been in scientific and  industrial applications such as instrumentation, robotics, process control, graphics and image processing,  artificial intelligence and business applications. The principal advantages of Forth include rapid, interactive  software development and efficient use of computer hardware.

Forth is often spoken of as a language because that is its most visible aspect. But in fact, Forth is both more  and less than a conventional programming language: more in that all the capabilities normally associated  with a large portfolio of separate programs (compilers, editors, etc.) are included within its range and less in  that it lacks (deliberately) the complex syntax characteristic of most high-level languages.

The original implementations of Forth were stand-alone systems that included functions normally performed  by separate operating systems, editors, compilers, assemblers, debuggers and other utilities. A single  simple, consistent set of rules governed this entire range of capabilities. Today, although very fast stand-alone versions are still marketed for many processors, there are also many versions that run co-resident with  conventional operating systems such as MS-DOS and UNIX.

Forthはインタラクティブなプログラミング環境を提供する。その主な用途は、計測器、ロボット工学、プロセス制御、グラフィックス、画像処理、人工知能、ビジネス・アプリケーションなどの科学的・産業的アプリケーションである。Forthの主な利点は、迅速でインタラクティブなソフトウェア開発と、コンピュータ・ハードウェアの効率的な使用である。

Forthは言語として語られることが多い。しかし実際には、Forthは従来のプログラミング言語以上でもあり、それ以下でもある。通常、独立したプログラム（コンパイラ、エディタなど）の大規模なポートフォリオに関連するすべての機能がその範囲に含まれているという点ではそれ以上であり、ほとんどの高級言語に特徴的な複雑な構文が（意図的に）欠如しているという点ではそれ以下である。

Forthの最初の実装は、通常は別々のオペレーティング・システム、エディタ、コンパイラ、アセンブラ、デバッガ、その他のユーティリティによって実行される機能を含むスタンドアロン・システムでした。単一のシンプルで一貫性のあるルールセットが、この機能の全範囲を支配していた。今日でも、非常に高速なスタンドアロン版が多くのプロセッサ向けに販売されているが、MS-DOSやUNIXのような従来のオペレーティング・システムと同居して動作するバージョンも数多くある。

Forth is not derived from any other language. As a result, its appearance and internal characteristics may  seem unfamiliar to new users. But Forth’s simplicity, extreme modularity, and interactive nature offset the  initial strangeness, making it easy to learn and use. A new Forth programmer must invest some time  mastering its large command repertoire. After a month or so of full-time use of Forth, that programmer  could understand more of its internal working than is possible with conventional operating systems and  compilers.

The most unconventional feature of Forth is its extensibility. The programming process in Forth consists of  defining new "words" - actually new commands in the language. These may be defined in terms of  previously defined words, much as one teaches a child concepts by explaining them in terms of previously  understood concepts. Such words are called "high-level definitions". Alternatively, new words may also be  defined in assembly code, since most Forth implementations include an assembler for the host processor.

This extensibility facilitates the development of special application languages for particular problem areas  or disciplines.

Forthは他の言語から派生したものではない。そのため、Forthの外観や内部的な特徴は、新しいユーザーにとっては見慣れないものに見えるかもしれません。しかし、Forthのシンプルさ、極端なモジュール性、対話的な性質は、最初の奇妙さを相殺し、学びやすく、使いやすくしています。新しいForthプログラマーは、その膨大なコマンドのレパートリーをマスターするのに時間をかけなければならない。Forthを1ヶ月ほどフルタイムで使えば、従来のオペレーティング・システムやコンパイラでは不可能なほど、Forthの内部動作を理解できるようになる。

Forthの最も型破りな特徴は、その拡張性にある。Forthのプログラミング・プロセスは、新しい「単語」、つまり実際には言語の新しいコマンドを定義することからなる。これらの単語は、以前に定義された単語の観点から定義することができる。このような単語は「ハイレベル定義」と呼ばれる。また、ほとんどのForth実装にはホスト・プロセッサ用のアセンブラが含まれているため、新しい単語をアセンブリ・コードで定義することもできます。

このような拡張性により、特定の問題分野や専門分野に特化したアプリケーション言語の開発が容易になります。

Forth’s extensibility goes beyond just adding new commands to the language. With equivalent ease, one  can also add new kinds of words. That is, one may create a word which itself will define words. In creating  such a defining word the programmer may specify a specialized behavior for the words it will create which  will be effective at compile time, at run-time, or both. This capability allows one to define specialized data  types, with complete control over both structure and behavior. Since the run-time behavior of such words  may be defined either in high-level or in code, the words created by this new defining word are equivalent to  all other kinds of Forth words in performance. Moreover, it is even easy to add new compiler directives to  implement special kinds of loops or other control structures.

Most professional implementations of Forth are written in Forth. Many Forth systems include a "meta-compiler" which allows the user to modify the internal structure of the Forth system itself.

Forthの拡張性は、単に新しいコマンドを追加するだけではない。同じように簡単に、新しい種類の単語を追加することもできる。つまり、単語を定義する単語を作成することができる。このような定義語を作成する際、プログラマーは、コンパイル時、実行時、またはその両方において有効な、作成する語の特殊な動作を指定することができる。この機能により、構造と動作の両方を完全に制御して、特殊なデータ型を定義することができる。このようなワードの実行時の動作は、高レベルでもコードでも定義できるため、この新しい定義ワードによって作成されるワードは、性能的には他のすべての種類のForthワードと同等です。さらに、特殊なループやその他の制御構造を実装するために、新しいコンパイラ指令を追加することさえ簡単です。

Forthの専門的な実装のほとんどは、Forthで書かれている。多くのForthシステムには、ユーザーがForthシステム自体の内部構造を変更できる「メタ・コンパイラ」が含まれている。


## C.2 History of Forth 

Forth was invented by Charles H. Moore. A direct outgrowth of Moore’s work in the 1960’s, the first  program to be called Forth was written in about 1970. The first complete implementation was used in 1971  at the National Radio Astronomy Observatory’s 11-meter radio telescope in Arizona. This system was  responsible for pointing and tracking the telescope, collecting data and recording it on magnetic tape, and  supporting an interactive graphics terminal on which an astronomer could analyze previously recorded data.

The multi-tasking nature of the system allowed all these functions to be performed concurrently, without  timing conflicts or other interference - a very advanced concept for that time.

The system was so useful that astronomers from all over the world began asking for copies. Its use spread  rapidly, and in 1976 Forth was adopted as a standard language by the International Astronomical Union.

In 1973, Moore and colleagues formed FORTH, Inc. to explore commercial uses of the language. FORTH,  Inc. developed multi-user versions of Forth on minicomputers for diverse projects ranging from data bases  to scientific applications such as image processing. In 1977, FORTH, Inc. developed a version for the  newly introduced 8-bit microprocessors called "microFORTH", which was successfully used in embedded  microprocessor applications in the United States, Britain and Japan.

Forthはチャールズ・H・ムーアによって発明された。1960年代のムーアの研究から直接発展し、Forthと呼ばれる最初のプログラムは1970年頃に書かれた。最初の完全な実装は、1971年にアリゾナ州にある国立電波天文台の11メートル電波望遠鏡で使われた。このシステムは、望遠鏡のポインティングとトラッキング、データの収集と磁気テープへの記録、天文学者が以前に記録したデータを分析するための対話型グラフィック端末のサポートを担当した。

このシステムのマルチタスク性により、これらすべての機能を、タイミングの衝突や他の干渉なしに同時に実行することができた。

このシステムは非常に便利であったため、世界中の天文学者がコピーを求め始めた。その使用は急速に広まり、1976年には国際天文学連合によってForthが標準言語として採用された。

1973年、ムーアと同僚たちはFORTH, Inc.を設立し、この言語の商業的利用を模索した。FORTH, Inc.は、データ・ベースから画像処理のような科学的アプリケーションまで、さまざまなプロジェクトのためにミニコンピュータ上でForthのマルチユーザー版を開発した。1977年、FORTH, Inc.は「microFORTH」と呼ばれる新しく登場した8ビットマイクロプロセッサ用のバージョンを開発し、アメリカ、イギリス、日本の組み込みマイクロプロセッサ・アプリケーションで成功しました。

Stimulated by the volume marketing of microFORTH, a group of computer hobbyists in Northern California  became interested in Forth, and in 1978 formed the Forth Interest Group (FIG). They developed a  simplified model which they implemented on several microprocessors and published listings and disks at  very low cost. Interest in Forth spread rapidly, and today there are chapters of the Forth Interest Group  throughout the U.S. and in over fifteen countries.

microFORTHの量販に刺激され、北カリフォルニアのコンピュータ趣味のグループがForthに興味を持ち、1978年にForth Interest Group（FIG）を結成した。彼らは簡略化したモデルを開発し、いくつかのマイクロプロセッサーに実装して、非常に安価なリストとディスクを出版した。Forthへの関心は急速に広まり、現在ではForth Interest Groupの支部が全米と15カ国以上に存在する。

By 1980, a number of new Forth vendors had entered the market with versions of Forth based upon the FIG  model. Primarily designed for personal computers, these relatively inexpensive Forth systems have been  distributed very widely.

1980年までに、多くの新しいForthベンダーが、FIGモデルに基づいたバージョンのForthを市場に投入した。主にパーソナルコンピュータ用に設計されたこれらの比較的安価なForthシステムは、非常に広く配布されている。

## C.3 Hardware implementations of Forth 

The internal architecture of Forth simulates a computer with two stacks, a set of registers, and other  standardized features. As a result, it was almost inevitable that someone would attempt to build a hardware  representation of an actual Forth computer.

Forthの内部アーキテクチャは、2つのスタック、レジスタのセット、およびその他の標準化された機能を持つコンピュータをシミュレートしています。その結果、誰かが実際のForthコンピュータをハードウェアで表現しようとするのは、ほぼ必然的なことでした。

In the early 1980’s, Rockwell produced a 6502-variant with Forth primitives in on-board ROM, the  Rockwell 65F11. This chip has been used successfully in many embedded microprocessor applications. In  the mid-1980’s Zilog developed the z8800 (Super8) which offered ENTER (nest), EXIT (unnest) and  NEXT in microcode.

1980年代初頭、ロックウェル社は、オンボードROMにForthプリミティブを搭載した6502変種、ロックウェル65F11を製造しました。このチップは、多くの組み込みマイクロプロセッサ・アプリケーションで成功裏に使用されました。1980年代半ば、ZilogはマイクロコードでENTER（ネスト）、EXIT（アンネスト）、NEXTを提供するz8800（Super8）を開発した。

In 1981, Moore undertook to design a chip-level implementation of the Forth virtual machine. Working  first at FORTH, Inc. and subsequently with the start-up company NOVIX, formed to develop the chip,  Moore completed the design in 1984, and the first prototypes were produced in early 1985. More recently,  Forth processors have been developed by Harris Semiconductor Corp., Johns Hopkins University, and  others.

1981年、ムーアはForth仮想マシンのチップレベル実装の設計に着手した。最初はFORTH社で、その後チップを開発するために設立された新興企業NOVIX社と共同で、ムーアは1984年に設計を完了し、1985年初めに最初のプロトタイプが製造された。最近では、ハリス・セミコンダクター社やジョンズ・ホプキンス大学などがForthプロセッサを開発している。

## C.4 Standardization efforts 

The first major effort to standardize Forth was a meeting in Utrecht in 1977. The attendees produced a  preliminary standard, and agreed to meet the following year. The 1978 meeting was also attended by  members of the newly formed Forth Interest Group. In 1979 and 1980 a series of meetings attended by both  users and vendors produced a more comprehensive standard called Forth 79.

Forthを標準化するための最初の大きな取り組みは、1977年にユトレヒトで開かれた会議であった。出席者は予備的な標準を作成し、翌年に会合を開くことに合意した。1978年の会議には、新しく結成されたForth Interest Groupのメンバーも参加した。1979年と1980年には、ユーザーとベンダーの両方が参加する一連の会議が開かれ、より包括的な標準規格「Forth 79」が策定された。

Although Forth 79 was very influential, many Forth users and vendors found serious flaws in it, and in 1983  a new standard called Forth 83 was released.

Forth 79は非常に大きな影響力を持ったが、多くのForthユーザーやベンダーが重大な欠陥を発見し、1983年にForth 83と呼ばれる新しい標準がリリースされた。

Encouraged by the widespread acceptance of Forth 83, a group of users and vendors met in 1986 to  investigate the feasibility of an American National Standard. The X3J14 Technical Committee for ANS  Forth held its first meeting in 1987. This Standard is the result.

Forth 83が広く受け入れられたことに後押しされ、1986年にユーザーとベンダーのグループが集まり、米国国家標準の実現可能性を調査することになった。ANS ForthのためのX3J14技術委員会は、1987年に最初の会合を開いた。この規格はその結果である。

## C.5 Programming in Forth 

Forth is an English-like language whose elements (called "words") are named data items, procedures, and  defining words capable of creating data items with customized characteristics. Procedures and defining  words may be defined in terms of previously defined words or in machine code, using an embedded  assembler.

Forthは英語ライクな言語であり、その要素（「単語」と呼ばれる）は、名前付きデータ項目、手続き、およびカスタマイズされた特性を持つデータ項目を作成できる定義語である。手続きや定義語は、以前に定義された語や、組み込みアセンブラを使用した機械語コードで定義することができます。

Forth "words" are functionally analogous to subroutines in other languages. They are also equivalent to  commands in other languages - Forth blurs the distinction between linguistic elements and functional  elements.

Forthの「単語」は、機能的には他の言語のサブルーチンに類似しています。Forthは、言語的要素と機能的要素の区別を曖昧にしています。

Words are referred to either from the keyboard or in program source by name. As a result, the term "word"  is applied both to program (and linguistic) units and to their text names. In parsing text, Forth considers a  word to be any string of characters bounded by spaces. There are a few special characters that cannot be  included in a word or start a word: space (the universal delimiter), CR (which ends terminal input), and  backspace or DEL (for backspacing during keyboard input). Many groups adopt naming conventions to  improve readability. Words encountered in text fall into three categories: defined words (i.e., Forth  routines), numbers, and undefined words. For example, here are four words:

単語は、キーボードから、あるいはプログラム・ソースの中で、名前によって参照される。そのため、「単語」という用語は、プログラム（および言語）単位とそのテキスト名の両方に適用されます。テキストの解析では、Forth は単語をスペースで区切られた文字列とみなします。スペース（世界共通の区切り文字）、CR（端末入力を終了させる）、バックスペースまたはDEL（キーボード入力中にバックスペースする）です。多くのグループは、読みやすさを向上させるために命名規則を採用している。テキストで使われる単語は、定義された単語（Forthルーチン）、数字、未定義の単語の3つに分類されます。例えば、次の4つの単語があります：

    HERE DOES> ! 8493
    
The first three are standard-defined words. This means that they have entries in Forth’s dictionary,  described below, explaining what Forth is to do when these words are encountered. The number "8493"  will presumably not be found in the dictionary, and Forth will convert it to binary and place it on its push-down stack for parameters. When Forth encounters an undefined word and cannot convert it to a number,  the word is returned to the user with an exception message.

最初の3つは標準定義の単語です。これは、後述するForthの辞書に、これらの単語に遭遇したときにForthが何をすべきかを説明する項目があることを意味します。8493」という数字はおそらく辞書にはなく、Forth はこれをバイナリに変換し、パラメータ用のプッシュダウン・スタックに置きます。Forthが未定義の単語に遭遇し、それを数字に変換できない場合、その単語は例外メッセージとともにユーザーに返されます。

Architecturally, Forth words adhere strictly to the principles of "structured programming":  

アーキテクチャ上、Forthの単語は「構造化プログラミング」の原則に厳密に従います：  

- Words must be defined before they are used.
- Logical flow is restricted to sequential, conditional, and iterative patterns. Words are included to implement the most useful program control structures.
- The programmer works with many small, independent modules (words) for maximum testability and reliability.

- 単語は使用される前に定義されていなければなりません。
- 論理フローは、シーケンシャル、条件付き、反復のパターンに制限されています。ワードは、最も有用なプログラム制御構造を実装するために含まれています。
- プログラマーは、テスト容易性と信頼性を最大化するために、多くの独立した小さなモジュール（単語）を使って作業する。

Forth is characterized by five major elements: a dictionary, two push-down stacks, interpreters, an  assembler, and virtual storage. Although each of these may be found in other systems, the combination  produces a synergy that yields a powerful and flexible system.

Forthは、辞書、2つのプッシュダウン・スタック、インタプリタ、アセンブラ、仮想記憶装置という5つの主要な要素を特徴としている。これらの各要素は他のシス テムにもあるかもしれませんが、組み合わせることで相乗効果が生まれ、強力で柔軟なシス テムが生まれます。

### C.5.1 The Forth dictionary 

A Forth program is organized into a dictionary that occupies most of the memory used by the system. This  dictionary is a threaded list of variable-length items, each of which defines a word. The content of each  definition depends upon the type of word (data item, constant, sequence of operations, etc.). The dictionary  is extensible, usually growing toward high memory. On some multi-user systems individual users have  private dictionaries, each of which is connected to a shared system dictionary.

Forth プログラムは、システムで使用されるメモリの大部分を占める辞書に編成されます。この辞書は可変長項目のスレッドリストであり、各項目は単語を定義します。各定義の内容は、単語のタイプ（データ項目、定数、演算シーケンスなど）に依存する。辞書は拡張可能であり、通常は大容量メモリに向かって成長する。マルチユーザーシステムでは、各ユーザーがプライベート辞書を持ち、それぞれが共有システム辞書に接続され ているものもある。

Words are added to the dictionary by "defining words", of which the most commonly used is : (colon).  

単語は「定義語」によって辞書に追加される。 

When : is executed, it constructs a definition for the word that follows it. In classical implementations,^^X content of this definition is a string of addresses of previously defined words which will be executed in turn  whenever the word being defined is invoked. The definition is terminated by ; (semicolon). For example,  here is a definition:  

`:`(コロン) が実行されると、それに続く単語の定義が構築される。古典的な実装では、この定義の内容は、定義されている単語が呼び出されるたびに順番に実行される、以前に定義された単語のアドレスの文字列である。定義は;（セミコロン）で終了する。例えば、次のような定義がある：

^^X{Other common implementation techniques include direct translation to code and other types of tokens.
^^}

    : RECEIVE ( -- addr n ) PAD DUP 32 ACCEPT ; 

The name of the new word is RECEIVE. The comment (in parentheses) indicates that it requires no  parameters and will return an address and count on the data stack. When RECEIVE is executed, it will  perform the words in the remainder of the definition in sequence. The word PAD places on the stack the  address of a scratch pad used to handle strings. DUP duplicates the top stack item, so we now have two  copies of the address. The number 32 is also placed on the stack. The word ACCEPT takes an address  (provided by PAD) and length (32) on the stack, accepts from the keyboard a string of up to 32 characters which will be placed at the specified address, and returns the number of characters received. The copy of  the scratch-pad address remains on the stack below the count so that the routine that called RECEIVE can  use it to pick up the received string.

新しい単語の名前は RECEIVE である。コメント（括弧内）は、パラメータを必要とせず、データスタック上のアドレスとカウントを返すことを示している。RECEIVEが実行されると、定義の残りのワードを順番に実行する。PAD は、文字列を扱うためのスクラッチパッドのアドレスをスタックに置く。DUPはスタックの一番上の項目を複製するので、アドレスのコピーが2つあることになる。32番もスタックに置かれる。ACCEPTは、スタック上のアドレス（PADによって与えられる）と長さ（32）を受け取り、キーボードから最大32文字の文字列を受け取り、指定されたアドレスに配置し、受け取った文字数を返す。スクラッチ・パッド・アドレスのコピーは、RECEIVE を呼び出したルーチンが受信した文字列をピックアップするために使用できるように、カウントの下のスタックに残ります。

### C.5.2 Push-down stacks 

The example above illustrates the use of push-down stacks for passing parameters between Forth words.  Forth maintains two push-down stacks, or LIFO lists. These provide communication between Forth words  plus an efficient mechanism for controlling logical flow. A stack contains 16-bit items on 8-bit and 16-bit  computers, and 32-bit items on 32-bit processors. Double-cell numbers occupy two stack positions, with  the most-significant part on top. Items on either stack may be addresses or data items of various kinds.  Stacks are of indefinite size, and usually grow towards low memory.

上記の例では、Forth ワード間のパラメータ受け渡しにプッシュダウン・スタックを使用し ています。 Forth は、2 つのプッシュダウン・スタック（LIFO リスト）を保持します。これらは、Forth ワード間の通信と、論理フローを制御するための効率的なメカニズムを提供します。スタックには、8 ビットと 16 ビットのコンピュータでは 16 ビットの項目が、32 ビットのプロセッサでは 32 ビットの項目が含まれます。ダブルセル番号は2つのスタック位置を占め、最上位が上になる。どちらのスタック上の項目も、アドレスであったり、様々な種類のデータ項目であったりする。 スタックの大きさは不定で、通常はメモリが少ないほど大きくなる。

Although the structure of both stacks is the same, they have very different uses. The user interacts most  directly with the Data Stack, which contains arguments passed between words. This function replaces the  calling sequences used by conventional languages. It is efficient internally, and makes routines intrinsically  re-entrant. The second stack is called the Return Stack, as its main function is to hold return addresses for  nested definitions, although other kinds of data are sometimes kept there temporarily.

両スタックの構造は同じだが、その用途は大きく異なる。ユーザーは、単語間で渡される引数を含むデータ・スタックと最も直接的にやりとりする。この機能は、従来の言語で使われていた呼び出しシーケンスに取って代わるものである。内部的に効率的で、ルーチンを本質的にリエントラントにする。第2のスタックはリターン・スタックと呼ばれ、その主な機能はネストされた定義のリターン・アドレスを保持することであるが、他の種類のデータが一時的に保持されることもある。

The use of the Data Stack (often called just "the stack") leads to a notation in which operands precede  operators. The word ACCEPT in the example above took an address and count from the stack and left  another address there. Similarly, a word called BLANK expects an address and count, and will place the  specified number of space characters (20H) in the region starting at that address. Thus, 

データ・スタック（しばしば単に "スタック "と呼ばれる）の使用は、演算子の前にオペランドを置く表記法につながる。上の例のACCEPTという単語は、スタックからアドレスとカウントを取り出し、そこに別のアドレスを残す。同様に、BLANKと呼ばれるワードはアドレスとカウントを期待し、そのアドレスから始まる領域に指定された数のスペース文字（20H）を配置する。このように

    PAD 25 BLANK
    
will fill the scratch region whose address is pushed on the stack by PAD with 25 spaces. Application words  are usually defined to work similarly. For example,

は、PADによってスタックにプッシュされたアドレスのスクラッチ領域を25個のスペースで埋める。通常、アプリケーション・ワードも同様に定義される。例えば

    100 SAMPLES 

might be defined to record 100 measurements in a data array.

は、データ配列に100個の測定値を記録するように定義されるかもしれない。

Arithmetic operators also expect values and leave results on the stack. For example, + adds the top two  numbers on the stack, replacing them both by their sum. Since results of operations are left on the stack,  operations may be strung together without a need to define variables to use for temporary storage.

算術演算子もまた、値を期待し、結果をスタックに残す。例えば、「+」はスタックの上の2つの数値を加算し、その和で置き換える。演算の結果はスタックに残されるので、一時記憶用の変数を定義しなくても、演算を連 続させることができる。

### C.5.3 Interpreters 

Forth is traditionally an interpretive system, in that program execution is controlled by data items rather than  machine code. Interpreters can be slow, but Forth maintains the high speed required of real-time  applications by having two levels of interpretation.

Forth は伝統的にインタプリタ・システムであり、プログラムの実行はマシン・コードで はなくデータ項目によって制御されます。インタプリタは低速になることがありますが、Forth は 2 つのレベルのインタプリタを持つことで、リアル タイム・アプリケーションに要求される高速性を維持しています。

The first is the text interpreter, which parses strings from the terminal or mass storage and looks each word  up in the dictionary. When a word is found it is executed by invoking the second level, the address  interpreter.

1つ目はテキスト・インタープリターで、端末や大容量記憶装置からの文字列を解析し、各単語を辞書で調べます。単語が見つかると、2番目のレベルであるアドレス・インタプリタを呼び出して実行する。

The second is an "address interpreter". Although not all Forth systems are implemented in this way, it was  the first and is still the primary implementation technology. For a small cost in performance, an address  interpreter can yield a very compact object program, which has been a major factor in Forth’s wide  acceptance in embedded systems and other applications where small object size is desirable.

もうひとつは「アドレス・インタープリタ」である。すべてのForthシステムがこの方法で実装されているわけではありませんが、最初の実装技術であり、現在でも主要な実装技術となっています。アドレス・インタープリターは、わずかな性能のコストで、非常にコンパクトなオブジェクト・プログラムを作成することができ、これが、組み込みシステムや、オブジェクト・サイズが小さいことが望ましい他のアプリケーションにおいて、Forthが広く受け入れられている大きな要因となっている。

The address interpreter processes strings of addresses or tokens compiled in definitions created by : (colon), by executing the definition pointed to by each. The content of most definitions is a sequence of addresses of previously defined words, which will be executed by the address interpreter in turn. Thus,  when the word RECEIVE (defined above) is executed, the word PAD, the word DUP, the literal 32, and the  word ACCEPT will be executed in sequence. The process is terminated by the semicolon. This execution  requires no dictionary searches, parsing, or other logic, because when RECEIVE was *compiled* the  dictionary was searched for each word, and its address (or other token) was placed in the next successive  cell of the entry. The text was not stored in memory, not even in condensed form.

アドレス・インタープリタは、:(コロン)で作成された定義にコンパイルされたアドレスやトークンの文字列を、それぞれが指す定義を実行することで処理します。ほとんどの定義の内容は、以前に定義された単語のアドレスの列であり、アドレス・インタープリタによって順番に実行される。したがって、単語RECEIVE（上で定義）が実行されると、単語PAD、単語DUP、リテラル32、単語ACCEPTが順に実行される。この処理はセミコロンで終了する。なぜなら、RECEIVEが*コンパイル*されたとき、各単語について辞書が検索され、そのアドレス（または他のトークン）がエントリの次の連続するセルに置かれたからである。テキストはメモリに保存されず、凝縮された形でも保存されなかった。

The address interpreter has two important properties. First, it is fast. Although the actual speed depends  upon the specific implementation, professional implementations are highly optimized, often requiring only  one or two machine instructions per address. On most benchmarks, a good Forth implementation  substantially out-performs interpretive languages such as BASIC or LISP, and will compare favorably with  other compiled high-level languages.

アドレスインタープリターには2つの重要な特性がある。第一に、高速である。実際の速度は特定の実装に依存しますが、プロの実装は高度に最適化されており、多くの場合、1アドレスあたり1～2個の機械命令しか必要としません。ほとんどのベンチマークにおいて、優れたForthの実装はBASICやLISPのようなインタープリタ型言語を大幅に凌駕し、他のコンパイル済み高級言語と比べても遜色ありません。

Second, the address interpreter makes Forth definitions extremely compact, as each reference requires only  one cell. In comparison, a subroutine call constructed by most compilers involves instructions for handling  the calling sequence (unnecessary in Forth because of the stack) before and after a CALL or JSR instruction  and address.

第二に、アドレス・インタプリタにより、Forthの定義は非常にコンパクトになります。それに比べ、ほとんどのコンパイラで作成されるサブルーチン・コールは、CALLまたはJSR命令とアドレスの前後に、呼び出しシーケンスを処理する命令（Forthではスタックがあるため不要）を含んでいます。

Most of the words in a Forth dictionary will be defined by : (colon) and interpreted by the address  interpreter. Most of Forth itself is defined this way.

Forth辞書のほとんどの単語は、:(コロン)で定義され、アドレス・インタプリタによって解釈されます。Forth自体のほとんどは、このように定義されています。

### C.5.4 Assembler 

Most implementations of Forth include a macro assembler for the CPU on which they run. By using the  defining word CODE the programmer can create a definition whose behavior will consist of executing actual  machine instructions. CODE definitions may be used to do I/O, implement arithmetic primitives, and do  other machine-dependent or time-critical processing. When using CODE the programmer has full control  over the CPU, as with any other assembler, and CODE definitions run at full machine speed.

Forthのほとんどの実装には、実行するCPU用のマクロ・アセンブラが含まれています。定義語のCODEを使用することで、プログラマーは実際のマシン命令を実行する動作を持つ定義を作成することができます。CODE定義は、I/O、算術プリミティブの実装、その他のマシン依存またはタイムクリティカルな処理に使用できます。CODEを使用する場合、プログラマは他のアセンブラと同様にCPUを完全に制御することができ、CODE定義は完全なマシン速度で実行されます。

This is an important feature of Forth. It permits explicit computer-dependent code in manageable pieces  with specific interfacing conventions that are machine-independent. To move an application to a different  processor requires re-coding only the CODE words, which will interact with other Forth words in exactly the  same manner.

これはForthの重要な特徴です。これはForthの重要な特徴であり、コンピュータに依存するコードを、マシンに依存しない特定のインターフェイス規則で管理可能な部分に明示的に記述することができます。アプリケーションを別のプロセッサに移行するには、CODE語だけを再コード化する必要があります。

Forth assemblers are so compact (typically a few Kbytes) that they can be resident in the system (as are the  compiler, editor, and other programming tools). This means that the programmer can type in short CODE definitions and execute them immediately. This capability is especially valuable in testing custom  hardware.

Forthアセンブラは非常にコンパクト（通常は数Kバイト）なので、（コンパイラ、エディタ、その他のプログラミング・ツールと同様に）システムに常駐させることができます。つまり、プログラマーは短いCODE定義を入力してすぐに実行することができます。この機能は、カスタム・ハードウェアのテストにおいて特に価値がある。

### C.5.5 Virtual memory 

The final unique element of Forth is its way of using disk or other mass storage as a form of "virtual  memory" for data and program source. As in the case of the address interpreter, this approach is historically  characteristic of Forth, but is by no means universal. Disk is divided into 1024-byte blocks. Two or more  buffers are provided in memory, into which blocks are read automatically when referred to. Each block has  a fixed block number, which in native systems is a direct function of its physical location. If a block is  changed in memory, it will be automatically written out when its buffer must be reused. Explicit reads and  writes are not needed; the program will find the data in memory whenever it accesses it.

Forthの最後のユニークな要素は、ディスクやその他の大容量記憶装置を、データやプログラム・ソースのための「仮想メモリ」の一形態として使用する方法です。アドレス・インタープリターの場合と同様、このアプローチは歴史的にForthの特徴であるが、決して普遍的なものではない。ディスクは1024バイトのブロックに分割されます。メモリ上には2つ以上のバッファが用意されており、参照されると自動的にブロックが読み込まれる。各ブロックは固定のブロック番号を持ち、ネイティブ・システムではこれは物理的な位置の直接関数である。メモリ上でブロックが変更された場合、そのバッファを再利用する必要があるときには自動的に書き出される。明示的な読み込みと書き込みは必要ない。プログラムがデータにアクセスするときはいつでも、メモリ内のデータを見つけることができる。

Block-oriented disk handling is efficient and easy for native Forth systems to implement. As a result, blocks  provide a completely transportable mechanism for handling program source and data across both native and  co-resident versions of Forth on different host operating systems.

ブロック指向のディスク処理は効率的で、ネイティブのForthシステムにとって実装しやすいものです。その結果、ブロックは、異なるホスト・オペレーティング・システム上のForthのネイティブ・バージョンと同居バージョンの両方にわたって、プログラム・ソースとデータを処理するための完全に移植可能なメカニズムを提供します。

Definitions in program source blocks are compiled into memory by the word LOAD. Most implementations  include an editor, which formats a block for display into 16 lines of 64 characters each, and provides  commands modifying the source. An example of a Forth source block is given in Fig. C.1 below.

プログラム・ソース・ブロックの定義は、LOADという単語によってメモリにコンパイルされます。ほとんどの実装にはエディタが含まれており、ブロックを64文字ずつ16行に整形して表示し、ソースを修正するコマンドを提供します。Forthソース・ブロックの例を図C.1に示す。

Source blocks have historically been an important element in Forth style. Just as Forth definitions may be  considered the linguistic equivalent of sentences in natural languages, a block is analogous to a paragraph.  A block normally contains definitions related to a common theme, such as "vector arithmetic". A comment  on the top line of the block identifies this theme. An application may selectively load the blocks it needs.

ソース・ブロックは、歴史的にForthスタイルにおける重要な要素です。Forthの定義が自然言語の文章に相当するように、ブロックは段落に相当します。 ブロックには通常、「ベクトル算術」など、共通のテーマに関連する定義が含まれています。ブロックの一番上の行にあるコメントで、このテーマを特定する。アプリケーションは必要なブロックを選択的にロードすることができる。

Blocks are also used to store data. Small records can be combined into a block, or large records spread over  several blocks. The programmer may allocate blocks in whatever way suits the application, and on native  systems can increase performance by organizing data to minimize disk head motion. Several Forth vendors  have developed sophisticated file and data base systems based on Forth blocks.

ブロックはデータの保存にも使われる。小さなレコードを1つのブロックにまとめたり、大きなレコードを複数のブロックにまたがったりすることができる。プログラマーは、アプリケーションに適した方法でブロックを割り当てることができ、ネイティブ・システムでは、ディスク・ヘッドの動きを最小限にするようにデータを整理することで、パフォーマンスを向上させることができる。いくつかのForthベンダーは、Forthブロックをベースとした洗練されたファイル・システムおよびデータベース・システムを開発している。

Versions of Forth that run co-resident with a host OS often implement blocks in host OS files. Others use  the host files exclusively. The Standard requires that blocks be available on systems providing any disk  access method, as they are the only means of referencing disk that can be transportable across both native  and co-resident implementations.

ホストOSと同居して動作するForthのバージョンは、ホストOSのファイルにブロックを実装することが多い。また、ホスト・ファイルを排他的に使用するものもあります。ブロックは、ネイティブ実装と同居実装の両方にまたがって移動可能な唯一のディスク参照手段であるため、本標準では、あらゆるディスクアクセス方式を提供するシステムで利用可能であることを要求しています。

### C.5.6 Programming environment 

Although this Standard does not require it, most Forth systems include a resident editor. This enables a  programmer to edit source and recompile it into executable form without leaving the Forth environment. As  it is easy to organize an application into layers, it is often possible to recompile only the topmost layer (which is usually the one currently under development), a process which rarely takes more than a few seconds.

本標準では必須ではありませんが、ほとんどのForthシステムにはエディタが常駐しています。これにより、プログラマはForth環境を離れることなくソースを編集し、実行可能な形式に再コンパイルすることができます。アプリケーションを階層化することは容易であるため、最上位階層（通常、現在開発中のもの）のみを再コンパイルすることが可能な場合が多く、この処理に数秒以上かかることはほとんどありません。

Most Forth systems also provide resident interactive debugging aids, not only including words such as those  in **15. The optional Programming-Tools word set**, but also having the ability to examine and change the  contents of VARIABLEs and other data items and to execute from the keyboard most of the component  words in both the underlying Forth system and the application under development.

ほとんどのForthシステムでは、常駐型の対話型デバッグ支援機能も提供されている。**15 オプションのProgramming-Tools単語セット**のような単語を含むだけでなく、VARIABLEやその他のデータ項目の内容を調べたり変更したりする機能や、基本的なForthシステムと開発中のアプリケーションの両方の構成単語のほとんどをキーボードから実行する機能も備えています。

The combination of resident editor, integrated debugging tools, and direct executability of most defined  words leads to a very interactive programming style, which has been shown to shorten development time.

常駐エディタ、統合されたデバッグ・ツール、および定義されたほとんどの単語の直接実行可能性の組み合わせは、非常にインタラクティブなプログラミング・スタイルにつながり、開発時間を短縮することが示されています。

### C.5.7 Advanced programming features 

One of the unusual characteristics of Forth is that the words the programmer defines in building an  application become integral elements of the language itself, adding more and more powerful application-oriented features.

Forthの珍しい特徴の1つは、プログラマーがアプリケーションを構築する際に定義する単語が言語自体の不可欠な要素となり、より強力なアプリケーション指向の機能を追加していくことです。

For example, Forth includes the words VARIABLE and 2VARIABLE to name locations in which data may  be stored, as well as CONSTANT and 2CONSTANT to name single and double-cell values. Suppose a  programmer finds that an application needs arrays that would be automatically indexed through a number of  two-cell items. Such an array might be called 2ARRAY. The prefix "2" in the name indicates that each  element in this array will occupy two cells (as would the contents of a 2VARIABLE or 2CONSTANT). The  prefix "2", however, has significance only to a human and is no more significant to the text interpreter than  any other character that may be used in a definition name.

例えば、ForthにはVARIABLEと2VARIABLEという単語があり、データを格納する場所を指定します。また、CONSTANTと2CONSTANTという単語もあり、シングルセルとダブルセルの値を指定します。あるプログラマが、アプリケーションで2セルの項目を自動的にインデックスする配列が必要だと考えたとする。そのような配列は2ARRAYと呼ばれるかもしれない。この名前の接頭辞 "2 "は、この配列の各要素が2セルを占めることを示す（2VARIABLEや2CONSTANTの内容と同じ）。しかし、接頭辞 "2 "は人間にとってのみ意味があり、テキスト・インタープリタにとっては、定義名で使用される他の文字よりも意味があるわけではない。

Such a definition has two parts, as there are two "behaviors" associated with this new word 2ARRAY, one at  compile time, and one at run or execute time. These are best understood if we look at how 2ARRAY is used  to define its arrays, and then how the array might be used in an application. In fact, this is how one would  design and implement this word.

このような定義には2つの部分があり、1つはコンパイル時、もう1つは実行時である。これらは、2ARRAYがその配列を定義するためにどのように使用され、次にその配列がアプリケーションでどのように使用されるかを見れば、最もよく理解できる。実際、これがこの単語を設計し実装する方法である。

Beginning the top-down design process, here’s how we would like to use 2ARRAY:  

トップダウンの設計プロセスとして、2ARRAYをどのように使いたいかを説明しよう：

    100 2ARRAY RAW 50 2ARRAY REFINED 

In the first case, we are defining an array 100 elements long, whose name is RAW. In the second, the array is 50 elements long, and is named REFINED. In each case, a size parameter is supplied to 2ARRAY on the data stack (Forth’s text interpreter automatically puts numbers there when it encounters them), and the name  of the word immediately follows. This order is typical of Forth defining words.

最初のケースでは、長さ100要素の配列を定義しており、その名前はRAWである。2番目のケースでは、配列の長さは50要素で、名前はREFINEDです。いずれの場合も、サイズ・パラメーターがデータ・スタック上の2ARRAYに供給され（Forthのテキスト・インタープリターは、数字に遭遇すると自動的にそこに数字を置く）、その直後に単語の名前が続く。この順序は、Forthが単語を定義するときの典型的な順序である。

When we use RAW or REFINED, we would like to supply on the stack the index of the element we want,  and get back the address of that element on the stack. Such a reference would characteristically take place  in a loop. Here’s a representative loop that accepts a two-cell value from a hypothetical application word  DATA and stores it in the next element of RAW:

RAWやREFINEDを使用する場合、スタック上に欲しい要素のインデックスを与え、スタック上のその要素のアドレスを取得したい。このような参照は、典型的にはループの中で行われる。以下はその代表的なループで、仮想的なアプリケーション・ワード DATA から 2 セルの値を受け取り、それを RAW の次の要素に格納します：

    : ACQUIRE 100 0 DO DATA I RAW 2! LOOP ; 

The name of this definition is ACQUIRE. The loop begins with DO, ends with LOOP, and will execute with  index values running from 0 through 99. Within the loop, DATA gets a value. The word I returns the  current value of the loop index, which is the argument to RAW. The address of the selected element,  returned by RAW, and the value, which has remained on the stack since DATA, are passed to the word 2! (pronounced "two-store"), which stores two stack items in the address.

この定義の名前は`ACQUIRE`である。ループは`DO`で始まり、`LOOP`で終わり、0から99までのインデックス値で実行される。ワードIは、`RAW`の引数であるループ・インデックスの現在値を返す。`RAW`が返す選択要素のアドレスと、`DATA`以降スタックに残っている値が、ワード2に渡される！(「ツーストア」と発音する)に渡され、そのアドレスに2つのスタック項目が格納される。

Now that we have specified exactly what 2ARRAY does and how the words it defines are to behave, we are  ready to write the two parts of its definition:  

これで`2ARRAY`が何をするのか、そして`2ARRAY`が定義する単語がどのように動作するのかを正確に指定することができたので、定義の2つの部分を書く準備ができた：

    : 2ARRAY  ( n -- ) 
       CREATE  2* CELLS ALLOT 
       DOES>  ( i a -- a')  SWAP  2* CELLS + ; 

The part of the definition before the word DOES> specifies the "compile-time" behavior, that is, what the 2ARRAY will do when it us used to define a word such as RAW. The comment indicates that this part expects a number on the stack, which is the size parameter. The word CREATE constructs the definition for  the new word. The phrase 2* CELLS converts the size parameter from two-cell units to the internal  addressing units of the system (normally characters). ALLOT then allocates the specified amount of  memory to contain the data to be associated with the newly defined array.

The second line defines the "run-time" behavior that will be shared by all words defined by 2ARRAY, such  as RAW and REFINED. The word DOES> terminates the first part of the definition and begins the second  part. A second comment here indicates that this code expects an index and an address on the stack, and will  return a different address. The index is supplied on the stack by the caller (of RAW in the example), while  the address of the content of a word defined in this way (the ALLOTted region) is automatically pushed on  top of the stack before this section of the code is to be executed. This code works as follows: SWAP reverses the order of the two stack items, to get the index on top. 2* CELLS converts the index to the  internal addressing units as in the compile-time section, to yield an offset from the beginning of the array.  The word + then adds the offset to the address of the start of the array to give the effective address, which is  the desired result.

DOES>の前の部分は、"コンパイル時 "の動作、つまり、2ARRAYがRAWのような単語を定義するために使われたときの動作を指定する。コメントは、この部分がスタック上の数値を期待していることを示している。CREATEは新しい単語の定義を構築する。2* CELLSというフレーズは、サイズ・パラメータを2セル単位からシステムの内部アドレス単位（通常は文字）に変換する。ALLOTは、新しく定義された配列に関連付けられるデータを格納するために、指定された量のメモリを確保する。

2行目は、RAWやREFINEDのような2ARRAYによって定義されるすべてのワードによって共有される「実行時」の動作を定義する。DOES＞は定義の最初の部分を終了し、2番目の部分を開始する。ここでの2つ目のコメントは、このコードがスタック上のインデックスとアドレスを期待し、異なるアドレスを返すことを示している。インデックスは（この例ではRAWの）呼び出し元からスタック上に供給され、一方、この方法で定義された単語の内容（ALLOTted領域）のアドレスは、コードのこのセクションが実行される前に、自動的にスタックの一番上にプッシュされる。このコードは次のように動作する： SWAPは2つのスタック項目の順序を逆にして、一番上のインデックスを取得する。2* CELLSは、コンパイル時のセクションと同じように、インデックスを内部アドレッシング単位に変換し、配列の先頭からのオフセットを得る。 次に、ワード＋は、オフセットを配列の開始アドレスに加算し、実効アドレスを与える。

Given this basic definition, one could easily modify it to do more sophisticated things. For example, the  compile-time code could be changed to initialize the array to zeros, spaces, or any other desired initial  value. The size of the array could be compiled at its beginning, so that the run-time code could compare the  index against it to ensure it is within range, or the entire array could be made to reside on disk instead of  main memory. None of these changes would affect the run-time usage we have specified in any way. This  illustrates a little of the flexibility available with these defining words.

この基本的な定義があれば、もっと洗練されたことができるように簡単に変更できる。例えば、コンパイル時のコードを変更して、配列をゼロや空白、その他の任意の初期値に初期化することができる。配列のサイズを最初にコンパイルしておき、ランタイムコードがインデックスと比較して範囲内であることを確認できるようにしたり、配列全体をメインメモリではなくディスク上に置くようにしたりすることもできる。これらの変更はいずれも、我々が指定したランタイムの使用法には何ら影響を与えない。これは、これらの定義語で利用可能な柔軟性の一端を示している。

### C.5.8 A programming example 

Figure C.1 contains a typical block of Forth source. It represents a portion of an application that controls a  bank of eight LEDs used as indicator lamps on an instrument, and indicates some of the ways in which Forth  definitions of various kinds combine in an application environment. This example was coded for a STD-bus  system with an 8088 processor and a millisecond clock, which is also used in the example.

図 C.1 に、Forth ソースの典型的なブロックを示します。これは、計器のインジケータ・ランプとして使用される 8 個の LED のバンクを制御するアプリケーションの一部を表しており、アプリケーション環境でさまざまな種類の Forth 定義を組み合わせる方法のいくつかを示しています。この例は、8088プロセッサとミリ秒クロックを備えたSTDバス・システム用にコード化されたもので、この例でもミリ秒クロックが使用されています。

The LEDs are interfaced through a single 8-bit port whose address is 40H. This location is defined as a  CONSTANT on Line 1, so that it may be referred to by name; should the address change, one need only  adjust the value of this constant. The word LIGHTS returns this address on the stack. The definition  LIGHT takes a value on the stack and sends it to the device. The nature of this value is a bit mask, whose  bits correspond directly to the individual lights.

LEDは、アドレスが40Hの8ビット・ポート1つを通してインターフェースされる。アドレスが変更された場合は、この定数の値を調整すればよい。LIGHTSは、このアドレスをスタックに戻す。LIGHTの定義は、スタック上の値を受け取り、それをデバイスに送る。この値の性質はビットマスクであり、そのビットは各ライトに直接対応する。

Thus, the command 255 LIGHT will turn on all lights, while 0 LIGHT will turn them all off.

したがって、255 LIGHT というコマンドはすべてのライトを点灯させ、0 LIGHT はすべてのライトを消灯させる。

```
    Block 180 
    0. ( LED control ) 
    1.  HEX 40 CONSTANT LIGHTS DECIMAL 
    2.  : LIGHT ( n -- ) LIGHTS OUTPUT ; 
    3.  
    4. VARIABLE DELAY 5.
    5. : SLOW 500 DELAY ! ;
    6. : FAST 100 DELAY ! ; 
    7. : COUNTS 256 0 DO I LIGHT DELAY @ MS LOOP ; 
    8. 
    9. : LAMP ( n - ) CREATE , DOES> ( a -- n ) @ ;
    10. 1 LAMP POWER 2 LAMP HV 4 LAMP TORCH
    11. 8 LAMP SAMPLING 16 LAMP IDLING
    12. 
    13. VARIABLE LAMPS 
    14. : TOGGLE ( n -- ) LAMPS @ XOR DUP LAMPS ! LIGHT ; 
    15. 

```
Figure C.1 - Forth source block containing words that control a set of LEDs.

Lines 4 - 7 contain a simple diagnostic of the sort one might type in from the terminal to confirm that  everything is working. The variable DELAY contains a delay time in milliseconds - execution of the word  DELAY returns the address of this variable. Two values of DELAY are set by the definitions SLOW and  FAST, using the Forth operator ! (pronounced "store") which takes a value and an address, and stores the  value in the address. The definition COUNTS runs a loop from 0 through 255 (Forth loops of this type are  exclusive at the upper end of the range), sending each value to the lights and then waiting for the period  specified by DELAY. The word @ (pronounced "fetch") fetches a value from an address, in this case the  address supplied by DELAY. This value is passed to MS, which waits the specified number of milliseconds.

4行目から7行目までは、ターミナルから入力するような簡単な診断で、すべてが機能していることを確認している。`DELAY`という変数にはミリ秒単位の遅延時間が格納されており、`DELAY`という単語を実行するとこの変数のアドレスが返される。`DELAY`の2つの値は、Forth演算子`！`(「ストア」と発音する)演算子を使って設定される。定義`COUNTS`は、0から255までのループを実行し（このタイプのForthループは、範囲の上限で排他的である）、各値をライトに送信し、`DELAY`で指定された期間待機する。単語`@`（「フェッチ」と発音）は、アドレスから値をフェッチする。この値は`MS`に渡され、`MS`は指定されたミリ秒数待つ。

The result of executing COUNTS is that the lights will count from 0 to 255 at the desired rate. To run this,  one would type:  

`COUNTS`を実行した結果、ライトは0から255まで希望のレートでカウントされる。これを実行するには、端末から次のようにタイプする：

    SLOW COUNTS or FAST COUNTS

at the terminal.

Line 9 provides the capability of naming individual lamps. In this application they are being used as  indicator lights. The word LAMP is a defining word which takes as an argument a mask which represents a  particular lamp, and compiles it as a named entity. Lines 10 and 11 contain five uses of LAMP to name  particular indicators. When one of these words such as POWER is executed, the mask is returned on the  stack. In fact, the behavior of defining a value such that when the word is invoked the value is returned, is  identical to the behavior of a Forth CONSTANT. We created a new defining word here, however, to  illustrate how this would be done.

9行目には、個々のランプに名前を付ける機能がある。このアプリケーションでは、ランプは表示灯として使用される。LAMPという単語は、特定のランプを表すマスクを引数として取り、それを名前付きエンティティとしてコンパイルする定義単語です。10行目と11行目には、特定のインジケーターに名前を付けるためのLAMPが5つ使われています。POWER のような単語が実行されると、そのマスクがスタックに戻される。実際、単語が呼び出されたときに値が返されるように値を定義する動作は、ForthのCONSTANTの動作と同じです。しかし、どのように定義するのかを説明するために、ここでは新しい定義語を作成しました。

Finally, on lines 13 and 14, we have the words that will control the light panel. LAMPS is a variable that  contains the current state of the lamps. The word TOGGLE takes a mask (which might be supplied by one of  the LAMP words) and changes the state of that particular lamp, saving the result in LAMPS.

最後に、13行目と14行目に、ライト・パネルを制御する単語があります。LAMPSはランプの現在の状態を格納する変数である。TOGGLEは、マスク（LAMPから供給されるかもしれません）を受け取り、特定のランプの状態を変更し、その結果をLAMPSに保存します。

In the remainder of the application, the lamp names and TOGGLE are probably the only words that will be  executed directly. The usage there will be, for example:  

アプリケーションの残りの部分では、直接実行されるのはランプ名とTOGGLEだけでしょう。そこでの使い方は、例えば次のようになります：

    POWER TOGGLE or SAMPLING TOGGLE

as appropriate, whenever the system indicators need to be changed.

システム・インジケータを変更する必要があるときはいつでも、適宜に。

The time to compile this block of code on that system was about half a second, including the time to fetch it  from disk. So it is quite practical (and normal practice) for a programmer to simply type in a definition and  try it immediately.

そのシステムでこのコード・ブロックをコンパイルする時間は、ディスクからフェッチする時間も含めて約0.5秒である。そのため、プログラマーが単純に定義を入力し、すぐにそれを試すことは非常に現実的である（そして通常の習慣である）。

In addition, one always has the capability of communicating with external devices directly. The first thing  one would do when told about the lamps would be to type:  

さらに、外部デバイスと直接通信する機能も常に持っている。ランプのことを聞かされたら、まず最初にすることは、こうタイプすることだろう：  

    HEX FF 40 OUTPUT

and see if all the lamps come on. If not, the presumption is that something is amiss with the hardware, since  this phrase directly transmits the "all ones" mask to the device. This type of direct interaction is useful in  applications involving custom hardware, as it reduces hardware debugging time.

と入力し、すべてのランプが点灯するかどうかを確認することである。もしそうでなければ、ハードウェアに何か問題があると推測される。このフレーズは「all ones」マスクを直接デバイスに送信するからである。このような直接対話は、ハードウェアのデバッグ時間を短縮するため、カスタムハードウェアを含むアプリケーションで有用です。

## C.6 Multiprogrammed systems 

Multiprogrammed Forth systems have existed since about 1970. The earliest public Forth systems  propagated the "hooks" for this capability despite the fact that many did not use them. Nevertheless the  underlying assumptions have been common knowledge in the community, and there exists considerable  common ground among these multiprogrammed systems. These systems are not just language processors,  but contain operating system characteristics as well. Many of these integrated systems run entirely stand-alone, performing all necessary operating system functions.

マルチプログラムForthシステムは1970年頃から存在している。初期の公開Forthシステムは、その多くが使用しなかったにもかかわらず、この機能の「フック」を広めた。とはいえ、根本的な前提はコミュニティーの共通認識であり、これらのマルチプログラム・システムにはかなりの共通項が存在する。これらのシステムは単なる言語プロセッサではなく、オペレーティング・システムの特性も含んでいる。これらの統合システムの多くは、完全にスタンドアロンで動作し、必要なオペレーティング・システム機能をすべて実行する。

Some Forth systems are very fast, and can support both multi-tasking and multi-user operation even on  computers whose hardware is usually thought incapable of such advanced operation. For example, one  producer of telephone switchboards is running over 50 tasks on a Z80. There are several multiprogrammed  products for PC’s, some of which even support multiple users. Even on computers that are commonly used  in multi-user operations, the number of users that can be supported may be much larger than expected. One  large data-base application running on a single 68000 has over 100 terminals updating and querying its  data-base, with no significant degradation.

一部のForthシステムは非常に高速で、通常そのような高度な操作ができないと考えられているハードウェアを搭載したコンピュータでも、マルチタスクとマルチユーザー操作の両方をサポートすることができる。たとえば、ある電話交換機メーカーは、Z80で50以上のタスクを実行している。PC用のマルチプログラム製品もいくつかあり、マルチユーザーをサポートするものもある。マルチユーザー・オペレーションによく使われるコンピュータでも、サポートできるユーザー数は予想よりずっと多いかもしれない。台の68000で動作するある大規模なデータベース・アプリケーションでは、100台以上の端末がデータ・ベースを更新したり問い合わせたりしているが、大きな劣化はない。

Multi-user systems may also support multiple programmers, each of which has a private dictionary, stacks,  and a set of variables controlling that task. The private dictionary is linked to a shared, re-entrant dictionary  containing all the standard Forth functions. The private dictionary can be used to develop application code  which may later be integrated into the shared dictionary. It may also be used to perform functions requiring  text interpretation, including compilation and execution of source code.

マルチユーザーシステムは、複数のプログラマーをサポートする場合もあり、各プログラマーは、プライベート辞書、スタック、およびそのタスクを制御する変数のセットを持ちます。プライベート辞書は、すべての標準Forth関数を含む共有のリエントラント辞書にリンクされている。プライベート・ディクショナリは、後で共有ディクショナリに統合されるアプリケーション・コードを開発す るために使用できます。また、ソースコードのコンパイルや実行など、テキスト解釈を必要とする機能の実行にも使用で きます。

## C.7 Design and management considerations 

Just as the choice of building materials has a strong effect on the design and construction of a building, the  choice of language and operating system will affect both application design and project management  decisions.

建築資材の選択が建物の設計と建設に強い影響を与えるように、言語とオペレーティングシステムの選択は、 アプリケーションの設計とプロジェクト管理の決定の両方に影響を与える。

Conventionally, software projects progress through four stages: analysis, design, coding, and testing. A  Forth project necessarily incorporates these activities as well. Forth is optimized for a project-management  methodology featuring small teams of skilled professionals. Forth encourages an iterative process of "successive prototyping" wherein high-level Forth is used as an executable design tool, with "stubs" replacing lower-level routines as necessary (e.g., for hardware that isn’t built yet).

従来、ソフトウェア・プロジェクトは、分析、設計、コーディング、テストの4つの段階を経て進行します。Forthプロジェクトでは、必然的にこれらの活動も組み込まれます。Forthは、熟練した専門家による小規模なチームを特徴とするプロジェクト管理手法に最適化されています。Forthは、高レベルのForthを実行可能な設計ツールとして使用し、必要に応じて（例えば、まだ構築されていないハードウェアのために）「スタブ」で低レベルのルーチンを置き換える「逐次プロトタイピング」の反復プロセスを推奨しています。

In many cases successive prototyping can produce a sounder, more useful product. As the project  progresses, implementors learn things that could lead to a better design. Wiser decisions can be made if  true relative costs are known, and often this isn’t possible until prototype code can be written and tried.

多くの場合、プロトタイピングを繰り返すことで、より健全で有用な製品を生み出すことができる。プロジェクトが進むにつれて、実装者はより良い設計につながるようなことを学んでいきます。本当の相対的なコストがわかれば、より賢明な決定を下すことができますが、多くの場合、プロトタイプのコードを書いて試してみるまでは、これは不可能です。

Using Forth can shorten the time required for software development, and reduce the level of effort required  for maintenance and modifications during the life of the product as well.

Forthを使用することで、ソフトウェア開発に必要な時間を短縮し、製品寿命の間 のメンテナンスや修正に必要な労力を削減することができます。

## C.8 Conclusion 

Forth has produced some remarkable achievements in a variety of application areas. In the last few years its  acceptance has grown rapidly, particularly among programmers looking for ways to improve their  productivity and managers looking for ways to simplify new software-development projects.

Forthは、さまざまな応用分野で目覚ましい成果を上げてきた。特に、生産性を向上させる方法を探しているプログラマーや、新しいソフ トウェア開発プロジェクトを簡略化する方法を探している管理者の間で、ここ数年、 Forthの受け入れは急速に拡大している。

# D. Compatibility analysis of ANS Forth (informative annex)

Prior to ANS Forth, there were several industry standards for Forth.  The most influential are listed here in chronological order, along with the major differences between ANS Forth and the most recent, Forth 83.

ANS Forth以前にも、Forthの業界標準はいくつかありました。 ここでは、ANS Forthと最新のForth 83の主な相違点とともに、最も影響力のあるものを年代順に示します。

## D.1 FIG Forth (circa 1978) 

FIG Forth was a "model" implementation of the Forth language developed by the Forth Interest Group(FIG). In FIG Forth, a relatively small number of words were implemented in processor-dependent machine language and the rest of the words were implemented in Forth. The FIG model was placed in the public  domain, and was ported to a wide variety of computer systems. Because the bulk of the FIG Forth  implementation was the same across all machines, programs written in FIG Forth enjoyed a substantial  degree of portability, even for "system-level" programs that directly manipulate the internals of the Forth  system implementation.

FIG Forthは、Forth Interest Group（FIG）によって開発されたForth言語の「モデル」実装でした。FIG Forthでは、比較的少数の単語がプロセッサ依存の機械語で実装され、残りの単語はForthで実装された。FIGモデルはパブリックドメインに置かれ、さまざまなコンピュータシステムに移植された。FIG Forthの実装の大部分はすべてのマシンで同じであったため、FIG Forthで書かれたプログラムは、Forthシステム実装の内部を直接操作する「システムレベル」プログラムであっても、かなりの移植性を享受することができました。

FIG Forth implementations were influential in increasing the number of people interested in using Forth.  Many people associate the implementation techniques embodied in the FIG Forth model with "the nature of Forth".

FIG Forthの実装は、Forthの使用に興味を持つ人の数を増やすことに影響力を持ちました。 多くの人が、FIG Forthモデルに具現化された実装技術を「Forthの本質」と結び付けています。

However, FIG Forth was not necessarily representative of commercial Forth implementations of the same  era. Some of the most successful commercial Forth systems used implementation techniques different from  the FIG Forth "model".

しかし、FIG Forthは必ずしも同時代の商用Forth実装を代表するものではありませんでした。最も成功を収めた商用Forthシステムの中には、FIG Forthの「モデル」とは異なる実装技術を使用したものもあります。

## D.2 Forth 79 

The Forth-79 Standard resulted from a series of meetings from 1978 to 1980, by the Forth Standards Team, an international group of Forth users and vendors (interim versions known as Forth 77 and Forth 78 were also released by the group).

Forth-79 Standardは、Forthユーザーとベンダーの国際的なグループであるForth Standards Teamによる、1978年から1980年にかけての一連の会議から生まれたものです（Forth 77およびForth 78として知られる暫定バージョンも、このグループによってリリースされました）。

Forth 79 described a set of words defined on a 16-bit, twos-complement, unaligned, linear byte-addressing  virtual machine. It prescribed an implementation technique known as "indirect threaded code", and used the  ASCII character set.

Forth 79は、16ビット、2進補数、アラインメントなし、リニアバイトアドレッシングの仮想マシン上で定義されたワードのセットについて説明したものである。間接スレッドコード」として知られる実装技術を規定し、ASCII文字セットを使用した。

The Forth-79 Standard served as the basis for several public domain and commercial implementations,  some of which are still available and supported today.

Forth-79 Standardは、いくつかのパブリックドメインや商用実装の基礎となり、そのいくつかは現在でも利用可能でサポートされている。

## D.3 Forth 83 

The Forth-83 Standard, also by the Forth Standards Team, was released in 1983. Forth 83 attempted to fix  some of the deficiencies of Forth 79.

同じくForth標準化チームによるForth-83 Standardは1983年にリリースされた。Forth 83は、Forth 79の欠陥のいくつかを修正しようとしたものである。

Forth 83 was similar to Forth 79 in most respects. However, Forth 83 changed the definition of several  well-defined features of Forth 79. For example, the rounding behavior of integer division, the base value of  the operands of PICK and ROLL, the meaning of the address returned by ', the compilation behavior of ',  the value of a "true" flag, the meaning of NOT, and the "chaining" behavior of words defined by  VOCABULARY were all changed. Forth 83 relaxed the implementation restrictions of Forth 79 to allow any  kind of threaded code, but it did not fully allow compilation to native machine code (this was not  specifically prohibited, but rather was an indirect consequence of another provision).

Forth 83は、ほとんどの点でForth 79に似ていた。しかし、Forth 83は、Forth 79のいくつかの明確に定義された機能の定義を変更した。例えば、整数除算の丸め動作、PICKとROLLのオペランドのベース値、'が返すアドレスの意味、'のコンパイル動作、「真」フラグの値、NOTの意味、VOCABULARYで定義された単語の「連鎖」動作がすべて変更された。Forth 83では、Forth 79の実装制限が緩和され、あらゆる種類のスレッドコードが許可されたが、ネイティブのマシンコードへのコンパイルは完全には許可されなかった（これは特に禁止されたわけではなく、別の規定の間接的な結果であった）。

Many new Forth implementations were based on the Forth-83 Standard, but few "strictly compliant"  Forth-83 implementations exist.

多くの新しいForth実装はForth-83 Standardに基づいていましたが、「厳密に準拠した」Forth-83実装はほとんど存在しません。

Although the incompatibilities resulting from the changes between Forth 79 and Forth 83 were usually  relatively easy to fix, a number of successful Forth vendors did not convert their implementations to be  Forth 83 compliant. For example, the most successful commercial Forth for Apple Macintosh computers is  based on Forth 79.

Forth 79とForth 83の間の変更に起因する非互換性は、通常、比較的簡単に修正することができましたが、成功を収めたForthベンダーの多くは、Forth 83に準拠するように実装を変換しませんでした。例えば、最も成功しているApple Macintoshコンピュータ用の商用Forthは、Forth 79に基づいています。

## D.4 Recent developments 

Since the Forth-83 Standard was published, the computer industry has undergone rapid and profound  changes. The speed, memory capacity, and disk capacity of affordable personal computers have increased  by factors of more than 100. 8-bit processors have given way to 16-bit processors, and now 32-bit  processors are commonplace.

Forth-83スタンダードが発表されて以来、コンピュータ業界は急速かつ大きな変化を遂げてきた。手頃な価格のパーソナル・コンピューターのスピード、メモリー容量、ディスク容量は100倍以上になった。8ビット・プロセッサーは16ビット・プロセッサーに取って代わられ、今では32ビット・プロセッサーが当たり前になっている。

The operating systems and programming-language environments of small systems are much more powerful  than they were in the early 80’s.

小型システムのオペレーティング・システムやプログラミング言語環境は、80年代前半に比べはるかに強力になっている。

The personal-computer marketplace has changed from a predominantly "hobbyist" market to a mature  business and commercial market.

パーソナル・コンピューター市場は、主に「趣味」の市場から、成熟したビジネスおよび商業市場へと変化した。

Improved technology for designing custom microprocessors has resulted in the design of numerous "Forth  chips", computers optimized for the execution of the Forth language.

カスタム・マイクロプロセッサの設計技術の向上により、Forth言語の実行に最適化されたコンピュータである「Forthチップ」が数多く設計されるようになった。

The market for ROM-based embedded control computers has grown substantially.

ROMベースの組み込み制御コンピュータの市場は大きく成長した。

In order to take full advantage of this evolving technology, and to better compete with other programming  languages, many recent Forth implementations have ignored some of the "rules" of previous Forth  standards. In particular:  

この進化する技術を最大限に活用し、他のプログラミング言語との競争を有利に進めるため、最近のForth実装の多くは、以前のForth標準の「ルール」のいくつかを無視しています。特に

- 32-bit Forth implementations are now common.  
- Some Forth systems adopt the address-alignment restrictions of the hardware on which they run.  
- Some Forth systems use native-code generation, microcode generation, and optimization techniques, rather than the traditional "threaded code".  
- Some Forth systems exploit segmented addressing architectures, placing portions of the Forth "dictionary" in different segments.  
- More and more Forth systems now run in the environment of another "standard" operating system, using OS text files for source code, rather than the traditional Forth "blocks".  
- Some Forth systems allow external operating system software, windowing software, terminal concentrators, or communications channels to handle or preprocess user input, resulting in deviations  from the input editing, character set availability, and screen management behavior prescribed by  Forth 83.  

- 32ビットのForth実装は、現在では一般的です。 
- 一部のForthシステムは、実行するハードウェアのアドレス・アライメント制限を採用しています。 
- 一部のForthシステムは、従来の「スレッドコード」ではなく、ネイティブコード生成、マイクロコード生成、最適化技術を使用しています。 
- 一部のForthシステムは、セグメント化されたアドレス指定アーキテクチャを利用し、Forthの「辞書」の一部を異なるセグメントに配置しています。 
- 現在では、より多くのForthシステムが、従来のForth「ブロック」ではなく、OSのテキストファイルをソースコードに使用し、別の「標準」オペレーティング・システムの環境で動作しています。 
- 一部のForthシステムでは、外部のオペレーティング・システム・ソフトウェア、ウィンドウ・ソフトウェア、ターミナル・コンセントレータ、または通信チャネルがユーザー入力を処理または前処理することを許可しており、その結果、Forth 83で規定された入力編集、文字セットの可用性、および画面管理の動作から逸脱しています。

Competitive pressure from other programming languages (predominantly "C") and from other Forth  vendors have led Forth vendors to optimizations that do not fit in well with the "virtual machine model"  implied by existing Forth standards.

他のプログラミング言語（主に「C」）や他のForthベンダーからの競争圧力により、Forthベンダーは、既存のForth標準が暗示する「仮想マシン・モデル」にうまく適合しない最適化を行うようになった。

## D.5 ANS Forth approach 

The ANS Forth committee addressed the serious fragmentation of the Forth community caused by the  differences between Forth 79 and Forth 83, and the divergence from either of these two industry standards  caused by marketplace pressures.

Consequently, the committee has chosen to base its compatibility decisions not upon a strict comparison  with the Forth-83 Standard, but instead upon consideration of the variety of existing implementations,  especially those with substantial user bases and/or considerable success in the marketplace.

The committee feels that, if ANS Forth prescribes stringent requirements upon the virtual machine model,  as did the previous standards, then many implementors will chose not to comply with ANS Forth. The  committee hopes that ANS Forth will serve to unify rather than to further divide the Forth community, and  thus has chosen to encompass rather than invalidate popular implementation techniques.

Many of the changes from Forth 83 are justified by this rationale. Most fall into the category that "an ANS  Forth Standard Program may not assume x", where "x" is an entitlement resulting from the virtual machine  model prescribed by the Forth-83 Standard. The committee feels that these restrictions are reasonable,  especially considering that a substantial number of existing Forth implementations do not correctly  implement the Forth-83 virtual model, thus the Forth-83 entitlements exist "in theory" but not "in practice".

ANS Forth委員会は、Forth 79とForth 83の違いによって引き起こされるForthコミュニティの深刻な分断、および市場の圧力によって引き起こされるこれら2つの業界標準のいずれかからの分岐に対処しました。

その結果、委員会は、Forth-83 Standardとの厳密な比較ではなく、既存のさまざまな実装、特にかなりのユーザーベースおよび/または市場でかなりの成功を収めている実装を考慮して互換性を決定することにしました。

委員会は、ANS Forthが以前の規格のように仮想マシンモデルに対して厳しい要件を規定した場合、多くの実装者がANS Forthに準拠しないことを選択するだろうと感じています。委員会は、ANS ForthがForthコミュニティの分断を深めるのではなく、むしろ統一に役立つことを望んでおり、そのため、一般的な実装技術を無効にするのではなく、包含することを選択しました。

Forth 83からの変更の多くは、この理論的根拠によって正当化される。そのほとんどは、「ANS Forth Standard Programはxを仮定してはならない」という範疇に入るもので、ここで「x」とは、Forth-83 Standardが規定する仮想マシンモデルから生じる権利のことである。委員会は、特に、既存のForth実装の相当数がForth-83仮想モデルを正しく実装していないことを考慮すると、これらの制限は妥当であると感じています。

Another way of looking at this is that while ANS Forth acknowledges the diversity of current Forth practice,  it attempts to document the similarity therein. In some sense, ANS Forth is thus a "description of reality"  rather than a "prescription for a particular virtual machine".

Since there is no previous American National Standard for Forth, the action requirements prescribed by  section 3.4 of X3/SD-9, "Policy and Guidelines", regarding previous standards do not apply.

The following discussion describes differences between ANS Forth and Forth 83. In most cases, Forth 83 is  representative of Forth 79 and FIG Forth for the purposes of this discussion. In many of these cases,  however, ANS Forth is more representative of the existing state of the Forth industry than the previously-published standards.

別の見方をすれば、ANS Forthは現在のForthの実践の多様性を認めながらも、そこにある類似性を文書化しようと試みているということである。ある意味で、ANS Forthは「特定の仮想マシンの処方箋」ではなく、「現実の記述」なのです。

Forthには以前の米国国家規格が存在しないため、以前の規格に関するX3/SD-9「ポリシーとガイドライン」の3.4項で規定される動作要件は適用されない。

以下の説明では、ANS Forth と Forth 83 の違いについて説明します。ほとんどの場合、Forth 83は、この議論の目的上、Forth 79およびFIG Forthを代表するものです。しかし、これらの多くの場合において、ANS Forth は、以前に公表された標準よりも、Forth 業界の既存の状態を代表するものです。

## D.6 Differences from Forth 83 

### D.6.1 Stack width 

Forth 83 specifies that stack items occupy 16 bits. This includes addresses, flags, and numbers. ANS Forth  specifies that stack items are at least 16 bits; the actual size must be documented by the implementation.

Forth 83は、スタック・アイテムが16ビットを占有することを規定している。これにはアドレス、フラグ、数値が含まれます。ANS Forthは、スタック項目が少なくとも16ビットであることを規定している。実際のサイズは実装によって文書化されなければなりません。

<desc>

||Words affected:||
all arithmetic, logical and addressing operators  

||影響を受ける単語||
すべての算術演算子、論理演算子、アドレス演算子  

||Reason:||
32-bit machines are becoming commonplace. A 16-bit Forth system on a 32-bit  machine is not competitive.

||理由:||
32ビットマシンは一般的になりつつあります。32ビット・マシン上の16ビットForthシステムは競争力がありません。

||Impact:||
Programs that assume 16-bit stack width will continue to run on 16-bit machines;  ANS Forth does not require a different stack width, but simply allows it. Many programs will be unaffected  (but see "address unit").

||影響:||
ANS Forthは異なるスタック幅を要求しているわけではなく、単に許容しているだけです。多くのプログラムは影響を受けません（ただし、「アドレス単位」を参照してください）。

||Transition/Conversion:||
Programs which use bit masks with the high bits set may have to be changed,  substituting either an implementation-defined bit-mask constant, or a procedure to calculate a bit mask in a  stack-width-independent way. Here are some procedures for constructing width-independent bit masks:  

||移行/変換:||
上位ビットが設定されたビットマスクを使用するプログラムは、実装で定義されたビットマスク定数、またはスタック幅に依存しない方法でビットマスクを計算する手順のいずれかに置き換えて、変更しなければならないかもしれません。以下に、スタック幅に依存しないビットマスクの計算手順をいくつか示す：

</desc>

    1 CONSTANT LO-BIT 
    TRUE 1 RSHIFT INVERT CONSTANT HI-BIT  
    : LO-BITS ( n -- mask ) 0 SWAP 0 ?DO 1 LSHIFT LO-BIT OR LOOP ; 
    : HI-BITS ( n -- mask ) 0 SWAP 0 ?DO 1 RSHIFT HI-BIT OR LOOP ; 

Programs that depend upon the "modulo 65536" behavior implicit in 16-bit arithmetic operations will need  to be rewritten to explicitly perform the modulus operation in the appropriate places. The committee  believes that such assumptions occur infrequently. Examples: some checksum or CRC calculations, some  random number generators and most fixed-point fractional math.

16ビット算術演算の暗黙の「モジュロ65536」動作に依存するプログラムは、適切な場所で明示的にモジュロ演算を実行するように書き直す必要がある。委員会は、このような仮定は滅多に発生しないと考えている。例：一部のチェックサムまたは CRC 計算、一部の乱数生成器、ほとんどの固定小数点分数計算。

### D.6.2 Number representation 

Forth 83 specifies two’s-complement number representation and arithmetic. ANS Forth also allows one’s-complement and signed-magnitude.

Forth 83 は、2 の補数による数値表現と算術演算を規定しています。ANS Forth では、1 補数と符号付き倍数も使用できます。

<desc>

||Words affected:||
all arithmetic and logical operators, LOOP, +LOOP

||Reason:||
Some computers use one’s-complement or signed-magnitude. The committee  did not wish to force Forth implementations for those machines to emulate two’s-complement arithmetic,  and thus incur severe performance penalties. The experience of some committee members with such  machines indicates that the usage restrictions necessary to support their number representations are not  overly burdensome.

||Impact:||
An ANS Forth Standard Program may declare an "environmental dependency on  two’s-complement arithmetic". This means that the otherwise-Standard Program is only guaranteed to work  on two’s-complement machines. Effectively, this is not a severe restriction, because the overwhelming  majority of current computers use two’s-complement. The committee knows of no Forth-83 compliant  implementations for non-two’s-complement machines at present, so existing Forth-83 programs will still  work on the same class of machines on which they currently work.

||Transition/Conversion:||
Existing programs wishing to take advantage of the possibility of ANS Forth  Standard Systems on non-two’s-complement machines may do so by eliminating the use of arithmetic  operators to perform logical functions, by deriving bit-mask constants from bit operations as described in  the section about stack width, by restricting the usage range of unsigned numbers to the range of positive  numbers, and by using the provided operators for conversion from single numbers to double numbers.

||影響を受ける単語:||
すべての算術演算子および論理演算子、LOOP、+LOOP

||理由:||
コンピュータの中には、1補数や符号付き桁数を使用するものがあります。委員会は、そのようなマシン用のForth実装に2補数の算術演算をエミュレートすることを強制し、深刻な性能上のペナルティを負わせることを望んでいませんでした。このようなマシンを使用している委員会メンバーの経験から、これらの数値表現をサポートするために必要な使用制限は、過度に負担になるものではないことが示されている。

||影響:||
ANS Forth標準プログラムは、「2の補数演算への環境依存」を宣言することができます。これは、標準プログラムが2の補数マシン上でのみ動作することを保証することを意味します。事実上、現在のコンピュータの圧倒的多数は2の補数を使用しているので、これは厳しい制限ではない。委員会は、現在のところ、2 の補数でないマシン用の Forth-83 準拠の実装を知らないため、既存の Forth-83 プログラムは、現在動作しているマシンと同じクラスで動作します。

|移行/変換:||
ANSフォース標準システムを非2補数マシン上で利用したい既存のプログラムでは、論理関数を実行するための算術演算子の使用を排除したり、スタック幅のセクションで説明したようにビット演算からビットマスク定数を導出したり、符号なし数値の使用範囲を正数の範囲に制限したり、1進数から2進数への変換に提供されている演算子を使用したりすることができます。

</desc>


### D.6.3 Address units 

Forth 83 specifies that each unique address refers to an 8-bit byte in memory. ANS Forth specifies that the  size of the item referred to by each unique address is implementation-defined, but, by default, is the size of  one character. Forth 83 describes many memory operations in terms of a number of bytes. ANS Forth  describes those operations in terms of a number of either characters or address units.

Forth 83は、各一意アドレスがメモリ内の8ビットバイトを参照することを規定しています。ANS Forthでは、各一意アドレスによって参照されるアイテムのサイズは実装によって決まりますが、デフォルトでは1文字のサイズになります。Forth 83では、多くのメモリ操作をバイト数で説明しています。ANS Forthでは、これらの操作を文字数またはアドレス単位で記述します。

<miniterm>


||Words affected:||
those with "address unit" arguments  

||影響される言葉||
"アドレス単位"の引数を持つもの  

||Reason:||
Some machines, including the most popular Forth chip, address 16-bit memory  locations instead of 8-bit bytes.

||理由:||
最も人気のあるForthチップを含むいくつかのマシンは、8ビットバイトの代わりに16ビットメモリ位置をアドレスします。

||Impact:||
Programs may choose to declare an environmental dependency on byte  addressing, and will continue to work on the class of machines for which they now work. In order for a  Forth implementation on a word-addressed machine to be Forth 83 compliant, it would have to simulate  byte addressing at considerable cost in speed and memory efficiency. The committee knows of no such  Forth-83 implementations for such machines, thus an environmental dependency on byte addressing does  not restrict a Standard Program beyond its current de facto restrictions.

||影響:||
プログラムは、バイトアドレッシングへの環境依存を宣言することを選択することができ、現在動作しているマシンのクラスで動作し続けます。ワードアドレス指定マシン上のForth実装がForth 83に準拠するためには、速度とメモリ効率においてかなりのコストをかけてバイトアドレッシングをシミュレートする必要があります。委員会は、そのようなマシンのためのそのようなForth-83実装を知らないので、バイトアドレッシングへの環境依存は、現在の事実上の制限を超えて標準プログラムを制限しない。

||Transition/Conversion:||
The new CHARS and CHAR+ address arithmetic operators should be used for  programs that require portability to non-byte-addressed machines. The places where such conversion is  necessary may be identified by searching for occurrences of words that accept a number of address units as  an argument (e.g., MOVE , ALLOT).

||移行/変換:||
新しいCHARSとCHAR+アドレス算術演算子は、非バイトアドレスのマシンへの移植性を必要とするプログラムに使用されるべきである。そのような変換が必要な場所は、引数としてアドレス単位の数を受け付ける単語（例えば、MOVE、ALLOT）の出現を検索することによって特定することができる。

</miniterm>

### D.6.4 Address increment for a cell is no longer two 

As a consequence of Forth-83’s simultaneous specification of 16-bit stack width and byte addressing, the  number two could reliably be used in address calculations involving memory arrays containing items from  the stack. Since ANS Forth requires neither 16-bit stack width nor byte addressing, the number two is no  longer necessarily appropriate for such calculations.

Forth-83が16ビットのスタック幅とバイトアドレッシングを同時に規定した結果、スタックからのアイテムを含むメモリ配列を含むアドレス計算では、数字の2を確実に使用することができました。ANS Forthは16ビットスタック幅もバイトアドレッシングも必要としないため、このような計算にはもはや2という数字は必ずしも適切ではありません。

<miniterm>

||Words affected:||
@ ! +! 2+ 2* 2- +LOOP 

||Reason:||
See reasons for "Address Units" and "Stack Width"  

||理由:||
"アドレス単位 "と "スタック幅 "の理由を参照。 

||Impact:||
In this respect, existing programs will continue to work on machines where a  stack cell occupies two address units when stored in memory. This includes most machines for which  Forth 83 compliant implementations currently exist. In principle, it would also include 16-bit-word-addressed machines with 32-bit stack width, but the committee knows of no examples of such machines.

||影響:||
この点で、既存のプログラムは、メモリに格納されたときにスタックセルが2つのアドレスユニットを占有するマシンでも引き続き動作します。これには、現在 Forth 83 準拠の実装が存在するほとんどのマシンが含まれます。原理的には、32ビットのスタック幅を持つ16ビットワードアドレスのマシンも含まれるが、委員会はそのようなマシンの例を知らない。

||Transition/Conversion:||
The new CELLS and CELL+ address arithmetic operators should be used for  portable programs. The places where such conversion is necessary may be identified by searching for the  character "2" and determining whether or not it is used as part of an address calculation. The following  substitutions are appropriate within address calculations:  

||移行/変換:||
新しいCELLSとCELL+アドレス算術演算子は移植可能なプログラムに使用されるべきである。このような変換が必要な場所は、文字 "2 "を検索し、それがアドレス計算の一部として使用されて いるかどうかを判断することによって特定することができる。アドレス計算の中では、以下の置換が適切である：

</miniterm>

<table>

 |Old<br><div style="width: 10em;"></div>|New<br><div style="width: 10em;"></div>| 
 |--|--|
 |2+ or 2 +|CELL+ 
 |2* or 2 *|CELLS 
 |2- or 2 -|1 CELLS - 
 |2/ or 2 /|1 CELLS / 
 |2|1 CELLS 

</table>

The number "2" by itself is sometimes used for address calculations as an argument to +LOOP, when the  loop index is an address. When converting the word 2/ which operates on negative dividends, one should  be cognizant of the rounding method used.

ループ・インデックスがアドレスである場合、+LOOPの引数としてアドレス計算に数値「2」単体が使われることがある。負の配当で動作するワード2/を変換する場合、使用される丸め方法に注意する必要がある。

### D.6.5 Address alignment 

Forth 83 imposes no restriction upon the alignment of addresses to any boundary. ANS Forth specifies that  a Standard System may require alignment of addresses for use with various "@" and "!" operators.

Forth 83 では、アドレスのアラインメントに制限はありません。ANS Forthは、標準システムがさまざまな「@」演算子や「!」演算子を使う際にアドレスアライメントを要求してくるかもしれない。

<desc>

||Words Affected:||
<code>! +! 2! 2@ @ ? ,</code> 

||Reason:||
Many computers have hardware restrictions that favor the use of aligned  addresses. On some machines, the native memory-access instructions will cause an exception trap if used  with an unaligned address. Even on machines where unaligned accesses do not cause exception traps,  aligned accesses are usually faster.

||理由||
多くのコンピュータでは、アラインメントされたアドレスの使用を推奨するハードウェア制限がある。一部のマシンでは、アラインされていないアドレスで使用すると、ネイティブのメモリアクセス命令が例外トラップを引き起こす。アンアラインド・アクセスが例外トラップを引き起こさないマシンであっても、アラインド・アクセスの方が通常は高速である。

||Impact:||
All of the ANS Forth words that return addresses suitable for use with aligned "@" and "!" words must return aligned addresses. In most cases, there will be no problem. Problems can arise from the use of user-defined data structures containing a mixture of character data and cell-sized data.

Many existing Forth systems, especially those currently in use on computers with strong alignment  requirements, already require alignment. Much existing Forth code that is currently in use on such  machines has already been converted for use in an aligned environment.

||影響||
アラインされた"@"および"!"ワードの使用に適したアドレスを返すANS Forthワードは、すべてアラインされたアドレスを返さなければなりません。ほとんどの場合、問題はありません。文字データとセル・サイズ・データが混在したユーザー定義のデータ構造を使用すると、問題が発生することがあります。

既存のForthシステムの多く、特に強いアライメント要求を持つコンピュータで現在使用されているものは、すでにアライメントを要求しています。そのようなマシンで現在使用されている既存のForthコードの多くは、アラインメント環境で使用するためにすでに変換されています。

||Transition/Conversion:||
There are two possible approaches to conversion of programs for use on a system  requiring address alignment.

||移行/変換:||
アドレス・アラインメントを必要とするシステムで使用するためのプログラムの変換には、2つのアプローチが考えられます。

The easiest approach is to redefine the system’s aligned "@" and "!" operators so that they do not require  alignment. For example, on a 16-bit little-endian byte-addressed machine, unaligned "@" and "!" could be  defined:  

最も簡単な方法は、システムの整列演算子"@"と"!"を再定義し、整列を必要としないようにすることである。例えば、16ビットのリトルエンディアン・バイトアドレス・マシンでは、アラインメントなしの"@"と"!"を定義することができる：

    : @ ( addr -- x ) DUP C@ SWAP CHAR+ C@ 8 LSHIFT OR ; 
    : ! ( x addr -- ) OVER 8 RSHIFT OVER CHAR+ C! C! ; 

These definitions, and similar ones for "+!", "2@", "2!", ",", and "?" as needed, can be compiled before  an unaligned application, which will then work as expected.

This approach may conserve memory if the application uses substantial numbers of data structures  containing unaligned fields.

Another approach is to modify the application’s source code to eliminate unaligned data fields. The ANS  Forth words ALIGN and ALIGNED may be used to force alignment of data fields. The places where such  alignment is needed may be determined by inspecting the parts of the application where data structures  (other than simple variables) are defined, or by "smart compiler" techniques (see the "Smart Compiler" discussion below).

This approach will probably result in faster application execution speed, at the possible expense of  increased memory utilization for data structures.

これらの定義、および必要に応じて "+!"、"2@"、"2!"、","、"? "に対応する同様の定義を、アラインされていないアプリケーションの前にコンパイルすることができる。

この方法は、アプリケーションがアラインされていないフィール ドを含むデータ構造を大量に使用する場合、メモリを節約することができます。

もう1つの方法は、アプリケーションのソースコードを変更して、アラインされていないデータフィールドをなくすことです。ANS Forth の単語 ALIGN と ALIGNED を使用して、データ・フィールドを強制的に整列させることができます。このような整列が必要な場所は、アプリケーションのデータ構造（単純な変数以外）が定義されている部分を検査するか、「スマートコンパイラ」技術（後述の「スマートコンパイラ」の説明を参照）によって決定することができます。

この方法は、データ構造のメモリ使用量を増加させる可能性はありますが、アプリケー ションの実行速度はおそらく速くなります。

</desc>

Finally, it is possible to combine the preceding techniques by identifying exactly those data fields that are  unaligned, and using "unaligned" versions of the memory access operators for only those fields. This  "hybrid" approach affects a compromise between execution speed and memory utilization.

最後に、アラインメントされていないデータ・フィールドを正確に特定し、そのフィールドだけに「アラインメントされていない」バージョンのメモリ・アクセス演算子を使用することで、前述のテクニックを組み合わせることが可能である。この "ハイブリッド "アプローチは、実行速度とメモリ使用率の妥協点に影響を与える。

### D.6.6 Division/modulus rounding direction 

Forth 79 specifies that division rounds toward 0 and the remainder carries the sign of the dividend. Forth 83  specifies that division rounds toward negative infinity and the remainder carries the sign of the divisor.  ANS Forth allows either behavior for the division operators listed below, at the discretion of the  implementor, and provides a pair of division primitives to allow the user to synthesize either explicit  behavior.

Forth 79は、除算が0に向かって丸められ、余りが配当の符号を持つことを指定します。Forth 83は、除算が負の無限大に丸められ、余りが除数の符号を持つことを指定します。 ANS Forthでは、実装者の判断により、以下に示す除算演算子のどちらの動作も許可しており、ユーザーがどちらの明示的な動作も合成できるように、除算プリミティブのペアを提供しています。

<desc>

||Words Affected:||
`/ MOD /MOD */MOD */`

||Reason:||
The difference between the division behaviors in Forth 79 and Forth 83 was a  point of much contention, and many Forth implementations did not switch to the Forth 83 behavior. Both  variants have vocal proponents, citing both application requirements and execution efficiency arguments on  both sides. After extensive debate spanning many meetings, the committee was unable to reach a consensus  for choosing one behavior over the other, and chose to allow either behavior as the default, while providing  a means for the user to explicitly use both behaviors as needed. Since implementors are allowed to choose  either behavior, they are not required to change the behavior exhibited by their current systems, thus  preserving correct functioning of existing programs that run on those systems and depend on a particular  behavior. New implementations could choose to supply the behavior that is supported by the native CPU  instruction set, thus maximizing execution speed, or could choose the behavior that is most appropriate for  the intended application domain of the system.

Forth 79とForth 83の分割動作の違いは多くの論争の的となり、多くのForth実装はForth 83の動作に切り替えなかった。両者とも、アプリケーション要件と実行効率の両論を引用して、声高な支持者がいる。委員会は、何度も開催された広範な議論の末、どちらか一方の動作を選択することでコンセンサスを得ることはできず、デフォルトとしてどちらかの動作を許可する一方、必要に応じてユーザーが明示的に両方の動作を使用できる手段を提供することを選択しました。実装者はどちらの動作も選択できるため、現在のシステムが示す動作を変更する必要はなく、そのシステム上で動作し、特定の動作に依存している既存のプログラムの正しい機能を維持することができる。新しい実装では、ネイティブのCPU命令セットでサポートされている動作を提供することで、実行速度を最大化することもできるし、システムの意図するアプリケーション領域に最も適した動作を選択することもできる。

||Impact:||
The issue only affects programs that use a negative dividend with a positive  divisor, or a positive dividend with a negative divisor. The vast majority of uses of division occur with both  a positive dividend and a positive divisor; in that case, the results are the same for both allowed division  behaviors.

この問題は、正の除数を持つ負の配当、または負の除数を持つ正の配当を使用するプログラムにのみ影響します。除算の大半は正の配当と正の除数の両方で行われます。その場合、許容される除算の動作はどちらも結果は同じです。

||Transition/Conversion:||
For programs that require a specific rounding behavior with division operands of  mixed sign, the division operators used by the program may be redefined in terms of one of the new ANS  Forth division primitives SM/REM (symmetrical division, i.e., round toward zero) or FM/MOD (floored  division, i.e., round toward negative infinity). Then the program may be recompiled without change. For  example, the Forth 83 style division operators may be defined by:  

||トランジション/変換:||
符号が混在する除算オペランドで特定の丸め動作を必要とするプログラムでは、プログラムで使用する除算演算子を、新しい ANS Forth の除算プリミティブ SM/REM（対称除算、つまりゼロに向かって丸める）または FM/MOD（フロアード除算、つまり負の無限大に向かって丸める）のいずれかで再定義することができます。その後、プログラムを変更せずに再コンパイルすることができる。例えば、Forth83スタイルの除算演算子は次のように定義することができる：

    : /MOD ( n1 n2 -- n3 n4 ) >R S>D R> FM/MOD ; 
    : MOD ( n1 n2 -- n3 ) /MOD DROP ; 
    : / ( n1 n2 -- n3 ) /MOD SWAP DROP ; 
    : */MOD ( n1 n2 n3 -- n4 n5 ) >R M* R> FM/MOD ; 
    : */ ( n1 n2 n3 -- n4 n5 ) */MOD SWAP DROP ; 

</desc>

### D.6.7 Immediacy 

Forth 83 specified that a number of "compiling words" are "immediate", meaning that they are executed  instead of compiled during compilation. ANS Forth is less specific about most of these words, stating that  their behavior is only defined during compilation, and specifying their results rather than their specific  compile-time actions.

To force the compilation of a word that would normally be executed, Forth 83 provided the words  COMPILE , used with non-immediate words, and [COMPILE] , used with immediate words. ANS Forth  provides the single word POSTPONE , which is used with both immediate and non-immediate words,  automatically selecting the appropriate behavior.

Forth 83は、多くの「コンパイル語」が「即時」であり、コンパイル時にコンパイルされる代わりに実行されることを意味すると規定しています。ANS Forthは、これらの単語のほとんどについてあまり具体的ではなく、その動作はコンパイル時にのみ定義されるとし、特定のコンパイル時の動作ではなくその結果を指定しています。

通常実行される単語のコンパイルを強制するために、Forth 83は、非即時単語で使用されるCOMPILEという単語と、即時単語で使用される[COMPILE]という単語を提供しています。ANS ForthはPOSTPONEという単一の単語を提供しており、これは即時単語と非即時単語の両方で使用され、自動的に適切な動作が選択されます。

<desc>

||Words Affected:||
`COMPILE [COMPILE] ['] '`

||Reason:||
The designation of particular words as either immediate or not depends upon the  implementation technique chosen for the Forth system. With traditional "threaded code" implementations,  the choice was generally quite clear (with the single exception of the word LEAVE), and the standard could  specify which words should be immediate. However, some of the currently popular implementation  techniques, such as native-code generation with optimization, require the immediacy attribute on a different  set of words than the set of immediate words of a threaded code implementation. ANS Forth,  acknowledging the validity of these other implementation techniques, specifies the immediacy attribute in as  few cases as possible.

特定の単語を即時かそうでないかの指定は、Forthシステムに選択された実装技法に依存します。従来の "スレッドコード "実装では、（LEAVEという単語を唯一の例外として）その選択は一般的に非常に明確であり、規格はどの単語を即時性とすべきかを指定することができました。しかし、最適化を伴うネイティブコード生成など、現在普及している実装技術の中には、スレッドコード実装の即時ワードセットとは異なるワードセットに即時属性を要求するものもあります。ANS Forthは、このような他の実装技術の有効性を認め、即時性属性を指定するケースをできるだけ少なくしています。

When the membership of the set of immediate words is unclear, the decision about whether to use  COMPILE or [COMPILE] becomes unclear. Consequently, ANS Forth provides a "general purpose"  replacement word POSTPONE that serves the purpose of the vast majority of uses of both COMPILE and  [COMPILE], without requiring that the user know whether or not the "postponed" word is immediate.

即値語の集合のメンバシップが不明確な場合、COMPILEと[COMPILE]のどちらを使用するかの判断が不明確になります。その結果、ANS Forthは「汎用」置換語POSTPONEを提供し、COMPILEと[COMPILE]の両方の大多数の使用目的を果たす。

Similarly, the use of ' and ['] with compiling words is unclear if the precise compilation behavior of those  words is not specified, so ANS Forth does not permit a Standard Program to use ' or ['] with compiling  words.

同様に、コンパイル語の正確なコンパイル動作が指定されていない場合、コンパイル語と共に'や[']を使用することは不明確であるため、ANS Forthは標準プログラムでコンパイル語と共に'や[']を使用することを許可していません。

The traditional (non-immediate) definition of the word COMPILE has an additional problem. Its traditional  definition assumes a threaded code implementation technique, and its behavior can only be properly  described in that context. In the context of ANS Forth, which permits other implementation techniques in  addition to threaded code, it is very difficult, if not impossible, to describe the behavior of the traditional  COMPILE. Rather than changing its behavior, and thus breaking existing code, ANS Forth does not include  the word COMPILE. This allows existing implementations to continue to supply the word COMPILE with  its traditional behavior, if that is appropriate for the implementation.

COMPILEという語の伝統的な（非即物的な）定義には、さらに問題があります。その伝統的な定義は、スレッドコード実装技術を前提としており、その動作はそのコンテキストでのみ適切に記述できます。ANS Forthのコンテキストでは、スレッドコードに加えて他の実装技法も許可されているため、従来のCOMPILEの動作を記述することは、不可能ではないにしても、非常に困難です。ANS Forthでは、COMPILEの動作を変更し、既存のコードを破壊するのではなく、COMPILEという単語を使用しません。これにより、既存の実装では、その実装が適切であれば、従来の動作でCOMPILEという単語を供給し続けることができます。

||Impact:||
[COMPILE] remains in ANS Forth, since its proper use does not depend on  knowledge of whether or not a word is immediate (Use of [COMPILE] with a non-immediate word is and  has always been a no-op). Whether or not you need to use [COMPILE] requires knowledge of whether or  not its target word is immediate, but it is always safe to use [COMPILE]. [COMPILE] is no longer in the  (required) core word set, having been moved to the Core Extensions word set, but the committee anticipates that most vendors will supply it anyway.

[COMPILE]の適切な使用は、単語が即時かどうかの知識に依存しないため、[COMPILE]はANS Forthに残っています（[COMPILE]を非即時の単語と一緒に使用することは、これまでもずっと禁止されています）。COMPILE]を使う必要があるかどうかは、その対象となる単語が即時的かどうかの知識を必要としますが、[COMPILE]を使うことは常に安全です。COMPILE]はコア拡張語セットに移されたため、（必須）コア語セットではなくなりましたが、委員会は、ほとんどのベンダーがいずれにせよ[COMPILE]を提供すると予想しています。

In nearly all cases, it is correct to replace both [COMPILE] and COMPILE with POSTPONE. Uses of  [COMPILE] and COMPILE that are not suitable for "mindless" replacement by POSTPONE are quite infrequent, and fall into the following two categories:  

ほとんどの場合、[COMPILE]と[COMPILE]の両方をPOSTPONEに置き換えるのが正しい。COMPILE]と[COMPILE]をPOSTPONEに「無頓着に」置き換えるのに適さない用法は非常にまれであり、次の2つのカテゴリーに分類される：

a) Use of [COMPILE] with non-immediate words. This is sometimes done with the words ' (tick, which  was immediate in Forth 79 but not in Forth 83) and LEAVE (which was immediate in Forth 83 but not  in Forth 79), in order to force the compilation of those words without regard to whether you are using a  Forth 79 or Forth 83 system.

b) Use of the phrase COMPILE [COMPILE] &lt;immediate word> to "doubly postpone" an  immediate word.

a) [COMPILE]の非即時単語での使用。これは、Forth 79システムとForth 83システムのどちらを使用しているかに関係なく、これらの単語のコンパイルを強制するために、'（Forth 79では即時だったがForth 83では即時でなかったtick）やLEAVE（Forth 83では即時だったがForth 79では即時でなかった）という単語で行われることがある。

b) COMPILE [COMPILE]<即時単語> というフレーズを使用して、即時単語を「二重に延期」する。

||Transition/Conversion:||
Many ANS Forth implementations will continue to implement both [COMPILE] and COMPILE in forms compatible with existing usage. In those environments, no conversion is necessary.

多くの ANS Forth 実装は、既存の使用法と互換性のある形で [COMPILE] と COMPILE の両方を実装し続けるでしょう。そのような環境では、変換は必要ない。

For complete portability, uses of COMPILE and [COMPILE] should be changed to POSTPONE , except in  the rare cases indicated above. Uses of [COMPILE] with non-immediate words may be left as-is, and the  program may declare a requirement for the word [COMPILE] from the Core Extensions word set, or the  [COMPILE] before the non-immediate word may be simply deleted if the target word is known to be non-immediate.

完全な移植性のために、COMPILEと[COMPILE]の使用は、上に示したまれな場合を除き、POSTPONEに変更されるべきである。COMPILE]の非即時単語での使用は、そのままにしておいてもよいし、プログラムは、コア拡張単語セットから[COMPILE]の単語に対する要求を宣言してもよいし、対象の単語が非即時であることが分かっている場合は、非即時単語の前の[COMPILE]を単に削除してもよい。

Uses of the phrase COMPILE [COMPILE] &lt;immediate-word> may be handled by introducing an "intermediate word" (XX in the example below) and then postponing that word. For example: 

COMPILE[COMPILE]<immediate-word>というフレーズの使用は、「中間単語」（以下の例ではXX）を導入し、その単語を後置することによって処理することができる。例えば

    : ABC COMPILE [COMPILE] IF ; 

changes to:  

    : XX POSTPONE IF ; 
    : ABC POSTPONE XX ; 

A non-standard case can occur with programs that "switch out of compilation state" to explicitly compile a  thread in the dictionary following a COMPILE . For example:  

`COMPILE`に続いて、辞書内のスレッドを明示的にコンパイルするために「コンパイル状態から切り替わる」プログラムでは、非標準的なケースが発生する可能性がある。例えば

    : XYZ COMPILE [ ' ABC , ] ; 

This depends heavily on knowledge of exactly how COMPILE and the threaded-code implementation  works. Cases like this cannot be handled mechanically; they must be translated by understanding exactly  what the code is doing, and rewriting that section according to ANS Forth restrictions.

Use the phrase POSTPONE [COMPILE] to replace [COMPILE] [COMPILE].

これは、`COMPILE`とスレッドコードの実装がどのように動作するかについての正確な知識に大きく依存します。このようなケースは機械的に処理することはできません。コードが何をしているかを正確に理解し、ANS Forthの制限に従ってそのセクションを書き換えることによって翻訳する必要があります。

`[COMPILE][COMPILE]`の代わりに`POSTPONE [COMPILE]`というフレーズを使用してください。

</desc>

### D.6.8 Input character set 

Forth 83 specifies that the full 7-bit ASCII character set is available through KEY . ANS Forth restricts it to  the graphic characters of the ASCII set, with codes from hex 20 to hex 7E inclusive.

Forth 83は、7ビットASCII文字セットが `KEY` を通じて利用可能であることを指定しています。ANS Forthでは、16進数20から16進数7Eまでのコードを持つASCIIセットのグラフィック文字に制限されています。

<desc>

||Words Affected:||
KEY

||Reason:||
Many system environments "consume" certain control characters for such  purposes as input editing, job control, or flow control. A Forth implementation cannot always control this  system behavior.

多くのシステム環境は、入力編集、ジョブ制御、フロー制御などの目的で特定の制御文字を「消費」します。Forthの実装では、このようなシステムの動作を常に制御することはできません。

||Impact:||
Standard Programs which require the ability to receive particular control  characters through KEY must declare an environmental dependency on the input character set.

KEYを通して特定の制御文字を受け取る能力を必要とする標準プログラムは、入力文字セットへの環境依存を宣言しなければならない。

||Transition/Conversion:||
For maximum portability, programs should restrict their required input character  set to only the graphic characters. Control characters may be handled if available, but complete program  functionality should be accessible using only graphic characters.

移植性を最大にするために、プログラムは必要な入力文字セットをグラフィック文字だけに制限すべきである。利用可能であれば制御文字も扱うことができるが、完全なプログラム機能には図形文字だけでアクセスできるようにすべきである。

As stated above, an environmental dependency on the input character set may be declared. Even so, it is  recommended that the program should avoid the requirement for particularly-troublesome control  characters, such as control-S and control-Q (often used for flow control, sometimes by communication  hardware whose presence may be difficult to detect), ASCII NUL (difficult to type on many keyboards), and  the distinction between carriage return and line feed (some systems translate carriage returns into line feeds,  or vice versa).

上述したように、入力文字セットに対する環境依存を宣言してもよい。たとえそうであっても、control-Sやcontrol-Q（フロー制御のためによく使用され、その存在を検出するのが困難な通信ハードウェアによって使用されることもある）、ASCII NUL（多くのキーボードで入力するのが困難）、キャリッジリターンとラインフィードの区別（システムによっては、キャリッジリターンをラインフィードに変換したり、その逆に変換したりするものもある）など、特にやっかいな制御文字の要求をプログラムが避けることが推奨される。

</desc>

### D.6.9 Shifting with UM/MOD 

Given Forth-83’s two’s-complement nature, and its requirement for floored (round toward minus infinity)  division, shifting is equivalent to division. Also, two’s-complement representation implies that unsigned  division by a power of two is equivalent to logical right-shifting, so UM/MOD could be used to perform a  logical right-shift.

Forth-83の2の補数という性質と、フロアード（マイナス無限大に向かって丸める）除算の要件を考えると、シフトは除算と等価です。また、2の補数表現は、符号なし2のべき乗除算が論理右シフトと等価であることを意味するので、UM/MODは論理右シフトを実行するために使用することができます。

<desc>

||Words Affected:||
UM/MOD

||Reason:||
The problem with UM/MOD is a result of allowing non-two’s-complement  number representations, as already described.

ANS Forth provides the words LSHIFT and RSHIFT to perform logical shifts. This is usually more  efficient, and certainly more descriptive, than the use of UM/MOD for logical shifting.

UM/MODの問題は、すでに説明したように、非2補数表現を許可した結果です。

ANS Forthには、論理シフトを実行するためのLSHIFTとRSHIFTという単語が用意されています。これは通常、論理シフトにUM/MODを使用するよりも効率的で、より記述的です。

||Impact:||
Programs running on ANS Forth systems with two’s-complement arithmetic (the  majority of machines), will not experience any incompatibility with UM/MOD . Existing Forth-83 Standard  programs intended to run on non-two’s-complement machines will not be able to use UM/MOD for shifting  on a non-two’s-complement ANS Forth system. This should not affect a significant number of existing  programs (perhaps none at all), since the committee knows of no existing Forth-83 implementations on non-two’s-complement machines.

2の補数演算を持つANS Forthシステム（大半のマシン）で実行されるプログラムは、UM/MODとの非互換性を経験することはありません。非2補数マシン上で実行することを意図した既存のForth-83 Standardプログラムは、非2補数のANS Forthシステム上でシフトするためにUM/MODを使用することはできません。委員会は、非2の補数マシン上の既存のForth-83実装を知らないため、これはかなりの数の既存プログラムに影響しないはずです（おそらくまったく影響しないでしょう）。

||Transition/Conversion:||
A program that requires UM/MOD to behave as a shift operation may declare an  environmental dependency on two’s-complement arithmetic.

A program that cannot declare an environmental dependency on two’s-complement arithmetic may require  editing to replace incompatible uses of UM/MOD with other operators defined within the application.

UM/MODがシフト演算として動作することを必要とするプログラムは、2の補数演算への環境依存を宣言することができる。

2の補数演算への環境依存を宣言できないプログラムは、互換性のないUM/MODの使用をアプリケーション内で定義された他の演算子で置き換えるための編集を必要とするかもしれない。

</desc>

### D.6.10 Vocabularies / wordlists 

ANS Forth does not define the words VOCABULARY, CONTEXT, and CURRENT , which were present in  Forth 83. Instead, ANS Forth defines a primitive word set for search order specification and control,  including words which have not existed in any previous standard.

Forth-83’s "ALSO/ONLY" experimental search order word set is specified for the most part as the extension  portion of the ANS Forth Search Order word set.

ANS Forthは、Forth 83に存在したVOCABULARY、CONTEXT、およびCURRENTという語を定義していない。その代わりに、ANS Forthは検索順序の指定と制御のための原始的な単語セットを定義しており、これには以前のどの標準にも存在しなかった単語も含まれています。

Forth-83の "ALSO/ONLY "実験的検索語セットは、ほとんどの部分でANS Forth検索語セットの拡張部分として指定されています。

<desc>

||Words Affected:||
VOCABULARY CONTEXT CURRENT

||Reason:||
Vocabularies are an area of much divergence among existing systems.  Considering major vendors’ systems and previous standards, there are at least 5 different and mutually  incompatible behaviors of words defined by VOCABULARY. Forth 83 took a step in the direction of "run-time search-order specification" by declining to specify a specific relationship between the hierarchy of  compiled vocabularies and the run-time search order. Forth 83 also specified an experimental mechanism  for run-time search-order specification, the ALSO/ONLY scheme. ALSO/ONLY was implemented in  numerous systems, and has achieved some measure of popularity in the Forth community.

However, several vendors refuse to implement it, citing technical limitations. In an effort to address those  limitations and thus hopefully make ALSO/ONLY more palatable to its critics, the committee specified a  simple "primitive word set" that not only fixes some of the objections to ALSO/ONLY, but also provides  sufficient power to implement ALSO/ONLY and all of the other search-order word sets that are currently  popular.

ボキャブラリーは、既存のシステム間で多くの乖離がある分野である。 主要なベンダーのシステムや以前の標準を考慮すると、VOCABULARYによって定義された単語には、少なくとも5つの異なる、相互に互換性のない動作が存在する。Forth 83は、コンパイルされた語彙の階層と実行時の検索順序の間の特定の関係を指定しないことによって、「実行時の検索順序の指定」の方向に一歩を踏み出した。Forth 83はまた、ランタイム検索順序指定のための実験的メカニズムであるALSO/ONLYスキームを規定した。ALSO/ONLYは多くのシステムで実装され、Forthコミュニティではある程度の人気を獲得した。

しかし、いくつかのベンダーは技術的な制限を理由に実装を拒否しています。これらの制限を解決し、ALSO/ONLY を批判的な人たちにも受け入れられるようにするために、委員会は ALSO/ONLY に対するいくつかの異論を修正するだけでなく、ALSO/ONLY や現在流行している他の全ての検索語集合を実装するのに十分なパワーを提供する単純な "プリミティブ語集合" を指定しました。

The Forth 83 ALSO/ONLY word set is provided as an optional extension to the search-order word set. This  allows implementors that are so inclined to provide this word set, with well-defined standard behavior, but  does not compel implementors to do so. Some vendors have publicly stated that they will not implement  ALSO/ONLY, no matter what, and one major vendor stated an unwillingness to implement ANS Forth at all  if ALSO/ONLY is mandated. The committee feels that its actions are prudent, specifying ALSO/ONLY to the  extent possible without mandating its inclusion in all systems, and also providing a primitive search-order  word set that vendors may be more likely to implement, and which can be used to synthesize ALSO/ONLY.

Forth 83のALSO/ONLY単語セットは、検索順単語セットのオプション拡張として提供されます。これは、実装者がこの単語セットを提供することを許可するもので、標準的な動作が明確に定義されていますが、実装者にそれを強制するものではありません。一部のベンダは ALSO/ONLY を実装しないと公言しており、ある大手ベンダは ALSO/ONLY が強制されるのであれば ANS Forth を一切実装しないと表明している。委員会は、すべてのシステムに ALSO/ONLY を組み込むことを義務付けることなく、可能な限り ALSO/ONLY を規定し、また、ベンダが実装しやすく、ALSO/ONLY を合成するために使用できる原始的な検索順序の単語集合を提供することで、委員会の行動は慎重であると感じています。

||Transition/Conversion:||
Since Forth 83 did not mandate precise semantics for VOCABULARY, existing  Forth-83 Standard programs cannot use it except in a trivial way. Programs can declare a dependency on  the existence of the Search Order word set, and can implement whatever semantics are required using that  word set’s primitives. Forth 83 programs that need ALSO/ONLY can declare a dependency on the Search  Order Extensions word set, or can implement the extensions in terms of the Search Order word set itself.

Forth 83はVOCABULARYに対して正確なセマンティクスを義務付けていないため、既存のForth-83 Standardプログラムでは、些細な方法を除いてVOCABULARYを使用することはできません。プログラムは、Search Order単語セットの存在への依存を宣言することができ、その単語セットのプリミティブを使用して必要なセマンティクスを実装することができます。ALSO/ONLY を必要とする Forth 83 プログラムは、Search Order Extensions 単語セットへの依存を宣言するか、Search Order 単語セット自体の観点から拡張を実装することができる。

</desc>


### D.6.11 Multiprogramming impact 

Forth 83 marked words with "multiprogramming impact" by the letter "M" in the first lines of their  descriptions. ANS Forth has removed the "M" designation from the word descriptions, moving the  discussion of multiprogramming impact to this non-normative annex.

Forth 83は、「マルチプログラミングの影響」を持つ単語に、その説明の最初の行に文字「M」で印を付けている。ANS Forthは、単語の説明から「M」の指定を削除し、マルチプログラミングの影響に関する議論をこの非規範的な附属書に移しました。

<desc>

||Words affected:||
none

||Reason:||
The meaning of "multiprogramming impact" is precise only in the context of a  specific model for multiprogramming. Although many Forth systems do provide multiprogramming  capabilities using a particular round-robin, cooperative, block-buffer sharing model, that model is not  universal. Even assuming the classical model, the "M" designations did not contain enough information to  enable writing of applications that interacted in a multiprogrammed system.

Practically speaking, the "M" designations in Forth 83 served to document usage rules for block buffer  addresses in multiprogrammed systems. These addresses often become meaningless after a task has  relinquished the CPU for any reason, most often for the purposes of performing I/O, awaiting an event, or  voluntarily sharing CPU resources using the word PAUSE. It was essential that portable applications  respect those usage rules to make it practical to run them on multiprogrammed systems; failure to adhere to  the rules could easily compromise the integrity of other applications running on those systems as well as the  applications actually in error. Thus, "M" appeared on all words that by design gave up the CPU, with the  understanding that other words NEVER gave it up.

マルチプログラミングの影響」の意味は、マルチプログラミングの特定のモデルにおいてのみ正確である。多くのForthシステムは、特定のラウンドロビン、協調、ブロックバッファ共有モデルを使用してマルチプログラミング機能を提供していますが、そのモデルは普遍的なものではありません。古典的なモデルを仮定しても、"M "という名称には、マルチプログラミング・システムで相互作用するアプリケーションを記述するのに十分な情報が含まれていませんでした。

現実的に言えば、Forth83の "M "指定は、マルチプログラム・システムにおけるブロック・バッファ・アドレスの使用規則を文書化する役割を果たした。これらのアドレスは、タスクが何らかの理由でCPUを手放した後、多くの場合、I/Oを実行したり、イベントを待ったり、PAUSEという単語を使って自発的にCPUリソースを共有したりする目的で無意味になります。ポータブル・アプリケーションをマルチプログラミング・システム上で実用的に動作させるためには、このような使用規則を尊重することが不可欠であった。この規則を守らないと、実際にエラーが発生したアプリケーションだけでなく、システム上で動作している他のアプリケーションの整合性も簡単に損なわれてしまう。したがって、"M "は、設計上CPUを放棄するすべての単語に表示され、他の単語は決してCPUを放棄しないことを理解した。

These usage rules have been explicitly documented in the Block word set where they are relevant. The "M"  designations have been removed entirely.

これらの使用ルールは、関連するブロック単語集に明示的に文書化されている。M」指定は完全に削除された。

||Impact:||
In practice, none.

In the sense that any application that depends on multiprogramming must consist of at least two tasks that  share some resource(s) and communicate between themselves, Forth 83 did not contain enough information  to enable writing of a standard program that DEPENDED on multiprogramming. This is also true of ANS  Forth.

Non-multiprogrammed applications in Forth 83 were required to respect usage rules for BLOCK so that they  could be run properly on multiprogrammed systems. The same is true of ANS Forth.

The only difference is the documentation method used to define the BLOCK usage rules. The Technical  Committee believes that the current method is clearer than the concept of "multiprogramming impact".

実際には、ありません。

マルチプログラミングに依存するアプリケーションは、何らかのリソースを共有し、タスク間で通信を行う少なくとも2つのタスクから構成されなければならないという意味で、Forth83にはマルチプログラミングに依存する標準的なプログラムを書くのに十分な情報が含まれていなかった。これは、ANS Forthにも当てはまります。

Forth 83の非マルチプログラミング・アプリケーションは、マルチプログラミング・システム上で適切に実行できるように、BLOCKの使用規則を尊重する必要がありました。ANS Forthも同様です。

唯一の違いは、BLOCKの使用規則を定義するための文書化方法である。技術委員会は、「マルチプログラミングの影響」という概念よりも現在の方法の方が明確であると考えている。

||Transition/Conversion:||
none needed.

</desc>

### D.6.12 Words not provided in executable form 

ANS Forth allows an implementation to supply some words in source code or "load as needed" form, rather  than requiring all supplied words to be available with no additional programmer action.

ANS Forthでは、プログラマーが追加操作をしなくても、提供されたすべての単語が利用可能であることを要求するのではなく、いくつかの単語をソースコードまたは「必要に応じてロード」形式で提供する実装が可能です。

<desc>

||Words affected:||
all

||Reason:||
Forth systems are often used in environments where memory space is at a  premium. Every word included in the system in executable form consumes memory space. The committee  believes that allowing standard words to be provided in source form will increase the probability that  implementors will provide complete ANS Forth implementations even in systems designed for use in  constrained environments.

Forthシステムは、メモリ容量が限られている環境で使用されることが多い。実行形式でシステムに含まれるすべての単語は、メモリ空間を消費します。委員会は、標準的なワードをソース形式で提供できるようにすることで、制約のある環境で使用するために設計されたシステムであっても、実装者が完全なANS Forth実装を提供する確率を高めることができると考えています。

||Impact:||
In order to use a Standard Program with a given ANS Forth implementation, it  may be necessary to precede the program with an implementation-dependent "preface" to make "source  form" words executable. This is similar to the methods that other computer languages require for selecting  the library routines needed by a particular application.

In languages like C, the goal of eliminating unnecessary routines from the memory image of an application  is usually accomplished by providing libraries of routines, using a "linker" program to incorporate only the  necessary routines into an executable application. The method of invoking and controlling the linker is  outside the scope of the language definition.

あるANS Forth実装で標準プログラムを使用するには、「ソース形式」の単語を実行可能にするために、実装に依存した「序文」をプログラムの前に置く必要がある場合があります。これは、他のコンピュータ言語が特定のアプリケーションに必要なライブラリルーチンを選択するために必要とする方法に似ています。

C言語のような言語では、アプリケーションのメモリイメージから不要なルーチンを排除するという目標は、通常、ルーチンのライブラリを提供し、「リンカ」プログラムを使って必要なルーチンのみを実行可能なアプリケーションに組み込むことで達成される。リンカを呼び出して制御する方法は、言語定義の範囲外である。

||Transition/Conversion:||
Before compiling a program, the programmer may need to perform some action  to make the words required by that program available for execution.

プログラムをコンパイルする前に、プログラマーはそのプログラムが必要とする単語を実行できるようにするために、何らかのアクションを実行する必要があるかもしれない。

</desc>

# E. ANS Forth portability guide (informative annex)  

## E.1 Introduction  

The most popular architectures used to implement Forth have had byte-addressed memory, 16-bit  operations, and two’s-complement number representation. The Forth-83 Standard dictates that these  particular features must be present in a Forth-83 Standard system and that Forth-83 programs may exploit  these features freely.

However, there are many beasts in the architectural jungle that are bit addressed or cell addressed, or prefer  32-bit operations, or represent numbers in one’s complement. Since one of Forth’s strengths is its usefulness in "strange" environments on "unusual" hardware with "peculiar" features, it is important that a  Standard Forth run on these machines too.

A primary goal of the ANS Forth Standard is to increase the types of machines that can support a Standard  Forth. This is accomplished by allowing some key Forth terms to be implementation-defined (e.g., how big  is a cell?) and by providing Forth operators (words) that conceal the implementation. This frees the  implementor to produce the Forth system that most effectively utilizes the native hardware. The machine  independent operators, together with some programmer discipline, enable a programmer to write Forth  programs that work on a wide variety of machines.

The remainder of this Annex provides guidelines for writing portable ANS Forth programs. The first  section describes ways to make a program hardware independent. It is difficult for someone familiar with  only one machine architecture to imagine the problems caused by transporting programs between dissimilar  machines. Consequently, examples of specific architectures with their respective problems are given. The  second section describes assumptions about Forth implementations that many programmers make, but can’t  be relied upon in a portable program.

## E.2 Hardware peculiarities  

### E.2.1 Data/memory abstraction  

Data and memory are the stones and mortar of program construction. Unfortunately, each computer treats  data and memory differently. The ANS Forth Systems Standard gives definitions of data and memory that  apply to a wide variety of computers. These definitions give us a way to talk about the common elements of  data and memory while ignoring the details of specific hardware. Similarly, ANS Forth programs that use  data and memory in ways that conform to these definitions can also ignore hardware details. The following  sections discuss the definitions and describe how to write programs that are independent of the data/memory  peculiarities of different computers.

### E.2.2 Definitions  

Three terms defined by ANS Forth are address unit, cell, and character. The address space of an ANS Forth  system is divided into an array of address units; an address unit is the smallest collection of bits that can be  addressed. In other words, an address unit is the number of bits spanned by the addresses addr and addr+1.  The most prevalent machines use 8-bit address units. Such "byte addressed" machines include the Intel  8086 and Motorola 68000 families. However, other address unit sizes exist. There are machines that are bit addressed and machines that are 4-bit nibble addressed. There are also machines with address units larger  than 8-bits. For example, several Forth-in-hardware computers are cell addressed.

The cell is the fundamental data type of a Forth system. A cell can be a single-cell integer or a memory address. Forth’s parameter and return stacks are stacks of cells. Forth 83 specifies that a cell is 16-bits. In  ANS Forth the size of a cell is an implementation-defined number of address units. Thus, an ANS Forth  implemented on a 16-bit microprocessor could use a 16-bit cell and an implementation on a 32-bit machine  could use a 32-bit cell. Also 18-bit machines, 36-bit machines, etc., could support ANS Forth systems with  18 or 36-bit cells respectively. In all of these systems, DUP does the same thing: it duplicates the top of the data stack. ! (store) behaves consistently too: given two cells on the data stack it stores the second cell in  the memory location designated by the top cell.

Similarly, the definition of a character has been generalized to be an implementation-defined number of  address units (but at least eight bits). This removes the need for a Forth implementor to provide 8-bit  characters on processors where it is inappropriate. For example, on an 18-bit machine with a 9-bit address  unit, a 9-bit character would be most convenient. Since, by definition, you can’t address anything smaller  than an address unit, a character must be at least as big as an address unit. This will result in big characters  on machines with large address units. An example is a 16-bit cell addressed machine where a 16-bit  character makes the most sense.

### E.2.3 Addressing memory  

ANS Forth eliminates many portability problems by using the above definitions. One of the most common  portability problems is addressing successive cells in memory. Given the memory address of a cell, how do  you find the address of the next cell? In Forth 83 this is easy: 2 + . This code assumes that memory is  addressed in 8-bit units (bytes) and a cell is 16-bits wide. On a byte-addressed machine with 32-bit cells the  code to find the next cell would be 4 + . The code would be 1+ on a cell-addressed processor and 16 + on a bit-addressed processor with 16-bit cells. ANS Forth provides a next-cell operator named CELL+ that  can be used in all of these cases. Given an address, CELL+ adjusts the address by the size of a cell  (measured in address units). A related problem is that of addressing an array of cells in an arbitrary order.  A defining word to create an array of cells using Forth 83 would be:  

    : ARRAY CREATE 2* ALLOT DOES> SWAP 2* + ; 

Use of 2* to scale the array index assumes byte addressing and 16-bit cells again. As in the example above,  different versions of the code would be needed for different machines. ANS Forth provides a portable  scaling operator named CELLS. Given a number n, CELLS returns the number of address units needed to  hold n cells. A portable definition of array is:  

    : ARRAY CREATE CELLS ALLOT 
        DOES> SWAP CELLS + ; 

There are also portability problems with addressing arrays of characters. In Forth 83 (and in the most  common ANS Forth implementations), the size of a character will equal the size of an address unit.  Consequently addresses of successive characters in memory can be found using 1+ and scaling indices into  a character array is a no-op (i.e., 1 *). However, there are cases where a character is larger than an address  unit. Examples include (1) systems with small address units (e.g., bit- and nibble-addressed systems), and  (2) systems with large character sets (e.g., 16-bit characters on a byte-addressed machine). CHAR+ and CHARS operators, analogous to CELL+ and CELLS are available to allow maximum portability.

ANS Forth generalizes the definition of some Forth words that operate on chunks of memory to use address  units. One example is ALLOT. By prefixing ALLOT with the appropriate scaling operator (CELLS,  CHARS, etc.), space for any desired data structure can be allocated (see definition of array above). For  example:  

    CREATE ABUFFER 5 CHARS ALLOT ( allot 5 character buffer)  

The memory-block-move word also uses address units:  

    source destination 8 CELLS MOVE ( move 8 cells)  

### E.2.4 Alignment problems  

Not all addresses are created equal. Many processors have restrictions on the addresses that can be used by  memory access instructions. This Standard does not require an implementor of an ANS Forth to make  alignment transparent; on the contrary, it requires (in Section **3.3.3.1  Address alignment**) that an ANS  Forth program assume that character and cell alignment may be required.

One of the most common problems caused by alignment restrictions is in creating tables containing both  characters and cells. When , (comma) or C, is used to initialize a table, data is stored at the data-space  pointer. Consequently, it must be suitably aligned. For example, a non-portable table definition would be:  

    CREATE ATABLE 1 C, X , 2 C, Y ,  

On a machine that restricts 16-bit fetches to even addresses, CREATE would leave the data space pointer at  an even address, the 1 C, would make the data space pointer odd, and , (comma) would violate the  address restriction by storing X at an odd address. A portable way to create the table is:  

    CREATE ATABLE 1 C, ALIGN X , 2 C, ALIGN Y ,  

ALIGN adjusts the data space pointer to the first aligned address greater than or equal to its current address.  An aligned address is suitable for storing or fetching characters, cells, cell pairs, or double-cell numbers.

After initializing the table, we would also like to read values from the table. For example, assume we want  to fetch the first cell, X, from the table. ATABLE CHAR+ gives the address of the first thing after the  character. However this may not be the address of X since we aligned the dictionary pointer between the C, and the ,. The portable way to get the address of X is:  

    ATABLE CHAR+ ALIGNED  

ALIGNED adjusts the address on top of the stack to the first aligned address greater than or equal to its  current value.

## E.3 Number representation  

Different computers represent numbers in different ways. An awareness of these differences can help a  programmer avoid writing a program that depends on a particular representation.

### E.3.1 Big endian vs. little endian  

The constituent bits of a number in memory are kept in different orders on different machines. Some  machines place the most-significant part of a number at an address in memory with less-significant parts  following it at higher addresses. Other machines do the opposite — the least-significant part is stored at the  lowest address. For example, the following code for a 16-bit 8086 "little endian" Forth would produce the  answer 34 (hex):  

    VARIABLE FOO HEX 1234 FOO ! FOO C@  

The same code on a 16-bit 68000 "big endian" Forth would produce the answer 12 (hex). A portable  program cannot exploit the representation of a number in memory.

A related issue is the representation of cell pairs and double-cell numbers in memory. When a cell pair is  moved from the stack to memory with 2!, the cell that was on top of the stack is placed at the lower  memory address. It is useful and reasonable to manipulate the individual cells when they are in memory.

### E.3.2 ALU organization  

Different computers use different bit patterns to represent integers. Possibilities include binary  representations (two’s complement, one’s complement, sign magnitude, etc.) and decimal representations  (BCD, etc.). Each of these formats creates advantages and disadvantages in the design of a computer’s arithmetic logic unit (ALU). The most commonly used representation, two’s complement, is popular  because of the simplicity of its addition and subtraction algorithms.

Programmers who have grown up on two’s complement machines tend to become intimate with their  representation of numbers and take some properties of that representation for granted. For example, a trick  to find the remainder of a number divided by a power of two is to mask off some bits with AND. A common  application of this trick is to test a number for oddness using 1 AND. However, this will not work on a  one’s complement machine if the number is negative (a portable technique is 2 MOD).

The remainder of this section is a (non-exhaustive) list of things to watch for when portability between  machines with binary representations other than two’s complement is desired.

To convert a single-cell number to a double-cell number, ANS Forth provides the operator S>D. To  convert a double-cell number to single-cell, Forth programmers have traditionally used DROP. However,  this trick doesn’t work on sign-magnitude machines. For portability a D>S operator is available.  Converting an unsigned single-cell number to a double-cell number can be done portably by pushing a zero  on the stack.


## E.4 Forth system implementation  

During Forth’s history, an amazing variety of implementation techniques have been developed. The ANS  Forth Standard encourages this diversity and consequently restricts the assumptions a user can make about  the underlying implementation of an ANS Forth system. Users of a particular Forth implementation  frequently become accustomed to aspects of the implementation and assume they are common to all Forths.  This section points out many of these incorrect assumptions.


 


### E.4.1 Definitions  

Traditionally, Forth definitions have consisted of the name of the Forth word, a dictionary search link, data  describing how to execute the definition, and parameters describing the definition itself. These components  are called the name, link, code, and parameter fields^^X . No method for accessing these fields has been found that works across all of the Forth implementations currently in use. Therefore, ANS Forth severely restricts  how the fields may be used. Specifically, a portable ANS Forth program may not use the name, link, or  code field in any way. Use of the parameter field (renamed to data field for clarity) is limited to the  operations described below.

^^X{These terms are not defined in the Standard. They are mentioned here for historical continuity.
^^}

Only words defined with CREATE or with other defining words that call CREATE have data fields. The  other defining words in the Standard (VARIABLE, CONSTANT, :, etc.) might not be implemented with  CREATE. Consequently, a Standard Program must assume that words defined by VARIABLE, CONSTANT, : , etc., may have no data fields. There is no way for a Standard Program to modify the value of a constant or to change the meaning of a colon definition. The DOES> part of a defining word operates on a data field.  Since only CREATEd words have data fields, DOES> can only be paired with CREATE or words that call  CREATE.

In ANS Forth, FIND, ['] and ' (tick) return an unspecified entity called an "execution token". There are  only a few things that may be done with an execution token. The token may be passed to EXECUTE to  execute the word ticked or compiled into the current definition with COMPILE,. The token can also be  stored in a variable and used later. Finally, if the word ticked was defined via CREATE, >BODY converts  the execution token into the word’s data-field address.

One thing that definitely cannot be done with an execution token is use ! or , to store it into the object code  of a Forth definition. This technique is sometimes used in implementations where the object code is a list of  addresses (threaded code) and an execution token is also an address. However, ANS Forth permits native  code implementations where this will not work.

### E.4.2 Stacks  

In some Forth implementations, it is possible to find the address of a stack in memory and manipulate the  stack as an array of cells. This technique is not portable, however. On some systems, especially Forth-in-hardware systems, the stacks might be in a part of memory that can’t be addressed by the program or might  not be in memory at all. Forth’s parameter and return stacks must be treated as stacks.

A Standard Program may use the return stack directly only for temporarily storing values. Every value  examined or removed from the return stack using R@, R>, or 2R> must have been put on the stack explicitly using >R or 2>R. Even this must be done carefully since the system may use the return stack to hold return  addresses and loop-control parameters. Section **3.2.3.3  Return stack** of the Standard has a list of  restrictions.

## E.5 ROMed application disciplines and conventions  

When a Standard System provides a data space which is uniformly readable and writeable we may term this  environment "RAM-only".

Programs designed for ROMed application must divide data space into at least two parts: a writeable and  readable uninitialized part, called "RAM", and a read-only initialized part, called "ROM". A third  possibility, a writeable and readable initialized part, normally called "initialized RAM", is not addressed by  this discipline. A Standard Program must explicitly initialize the RAM data space as needed.

The separation of data space into RAM and ROM is meaningful only during the generation of the ROMed  program. If the ROMed program is itself a standard development system, it has the same taxonomy as an  ordinary RAM-only system.

The words affected by conversion from a RAM-only to a mixed RAM and ROM environment are:  

    , (comma) ALIGN ALIGNED ALLOT C, CREATE HERE UNUSED
    (VARIABLE always accesses the RAM data space.) 

With the exception of , (comma) and C, these words are meaningful in both RAM and ROM data space.

To select the data space, these words could be preceded by selectors RAM and ROM. For example:  

    ROM CREATE ONES 32 ALLOT ONES 32 1 FILL RAM  

would create a table of ones in the ROM data space. The storage of data into RAM data space when  generating a program for ROM would be an ambiguous condition.

A straightforward implementation of these selectors would maintain separate address counters for each  space. A counter value would be returned by HERE and altered by , (comma), C,, ALIGN, and ALLOT,  with RAM and ROM simply selecting the appropriate address counter. This technique could be extended to  additional partitions of the data space.

## E.6 Summary  

The ANS Forth Standard cannot and should not force anyone to write a portable program. In situations  where performance is paramount, the programmer is encouraged to use every trick in the book. On the  other hand, if portability to a wide variety of systems is needed, ANS Forth provides the tools to accomplish  this. There is probably no such thing as a completely portable program. A programmer, using this guide,  should intelligently weigh the tradeoffs of providing portability to specific machines. For example,  machines that use sign-magnitude numbers are rare and probably don’t deserve much thought. But, systems  with different cell sizes will certainly be encountered and should be provided for. In general, making a  program portable clarifies both the programmer’s thinking process and the final program.

# F. Alphabetic list of words (informative annex)  

In the following list, the last, four-digit, part of the reference number establishes a sequence corresponding  to the alphabetic ordering of all standard words. The first two or three parts indicate the word set and  glossary section in which the word is defined.

### LIST OF WORDS(low.md) SHOULD BE HERE
