1. Introduction 
1.1 Purpose 
The purpose of this Standard is to promote the portability of Forth programs for use on a wide variety of 
computing systems, to facilitate the communication of programs, programming techniques, and ideas among 
Forth programmers, and to serve as a basis for the future evolution of the Forth language. 
1.2 Scope 
This Standard specifies an interface between a Forth System and a Forth Program by defining the words 
provided by a Standard System. 
1.2.1 Inclusions 
This Standard specifies: 
– the forms that a program written in the Forth language may take; 
– the rules for interpreting the meaning of a program and its data. 
1.2.2 Exclusions 
This Standard does not specify: 
– the mechanism by which programs are transformed for use on computing systems; 
– the operations required for setup and control of the use of programs on computing systems; 
– the method of transcription of programs or their input or output data to or from a storage medium; 
– the program and Forth system behavior when the rules of this Standard fail to establish an 
interpretation; 
– the size or complexity of a program and its data that will exceed the capacity of any specific computing 
system or the capability of a particular Forth system; 
– the physical properties of input/output records, files, and units; 
– the physical properties and implementation of storage. 
ANSI X3.215-1994 
2 
1.3 Document organization 
1.3.1 Word sets 
This Standard groups Forth words and capabilities into word sets under a name indicating some shared 
aspect, typically their common functional area. Each word set may have an extension, containing words that 
offer additional functionality. These words are not required in an implementation of the word set. 
The “Core” word set, defined in sections 1 through 6, contains the required words and capabilities of a 
Standard System. The other word sets, defined in sections 7 through 17, are optional, making it possible to 
provide Standard Systems with tailored levels of functionality. 
1.3.1.1 Text sections 
Within each word set, section 1 contains introductory and explanatory material and section 2 introduces 
terms and notation used throughout the Standard. There are no requirements in these sections. 
Sections 3 and 4 contain the usage and documentation requirements, respectively, for Standard Systems and 
Programs, while section 5 specifies their labeling. 
1.3.1.2 Glossary sections 
Section 6 of each word set specifies the required behavior of the definitions in the word set and the 
extensions word set. 
1.3.2 Annexes 
The annexes do not contain any required material. 
Annex A provides some of the rationale behind the committee’s decisions in creating this Standard, as well 
as implementation examples. It has the same section numbering as the body of the Standard to make it easy 
to relate each requirements section to its rationale section. 
Annex B is a short bibliography on Forth. 
Annex C provides an introduction to Forth. 
Annex D discusses the compatibility of ANS Forth with earlier Forths, emphasizing the differences from 
Forth 83. 
Annex E presents some techniques for writing portable programs in ANS Forth. 
Annex F includes the words from all word sets in a single list, and serves as an index of ANS Forth words. 
1.4 Future directions 
1.4.1 New technology 
This Standard adopts certain words and practices that are increasingly found in common practice. New 
words have also been adopted to ease creation of portable programs. 
1.4.2 Obsolescent features 
This Standard adopts certain words and practices that cause some previously used words to become 
obsolescent. Although retained here because of their widespread use, their use in new implementations or 
new programs is discouraged, because they may be withdrawn from future revisions of the Standard. 
This Standard designates the following words as obsolescent: 
 6.2.0060 #TIB 15.6.2.1580 FORGET 6.2.2240 SPAN 
 6.2.0970 CONVERT 6.2.2040 QUERY 6.2.2290 TIB
 6.2.1390 EXPECT
 ANSI X3.215-1994 
 3 
2. Terms, notation, and references 
The phrase “See:” is used throughout this Standard to direct the reader to other sections of the Standard that 
have a direct bearing on the current section. 
In this Standard, “shall” states a requirement on a system or program; conversely, “shall not” is a 
prohibition; “need not” means “is not required to”; “should” describes a recommendation of the Standard; 
and “may”, depending on context, means “is allowed to” or “might happen”. 
Throughout the Standard, typefaces are used in the following manner: 
– This proportional serif typeface is used for text, with italic used for symbols and the first appearance of 
new terms; 
– A bold proportional sans-serif typeface is used for headings; 
– A bold monospaced serif typeface is used for Forth-language text. 
2.1 Definitions of terms 
Terms defined in this section are used generally throughout this Standard. Additional terms specific to 
individual word sets are defined in those word sets. Other terms are defined at their first appearance, 
indicated by italic type. Terms not defined in this Standard are to be construed according to the Dictionary
for Information Systems, ANSI X3.172-1990. 
address unit: Depending on context, either 1) the units into which a Forth address space is divided for the 
purposes of locating data objects such as characters and variables; 2) the physical memory storage elements 
corresponding to those units; 3) the contents of such a memory storage element; or 4) the units in which the 
length of a region of memory is expressed. 
aligned address: The address of a memory location at which a character, cell, cell pair, or double-cell 
integer can be accessed. 
ambiguous condition: A circumstance for which this Standard does not prescribe a specific behavior for 
Forth systems and programs. 
Ambiguous conditions include such things as the absence of a needed delimiter while parsing, attempted 
access to a nonexistent file, or attempted use of a nonexistent word. An ambiguous condition also exists 
when a Standard word is passed values that are improper or out of range. 
cell: The primary unit of information in the architecture of a Forth system. 
cell pair: Two cells that are treated as a single unit. 
character: Depending on context, either 1) a storage unit capable of holding a character; or 2) a member of 
a character set. 
character-aligned address: The address of a memory location at which a character can be accessed. 
character string: Data space that is associated with a sequence of consecutive character-aligned addresses. 
Character strings usually contain text. Unless otherwise indicated, the term “string” means “character 
string”. 
code space: The logical area of the dictionary in which word semantics are implemented. 
compile: To transform source code into dictionary definitions. 
compilation semantics: The behavior of a Forth definition when its name is encountered by the text 
interpreter in compilation state. 
counted string: A data structure consisting of one character containing a length followed by zero or more 
contiguous data characters. Normally, counted strings contain text. 
ANSI X3.215-1994 
4 
cross compiler: A system that compiles a program for later execution in an environment that may be 
physically and logically different from the compiling environment. In a cross compiler, the term “host” 
applies to the compiling environment, and the term “target” applies to the run-time environment. 
current definition: The definition whose compilation has been started but not yet ended. 
data field: The data space associated with a word defined via CREATE. 
data space: The logical area of the dictionary that can be accessed. 
data-space pointer: The address of the next available data space location, i.e., the value returned by 
HERE. 
data stack: A stack that may be used for passing parameters between definitions. When there is no 
possibility of confusion, the data stack is referred to as “the stack”. Contrast with return stack. 
data type: An identifier for the set of values that a data object may have. 
defining word: A Forth word that creates a new definition when executed. 
definition: A Forth execution procedure compiled into the dictionary. 
dictionary: An extensible structure that contains definitions and associated data space. 
display: To send one or more characters to the user output device. 
environmental dependencies: A program’s implicit assumptions about a Forth system’s implementation 
options or underlying hardware. For example, a program that assumes a cell size greater than 16 bits is said 
to have an environmental dependency. 
execution semantics: The behavior of a Forth definition when it is executed. 
execution token: A value that identifies the execution semantics of a definition. 
find: To search the dictionary for a definition name matching a given string. 
immediate word: A Forth word whose compilation semantics are to perform its execution semantics. 
implementation defined: Denotes system behaviors or features that must be provided and documented by 
a system but whose further details are not prescribed by this Standard. 
implementation dependent: Denotes system behaviors or features that must be provided by a system but 
whose further details are not prescribed by this Standard. 
input buffer: A region of memory containing the sequence of characters from the input source that is 
currently accessible to a program. 
input source: The device, file, block, or other entity that supplies characters to refill the input buffer. 
input source specification: A set of information describing a particular state of the input source, input 
buffer, and parse area. This information is sufficient, when saved and restored properly, to enable the 
nesting of parsing operations on the same or different input sources. 
interpretation semantics: The behavior of a Forth definition when its name is encountered by the text 
interpreter in interpretation state. 
keyboard event: A value received by the system denoting a user action at the user input device. The term 
“keyboard” in this document does not exclude other types of user input devices. 
line: A sequence of characters followed by an actual or implied line terminator. 
name space: The logical area of the dictionary in which definition names are stored. 
number: In this Standard, “number” used without other qualification means “integer”. Similarly, “double 
number” means “double-cell integer”. 
 ANSI X3.215-1994 
 5 
parse: To select and exclude a character string from the parse area using a specified set of delimiting 
characters, called delimiters. 
parse area: The portion of the input buffer that has not yet been parsed, and is thus available to the system 
for subsequent processing by the text interpreter and other parsing operations. 
pictured-numeric output: A number display format in which the number is converted using Forth words 
that resemble a symbolic “picture” of the desired output. 
program: A complete specification of execution to achieve a specific function (application task) expressed 
in Forth source code form. 
receive: To obtain characters from the user input device. 
return stack: A stack that may be used for program execution nesting, do-loop execution, temporary 
storage, and other purposes. 
standard word: A named Forth procedure, formally specified in this Standard. 
user input device: The input device currently selected as the source of received data, typically a keyboard. 
user output device: The output device currently selected as the destination of display data. 
variable: A named region of data space located and accessed by its memory address. 
word: Depending on context, either 1) the name of a Forth definition; or 2) a parsed sequence of non-space 
characters, which could be the name of a Forth definition. 
word list: A list of associated Forth definition names that may be examined during a dictionary search. 
word set: A set of Forth definitions grouped together in this Standard under a name indicating some shared 
aspect, typically their common functional area. 
2.2 Notation 
2.2.1 Numeric notation 
Unless otherwise stated, all references to numbers apply to signed single-cell integers. The inclusive range 
of values is shown as {from...to}. The allowable range for the contents of an address is shown in double 
braces, particularly for the contents of variables, e.g., BASE {{2...36}}. 
2.2.2 Stack notation 
Stack parameters input to and output from a definition are described using the notation: 
( stack-id before -- after )
where stack-id specifies which stack is being described, before represents the stack-parameter data types 
before execution of the definition and after represents them after execution. The symbols used in before
and after are shown in table 3.1. 
The control-flow-stack stack-id is “C:”, the data-stack stack-id is “S:”, and the return-stack stack-id is “R:”. 
When there is no confusion, the data-stack stack-id may be omitted. 
When there are alternate after representations, they are described by “after1 | after2”. The top of the stack is 
to the right. Only those stack items required for or provided by execution of the definition are shown. 
2.2.3 Parsed-text notation 
If, in addition to using stack parameters, a definition parses text, that text is specified by an abbreviation 
from table 2.1, shown surrounded by double-quotes and placed between the before parameters and the “--” 
separator in the first stack described, e.g., 
( S: before “parsed-text-abbreviation” -- after ). 
ANSI X3.215-1994 
6 
Table 2.1 – Parsed text abbreviations 
Abbreviation Description 
<char> the delimiting character marking the end of the string being 
parsed 
<chars> zero or more consecutive occurrences of the character char
<space> a delimiting space character 
<spaces> zero or more consecutive occurrences of the character space
<quote> a delimiting double quote 
<paren> a delimiting right parenthesis 
<eol> an implied delimiter marking the end of a line 
ccc a parsed sequence of arbitrary characters, excluding the 
delimiter character 
name a token delimited by space, equivalent to ccc<space> or 
ccc<eol>
2.2.4 Glossary notation 
The glossary entries for each word set are listed in the standard ASCII collating sequence. Each glossary 
entry specifies an ANS Forth word and consists of two parts: an index line and the semantic description of 
the definition. 
2.2.4.1 Glossary index line 
The index line is a single-line entry containing, from left to right: 
– Section number, the last four digits of which assign a unique sequential number to all words included in 
this Standard; 
– DEFINITION-NAME in upper-case, mono-spaced, bold-face letters; 
– Natural-language pronunciation in quotes if it differs from English; 
– Word-set designator from table 2.2. The designation for extensions word sets includes “EXT”. 
Table 2.2 – Word set designators 
Word set Designator 
Core word set CORE 
Block word set BLOCK 
Double-Number word set DOUBLE 
Exception word set EXCEPTION 
Facility word set FACILITY 
File-Access word set FILE 
Floating-Point word set FLOATING 
Locals word set LOCALS 
Memory-Allocation word set MEMORY 
Programming-Tools word set TOOLS 
Search-Order word set SEARCH 
String-Handling word set STRING 
2.2.4.2 Glossary semantic description 
The first paragraph of the semantic description contains a stack notation for each stack affected by 
execution of the word. The remaining paragraphs contain a text description of the semantics. See 3.4.3 
Semantics. 
 ANSI X3.215-1994 
 7 
2.3 References 
The following national and international standards are referenced in this Standard: 
 ANSI X3.172-1990, Dictionary for information systems (2.1 Definition of terms); 
 ANSI X3.4-1974, American Standard Code for Information Interchange (ASCII) (3.1.2.1 Graphic 
characters); 
 ISO 646-1983, ISO 7-bit coded characterset for information interchange, International Reference 
Version (IRV) (3.1.2.1 Graphic characters);1
 ANSI/IEEE 754-1985, Floating-point standard (12.2.1 Definition of terms). 
 
1
 Available from the American National Standards Institute, 11 West 42nd Street, Newyork, NY 10036 
ANSI X3.215-1994 
8 
3. Usage requirements 
A system shall provide all of the words defined in 6.1 Core Words. It may also provide any words defined 
in the optional word sets and extensions word sets. No standard word provided by a system shall alter the 
system state in a way that changes the effect of execution of any other standard word except as provided in 
this Standard. A system may contain non-standard extensions, provided that they are consistent with the 
requirements of this Standard. 
The implementation of a system may use words and techniques outside the scope of this Standard. 
A system need not provide all words in executable form. The implementation may provide definitions, 
including definitions of words in the Core word set, in source form only. If so, the mechanism for adding 
the definitions to the dictionary is implementation defined. 
A program that requires a system to provide words or techniques not defined in this Standard has an 
environmental dependency. 
3.1 Data types 
A data type identifies the set of permissible values for a data object. It is not a property of a particular 
storage location or position on a stack. Moving a data object shall not affect its type. 
No data-type checking is required of a system. An ambiguous condition exists if an incorrectly typed data 
object is encountered. 
Table 3.1 summarizes the data types used throughout this Standard. Multiple instances of the same type in 
the description of a definition are suffixed with a sequence digit subscript to distinguish them. 
3.1.1 Data-type relationships 
Some of the data types are subtypes of other data types. A data type i is a subtype of type j if and only if the 
members of i are a subset of the members of j. The following list represents the subtype relationships using 
the phrase “i => j” to denote “i is a subtype of j”. The subtype relationship is transitive; if i => j and j => k
then i => k: 
+n => u => x; 
+n => n => x; 
char => +n; 
a-addr => c-addr => addr => u; 
flag => x; 
xt => x; 
+d => d => xd; 
+d => ud => xd. 
Any Forth definition that accepts an argument of type i shall also accept an argument that is a subtype of i. 
3.1.2 Character types 
Characters shall be at least one address unit wide, contain at least eight bits, and have a size less than or 
equal to cell size. 
The characters provided by a system shall include the graphic characters {32..126}, which represent graphic 
forms as shown in table 3.2. 
3.1.2.1 Graphic characters 
A graphic character is one that is normally displayed (e.g., A, #, &, 6). These values and graphics, shown in 
table 3.2, are taken directly from ANS X3.4-1974 (ASCII) and ISO 646-1983, International Reference 
Version (IRV). The graphic forms of characters outside the hex range {20..7E} are implementationdefined. Programs that use the graphic hex 24 (the currency sign) have an environmental dependency. 
 ANSI X3.215-1994 
 9 
The graphic representation of characters is not restricted to particular type fonts or styles. The graphics 
here are examples. 
3.1.2.2 Control characters 
All non-graphic characters included in the implementation-defined character set are defined in this Standard 
as control characters. In particular, the characters {0..31}, which could be included in the implementationdefined character set, are control characters. 
Programs that require the ability to send or receive control characters have an environmental dependency. 
Table 3.1 – Data types 
Symbol Data type Size on stack 
flag flag 1 cell 
true true flag 1 cell 
false false flag 1 cell 
char character 1 cell 
n signed number 1 cell 
+n non-negative number 1 cell 
u unsigned number 1 cell 
n|u 1 number 1 cell 
x unspecified cell 1 cell 
xt execution token 1 cell 
addr address 1 cell 
a-addr aligned address 1 cell 
c-addr character-aligned address 1 cell 
d double-cell signed number 2 cells 
+d double-cell non-negative number 2 cells 
ud double-cell unsigned number 2 cells 
d|ud 2 double-cell number 2 cells 
xd unspecified cell pair 2 cells 
colon-sys definition compilation implementation dependent 
do-sys do-loop structures implementation dependent 
case-sys CASE structures implementation dependent 
of-sys OF structures implementation dependent 
orig control-flow origins implementation dependent 
dest control-flow destinations implementation dependent 
loop-sys loop-control parameters implementation dependent 
nest-sys definition calls implementation dependent 
i*x, j*x, k*x 3 any data type 0 or more cells 
1 May be either a signed number or an unsigned number depending on 
context. 
2 May be either a double-cell signed number or a double-cell unsigned 
number depending on context. 
3 May be an undetermined number of stack entries of unspecified type. For 
examples of use, see 6.1.1370 EXECUTE, 6.1.2050 QUIT.
ANSI X3.215-1994 
10 
Table 3.2 – Standard graphic characters 
 Hex IRV ASCII 
20 
21 ! ! 
22 " " 
23 # # 
24 ¤ $ 
25 % % 
26 & & 
27 ' ' 
28 ( ( 
29 ) ) 
2A * * 
2B + + 
2C , , 
2D - - 
2E . . 
2F / / 
 Hex IRV ASCII 
30 0 0 
31 1 1 
32 2 2 
33 3 3 
34 4 4 
35 5 5 
36 6 6 
37 7 7 
38 8 8 
39 9 9 
3A : : 
3B ; ; 
3C < < 
3D = = 
3E > > 
3F ? ? 
 Hex IRV ASCII 
40 @ @ 
41 A A 
42 B B 
43 C C 
44 D D 
45 E E 
46 F F 
47 G G 
48 H H 
49 I I 
4A J J 
4B K K 
4C L L 
4D M M 
4E N N 
4F O O 
 Hex IRV ASCII 
50 P P 
51 Q Q 
52 R R 
53 S S 
54 T T 
55 U U 
56 V V 
57 W W 
58 X X 
59 Y Y 
5A Z Z 
5B [ [ 
5C \ \ 
5D ] ] 
5E ^ ^ 
5F _ _ 
 Hex IRV ASCII 
60 ` ` 
61 a a 
62 b b 
63 c c 
64 d d 
65 e e 
66 f f 
67 g g 
68 h h 
69 i i 
6A j j 
6B k k 
6C l l 
6D m m 
6E n n 
6F o o 
 Hex IRV ASCII 
70 p p 
71 q q 
72 r r 
73 s s 
74 t t 
75 u u 
76 v v 
77 w w 
78 x x 
79 y y 
7A z z 
7B { { 
7C | | 
7D } } 
7E ~ ~ 
3.1.3 Single-cell types 
The implementation-defined fixed size of a cell is specified in address units and the corresponding number 
of bits. See E.2 Hardware peculiarities. 
Cells shall be at least one address unit wide and contain at least sixteen bits. The size of a cell shall be an 
integral multiple of the size of a character. Data-stack elements, return-stack elements, addresses, execution 
tokens, flags, and integers are one cell wide. 
3.1.3.1 Flags 
Flags may have one of two logical states, true or false. Programs that use flags as arithmetic operands have 
an environmental dependency. 
A true flag returned by a standard word shall be a single-cell value with all bits set. A false flag returned by 
a standard word shall be a single-cell value with all bits clear. 
3.1.3.2 Integers 
The implementation-defined range of signed integers shall include {-32767..+32767}. 
The implementation-defined range of non-negative integers shall include {0..32767}. 
The implementation-defined range of unsigned integers shall include {0..65535}. 
3.1.3.3 Addresses 
An address identifies a location in data space with a size of one address unit, which a program may fetch 
from or store into except for the restrictions established in this Standard. The size of an address unit is 
specified in bits. Each distinct address value identifies exactly one such storage element. See 3.3.3 Data 
space. 
The set of character-aligned addresses, addresses at which a character can be accessed, is an 
implementation-defined subset of all addresses. Adding the size of a character to a character-aligned 
address shall produce another character-aligned address. 
The set of aligned addresses is an implementation-defined subset of character-aligned addresses. Adding 
the size of a cell to an aligned address shall produce another aligned address. 
3.1.3.4 Counted strings 
A counted string in memory is identified by the address (c-addr) of its length character. 
 ANSI X3.215-1994 
 11 
The length character of a counted string shall contain a binary representation of the number of data 
characters, between zero and the implementation-defined maximum length for a counted string. The 
maximum length of a counted string shall be at least 255. 
3.1.3.5 Execution tokens 
Different definitions may have the same execution token if the definitions are equivalent. 
3.1.4 Cell-pair types 
A cell pair in memory consists of a sequence of two contiguous cells. The cell at the lower address is the 
first cell, and its address is used to identify the cell pair. Unless otherwise specified, a cell pair on a stack 
consists of the first cell immediately above the second cell. 
3.1.4.1 Double-cell integers 
On the stack, the cell containing the most significant part of a double-cell integer shall be above the cell 
containing the least significant part. 
The implementation-defined range of double-cell signed integers shall include 
{-2147483647..+2147483647}. 
The implementation-defined range of double-cell non-negative integers shall include {0..2147483647}. 
The implementation-defined range of double-cell unsigned integers shall include {0..4294967295}. Placing 
the single-cell integer zero on the stack above a single-cell unsigned integer produces a double-cell unsigned 
integer with the same value. See 3.2.1.1 Internal number representation. 
3.1.4.2 Character strings 
A string is specified by a cell pair (c-addr u) representing its starting address and length in characters. 
3.1.5 System types 
The system data types specify permitted word combinations during compilation and execution. 
3.1.5.1 System-compilation types 
These data types denote zero or more items on the control-flow stack (see 3.2.3.2). The possible presence 
of such items on the data stack means that any items already there shall be unavailable to a program until the 
control-flow-stack items are consumed. 
The implementation-dependent data generated upon beginning to compile a definition and consumed at its 
close is represented by the symbol colon-sys throughout this Standard. 
The implementation-dependent data generated upon beginning to compile a do-loop structure such as 
DO ... LOOP and consumed at its close is represented by the symbol do-sys throughout this Standard. 
The implementation-dependent data generated upon beginning to compile a CASE ... ENDCASE
structure and consumed at its close is represented by the symbol case-sys throughout this Standard. 
The implementation-dependent data generated upon beginning to compile an OF ... ENDOF structure 
and consumed at its close is represented by the symbol of-sys throughout this Standard. 
The implementation-dependent data generated and consumed by executing the other standard control-flow 
words is represented by the symbols orig and dest throughout this Standard. 
3.1.5.2 System-execution types 
These data types denote zero or more items on the return stack. Their possible presence means that any 
items already on the return stack shall be unavailable to a program until the system-execution items are 
consumed. 
The implementation-dependent data generated upon beginning to execute a definition and consumed upon 
exiting it is represented by the symbol nest-sys throughout this Standard. 
ANSI X3.215-1994 
12 
The implementation-dependent loop-control parameters used to control the execution of do-loops are 
represented by the symbol loop-sys throughout this Standard. Loop-control parameters shall be available 
inside the do-loop for words that use or change these parameters, words such as I, J, LEAVE and UNLOOP. 
3.2 The implementation environment 
3.2.1 Numbers 
3.2.1.1 Internal number representation 
This Standard allows one’s complement, two’s complement, or sign-magnitude number representations and 
arithmetic. Arithmetic zero is represented as the value of a single cell with all bits clear. 
The representation of a number as a compiled literal or in memory is implementation dependent. 
3.2.1.2 Digit conversion 
Numbers shall be represented externally by using characters from the standard character set. 
Conversion between the internal and external forms of a digit shall behave as follows: 
The value in BASE is the radix for number conversion. A digit has a value ranging from zero to one less 
than the contents of BASE. The digit with the value zero corresponds to the character “0”. This 
representation of digits proceeds through the character set to the decimal value nine corresponding to the 
character “9”. For digits beginning with the decimal value ten the graphic characters beginning with the 
character “A” are used. This correspondence continues up to and including the digit with the decimal value 
thirty-five which is represented by the character “Z”. The conversion of digits outside this range is 
implementation defined. 
3.2.1.3 Free-field number display 
Free-field number display uses the characters described in digit conversion, without leading zeros, in a field 
the exact size of the converted string plus a trailing space. If a number is zero, the least significant digit is 
not considered a leading zero. If the number is negative, a leading minus sign is displayed. 
Number display may use the pictured numeric output string buffer to hold partially converted strings (see 
3.3.3.6 Other transient regions). 
3.2.2 Arithmetic 
3.2.2.1 Integer division 
Division produces a quotient q and a remainder r by dividing operand a by operand b. Division operations 
return q, r, or both. The identity b*q + r = a shall hold for all a and b. 
When unsigned integers are divided and the remainder is not zero, q is the largest integer less than the true 
quotient. 
When signed integers are divided, the remainder is not zero, and a and b have the same sign, q is the largest 
integer less than the true quotient. If only one operand is negative, whether q is rounded toward negative 
infinity (floored division) or rounded towards zero (symmetric division) is implementation defined. 
Floored division is integer division in which the remainder carries the sign of the divisor or is zero, and the 
quotient is rounded to its arithmetic floor. Symmetric division is integer division in which the remainder 
carries the sign of the dividend or is zero and the quotient is the mathematical quotient “rounded towards 
zero” or “truncated”. Examples of each are shown in tables 3.3 and 3.4. 
In cases where the operands differ in sign and the rounding direction matters, a program shall either include 
code generating the desired form of division, not relying on the implementation-defined default result, or 
have an environmental dependency on the desired rounding direction. 
 ANSI X3.215-1994 
 13 
3.2.2.2 Other integer operations 
In all integer arithmetic operations, both overflow and underflow shall be ignored. The value returned when 
either overflow or underflow occurs is implementation defined. 
3.2.3 Stacks 
3.2.3.1 Data stack 
Objects on the data stack shall be one cell wide. 
3.2.3.2 Control-flow stack 
The control-flow stack is a last-in, first out list whose elements define the permissible matchings of controlflow words and the restrictions imposed on data-stack usage during the compilation of control structures. 
The elements of the control-flow stack are system-compilation data types. 
The control-flow stack may, but need not, physically exist in an implementation. If it does exist, it may be, 
but need not be, implemented using the data stack. The format of the control-flow stack is implementation 
defined. Since the control-flow stack may be implemented using the data stack, items placed on the data 
stack are unavailable to a program after items are placed on the control-flow stack and remain unavailable 
until the control-flow stack items are removed. 
3.2.3.3 Return stack 
Items on the return stack shall consist of one or more cells. A system may use the return stack in an 
implementation-dependent manner during the compilation of definitions, during the execution of do-loops, 
and for storing run-time nesting information. 
A program may use the return stack for temporary storage during the execution of a definition subject to the 
following restrictions: 
– A program shall not access values on the return stack (using R@, R>, 2R@ or 2R>) that it did not place 
there using >R or 2>R; 
– A program shall not access from within a do-loop values placed on the return stack before the loop was 
entered; 
– All values placed on the return stack within a do-loop shall be removed before I, J, LOOP, +LOOP, 
UNLOOP, or LEAVE is executed; 
– All values placed on the return stack within a definition shall be removed before the definition is 
terminated or before EXIT is executed. 
3.2.4 Operator terminal 
See 1.2.2 Exclusions. 
3.2.4.1 User input device 
The method of selecting the user input device is implementation defined. 
Table 3.3 – Floored Division Example 
 Dividend Divisor Remainder Quotient 
 10 7 3 1 
 -10 7 4 -2 
 10 -7 -4 -2 
 -10 -7 -3 1 
Table 3.4 – Symmetric Division Example 
 Dividend Divisor Remainder Quotient 
 10 7 3 1 
 -10 7 -3 -1 
 10 -7 3 -1 
 -10 -7 -3 1 
ANSI X3.215-1994 
14 
The method of indicating the end of an input line of text is implementation defined. 
3.2.4.2 User output device 
The method of selecting the user output device is implementation defined. 
3.2.5 Mass storage 
A system need not provide any standard words for accessing mass storage. If a system provides any 
standard word for accessing mass storage, it shall also implement the Block word set. 
3.2.6 Environmental queries 
The name spaces for ENVIRONMENT? and definitions are disjoint. Names of definitions that are the same 
as ENVIRONMENT? strings shall not impair the operation of ENVIRONMENT?. Table 3.5 contains the 
valid input strings and corresponding returned value for inquiring about the programming environment with 
ENVIRONMENT?. 
Table 3.5 – Environmental Query Strings 
String Value data type Constant? Meaning 
/COUNTED-STRING n yes maximum size of a counted string, in 
characters 
/HOLD n yes size of the pictured numeric output string 
buffer, in characters 
/PAD n yes size of the scratch area pointed to by PAD, in 
characters 
ADDRESS-UNIT-BITS n yes size of one address unit, in bits 
CORE flag no true if complete core word set present 
(i.e., not a subset as defined in 5.1.1) 
CORE-EXT flag no true if core extensions word set present 
FLOORED flag yes true if floored division is the default 
MAX-CHAR u yes maximum value of any character in the 
implementation-defined character set 
MAX-D d yes largest usable signed double number 
MAX-N n yes largest usable signed integer 
MAX-U u yes largest usable unsigned integer 
MAX-UD ud yes largest usable unsigned double number 
RETURN-STACK-CELLS n yes maximum size of the return stack, in cells 
STACK-CELLS n yes maximum size of the data stack, in cells 
If an environmental query (using ENVIRONMENT?) returns false (i.e., unknown) in response to a string, 
subsequent queries using the same string may return true. If a query returns true (i.e., known) in response to 
a string, subsequent queries with the same string shall also return true. If a query designated as constant in 
the above table returns true and a value in response to a string, subsequent queries with the same string shall 
return true and the same value. 
3.3 The Forth dictionary 
Forth words are organized into a structure called the dictionary. While the form of this structure is not 
specified by the Standard, it can be described as consisting of three logical parts: a name space, a code 
space, and a data space. The logical separation of these parts does not require their physical separation. 
A program shall not fetch from or store into locations outside data space. An ambiguous condition exists if 
a program addresses name space or code space. 
 ANSI X3.215-1994 
 15 
3.3.1 Name space 
The relationship between name space and data space is implementation dependent. 
3.3.1.1 Word lists 
The structure of a word list is implementation dependent. When duplicate names exist in a word list, the 
latest-defined duplicate shall be the one found during a search for the name. 
3.3.1.2 Definition names 
Definition names shall contain {1..31} characters. A system may allow or prohibit the creation of definition 
names containing non-standard characters. 
Programs that use lower case for standard definition names or depend on the case-sensitivity properties of a 
system have an environmental dependency. 
A program shall not create definition names containing non-graphic characters. 
3.3.2 Code space 
The relationship between code space and data space is implementation dependent. 
3.3.3 Data space 
Data space is the only logical area of the dictionary for which standard words are provided to allocate and 
access regions of memory. These regions are: contiguous regions, variables, text-literal regions, input 
buffers, and other transient regions, each of which is described in the following sections. A program may 
read from or write into these regions unless otherwise specified. 
3.3.3.1 Address alignment 
Most addresses used in ANS Forth are aligned addresses (indicated by a-addr) or character-aligned 
(indicated by c-addr). ALIGNED, CHAR+, and arithmetic operations can alter the alignment state of an 
address on the stack. CHAR+ applied to an aligned address returns a character-aligned address that can only 
be used to access characters. Applying CHAR+ to a character-aligned address produces the succeeding 
character-aligned address. Adding or subtracting an arbitrary number to an address can produce an 
unaligned address that shall not be used to fetch or store anything. The only way to find the next aligned 
address is with ALIGNED. An ambiguous condition exists when @, !, , (comma), +!, 2@, or 2! is used 
with an address that is not aligned, or when C@, C!, or C, is used with an address that is not characteraligned. 
The definitions of 6.1.1000 CREATE and 6.1.2410 VARIABLE require that the definitions created by them 
return aligned addresses. 
After definitions are compiled or the word ALIGN is executed the data-space pointer is guaranteed to be 
aligned. 
3.3.3.2 Contiguous regions 
A system guarantees that a region of data space allocated using ALLOT, , (comma), C, (c-comma), and 
ALIGN shall be contiguous with the last region allocated with one of the above words, unless the 
restrictions in the following paragraphs apply. The data-space pointer HERE always identifies the beginning 
of the next data-space region to be allocated. As successive allocations are made, the data-space pointer 
increases. A program may perform address arithmetic within contiguously allocated regions. The last 
region of data space allocated using the above operators may be released by allocating a corresponding 
negatively-sized region using ALLOT, subject to the restrictions of the following paragraphs. 
CREATE establishes the beginning of a contiguous region of data space, whose starting address is returned 
by the CREATEd definition. This region is terminated by compiling the next definition. 
ANSI X3.215-1994 
16 
Since an implementation is free to allocate data space for use by code, the above operators need not produce 
contiguous regions of data space if definitions are added to or removed from the dictionary between 
allocations. An ambiguous condition exists if deallocated memory contains definitions. 
3.3.3.3 Variables 
The region allocated for a variable may be non-contiguous with regions subsequently allocated with 
, (comma) or ALLOT. For example, in: 
VARIABLE X 1 CELLS ALLOT 
the region X and the region ALLOTted could be non-contiguous. 
Some system-provided variables, such as STATE, are restricted to read-only access. 
3.3.3.4 Text-literal regions 
The text-literal regions, specified by strings compiled with S" and C", may be read-only. 
A program shall not store into the text-literal regions created by S" and C" nor into any read-only system 
variable or read-only transient regions. An ambiguous condition exists when a program attempts to store 
into read-only regions. 
3.3.3.5 Input buffers 
The address, length, and content of the input buffer may be transient. A program shall not write into the 
input buffer. In the absence of any optional word sets providing alternative input sources, the input buffer is 
either the terminal-input buffer, used by QUIT to hold one line from the user input device, or a buffer 
specified by EVALUATE. In all cases, SOURCE returns the beginning address and length in characters of 
the current input buffer. 
The minimum size of the terminal-input buffer shall be 80 characters. 
The address and length returned by SOURCE, the string returned by PARSE, and directly computed inputbuffer addresses are valid only until the text interpreter does I/O to refill the input buffer or the input source 
is changed. 
A program may modify the size of the parse area by changing the contents of >IN within the limits imposed 
by this Standard. For example, if the contents of >IN are saved before a parsing operation and restored 
afterwards, the text that was parsed will be available again for subsequent parsing operations. The extent of 
permissible repositioning using this method depends on the input source (see 7.3.3 Block buffer regions
and 11.3.4 Input source). 
A program may directly examine the input buffer using its address and length as returned by SOURCE; the 
beginning of the parse area within the input buffer is indexed by the number in >IN. The values are valid 
for a limited time. An ambiguous condition exists if a program modifies the contents of the input buffer. 
3.3.3.6 Other transient regions 
The data space regions identified by PAD, WORD, and #> (the pictured numeric output string buffer) may be 
transient. Their addresses and contents may become invalid after: 
– a definition is created via a defining word; 
– definitions are compiled with : or :NONAME; 
– data space is allocated using ALLOT, , (comma), C, (c-comma), or ALIGN. 
The previous contents of the regions identified by WORD and #> may be invalid after each use of these 
words. Further, the regions returned by WORD and #> may overlap in memory. Consequently, use of one of 
these words can corrupt a region returned earlier by a different word. The other words that construct 
pictured numeric output strings (<#, #, #S, and HOLD) may also modify the contents of these regions. 
 ANSI X3.215-1994 
 17 
Words that display numbers may be implemented using pictured numeric output words. Consequently, .
(dot), .R, .S, ?, D., D.R, U., and U.R could also corrupt the regions. 
The size of the scratch area whose address is returned by PAD shall be at least 84 characters. The contents 
of the region addressed by PAD are intended to be under the complete control of the user: no words defined 
in this Standard place anything in the region, although changing data-space allocations as described in 
3.3.3.2 Contiguous regions may change the address returned by PAD. Non-standard words provided by an 
implementation may use PAD, but such use shall be documented. 
The size of the region identified by WORD shall be at least 33 characters. 
The size of the pictured numeric output string buffer shall be at least (2*n) + 2 characters, where n is the 
number of bits in a cell. Programs that consider it a fixed area with unchanging access parameters have an 
environmental dependency. 
3.4 The Forth text interpreter 
Upon start-up, a system shall be able to interpret, as described by 6.1.2050 QUIT, Forth source code 
received interactively from a user input device. 
Such interactive systems usually furnish a “prompt” indicating that they have accepted a user request and 
acted on it. The implementation-defined Forth prompt should contain the word “OK” in some combination 
of upper or lower case. 
Text interpretation (see 6.1.1360 EVALUATE and 6.1.2050 QUIT) shall repeat the following steps until 
either the parse area is empty or an ambiguous condition exists: 
a) Skip leading spaces and parse a name (see 3.4.1); 
b) Search the dictionary name space (see 3.4.2). If a definition name matching the string is found: 
1) if interpreting, perform the interpretation semantics of the definition (see 3.4.3.2), and continue at 
a); 
2) if compiling, perform the compilation semantics of the definition (see 3.4.3.3), and continue at a). 
c) If a definition name matching the string is not found, attempt to convert the string to a number 
(see 3.4.1.3). If successful: 
1) if interpreting, place the number on the data stack, and continue at a); 
2) if compiling, compile code that when executed will place the number on the stack (see 6.1.1780
LITERAL), and continue at a); 
d) If unsuccessful, an ambiguous condition exists (see 3.4.4). 
ANSI X3.215-1994 
18 
3.4.1 Parsing 
Unless otherwise noted, the number of characters parsed may be from zero to the implementation-defined 
maximum length of a counted string. 
If the parse area is empty, i.e., when the number in >IN is equal to the length of the input buffer, or contains 
no characters other than delimiters, the selected string is empty. Otherwise, the selected string begins with 
the next character in the parse area, which is the character indexed by the contents of >IN. An ambiguous 
condition exists if the number in >IN is greater than the size of the input buffer. 
If delimiter characters are present in the parse area after the beginning of the selected string, the string 
continues up to and including the character just before the first such delimiter, and the number in >IN is 
changed to index immediately past that delimiter, thus removing the parsed characters and the delimiter 
from the parse area. Otherwise, the string continues up to and including the last character in the parse area, 
and the number in >IN is changed to the length of the input buffer, thus emptying the parse area. 
Parsing may change the contents of >IN, but shall not affect the contents of the input buffer. Specifically, if 
the value in >IN is saved before starting the parse, resetting >IN to that value immediately after the parse 
shall restore the parse area without loss of data. 
3.4.1.1 Delimiters 
If the delimiter is the space character, hex 20 (BL), control characters may be treated as delimiters. The set 
of conditions, if any, under which a “space” delimiter matches control characters is implementation defined. 
To skip leading delimiters is to pass by zero or more contiguous delimiters in the parse area before parsing. 
3.4.1.2 Syntax 
Forth has a simple, operator-ordered syntax. The phrase A B C returns values as if A were executed first, 
then B and finally C. Words that cause deviations from this linear flow of control are called control-flow 
words. Combinations of control-flow words whose stack effects are compatible form control-flow 
structures. Examples of typical use are given for each control-flow word in Annex A. 
Forth syntax is extensible; for example, new control-flow words can be defined in terms of existing ones. 
This Standard does not require a syntax or program-construct checker. 
3.4.1.3 Text interpreter input number conversion 
When converting input numbers, the text interpreter shall recognize both positive and negative numbers, 
with a negative number represented by a single minus sign, the character “-”, preceding the digits. The 
value in BASE is the radix for number conversion. 
3.4.2 Finding definition names 
A string matches a definition name if each character in the string matches the corresponding character in the 
string used as the definition name when the definition was created. The case sensitivity (whether or not the 
upper-case letters match the lower-case letters) is implementation defined. A system may be either case 
sensitive, treating upper- and lower-case letters as different and not matching, or case insensitive, ignoring 
differences in case while searching. 
The matching of upper- and lower-case letters with alphabetic characters in character set extensions such as 
accented international characters is implementation defined. 
A system shall be capable of finding the definition names defined by this Standard when they are spelled 
with upper-case letters. 
 ANSI X3.215-1994 
 19 
3.4.3 Semantics 
The semantics of a Forth definition are implemented by machine code or a sequence of execution tokens or 
other representations. They are largely specified by the stack notation in the glossary entries, which shows 
what values shall be consumed and produced. The prose in each glossary entry further specifies the 
definition’s behavior. 
Each Forth definition may have several behaviors, described in the following sections. The terms “initiation 
semantics” and “run-time semantics” refer to definition fragments, and have meaning only within the 
individual glossary entries where they appear. 
3.4.3.1 Execution semantics 
The execution semantics of each Forth definition are specified in an “Execution:” section of its glossary 
entry. When a definition has only one specified behavior, the label is omitted. 
Execution may occur implicitly, when the definition into which it has been compiled is executed, or 
explicitly, when its execution token is passed to EXECUTE. The execution semantics of a syntactically 
correct definition under conditions other than those specified in this Standard are implementation 
dependent. 
Glossary entries for defining words include the execution semantics for the new definition in a “name
Execution:” section. 
3.4.3.2 Interpretation semantics 
Unless otherwise specified in an “Interpretation:” section of the glossary entry, the interpretation semantics 
of a Forth definition are its execution semantics. 
A system shall be capable of executing, in interpretation state, all of the definitions from the Core word set 
and any definitions included from the optional word sets or word set extensions whose interpretation 
semantics are defined by this Standard. 
A system shall be capable of executing, in interpretation state, any new definitions created in accordance 
with 3. Usage requirements. 
3.4.3.3 Compilation semantics 
Unless otherwise specified in a “Compilation:” section of the glossary entry, the compilation semantics of a 
Forth definition shall be to append its execution semantics to the execution semantics of the current 
definition. 
3.4.4 Possible actions on an ambiguous condition 
When an ambiguous condition exists, a system may take one or more of the following actions: 
– ignore and continue; 
– display a message; 
– execute a particular word; 
– set interpretation state and begin text interpretation; 
– take other implementation-defined actions; 
– take implementation-dependent actions. 
The response to a particular ambiguous condition need not be the same under all circumstances. 
ANSI X3.215-1994 
20 
3.4.5 Compilation 
A program shall not attempt to nest compilation of definitions. 
During the compilation of the current definition, a program shall not execute any defining word, :NONAME, 
or any definition that allocates dictionary data space. The compilation of the current definition may be 
suspended using [ (left-bracket) and resumed using ] (right-bracket). While the compilation of the current 
definition is suspended, a program shall not execute any defining word, :NONAME, or any definition that 
allocates dictionary data space. 
 ANSI X3.215-1994 
 21 
4. Documentation requirements 
When it is impossible or infeasible for a system or program to define a particular behavior itself, it is 
permissible to state that the behavior is unspecifiable and to explain the circumstances and reasons why this 
is so. 
4.1 System documentation 
4.1.1 Implementation-defined options 
The implementation-defined items in the following list represent characteristics and choices left to the 
discretion of the implementor, provided that the requirements of this Standard are met. A system shall 
document the values for, or behaviors of, each item. 
– aligned address requirements (3.1.3.3 Addresses); 
– behavior of 6.1.1320 EMIT for non-graphic characters; 
– character editing of 6.1.0695 ACCEPT and 6.2.1390 EXPECT; 
– character set (3.1.2 Character types, 6.1.1320 EMIT, 6.1.1750 KEY); 
– character-aligned address requirements (3.1.3.3 Addresses); 
– character-set-extensions matching characteristics (3.4.2 Finding definition names); 
– conditions under which control characters match a space delimiter (3.4.1.1 Delimiters); 
– format of the control-flow stack (3.2.3.2 Control-flow stack); 
– conversion of digits larger than thirty-five (3.2.1.2 Digit conversion); 
– display after input terminates in 6.1.0695 ACCEPT and 6.2.1390 EXPECT; 
– exception abort sequence (as in 6.1.0680 ABORT"); 
– input line terminator (3.2.4.1 User input device); 
– maximum size of a counted string, in characters (3.1.3.4 Counted strings, 6.1.2450 WORD); 
– maximum size of a parsed string (3.4.1 Parsing); 
– maximum size of a definition name, in characters (3.3.1.2 Definition names); 
– maximum string length for 6.1.1345 ENVIRONMENT?, in characters; 
– method of selecting 3.2.4.1 User input device; 
– method of selecting 3.2.4.2 User output device; 
– methods of dictionary compilation (3.3 The Forth dictionary); 
– number of bits in one address unit (3.1.3.3 Addresses); 
– number representation and arithmetic (3.2.1.1 Internal number representation); 
– ranges for n, +n, u, d, +d, and ud (3.1.3 Single-cell types, 3.1.4 Cell-pair types); 
– read-only data-space regions (3.3.3 Data space); 
– size of buffer at 6.1.2450 WORD (3.3.3.6 Other transient regions); 
– size of one cell in address units (3.1.3 Single-cell types); 
– size of one character in address units (3.1.2 Character types); 
– size of the keyboard terminal input buffer (3.3.3.5 Input buffers); 
– size of the pictured numeric output string buffer (3.3.3.6 Other transient regions); 
– size of the scratch area whose address is returned by 6.2.2000 PAD (3.3.3.6 Other transient regions); 
– system case-sensitivity characteristics (3.4.2 Finding definition names); 
– system prompt (3.4 The Forth text interpreter, 6.1.2050 QUIT); 
– type of division rounding (3.2.2.1 Integer division, 6.1.0100 */, 6.1.0110 */MOD, 6.1.0230 /, 
6.1.0240 /MOD, 6.1.1890 MOD); 
– values of 6.1.2250 STATE when true; 
– values returned after arithmetic overflow (3.2.2.2 Other integer operations); 
ANSI X3.215-1994 
22 
– whether the current definition can be found after 6.1.1250 DOES> (6.1.0450 :). 
4.1.2 Ambiguous conditions 
A system shall document the system action taken upon each of the general or specific ambiguous conditions 
identified in this Standard. See 3.4.4 Possible actions on an ambiguous condition. 
The following general ambiguous conditions could occur because of a combination of factors: 
– a name is neither a valid definition name nor a valid number during text interpretation (3.4 The Forth 
text interpreter); 
– a definition name exceeded the maximum length allowed (3.3.1.2 Definition names); 
– addressing a region not listed in 3.3.3 Data Space; 
– argument type incompatible with specified input parameter, e.g., passing a flag to a word expecting an 
n (3.1 Data types); 
– attempting to obtain the execution token, (e.g., with 6.1.0070 ', 6.1.1550 FIND, etc.) of a definition 
with undefined interpretation semantics; 
– dividing by zero (6.1.0100 */, 6.1.0110 */MOD, 6.1.0230 /, 6.1.0240 /MOD, 6.1.1561 FM/MOD, 
6.1.1890 MOD, 6.1.2214 SM/REM, 6.1.2370 UM/MOD, 8.6.1.1820 M*/); 
– insufficient data-stack space or return-stack space (stack overflow); 
– insufficient space for loop-control parameters; 
– insufficient space in the dictionary; 
– interpretating a word with undefined interpretation semantics; 
– modifying the contents of the input buffer or a string literal (3.3.3.4 Text-literal regions, 3.3.3.5 Input 
buffers); 
– overflow of a pictured numeric output string; 
– parsed string overflow; 
– producing a result out of range, e.g., multiplication (using *) results in a value too big to be represented 
by a single-cell integer (6.1.0090 *, 6.1.0100 */, 6.1.0110 */MOD, 6.1.0570 >NUMBER, 6.1.1561
FM/MOD, 6.1.2214 SM/REM, 6.1.2370 UM/MOD, 6.2.0970 CONVERT, 8.6.1.1820 M*/); 
– reading from an empty data stack or return stack (stack underflow); 
– unexpected end of input buffer, resulting in an attempt to use a zero-length string as a name; 
The following specific ambiguous conditions are noted in the glossary entries of the relevant words: 
– >IN greater than size of input buffer (3.4.1 Parsing); 
– 6.1.2120 RECURSE appears after 6.1.1250 DOES>; 
– argument input source different than current input source for 6.2.2148 RESTORE-INPUT; 
– data space containing definitions is de-allocated (3.3.3.2 Contiguous regions); 
– data space read/write with incorrect alignment (3.3.3.1 Address alignment); 
– data-space pointer not properly aligned (6.1.0150 ,, 6.1.0860 C,); 
– less than u+2 stack items (6.2.2030 PICK, 6.2.2150 ROLL); 
– loop-control parameters not available (6.1.0140 +LOOP, 6.1.1680 I, 6.1.1730 J, 6.1.1760 LEAVE, 
6.1.1800 LOOP, 6.1.2380 UNLOOP); 
– most recent definition does not have a name (6.1.1710 IMMEDIATE); 
– name not defined by 6.2.2405 VALUE used by 6.2.2295 TO; 
– name not found (6.1.0070 ', 6.1.2033 POSTPONE, 6.1.2510 ['], 6.2.2530 [COMPILE]); 
– parameters are not of the same type (6.1.1240 DO, 6.2.0620 ?DO, 6.2.2440 WITHIN); 
– 6.1.2033 POSTPONE or 6.2.2530 [COMPILE] applied to 6.2.2295 TO; 
– string longer than a counted string returned by 6.1.2450 WORD; 
– u greater than or equal to the number of bits in a cell ( 6.1.1805 LSHIFT, 6.1.2162 RSHIFT); 
– word not defined via 6.1.1000 CREATE (6.1.0550 >BODY, 6.1.1250 DOES>); 
– words improperly used outside 6.1.0490 <# and 6.1.0040 #> (6.1.0030 #, 6.1.0050 #S, 
6.1.1670 HOLD, 6.1.2210 SIGN). 
 ANSI X3.215-1994 
 23 
4.1.3 Other system documentation 
A system shall provide the following information: 
– list of non-standard words using 6.2.2000 PAD (3.3.3.6 Other transient regions); 
– operator’s terminal facilities available; 
– program data space available, in address units; 
– return stack space available, in cells; 
– stack space available, in cells; 
– system dictionary space required, in address units. 
4.2 Program documentation 
4.2.1 Environmental dependencies 
A program shall document the following environmental dependencies, where they apply, and should 
document other known environmental dependencies: 
– considering the pictured numeric output string buffer a fixed area with unchanging access parameters 
(3.3.3.6 Other transient regions); 
– depending on the presence or absence of non-graphic characters in a received string 
(6.1.0695 ACCEPT, 6.2.1390 EXPECT); 
– relying on a particular rounding direction (3.2.2.1 Integer division); 
– requiring a particular number representation and arithmetic (3.2.1.1 Internal number 
representation); 
– requiring non-standard words or techniques (3. Usage requirements); 
– requiring the ability to send or receive control characters (3.1.2.2 Control characters, 6.1.1750 KEY); 
– using control characters to perform specific functions (6.1.1320 EMIT, 6.1.2310 TYPE); 
– using flags as arithmetic operands (3.1.3.1 Flags); 
– using lower case for standard definition names or depending on the case sensitivity of a system 
(3.3.1.2 Definition names); 
– using the graphic character with a value of hex 24 (3.1.2.1 Graphic characters). 
4.2.2 Other program documentation 
A program shall also document: 
– minimum operator’s terminal facilities required; 
– whether a Standard System exists after the program is loaded. 
ANSI X3.215-1994 
24 Collating Sequence: 
5. Compliance and labeling 
5.1 ANS Forth systems 
5.1.1 System compliance 
A system that complies with all the system requirements given in sections 3. Usage requirements and 
4.1 System documentation and their sub-sections is a Standard System. An otherwise Standard System 
that provides only a portion of the Core words is a Standard System Subset. An otherwise Standard System 
(Subset) that fails to comply with one or more of the minimum values or ranges specified in 3. Usage 
requirements and its sub-sections has environmental restrictions. 
5.1.2 System labeling 
A Standard System (Subset) shall be labeled an “ANS Forth System (Subset)”. That label, by itself, shall 
not be applied to Standard Systems or Standard System Subsets that have environmental restrictions. 
The phrase “with Environmental Restrictions” shall be appended to the label of a Standard System (Subset) 
that has environmental restrictions. 
The phrase “Providing name(s) from the Core Extensions word set” shall be appended to the label of any 
Standard System that provides portions of the Core Extensions word set. 
The phrase “Providing the Core Extensions word set” shall be appended to the label of any Standard System 
that provides all of the Core Extensions word set. 
5.2 ANS Forth programs 
5.2.1 Program compliance 
A program that complies with all the program requirements given in sections 3. Usage requirements and 
4.2 Program documentation and their sub-sections is a Standard Program. 
5.2.2 Program labeling 
A Standard Program shall be labeled an “ANS Forth Program”. That label, by itself, shall not be applied to 
Standard Programs that require the system to provide standard words outside the Core word set or that have 
environmental dependencies. 
The phrase “with Environmental Dependencies” shall be appended to the label of Standard Programs that 
have environmental dependencies. 
The phrase “Requiring name(s) from the Core Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the Core Extensions word set. 
The phrase “Requiring the Core Extensions word set” shall be appended to the label of Standard Programs 
that require the system to provide all of the Core Extensions word set. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 25 
6. Glossary 
6.1 Core words 
6.1.0010 ! “store” CORE 
( x a-addr -- ) 
Store x at a-addr. 
 See: 3.3.3.1 Address alignment. 
6.1.0030 # “number-sign” CORE 
( ud1 -- ud2 ) 
Divide ud1 by the number in BASE giving the quotient ud2 and the remainder n. (n is the leastsignificant digit of ud1.) Convert n to external form and add the resulting character to the 
beginning of the pictured numeric output string. An ambiguous condition exists if # executes 
outside of a <# #> delimited number conversion. 
 See: 6.1.0040 #>, 6.1.0050 #S, 6.1.0490 <#. 
6.1.0040 #> “number-sign-greater” CORE 
( xd -- c-addr u ) 
Drop xd. Make the pictured numeric output string available as a character string. c-addr and u
specify the resulting character string. A program may replace characters within the string. 
 See: 6.1.0030 #, 6.1.0050 #S, 6.1.0490 <#. 
6.1.0050 #S “number-sign-s” CORE 
( ud1 -- ud2 ) 
Convert one digit of ud1 according to the rule for #. Continue conversion until the quotient is 
zero. ud2 is zero. An ambiguous condition exists if #S executes outside of a <# #> delimited 
number conversion. 
 See: 6.1.0030 #, 6.1.0040 #>, 6.1.0490 <#. 
6.1.0070 ' “tick” CORE 
( “<spaces>name” -- xt ) 
Skip leading space delimiters. Parse name delimited by a space. Find name and return xt, the 
execution token for name. An ambiguous condition exists if name is not found. 
When interpreting, ' xyz EXECUTE is equivalent to xyz. 
See: 3.4 The Forth text interpreter, 3.4.1 Parsing, A.6.1.2033 POSTPONE, A.6.1.2510 ['], 
D.6.7 Immediacy.
ANSI X3.215-1994 
26 Collating Sequence: 
6.1.0080 ( “paren” CORE 
 Compilation: Perform the execution semantics given below. 
 Execution: ( “ccc<paren>” -- ) 
Parse ccc delimited by ) (right parenthesis). ( is an immediate word. 
The number of characters in ccc may be zero to the number of characters in the parse area. 
 See: 3.4.1 Parsing, 11.6.1.0080 (.
6.1.0090 * “star” CORE 
( n1|u1 n2|u2 -- n3|u3 ) 
Multiply n1|u1 by n2|u2 giving the product n3|u3. 
6.1.0100 */ “star-slash” CORE 
( n1 n2 n3 -- n4 ) 
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 giving the 
single-cell quotient n4. An ambiguous condition exists if n3 is zero or if the quotient n4 lies 
outside the range of a signed number. If d and n3 differ in sign, the implementation-defined 
result returned will be the same as that returned by either the phrase >R M* R> FM/MOD 
SWAP DROP or the phrase >R M* R> SM/REM SWAP DROP. 
 See: 3.2.2.1 Integer division. 
6.1.0110 */MOD “star-slash-mod” CORE 
( n1 n2 n3 -- n4 n5 ) 
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 producing the 
single-cell remainder n4 and the single-cell quotient n5. An ambiguous condition exists if n3 is 
zero, or if the quotient n5 lies outside the range of a single-cell signed integer. If d and n3 differ 
in sign, the implementation-defined result returned will be the same as that returned by either 
the phrase >R M* R> FM/MOD or the phrase >R M* R> SM/REM. 
 See: 3.2.2.1 Integer division. 
6.1.0120 + “plus” CORE 
 ( n1|u1 n2|u2 -- n3|u3 ) 
Add n2|u2 to n1|u1, giving the sum n3|u3. 
 See: 3.3.3.1 Address alignment. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 27 
6.1.0130 +! “plus-store” CORE 
( n|u a-addr -- ) 
Add n|u to the single-cell number at a-addr. 
 See: 3.3.3.1 Address alignment. 
6.1.0140 +LOOP “plus-loop” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: do-sys -- ) 
Append the run-time semantics given below to the current definition. Resolve the destination of 
all unresolved occurrences of LEAVE between the location given by do-sys and the next 
location for a transfer of control, to execute the words following +LOOP. 
 Run-time: ( n -- ) ( R: loop-sys1 -- | loop-sys2 ) 
An ambiguous condition exists if the loop control parameters are unavailable. Add n to the loop 
index. If the loop index did not cross the boundary between the loop limit minus one and the 
loop limit, continue execution at the beginning of the loop. Otherwise, discard the current loop 
control parameters and continue execution immediately following the loop. 
 See: 6.1.1240 DO, 6.1.1680 I, 6.1.1760 LEAVE. 
6.1.0150 , “comma” CORE 
( x -- ) 
Reserve one cell of data space and store x in the cell. If the data-space pointer is aligned when 
, begins execution, it will remain aligned when , finishes execution. An ambiguous condition 
exists if the data-space pointer is not aligned prior to execution of ,. 
 See: 3.3.3 Data space, 3.3.3.1 Address alignment. 
6.1.0160 - “minus” CORE 
 ( n1|u1 n2|u2 -- n3|u3 ) 
Subtract n2|u2 from n1|u1, giving the difference n3|u3. 
 See: 3.3.3.1 Address alignment. 
6.1.0180 . “dot” CORE 
( n -- ) 
Display n in free field format. 
 See: 3.2.1.2 Digit conversion, 3.2.1.3 Free-field number display. 
ANSI X3.215-1994 
28 Collating Sequence: 
6.1.0190 ." “dot-quote” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by " (double-quote). Append the run-time semantics given below to the 
current definition. 
 Run-time: ( -- ) 
Display ccc. 
 See: 3.4.1 Parsing, 6.2.0200 .(. 
6.1.0230 / “slash” CORE 
( n1 n2 -- n3 ) 
Divide n1 by n2, giving the single-cell quotient n3. An ambiguous condition exists if n2 is zero. 
If n1 and n2 differ in sign, the implementation-defined result returned will be the same as that 
returned by either the phrase >R S>D R> FM/MOD SWAP DROP or the phrase >R S>D R> 
SM/REM SWAP DROP. 
 See: 3.2.2.1 Integer division. 
6.1.0240 /MOD “slash-mod” CORE 
( n1 n2 -- n3 n4 ) 
Divide n1 by n2, giving the single-cell remainder n3 and the single-cell quotient n4. An 
ambiguous condition exists if n2 is zero. If n1 and n2 differ in sign, the implementation-defined 
result returned will be the same as that returned by either the phrase >R S>D R> FM/MOD or 
the phrase >R S>D R> SM/REM. 
 See: 3.2.2.1 Integer division. 
6.1.0250 0< “zero-less” CORE 
( n -- flag ) 
flag is true if and only if n is less than zero. 
6.1.0270 0= “zero-equals” CORE 
( x -- flag ) 
flag is true if and only if x is equal to zero. 
6.1.0290 1+ “one-plus” CORE 
 ( n1|u1 -- n2|u2 ) 
Add one (1) to n1|u1 giving the sum n2|u2. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 29 
6.1.0300 1- “one-minus” CORE 
 ( n1|u1 -- n2|u2 ) 
Subtract one (1) from n1|u1 giving the difference n2|u2. 
6.1.0310 2! “two-store” CORE 
( x1 x2 a-addr -- ) 
Store the cell pair x1 x2 at a-addr, with x2 at a-addr and x1 at the next consecutive cell. It is 
equivalent to the sequence SWAP OVER ! CELL+ !. 
 See: 3.3.3.1 Address alignment. 
6.1.0320 2* “two-star” CORE 
( x1 -- x2 ) 
x2 is the result of shifting x1 one bit toward the most-significant bit, filling the vacated leastsignificant bit with zero. 
6.1.0330 2/ “two-slash” CORE 
( x1 -- x2 ) 
x2 is the result of shifting x1 one bit toward the least-significant bit, leaving the most-significant 
bit unchanged. 
6.1.0350 2@ “two-fetch” CORE 
( a-addr -- x1 x2 ) 
Fetch the cell pair x1 x2 stored at a-addr. x2 is stored at a-addr and x1 at the next consecutive 
cell. It is equivalent to the sequence DUP CELL+ @ SWAP @. 
 See: 3.3.3.1 Address alignment, 6.1.0310 2!. 
6.1.0370 2DROP “two-drop” CORE 
( x1 x2 -- ) 
Drop cell pair x1 x2 from the stack. 
6.1.0380 2DUP “two-dupe” CORE 
( x1 x2 -- x1 x2 x1 x2 ) 
Duplicate cell pair x1 x2. 
6.1.0400 2OVER “two-over” CORE 
( x1 x2 x3 x4 -- x1 x2 x3 x4 x1 x2 ) 
Copy cell pair x1 x2 to the top of the stack. 
ANSI X3.215-1994 
30 Collating Sequence: 
6.1.0430 2SWAP “two-swap” CORE 
( x1 x2 x3 x4 -- x3 x4 x1 x2 ) 
Exchange the top two cell pairs. 
6.1.0450 : “colon” CORE 
( C: “<spaces>name” -- colon-sys ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name, 
called a “colon definition”. Enter compilation state and start the current definition, producing 
colon-sys. Append the initiation semantics given below to the current definition. 
The execution semantics of name will be determined by the words compiled into the body of the 
definition. The current definition shall not be findable in the dictionary until it is ended (or until 
the execution of DOES> in some systems). 
Initiation: ( i*x -- i*x ) ( R: -- nest-sys ) 
Save implementation-dependent information nest-sys about the calling definition. The stack 
effects i*x represent arguments to name. 
name Execution: ( i*x -- j*x ) 
Execute the definition name. The stack effects i*x and j*x represent arguments to and results 
from name, respectively. 
 See: 3.4 The Forth text interpreter, 3.4.1 Parsing, 3.4.5 Compilation, 6.1.1250 DOES>, 6.1.2500 
[, 6.1.2540 ], 15.6.2.0470 ;CODE. 
6.1.0460 ; “semicolon” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: colon-sys -- ) 
Append the run-time semantics below to the current definition. End the current definition, 
allow it to be found in the dictionary and enter interpretation state, consuming colon-sys. If the 
data-space pointer is not aligned, reserve enough data space to align it. 
 Run-time: ( -- ) ( R: nest-sys -- ) 
Return to the calling definition specified by nest-sys. 
 See: 3.4 The Forth text interpreter, 3.4.5 Compilation. 
6.1.0480 < “less-than” CORE 
( n1 n2 -- flag ) 
flag is true if and only if n1 is less than n2. 
 See: 6.1.2340 U<. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 31 
6.1.0490 <# “less-number-sign” CORE 
( -- ) 
Initialize the pictured numeric output conversion process. 
 See: 6.1.0030 #, 6.1.0040 #>, 6.1.0050 #S. 
6.1.0530 = “equals” CORE 
( x1 x2 -- flag ) 
flag is true if and only if x1 is bit-for-bit the same as x2. 
6.1.0540 > “greater-than” CORE 
( n1 n2 -- flag ) 
flag is true if and only if n1 is greater than n2. 
 See: 6.2.2350 U>. 
6.1.0550 >BODY “to-body” CORE 
( xt -- a-addr ) 
a-addr is the data-field address corresponding to xt. An ambiguous condition exists if xt is not 
for a word defined via CREATE. 
 See: 3.3.3 Data space. 
6.1.0560 >IN “to-in” CORE 
( -- a-addr ) 
a-addr is the address of a cell containing the offset in characters from the start of the input 
buffer to the start of the parse area. 
6.1.0570 >NUMBER “to-number” CORE 
( ud1 c-addr1 u1 -- ud2 c-addr2 u2 ) 
ud2 is the unsigned result of converting the characters within the string specified by c-addr1 u1
into digits, using the number in BASE, and adding each into ud1 after multiplying ud1 by the 
number in BASE. Conversion continues left-to-right until a character that is not convertible, 
including any “+” or “-”, is encountered or the string is entirely converted. c-addr2 is the 
location of the first unconverted character or the first character past the end of the string if the 
string was entirely converted. u2 is the number of unconverted characters in the string. An 
ambiguous condition exists if ud2 overflows during the conversion. 
 See: 3.2.1.2 Digit conversion. 
ANSI X3.215-1994 
32 Collating Sequence: 
6.1.0580 >R “to-r” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( x -- ) ( R: -- x ) 
Move x to the return stack. 
 See: 3.2.3.3 Return stack, 6.1.2060 R>, 6.1.2070 R@, 6.2.0340 2>R, 6.2.0410 2R>, 6.2.0415 2R@. 
6.1.0630 ?DUP “question-dupe” CORE 
( x -- 0 | x x ) 
Duplicate x if it is non-zero. 
6.1.0650 @ “fetch” CORE 
( a-addr -- x ) 
x is the value stored at a-addr. 
 See: 3.3.3.1 Address alignment. 
6.1.0670 ABORT CORE 
( i*x -- ) ( R: j*x -- ) 
Empty the data stack and perform the function of QUIT, which includes emptying the return 
stack, without displaying a message. 
See: 9.6.2.0670 ABORT. 
6.1.0680 ABORT" “abort-quote” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by a " (double-quote). Append the run-time semantics given below to the 
current definition. 
 Run-time: ( i*x x1 -- | i*x ) ( R: j*x -- | j*x ) 
Remove x1 from the stack. If any bit of x1 is not zero, display ccc and perform an 
implementation-defined abort sequence that includes the function of ABORT. 
See: 3.4.1 Parsing, 9.6.2.0680 ABORT". 
6.1.0690 ABS “abs” CORE 
( n -- u ) 
u is the absolute value of n. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 33 
6.1.0695 ACCEPT CORE 
( c-addr +n1 -- +n2 ) 
Receive a string of at most +n1 characters. An ambiguous condition exists if +n1 is zero or 
greater than 32,767. Display graphic characters as they are received. A program that depends 
on the presence or absence of non-graphic characters in the string has an environmental 
dependency. The editing functions, if any, that the system performs in order to construct the 
string are implementation-defined. 
Input terminates when an implementation-defined line terminator is received. When input 
terminates, nothing is appended to the string, and the display is maintained in an 
implementation-defined way. 
+n2 is the length of the string stored at c-addr. 
6.1.0705 ALIGN CORE 
( -- ) 
If the data-space pointer is not aligned, reserve enough space to align it. 
 See: 3.3.3 Data space, 3.3.3.1 Address alignment. 
6.1.0706 ALIGNED CORE 
( addr -- a-addr ) 
a-addr is the first aligned address greater than or equal to addr. 
 See: 3.3.3.1 Address alignment. 
6.1.0710 ALLOT CORE 
( n -- ) 
If n is greater than zero, reserve n address units of data space. If n is less than zero, release |n| 
address units of data space. If n is zero, leave the data-space pointer unchanged. 
If the data-space pointer is aligned and n is a multiple of the size of a cell when ALLOT begins 
execution, it will remain aligned when ALLOT finishes execution. 
If the data-space pointer is character aligned and n is a multiple of the size of a character when 
ALLOT begins execution, it will remain character aligned when ALLOT finishes execution. 
 See: 3.3.3 Data space. 
6.1.0720 AND CORE 
( x1 x2 -- x3 ) 
x3 is the bit-by-bit logical “and” of x1 with x2. 
ANSI X3.215-1994 
34 Collating Sequence: 
6.1.0750 BASE CORE 
( -- a-addr ) 
a-addr is the address of a cell containing the current number-conversion radix {{2...36}}. 
6.1.0760 BEGIN CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- dest ) 
Put the next location for a transfer of control, dest, onto the control flow stack. Append the runtime semantics given below to the current definition. 
 Run-time: ( -- ) 
Continue execution. 
 See: 3.2.3.2 Control-flow stack, 6.1.2140 REPEAT, 6.1.2390 UNTIL, 6.1.2430 WHILE. 
6.1.0770 BL “b-l” CORE 
( -- char ) 
char is the character value for a space. 
6.1.0850 C! “c-store” CORE 
( char c-addr -- ) 
Store char at c-addr. When character size is smaller than cell size, only the number of loworder bits corresponding to character size are transferred. 
 See: 3.3.3.1 Address alignment
6.1.0860 C, “c-comma” CORE 
( char -- ) 
Reserve space for one character in the data space and store char in the space. If the data-space 
pointer is character aligned when C, begins execution, it will remain character aligned when C,
finishes execution. An ambiguous condition exists if the data-space pointer is not characteraligned prior to execution of C,. 
 See: 3.3.3 Data space, 3.3.3.1 Address alignment. 
6.1.0870 C@ “c-fetch” CORE 
( c-addr -- char ) 
Fetch the character stored at c-addr. When the cell size is greater than character size, the 
unused high-order bits are all zeroes. 
 See: 3.3.3.1 Address alignment. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 35 
6.1.0880 CELL+ “cell-plus” CORE 
( a-addr1 -- a-addr2 ) 
Add the size in address units of a cell to a-addr1, giving a-addr2. 
 See: 3.3.3.1 Address alignment. 
6.1.0890 CELLS CORE 
( n1 -- n2 ) 
n2 is the size in address units of n1 cells. 
6.1.0895 CHAR “char” CORE 
( “<spaces>name” -- char ) 
Skip leading space delimiters. Parse name delimited by a space. Put the value of its first 
character onto the stack. 
See: 3.4.1 Parsing, 6.1.2520 [CHAR].
6.1.0897 CHAR+ “char-plus” CORE 
( c-addr1 -- c-addr2 ) 
Add the size in address units of a character to c-addr1, giving c-addr2. 
 See: 3.3.3.1 Address alignment. 
6.1.0898 CHARS “chars” CORE 
( n1 -- n2 ) 
n2 is the size in address units of n1 characters. 
6.1.0950 CONSTANT CORE 
( x “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. 
name is referred to as a “constant”. 
name Execution: ( -- x ) 
Place x on the stack. 
See: 3.4.1 Parsing. 
ANSI X3.215-1994 
36 Collating Sequence: 
6.1.0980 COUNT CORE 
( c-addr1 -- c-addr2 u ) 
Return the character string specification for the counted string stored at c-addr1. c-addr2 is the 
address of the first character after c-addr1. u is the contents of the character at c-addr1, which 
is the length in characters of the string at c-addr2. 
6.1.0990 CR “c-r” CORE 
( -- ) 
Cause subsequent output to appear at the beginning of the next line. 
6.1.1000 CREATE CORE 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. If the data-space pointer is not aligned, reserve 
enough data space to align it. The new data-space pointer defines name’s data field. CREATE
does not allocate data space in name’s data field. 
name Execution: ( -- a-addr ) 
a-addr is the address of name’s data field. The execution semantics of name may be extended 
by using DOES>. 
 See: 3.3.3 Data space, 6.1.1250 DOES>. 
6.1.1170 DECIMAL CORE 
( -- ) 
Set the numeric conversion radix to ten (decimal). 
6.1.1200 DEPTH CORE 
( -- +n ) 
+n is the number of single-cell values contained in the data stack before +n was placed on the 
stack. 
6.1.1240 DO CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- do-sys ) 
Place do-sys onto the control-flow stack. Append the run-time semantics given below to the 
current definition. The semantics are incomplete until resolved by a consumer of do-sys such as 
LOOP. 
 Run-time: ( n1|u1 n2|u2 -- ) ( R: -- loop-sys ) 
Set up loop control parameters with index n2|u2 and limit n1|u1. An ambiguous condition exists 
if n1|u1 and n2|u2 are not both the same type. Anything already on the return stack becomes 
unavailable until the loop-control parameters are discarded. 
 See: 3.2.3.2 Control-flow stack, 6.1.0140 +LOOP, 6.1.1800 LOOP. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 37 
6.1.1250 DOES> “does” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
Compilation: ( C: colon-sys1 -- colon-sys2 ) 
Append the run-time semantics below to the current definition. Whether or not the current 
definition is rendered findable in the dictionary by the compilation of DOES> is implementation 
defined. Consume colon-sys1 and produce colon-sys2. Append the initiation semantics given 
below to the current definition. 
 Run-time: ( -- ) ( R: nest-sys1 -- ) 
Replace the execution semantics of the most recent definition, referred to as name, with the 
name execution semantics given below. Return control to the calling definition specified by 
nest-sys1. An ambiguous condition exists if name was not defined with CREATE or a userdefined word that calls CREATE. 
Initiation: ( i*x -- i*x a-addr ) ( R: -- nest-sys2 ) 
Save implementation-dependent information nest-sys2 about the calling definition. Place 
name’s data field address on the stack. The stack effects i*x represent arguments to name. 
name Execution: ( i*x -- j*x ) 
Execute the portion of the definition that begins with the initiation semantics appended by the 
DOES> which modified name. The stack effects i*x and j*x represent arguments to and results 
from name, respectively. 
 See: 6.1.1000 CREATE. 
6.1.1260 DROP CORE 
( x -- ) 
Remove x from the stack. 
6.1.1290 DUP “dupe” CORE 
( x -- x x ) 
Duplicate x. 
6.1.1310 ELSE CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: orig1 -- orig2 ) 
Put the location of a new unresolved forward reference orig2 onto the control flow stack. 
Append the run-time semantics given below to the current definition. The semantics will be 
incomplete until orig2 is resolved (e.g., by THEN). Resolve the forward reference orig1 using 
the location following the appended run-time semantics. 
 Run-time: ( -- ) 
Continue execution at the location given by the resolution of orig2. 
 See: 6.1.1700 IF, 6.1.2270 THEN. 
ANSI X3.215-1994 
38 Collating Sequence: 
6.1.1320 EMIT CORE 
( x -- ) 
If x is a graphic character in the implementation-defined character set, display x. The effect of 
EMIT for all other values of x is implementation-defined. 
When passed a character whose character-defining bits have a value between hex 20 and 7E 
inclusive, the corresponding standard character, specified by 3.1.2.1 Graphic characters, is 
displayed. Because different output devices can respond differently to control characters, 
programs that use control characters to perform specific functions have an environmental 
dependency. Each EMIT deals with only one character. 
 See: 6.1.2310 TYPE. 
6.1.1345 ENVIRONMENT? “environment-query” CORE 
( c-addr u -- false | i*x true ) 
c-addr is the address of a character string and u is the string’s character count. u may have a 
value in the range from zero to an implementation-defined maximum which shall not be less 
than 31. The character string should contain a keyword from 3.2.6 Environmental queries or 
the optional word sets to be checked for correspondence with an attribute of the present 
environment. If the system treats the attribute as unknown, the returned flag is false; otherwise, 
the flag is true and the i*x returned is of the type specified in the table for the attribute queried. 
6.1.1360 EVALUATE CORE 
( i*x c-addr u -- j*x ) 
Save the current input source specification. Store minus-one (-1) in SOURCE-ID if it is 
present. Make the string described by c-addr and u both the input source and input buffer, set 
>IN to zero, and interpret. When the parse area is empty, restore the prior input source 
specification. Other stack effects are due to the words EVALUATEd. 
6.1.1370 EXECUTE CORE 
( i*x xt -- j*x ) 
Remove xt from the stack and perform the semantics identified by it. Other stack effects are due 
to the word EXECUTEd. 
 See: 6.1.0070 ', 6.1.2510 [']. 
6.1.1380 EXIT CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- ) ( R: nest-sys -- ) 
Return control to the calling definition specified by nest-sys. Before executing EXIT within a 
do-loop, a program shall discard the loop-control parameters by executing UNLOOP. 
 See: 3.2.3.3 Return stack, 6.1.2380 UNLOOP. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 39 
6.1.1540 FILL CORE 
( c-addr u char -- ) 
If u is greater than zero, store char in each of u consecutive characters of memory beginning at 
c-addr. 
6.1.1550 FIND CORE 
( c-addr -- c-addr 0 | xt 1 | xt -1 ) 
Find the definition named in the counted string at c-addr. If the definition is not found, return 
c-addr and zero. If the definition is found, return its execution token xt. If the definition is 
immediate, also return one (1), otherwise also return minus-one (-1). For a given string, the 
values returned by FIND while compiling may differ from those returned while not compiling. 
 See: 3.4.2 Finding definition names, A.6.1.0070 ', A.6.1.2510 ['], A.6.1.2033 POSTPONE, 
D.6.7 Immediacy. 
6.1.1561 FM/MOD “f-m-slash-mod” CORE 
( d1 n1 -- n2 n3 ) 
Divide d1 by n1, giving the floored quotient n3 and the remainder n2. Input and output stack 
arguments are signed. An ambiguous condition exists if n1 is zero or if the quotient lies outside 
the range of a single-cell signed integer. 
See: 3.2.2.1 Integer division, 6.1.2214 SM/REM, 6.1.2370 UM/MOD. 
6.1.1650 HERE CORE 
( -- addr ) 
addr is the data-space pointer. 
See: 3.3.3.2 Contiguous regions. 
6.1.1670 HOLD CORE 
( char -- ) 
Add char to the beginning of the pictured numeric output string. An ambiguous condition exists 
if HOLD executes outside of a <# #> delimited number conversion. 
6.1.1680 I CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- n|u ) ( R: loop-sys -- loop-sys ) 
n|u is a copy of the current (innermost) loop index. An ambiguous condition exists if the loop 
control parameters are unavailable. 
ANSI X3.215-1994 
40 Collating Sequence: 
6.1.1700 IF CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- orig ) 
Put the location of a new unresolved forward reference orig onto the control flow stack. Append 
the run-time semantics given below to the current definition. The semantics are incomplete 
until orig is resolved, e.g., by THEN or ELSE. 
 Run-time: ( x -- ) 
If all bits of x are zero, continue execution at the location specified by the resolution of orig. 
 See: 3.2.3.2 Control flow stack, 6.1.1310 ELSE, 6.1.2270 THEN. 
6.1.1710 IMMEDIATE CORE 
( -- ) 
Make the most recent definition an immediate word. An ambiguous condition exists if the most 
recent definition does not have a name. 
 See: D.6.7 Immediacy. 
6.1.1720 INVERT CORE 
( x1 -- x2 ) 
Invert all bits of x1, giving its logical inverse x2. 
 See: 6.1.1910 NEGATE, 6.1.0270 0=. 
6.1.1730 J CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- n|u ) ( R: loop-sys1 loop-sys2 -- loop-sys1 loop-sys2 ) 
n|u is a copy of the next-outer loop index. An ambiguous condition exists if the loop control 
parameters of the next-outer loop, loop-sys1, are unavailable. 
6.1.1750 KEY CORE 
( -- char ) 
Receive one character char, a member of the implementation-defined character set. Keyboard 
events that do not correspond to such characters are discarded until a valid character is received, 
and those events are subsequently unavailable. 
All standard characters can be received. Characters received by KEY are not displayed. 
Any standard character returned by KEY has the numeric value specified in 3.1.2.1 Graphic 
characters. Programs that require the ability to receive control characters have an 
environmental dependency. 
 See: 10.6.2.1307 EKEY, 10.6.1.1755 KEY?. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 41 
6.1.1760 LEAVE CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- ) ( R: loop-sys -- ) 
Discard the current loop control parameters. An ambiguous condition exists if they are 
unavailable. Continue execution immediately following the innermost syntactically enclosing 
DO ... LOOP or DO ... +LOOP. 
 See: 3.2.3.3 Return stack, 6.1.0140 +LOOP, 6.1.1800 LOOP. 
6.1.1780 LITERAL CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( x -- ) 
Append the run-time semantics given below to the current definition. 
 Run-time: ( -- x ) 
Place x on the stack. 
6.1.1800 LOOP CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: do-sys -- ) 
Append the run-time semantics given below to the current definition. Resolve the destination of 
all unresolved occurrences of LEAVE between the location given by do-sys and the next 
location for a transfer of control, to execute the words following the LOOP. 
 Run-time: ( -- ) ( R: loop-sys1 -- | loop-sys2 ) 
An ambiguous condition exists if the loop control parameters are unavailable. Add one to the 
loop index. If the loop index is then equal to the loop limit, discard the loop parameters and 
continue execution immediately following the loop. Otherwise continue execution at the 
beginning of the loop. 
 See: 6.1.1240 DO, 6.1.1680 I, 6.1.1760 LEAVE. 
6.1.1805 LSHIFT “l-shift” CORE 
( x1 u -- x2 ) 
Perform a logical left shift of u bit-places on x1, giving x2. Put zeroes into the least significant 
bits vacated by the shift. An ambiguous condition exists if u is greater than or equal to the 
number of bits in a cell. 
6.1.1810 M* “m-star” CORE 
( n1 n2 -- d ) 
d is the signed product of n1 times n2. 
ANSI X3.215-1994 
42 Collating Sequence: 
6.1.1870 MAX CORE 
( n1 n2 -- n3 ) 
n3 is the greater of n1 and n2. 
6.1.1880 MIN CORE 
( n1 n2 -- n3 ) 
n3 is the lesser of n1 and n2. 
6.1.1890 MOD CORE 
( n1 n2 -- n3 ) 
Divide n1 by n2, giving the single-cell remainder n3. An ambiguous condition exists if n2 is 
zero. If n1 and n2 differ in sign, the implementation-defined result returned will be the same as 
that returned by either the phrase >R S>D R> FM/MOD DROP or the phrase >R S>D R> 
SM/REM DROP. 
 See: 3.2.2.1 Integer division. 
6.1.1900 MOVE CORE 
( addr1 addr2 u -- ) 
If u is greater than zero, copy the contents of u consecutive address units at addr1 to the u
consecutive address units at addr2. After MOVE completes, the u consecutive address units at 
addr2 contain exactly what the u consecutive address units at addr1 contained before the move. 
 See: 17.6.1.0910 CMOVE, 17.6.1.0920 CMOVE>. 
6.1.1910 NEGATE CORE 
( n1 -- n2 ) 
Negate n1, giving its arithmetic inverse n2. 
 See: 6.1.1720 INVERT, 6.1.0270 0=. 
6.1.1980 OR CORE 
( x1 x2 -- x3 ) 
x3 is the bit-by-bit inclusive-or of x1 with x2. 
6.1.1990 OVER CORE 
( x1 x2 -- x1 x2 x1 ) 
Place a copy of x1 on top of the stack. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 43 
6.1.2033 POSTPONE CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Find name. Append the 
compilation semantics of name to the current definition. An ambiguous condition exists if name
is not found. 
See: 3.4.1 Parsing.
6.1.2050 QUIT CORE 
( -- ) ( R: i*x -- ) 
Empty the return stack, store zero in SOURCE-ID if it is present, make the user input device the 
input source, and enter interpretation state. Do not display a message. Repeat the following: 
– Accept a line from the input source into the input buffer, set >IN to zero, and interpret. 
– Display the implementation-defined system prompt if in interpretation state, all 
processing has been completed, and no ambiguous condition exists. 
See: 3.4 The Forth text interpreter. 
6.1.2060 R> “r-from” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- x ) ( R: x -- ) 
Move x from the return stack to the data stack. 
 See: 3.2.3.3 Return stack, 6.1.0580 >R, 6.1.2070 R@, 6.2.0340 2>R, 6.2.0410 2R>, 6.2.0415 2R@. 
6.1.2070 R@ “r-fetch” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- x ) ( R: x -- x ) 
Copy x from the return stack to the data stack. 
 See: 3.2.3.3 Return stack, 6.1.0580 >R, 6.1.2060 R>, 6.2.0340 2>R, 6.2.0410 2R>, 6.2.0415 2R@. 
6.1.2120 RECURSE CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
Compilation: ( -- ) 
Append the execution semantics of the current definition to the current definition. An 
ambiguous condition exists if RECURSE appears in a definition after DOES>. 
 See: 6.1.1250 DOES>, 6.1.2120 RECURSE.
ANSI X3.215-1994 
44 Collating Sequence: 
6.1.2140 REPEAT CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: orig dest -- ) 
Append the run-time semantics given below to the current definition, resolving the backward 
reference dest. Resolve the forward reference orig using the location following the appended 
run-time semantics. 
 Run-time: ( -- ) 
Continue execution at the location given by dest. 
 See: 6.1.0760 BEGIN, 6.1.2430 WHILE. 
6.1.2160 ROT “rote” CORE 
( x1 x2 x3 -- x2 x3 x1 ) 
Rotate the top three stack entries. 
6.1.2162 RSHIFT “r-shift” CORE 
( x1 u -- x2 ) 
Perform a logical right shift of u bit-places on x1, giving x2. Put zeroes into the most significant 
bits vacated by the shift. An ambiguous condition exists if u is greater than or equal to the 
number of bits in a cell. 
6.1.2165 S" “s-quote” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by " (double-quote). Append the run-time semantics given below to the 
current definition. 
 Run-time: ( -- c-addr u ) 
Return c-addr and u describing a string consisting of the characters ccc. A program shall not 
alter the returned string. 
See: 3.4.1 Parsing, 6.2.0855 C", 11.6.1.2165 S".
6.1.2170 S>D “s-to-d” CORE 
( n -- d ) 
Convert the number n to the double-cell number d with the same numerical value. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 45 
6.1.2210 SIGN CORE 
( n -- ) 
If n is negative, add a minus sign to the beginning of the pictured numeric output string. An 
ambiguous condition exists if SIGN executes outside of a <# #> delimited number conversion. 
6.1.2214 SM/REM “s-m-slash-rem” CORE 
( d1 n1 -- n2 n3 ) 
Divide d1 by n1, giving the symmetric quotient n3 and the remainder n2. Input and output stack 
arguments are signed. An ambiguous condition exists if n1 is zero or if the quotient lies outside 
the range of a single-cell signed integer. 
See: 3.2.2.1 Integer division, 6.1.1561 FM/MOD, 6.1.2370 UM/MOD. 
6.1.2216 SOURCE CORE 
( -- c-addr u ) 
c-addr is the address of, and u is the number of characters in, the input buffer. 
6.1.2220 SPACE CORE 
( -- ) 
Display one space. 
6.1.2230 SPACES CORE 
( n -- ) 
If n is greater than zero, display n spaces. 
6.1.2250 STATE CORE 
( -- a-addr ) 
a-addr is the address of a cell containing the compilation-state flag. STATE is true when in 
compilation state, false otherwise. The true value in STATE is non-zero, but is otherwise 
implementation-defined. Only the following standard words alter the value in STATE: :
(colon), ; (semicolon), ABORT, QUIT, :NONAME, [ (left-bracket), and ] (right-bracket). 
Note: A program shall not directly alter the contents of STATE. 
 See: 3.4 The Forth text interpreter, 6.1.0450 :, 6.1.0460 ;, 6.1.0670 ABORT, 6.1.2050 QUIT, 
6.1.2500 [, 6.1.2540 ], 6.2.0455 :NONAME, 15.6.2.2250 STATE. 
6.1.2260 SWAP CORE 
( x1 x2 -- x2 x1 ) 
Exchange the top two stack items. 
ANSI X3.215-1994 
46 Collating Sequence: 
6.1.2270 THEN CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: orig -- ) 
Append the run-time semantics given below to the current definition. Resolve the forward 
reference orig using the location of the appended run-time semantics. 
 Run-time: ( -- ) 
Continue execution. 
 See: 6.1.1310 ELSE, 6.1.1700 IF. 
6.1.2310 TYPE CORE 
( c-addr u -- ) 
If u is greater than zero, display the character string specified by c-addr and u. 
When passed a character in a character string whose character-defining bits have a value 
between hex 20 and 7E inclusive, the corresponding standard character, specified by 3.1.2.1 
graphic characters, is displayed. Because different output devices can respond differently to 
control characters, programs that use control characters to perform specific functions have an 
environmental dependency. 
 See: 6.1.1320 EMIT. 
6.1.2320 U. “u-dot” CORE 
( u -- ) 
Display u in free field format. 
6.1.2340 U< “u-less-than” CORE 
( u1 u2 -- flag ) 
flag is true if and only if u1 is less than u2. 
 See: 6.1.0480 <. 
6.1.2360 UM* “u-m-star” CORE 
( u1 u2 -- ud ) 
Multiply u1 by u2, giving the unsigned double-cell product ud. All values and arithmetic are 
unsigned. 
6.1.2370 UM/MOD “u-m-slash-mod” CORE 
( ud u1 -- u2 u3 ) 
Divide ud by u1, giving the quotient u3 and the remainder u2. All values and arithmetic are 
unsigned. An ambiguous condition exists if u1 is zero or if the quotient lies outside the range of 
a single-cell unsigned integer. 
See: 3.2.2.1 Integer division, 6.1.1561 FM/MOD, 6.1.2214 SM/REM. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 47 
6.1.2380 UNLOOP CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- ) ( R: loop-sys -- ) 
Discard the loop-control parameters for the current nesting level. An UNLOOP is required for 
each nesting level before the definition may be EXITed. An ambiguous condition exists if the 
loop-control parameters are unavailable. 
 See: 3.2.3.3 Return stack. 
6.1.2390 UNTIL CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: dest -- ) 
Append the run-time semantics given below to the current definition, resolving the backward 
reference dest. 
 Run-time: ( x -- ) 
If all bits of x are zero, continue execution at the location specified by dest. 
 See: 6.1.0760 BEGIN. 
6.1.2410 VARIABLE CORE 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. Reserve one cell of data space at an aligned 
address. 
name is referred to as a “variable”. 
name Execution: ( -- a-addr ) 
a-addr is the address of the reserved cell. A program is responsible for initializing the contents 
of the reserved cell. 
See: 3.4.1 Parsing. 
6.1.2430 WHILE CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: dest -- orig dest ) 
Put the location of a new unresolved forward reference orig onto the control flow stack, under 
the existing dest. Append the run-time semantics given below to the current definition. The 
semantics are incomplete until orig and dest are resolved (e.g., by REPEAT). 
 Run-time: ( x -- ) 
If all bits of x are zero, continue execution at the location specified by the resolution of orig. 
ANSI X3.215-1994 
48 Collating Sequence: 
6.1.2450 WORD CORE 
( char “<chars>ccc<char>” -- c-addr ) 
Skip leading delimiters. Parse characters ccc delimited by char. An ambiguous condition exists 
if the length of the parsed string is greater than the implementation-defined length of a counted 
string. 
c-addr is the address of a transient region containing the parsed word as a counted string. If the 
parse area was empty or contained no characters other than the delimiter, the resulting string has 
a zero length. A space, not included in the length, follows the string. A program may replace 
characters within the string. 
Note: The requirement to follow the string with a space is obsolescent and is included as a concession 
to existing programs that use CONVERT. A program shall not depend on the existence of the 
space. 
 See: 3.3.3.6 Other transient regions, 3.4.1 Parsing. 
6.1.2490 XOR “x-or” CORE 
( x1 x2 -- x3 ) 
x3 is the bit-by-bit exclusive-or of x1 with x2. 
6.1.2500 [ “left-bracket” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: Perform the execution semantics given below. 
 Execution: ( -- ) 
Enter interpretation state. [ is an immediate word. 
 See: 3.4 The Forth text interpreter, 3.4.5 Compilation, 6.1.2540 ]. 
6.1.2510 ['] “bracket-tick” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Find name. Append the runtime semantics given below to the current definition. 
An ambiguous condition exists if name is not found. 
 Run-time: ( -- xt ) 
Place name’s execution token xt on the stack. The execution token returned by the compiled 
phrase “['] X ” is the same value returned by “' X ” outside of compilation state. 
 See: 3.4.1 Parsing, A.6.1.0070 ', A.6.1.2033 POSTPONE, D.6.7 Immediacy. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 49 
6.1.2520 [CHAR] “bracket-char” CORE 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Append the run-time 
semantics given below to the current definition. 
 Run-time: ( -- char ) 
Place char, the value of the first character of name, on the stack. 
See: 3.4.1 Parsing, 6.1.0895 CHAR.
6.1.2540 ] “right-bracket” CORE 
( -- ) 
Enter compilation state. 
 See: 3.4 The Forth text interpreter, 3.4.5 Compilation, 6.1.2500 [. 
6.2 Core extension words 
6.2.0060 #TIB “number-t-i-b” CORE EXT 
( -- a-addr ) 
a-addr is the address of a cell containing the number of characters in the terminal input buffer. 
 Note: This word is obsolescent and is included as a concession to existing implementations.
6.2.0200 .( “dot-paren” CORE EXT 
 Compilation: Perform the execution semantics given below. 
 Execution: ( “ccc<paren>” -- ) 
Parse and display ccc delimited by ) (right parenthesis). .( is an immediate word. 
See: 3.4.1 Parsing, 6.1.0190 .".
6.2.0210 .R “dot-r” CORE EXT 
( n1 n2 -- ) 
Display n1 right aligned in a field n2 characters wide. If the number of characters required to 
display n1 is greater than n2, all digits are displayed with no leading spaces in a field as wide as 
necessary. 
6.2.0260 0<> “zero-not-equals” CORE EXT 
( x -- flag ) 
flag is true if and only if x is not equal to zero. 
ANSI X3.215-1994 
50 Collating Sequence: 
6.2.0280 0> “zero-greater” CORE EXT 
( n -- flag ) 
flag is true if and only if n is greater than zero. 
6.2.0340 2>R “two-to-r” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( x1 x2 -- ) ( R: -- x1 x2 ) 
Transfer cell pair x1 x2 to the return stack. Semantically equivalent to SWAP >R >R. 
 See: 3.2.3.3 Return stack, 6.1.0580 >R, 6.1.2060 R>, 6.1.2070 R@, 6.2.0410 2R>, 6.2.0415 2R@. 
6.2.0410 2R> “two-r-from” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- x1 x2 ) ( R: x1 x2 -- ) 
Transfer cell pair x1 x2 from the return stack. Semantically equivalent to R> R> SWAP. 
 See: 3.2.3.3 Return stack, 6.1.0580 >R, 6.1.2060 R>, 6.1.2070 R@, 6.2.0340 2>R, 6.2.0415 2R@. 
6.2.0415 2R@ “two-r-fetch” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( -- x1 x2 ) ( R: x1 x2 -- x1 x2 ) 
Copy cell pair x1 x2 from the return stack. Semantically equivalent to 
R> R> 2DUP >R >R SWAP. 
 See: 3.2.3.3 Return stack, 6.1.0580 >R, 6.1.2060 R>, 6.1.2070 R@, 6.2.0340 2>R, 6.2.0410 2R>. 
6.2.0455 :NONAME “colon-no-name” CORE EXT 
( C: -- colon-sys ) ( S: -- xt ) 
Create an execution token xt, enter compilation state and start the current definition, producing 
colon-sys. Append the initiation semantics given below to the current definition. 
The execution semantics of xt will be determined by the words compiled into the body of the 
definition. This definition can be executed later by using xt EXECUTE. 
If the control-flow stack is implemented using the data stack, colon-sys shall be the topmost 
item on the data stack. See 3.2.3.2 Control-flow stack. 
Initiation: ( i*x -- i*x ) ( R: -- nest-sys ) 
Save implementation-dependent information nest-sys about the calling definition. The stack 
effects i*x represent arguments to xt. 
xt Execution: ( i*x -- j*x ) 
Execute the definition specified by xt. The stack effects i*x and j*x represent arguments to and 
results from xt, respectively. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 51 
6.2.0500 <> “not-equals” CORE EXT 
( x1 x2 -- flag ) 
flag is true if and only if x1 is not bit-for-bit the same as x2. 
6.2.0620 ?DO “question-do” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- do-sys ) 
Put do-sys onto the control-flow stack. Append the run-time semantics given below to the 
current definition. The semantics are incomplete until resolved by a consumer of do-sys such as 
LOOP. 
 Run-time: ( n1|u1 n2|u2 -- ) ( R: -- | loop-sys ) 
If n1|u1 is equal to n2|u2, continue execution at the location given by the consumer of do-sys. 
Otherwise set up loop control parameters with index n2|u2 and limit n1|u1 and continue 
executing immediately following ?DO. Anything already on the return stack becomes 
unavailable until the loop control parameters are discarded. An ambiguous condition exists if 
n1|u1 and n2|u2 are not both of the same type. 
 See: 3.2.3.2 Control-flow stack, 6.1.0140 +LOOP, 6.1.1240 DO, 6.1.1680 I, 6.1.1760 LEAVE, 
6.1.1800 LOOP, 6.1.2380 UNLOOP. 
6.2.0700 AGAIN CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: dest -- ) 
Append the run-time semantics given below to the current definition, resolving the backward 
reference dest. 
 Run-time: ( -- ) 
Continue execution at the location specified by dest. If no other control flow words are used, 
any program code after AGAIN will not be executed. 
 See: 6.1.0760 BEGIN. 
ANSI X3.215-1994 
52 Collating Sequence: 
6.2.0855 C" “c-quote” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by " (double-quote) and append the run-time semantics given below to the 
current definition. 
 Run-time: ( -- c-addr ) 
Return c-addr, a counted string consisting of the characters ccc. A program shall not alter the 
returned string. 
See: 3.4.1 Parsing, 6.1.2165 S", 11.6.1.2165 S". 
6.2.0873 CASE CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- case-sys ) 
Mark the start of the CASE ... OF ... ENDOF ... ENDCASE structure. Append the 
run-time semantics given below to the current definition. 
 Run-time: ( -- ) 
Continue execution. 
 See: 6.2.1342 ENDCASE, 6.2.1343 ENDOF, 6.2.1950 OF. 
6.2.0945 COMPILE, “compile-comma” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( xt -- ) 
Append the execution semantics of the definition represented by xt to the execution semantics of 
the current definition. 
6.2.0970 CONVERT CORE EXT 
( ud1 c-addr1 -- ud2 c-addr2 ) 
ud2 is the result of converting the characters within the text beginning at the first character after 
c-addr1 into digits, using the number in BASE, and adding each digit to ud1 after multiplying 
ud1 by the number in BASE. Conversion continues until a character that is not convertible is 
encountered. c-addr2 is the location of the first unconverted character. An ambiguous 
condition exists if ud2 overflows. 
Note: This word is obsolescent and is included as a concession to existing implementations. Its 
function is superseded by 6.1.0570 >NUMBER. 
 See: 3.2.1.2 Digit conversion. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 53 
6.2.1342 ENDCASE “end-case” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: case-sys -- ) 
Mark the end of the CASE ... OF ... ENDOF ... ENDCASE structure. Use case-sys
to resolve the entire structure. Append the run-time semantics given below to the current 
definition. 
 Run-time: ( x -- ) 
Discard the case selector x and continue execution. 
 See: 6.2.0873 CASE, 6.2.1343 ENDOF, 6.2.1950 OF. 
6.2.1343 ENDOF “end-of” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: case-sys1 of-sys -- case-sys2 ) 
Mark the end of the OF ... ENDOF part of the CASE structure. The next location for a 
transfer of control resolves the reference given by of-sys. Append the run-time semantics given 
below to the current definition. Replace case-sys1 with case-sys2 on the control-flow stack, to 
be resolved by ENDCASE. 
 Run-time: ( -- ) 
Continue execution at the location specified by the consumer of case-sys2. 
 See: 6.2.0873 CASE, 6.2.1342 ENDCASE, 6.2.1950 OF. 
6.2.1350 ERASE CORE EXT 
( addr u -- ) 
If u is greater than zero, clear all bits in each of u consecutive address units of memory 
beginning at addr . 
6.2.1390 EXPECT CORE EXT 
( c-addr +n -- ) 
Receive a string of at most +n characters. Display graphic characters as they are received. A 
program that depends on the presence or absence of non-graphic characters in the string has an 
environmental dependency. The editing functions, if any, that the system performs in order to 
construct the string of characters are implementation-defined. 
Input terminates when an implementation-defined line terminator is received or when the string 
is +n characters long. When input terminates, nothing is appended to the string and the display 
is maintained in an implementation-defined way. 
Store the string at c-addr and its length in SPAN. 
 Note: This word is obsolescent and is included as a concession to existing implementations. Its 
function is superseded by 6.1.0695 ACCEPT. 
ANSI X3.215-1994 
54 Collating Sequence: 
6.2.1485 FALSE CORE EXT 
( -- false ) 
Return a false flag. 
See: 3.1.3.1 Flags
6.2.1660 HEX CORE EXT 
( -- ) 
Set contents of BASE to sixteen. 
6.2.1850 MARKER CORE EXT
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. 
name Execution: ( -- ) 
Restore all dictionary allocation and search order pointers to the state they had just prior to the 
definition of name. Remove the definition of name and all subsequent definitions. Restoration 
of any structures still existing that could refer to deleted definitions or deallocated data space is 
not necessarily provided. No other contextual information such as numeric base is affected. 
See: 3.4.1 Parsing, 15.6.2.1580 FORGET. 
6.2.1930 NIP CORE EXT 
( x1 x2 -- x2 ) 
Drop the first item below the top of stack. 
6.2.1950 OF CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: -- of-sys ) 
Put of-sys onto the control flow stack. Append the run-time semantics given below to the 
current definition. The semantics are incomplete until resolved by a consumer of of-sys such as 
ENDOF. 
 Run-time: ( x1 x2 -- | x1 ) 
If the two values on the stack are not equal, discard the top value and continue execution at the 
location specified by the consumer of of-sys, e.g., following the next ENDOF. Otherwise, 
discard both values and continue execution in line. 
 See: 6.2.0873 CASE, 6.2.1342 ENDCASE, 6.2.1343 ENDOF. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 55 
6.2.2000 PAD CORE EXT 
( -- c-addr ) 
c-addr is the address of a transient region that can be used to hold data for intermediate 
processing. 
 See: 3.3.3.6 Other transient regions. 
6.2.2008 PARSE CORE EXT 
( char “ccc<char>” -- c-addr u ) 
Parse ccc delimited by the delimiter char. 
c-addr is the address (within the input buffer) and u is the length of the parsed string. If the 
parse area was empty, the resulting string has a zero length. 
See: 3.4.1 Parsing. 
6.2.2030 PICK CORE EXT 
( xu ... x1 x0 u -- xu ... x1 x0 xu ) 
Remove u. Copy the xu to the top of the stack. An ambiguous condition exists if there are less 
than u+2 items on the stack before PICK is executed. 
6.2.2040 QUERY CORE EXT 
( -- ) 
Make the user input device the input source. Receive input into the terminal input buffer, 
replacing any previous contents. Make the result, whose address is returned by TIB, the input 
buffer. Set >IN to zero. 
 Note: This word is obsolescent and is included as a concession to existing implementations.
6.2.2125 REFILL CORE EXT 
( -- flag ) 
Attempt to fill the input buffer from the input source, returning a true flag if successful. 
When the input source is the user input device, attempt to receive input into the terminal input 
buffer. If successful, make the result the input buffer, set >IN to zero, and return true. Receipt 
of a line containing no characters is considered successful. If there is no input available from 
the current input source, return false. 
When the input source is a string from EVALUATE, return false and perform no other action. 
 See: 7.6.2.2125 REFILL, 11.6.2.2125 REFILL. 
ANSI X3.215-1994 
56 Collating Sequence: 
6.2.2148 RESTORE-INPUT CORE EXT 
( xn ... x1 n -- flag ) 
Attempt to restore the input source specification to the state described by x1 through xn. flag is 
true if the input source specification cannot be so restored. 
An ambiguous condition exists if the input source represented by the arguments is not the same 
as the current input source. 
See: A.6.2.2182 SAVE-INPUT. 
6.2.2150 ROLL CORE EXT 
( xu xu-1 ... x0 u -- xu-1 ... x0 xu ) 
Remove u. Rotate u+1 items on the top of the stack. An ambiguous condition exists if there are 
less than u+2 items on the stack before ROLL is executed. 
6.2.2182 SAVE-INPUT CORE EXT 
( -- xn ... x1 n ) 
x1 through xn describe the current state of the input source specification for later use by 
RESTORE-INPUT. 
6.2.2218 SOURCE-ID “source-i-d” CORE EXT 
( -- 0 | -1 ) 
Identifies the input source as follows: 
SOURCE-ID Input source 
 -1 String (via EVALUATE) 
 0 User input device 
 See: 11.6.1.2218 SOURCE-ID. 
6.2.2240 SPAN CORE EXT 
( -- a-addr ) 
a-addr is the address of a cell containing the count of characters stored by the last execution of 
EXPECT. 
 Note: This word is obsolescent and is included as a concession to existing implementations. 
6.2.2290 TIB “t-i-b” CORE EXT 
( -- c-addr ) 
c-addr is the address of the terminal input buffer. 
 Note: This word is obsolescent and is included as a concession to existing implementations. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 57 
6.2.2295 TO CORE EXT 
 Interpretation: ( x “<spaces>name” -- ) 
Skip leading spaces and parse name delimited by a space. Store x in name. An ambiguous 
condition exists if name was not defined by VALUE. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading spaces and parse name delimited by a space. Append the run-time semantics given 
below to the current definition. An ambiguous condition exists if name was not defined by 
VALUE. 
 Run-time: ( x -- ) 
Store x in name. 
 Note: An ambiguous condition exists if either POSTPONE or [COMPILE] is applied to TO. 
 See: 6.2.2405 VALUE, 13.6.1.2295 TO. 
6.2.2298 TRUE CORE EXT 
( -- true ) 
Return a true flag, a single-cell value with all bits set. 
See: 3.1.3.1 Flags. 
6.2.2300 TUCK CORE EXT 
( x1 x2 -- x2 x1 x2 ) 
Copy the first (top) stack item below the second stack item. 
6.2.2330 U.R “u-dot-r” CORE EXT 
( u n -- ) 
Display u right aligned in a field n characters wide. If the number of characters required to 
display u is greater than n, all digits are displayed with no leading spaces in a field as wide as 
necessary. 
6.2.2350 U> “u-greater-than” CORE EXT 
( u1 u2 -- flag ) 
flag is true if and only if u1 is greater than u2. 
 See: 6.1.0540 >. 
6.2.2395 UNUSED CORE EXT 
( -- u ) 
u is the amount of space remaining in the region addressed by HERE , in address units. 
ANSI X3.215-1994 
58 Collating Sequence: 
6.2.2405 VALUE CORE EXT 
( x “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below, with an initial value equal to x. 
name is referred to as a “value”. 
name Execution: ( -- x ) 
Place x on the stack. The value of x is that given when name was created, until the phrase x TO 
name is executed, causing a new value of x to be associated with name. 
See: 3.4.1 Parsing. 
6.2.2440 WITHIN CORE EXT 
( n1|u1 n2|u2 n3|u3 -- flag ) 
Perform a comparison of a test value n1|u1 with a lower limit n2|u2 and an upper limit n3|u3, 
returning true if either (n2|u2 < n3|u3 and (n2|u2 <= n1|u1 and n1|u1 < n3|u3)) or (n2|u2 > n3|u3
and (n2|u2 <= n1|u1 or n1|u1 < n3|u3)) is true, returning false otherwise. An ambiguous condition 
exists if n1|u1, n2|u2, and n3|u3 are not all the same type. 
6.2.2530 [COMPILE] “bracket-compile” CORE EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Find name. If name has other 
than default compilation semantics, append them to the current definition; otherwise append the 
execution semantics of name. An ambiguous condition exists if name is not found. 
See: 3.4.1 Parsing. 
6.2.2535 \ “backslash” CORE EXT 
 Compilation: Perform the execution semantics given below. 
 Execution: ( “ccc<eol>”-- ) 
Parse and discard the remainder of the parse area. \ is an immediate word. 
See: 7.6.2.2535 \. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 59 
7. The optional Block word set 
7.1 Introduction 
7.2 Additional terms 
block: 1024 characters of data on mass storage, designated by a block number. 
block buffer: A block-sized region of data space where a block is made temporarily available for use. The 
current block buffer is the block buffer most recently accessed by BLOCK, BUFFER, LOAD, LIST, or 
THRU. 
7.3 Additional usage requirements 
7.3.1 Environmental queries 
Append table 7.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 7.1 – Environmental Query Strings 
String Value data type Constant? Meaning 
BLOCK flag no block word set present 
BLOCK-EXT flag no block extensions word set present 
7.3.2 Data space 
A program may access memory within a valid block buffer. 
See: 3.3.3 Data Space. 
7.3.3 Block buffer regions 
The address of a block buffer returned by BLOCK or BUFFER is transient. A call to BLOCK or BUFFER
may render a previously-obtained block-buffer address invalid, as may a call to any word that: 
– parses: 
– displays characters on the user output device, such as TYPE or EMIT; 
– controls the user output device, such as CR or AT-XY; 
– receives or tests for the presence of characters from the user input device such as ACCEPT or KEY; 
– waits for a condition or event, such as MS or EKEY; 
– manages the block buffers, such as FLUSH, SAVE-BUFFERS, or EMPTY-BUFFERS; 
– performs any operation on a file or file-name directory that implies I/O, such as REFILL or any word 
that returns an ior; 
– implicitly performs I/O, such as text interpreter nesting and un-nesting when files are being used 
(including un-nesting implied by THROW). 
If the input source is a block, these restrictions also apply to the address returned by SOURCE. 
Block buffers are uniquely assigned to blocks. 
ANSI X3.215-1994 
60 Collating Sequence: 
7.3.4 Parsing 
The Block word set implements an alternative input source for the text interpreter. When the input source is 
a block, BLK shall contain the non-zero block number and the input buffer is the 1024-character buffer 
containing that block. 
A block is conventionally displayed as 16 lines of 64 characters. 
A program may switch the input source to a block by using LOAD or THRU. Input sources may be nested 
using LOAD and EVALUATE in any order. 
A program may reposition the parse area within a block by manipulating >IN. More extensive 
repositioning can be accomplished using SAVE-INPUT and RESTORE-INPUT. 
See: 3.4.1 Parsing. 
7.3.5 Possible action on an ambiguous condition 
See: 3.4.4 Possible action on an ambiguous condition. 
– A system with the Block word set may set interpretation state and interpret a block. 
7.4 Additional documentation requirements 
7.4.1 System documentation 
7.4.1.1 Implementation-defined options 
– the format used for display by 7.6.2.1770 LIST (if implemented); 
– the length of a line affected by 7.6.2.2535 \ (if implemented). 
7.4.1.2 Ambiguous conditions 
– Correct block read was not possible; 
– I/O exception in block transfer; 
– Invalid block number (7.6.1.0800 BLOCK, 7.6.1.0820 BUFFER, 7.6.1.1790 LOAD); 
– A program directly alters the contents of 7.6.1.0790 BLK; 
– No current block buffer for 7.6.1.2400 UPDATE.
7.4.1.3 Other system documentation 
– any restrictions a multiprogramming system places on the use of buffer addresses; 
– the number of blocks available for source text and data. 
7.4.2 Program documentation 
– the number of blocks required by the program. 
7.5 Compliance and labeling 
7.5.1 ANS Forth systems 
The phrase “Providing the Block word set” shall be appended to the label of any Standard System that 
provides all of the Block word set. 
The phrase “Providing name(s) from the Block Extensions word set” shall be appended to the label of any 
Standard System that provides portions of the Block Extensions word set. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 61 
The phrase “Providing the Block Extensions word set” shall be appended to the label of any Standard 
System that provides all of the Block and Block Extensions word sets. 
7.5.2 ANS Forth programs 
The phrase “Requiring the Block word set” shall be appended to the label of Standard Programs that require 
the system to provide the Block word set. 
The phrase “Requiring name(s) from the Block Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the Block Extensions word set. 
The phrase “Requiring the Block Extensions word set” shall be appended to the label of Standard Programs 
that require the system to provide all of the Block and Block Extensions word sets. 
ANSI X3.215-1994 
62 Collating Sequence: 
7.6 Glossary 
7.6.1 Block words 
7.6.1.0790 BLK “b-l-k” BLOCK 
( -- a-addr ) 
a-addr is the address of a cell containing zero or the number of the mass-storage block being 
interpreted. If BLK contains zero, the input source is not a block and can be identified by 
SOURCE-ID, if SOURCE-ID is available. An ambiguous condition exists if a program directly 
alters the contents of BLK. 
 See: 7.3.3 Block buffer regions. 
7.6.1.0800 BLOCK BLOCK 
( u -- a-addr ) 
a-addr is the address of the first character of the block buffer assigned to mass-storage block u. 
An ambiguous condition exists if u is not an available block number. 
If block u is already in a block buffer, a-addr is the address of that block buffer. 
If block u is not already in memory and there is an unassigned block buffer, transfer block u
from mass storage to an unassigned block buffer. a-addr is the address of that block buffer. 
If block u is not already in memory and there are no unassigned block buffers, unassign a block 
buffer. If the block in that buffer has been UPDATEd, transfer the block to mass storage and 
transfer block u from mass storage into that buffer. a-addr is the address of that block buffer. 
At the conclusion of the operation, the block buffer pointed to by a-addr is the current block 
buffer and is assigned to u. 
7.6.1.0820 BUFFER BLOCK 
( u -- a-addr ) 
a-addr is the address of the first character of the block buffer assigned to block u. The contents 
of the block are unspecified. An ambiguous condition exists if u is not an available block 
number. 
If block u is already in a block buffer, a-addr is the address of that block buffer. 
If block u is not already in memory and there is an unassigned buffer, a-addr is the address of 
that block buffer. 
If block u is not already in memory and there are no unassigned block buffers, unassign a block 
buffer. If the block in that buffer has been UPDATEd, transfer the block to mass storage. aaddr is the address of that block buffer. 
At the conclusion of the operation, the block buffer pointed to by a-addr is the current block 
buffer and is assigned to u. 
 See: 7.6.1.0800 BLOCK.
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 63 
7.6.1.1360 EVALUATE BLOCK 
Extend the semantics of 6.1.1360 EVALUATE to include: 
Store zero in BLK. 
7.6.1.1559 FLUSH BLOCK 
( -- ) 
Perform the function of SAVE-BUFFERS, then unassign all block buffers. 
7.6.1.1790 LOAD BLOCK 
( i*x u -- j*x ) 
Save the current input-source specification. Store u in BLK (thus making block u the input 
source and setting the input buffer to encompass its contents), set >IN to zero, and interpret. 
When the parse area is exhausted, restore the prior input source specification. Other stack 
effects are due to the words LOADed. 
An ambiguous condition exists if u is zero or is not a valid block number. 
 See: 3.4 The Forth text interpreter. 
7.6.1.2180 SAVE-BUFFERS BLOCK 
( -- ) 
Transfer the contents of each UPDATEd block buffer to mass storage. Mark all buffers as 
unmodified. 
7.6.1.2400 UPDATE BLOCK 
( -- ) 
Mark the current block buffer as modified. An ambiguous condition exists if there is no current 
block buffer. 
UPDATE does not immediately cause I/O. 
 See: 7.6.1.0800 BLOCK, 7.6.1.0820 BUFFER, 7.6.1.1559 FLUSH, 7.6.1.2180 SAVE-BUFFERS. 
7.6.2 Block extension words 
7.6.2.1330 EMPTY-BUFFERS BLOCK EXT 
( -- ) 
Unassign all block buffers. Do not transfer the contents of any UPDATEd block buffer to mass 
storage. 
 See: 7.6.1.0800 BLOCK. 
ANSI X3.215-1994 
64 Collating Sequence: 
7.6.2.1770 LIST BLOCK EXT 
( u -- ) 
Display block u in an implementation-defined format. Store u in SCR. 
 See: 7.6.1.0800 BLOCK. 
7.6.2.2125 REFILL BLOCK EXT 
( -- flag ) 
Extend the execution semantics of 6.2.2125 REFILL with the following: 
When the input source is a block, make the next block the input source and current input buffer 
by adding one to the value of BLK and setting >IN to zero. Return true if the new value of BLK
is a valid block number, otherwise false. 
 See: 6.2.2125 REFILL, 11.6.2.2125 REFILL. 
7.6.2.2190 SCR “s-c-r” BLOCK EXT 
( -- a-addr ) 
a-addr is the address of a cell containing the block number of the block most recently LISTed. 
7.6.2.2280 THRU BLOCK EXT 
( i*x u1 u2 -- j*x ) 
LOAD the mass storage blocks numbered u1 through u2 in sequence. Other stack effects are due 
to the words LOADed. 
7.6.2.2535 \ “backslash” BLOCK EXT 
Extend the semantics of 6.2.2535 \ to be: 
 Compilation: Perform the execution semantics given below. 
 Execution: ( “ccc<eol>”-- ) 
If BLK contains zero, parse and discard the remainder of the parse area; otherwise parse and 
discard the portion of the parse area corresponding to the remainder of the current line. \ is an 
immediate word. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 65 
8. The optional Double-Number word set 
8.1 Introduction 
Sixteen-bit Forth systems often use double-length numbers. However, many Forths on small embedded 
systems do not, and many users of Forth on systems with a cell size of 32 bits or more find that the use of 
double-length numbers is much diminished. Therefore, the words that manipulate double-length entities 
have been placed in this optional word set. 
8.2 Additional terms and notation 
None. 
8.3 Additional usage requirements 
8.3.1 Environmental queries 
Append table 8.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 8.1 – Environmental Query Strings 
String Value data type Constant? Meaning 
DOUBLE flag no double-number word set present 
DOUBLE-EXT flag no double-number extensions word set present 
8.3.2 Text interpreter input number conversion 
When the text interpreter processes a number that is immediately followed by a decimal point and is not 
found as a definition name, the text interpreter shall convert it to a double-cell number. 
For example, entering DECIMAL 1234 leaves the single-cell number 1234 on the stack, 
and entering DECIMAL 1234. leaves the double-cell number 1234 0 on the stack. 
See: 3.4.1.3 Text interpreter input number conversion. 
8.4 Additional documentation requirements 
8.4.1 System documentation 
8.4.1.1 Implementation-defined options 
– no additional requirements. 
8.4.1.2 Ambiguous conditions 
– d outside range of n in 8.6.1.1140 D>S. 
8.4.1.3 Other system documentation 
– no additional requirements. 
8.4.2 Program documentation 
– no additional requirements. 
ANSI X3.215-1994 
66 Collating Sequence: 
8.5 Compliance and labeling 
8.5.1 ANS Forth systems 
The phrase “Providing the Double-Number word set” shall be appended to the label of any Standard System 
that provides all of the Double-Number word set. 
The phrase “Providing name(s) from the Double-Number Extensions word set” shall be appended to the 
label of any Standard System that provides portions of the Double-Number Extensions word set. 
The phrase “Providing the Double-Number Extensions word set” shall be appended to the label of any 
Standard System that provides all of the Double-Number and Double-Number Extensions word sets. 
8.5.2 ANS Forth programs 
The phrase “Requiring the Double-Number word set” shall be appended to the label of Standard Programs 
that require the system to provide the Double-Number word set. 
The phrase “Requiring name(s) from the Double-Number Extensions word set” shall be appended to the 
label of Standard Programs that require the system to provide portions of the Double-Number Extensions 
word set. 
The phrase “Requiring the Double-Number Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the Double-Number and Double-Number Extensions 
word sets. 
8.6 Glossary 
8.6.1 Double-Number words 
8.6.1.0360 2CONSTANT “two-constant” DOUBLE
( x1 x2 “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. 
name is referred to as a “two-constant”. 
name Execution: ( -- x1 x2 ) 
Place cell pair x1 x2 on the stack. 
See: 3.4.1 Parsing. 
8.6.1.0390 2LITERAL “two-literal” DOUBLE 
 Interpretation: Interpretation semantics for this word are undefined. 
Compilation: ( x1 x2 -- ) 
Append the run-time semantics below to the current definition. 
 Run-time: ( -- x1 x2 ) 
Place cell pair x1 x2 on the stack. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 67 
8.6.1.0440 2VARIABLE “two-variable” DOUBLE 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. Reserve two consecutive cells of data space. 
name is referred to as a “two-variable”. 
name Execution: ( -- a-addr ) 
a-addr is the address of the first (lowest address) cell of two consecutive cells in data space 
reserved by 2VARIABLE when it defined name. A program is responsible for initializing the 
contents. 
 See: 3.4.1 Parsing, 6.1.2410 VARIABLE. 
8.6.1.1040 D+ “d-plus” DOUBLE 
( d1|ud1 d2|ud2 -- d3|ud3 ) 
Add d2|ud2 to d1|ud1, giving the sum d3|ud3. 
8.6.1.1050 D- “d-minus” DOUBLE 
( d1|ud1 d2|ud2 -- d3|ud3 ) 
Subtract d2|ud2 from d1|ud1, giving the difference d3|ud3. 
8.6.1.1060 D. “d-dot” DOUBLE 
( d -- ) 
Display d in free field format. 
8.6.1.1070 D.R “d-dot-r” DOUBLE 
( d n -- ) 
Display d right aligned in a field n characters wide. If the number of characters required to 
display d is greater than n, all digits are displayed with no leading spaces in a field as wide as 
necessary. 
8.6.1.1075 D0< “d-zero-less” DOUBLE 
( d -- flag ) 
flag is true if and only if d is less than zero. 
8.6.1.1080 D0= “d-zero-equals” DOUBLE 
( xd -- flag ) 
flag is true if and only if xd is equal to zero. 
ANSI X3.215-1994 
68 Collating Sequence: 
8.6.1.1090 D2* “d-two-star” DOUBLE 
( xd1 -- xd2 ) 
xd2 is the result of shifting xd1 one bit toward the most-significant bit, filling the vacated leastsignificant bit with zero. 
8.6.1.1100 D2/ “d-two-slash” DOUBLE 
( xd1 -- xd2 ) 
xd2 is the result of shifting xd1 one bit toward the least-significant bit, leaving the mostsignificant bit unchanged. 
8.6.1.1110 D< “d-less-than” DOUBLE 
( d1 d2 -- flag ) 
flag is true if and only if d1 is less than d2. 
8.6.1.1120 D= “d-equals” DOUBLE 
( xd1 xd2 -- flag ) 
flag is true if and only if xd1 is bit-for-bit the same as xd2. 
8.6.1.1140 D>S “d-to-s” DOUBLE 
( d -- n ) 
n is the equivalent of d. An ambiguous condition exists if d lies outside the range of a signed 
single-cell number. 
8.6.1.1160 DABS “d-abs” DOUBLE 
( d -- ud ) 
ud is the absolute value of d. 
8.6.1.1210 DMAX “d-max” DOUBLE 
( d1 d2 -- d3 ) 
d3 is the greater of d1 and d2. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 69 
8.6.1.1220 DMIN “d-min” DOUBLE 
( d1 d2 -- d3 ) 
d3 is the lesser of d1 and d2. 
8.6.1.1230 DNEGATE “d-negate” DOUBLE 
( d1 -- d2 ) 
d2 is the negation of d1. 
8.6.1.1820 M*/ “m-star-slash” DOUBLE 
( d1 n1 +n2 -- d2 ) 
Multiply d1 by n1 producing the triple-cell intermediate result t. Divide t by +n2 giving the 
double-cell quotient d2. An ambiguous condition exists if +n2 is zero or negative, or the 
quotient lies outside of the range of a double-precision signed integer. 
8.6.1.1830 M+ “m-plus” DOUBLE 
( d1|ud1 n -- d2|ud2 ) 
Add n to d1|ud1, giving the sum d2|ud2. 
8.6.2 Double-Number extension words 
8.6.2.0420 2ROT “two-rote” DOUBLE EXT 
( x1 x2 x3 x4 x5 x6 -- x3 x4 x5 x6 x1 x2 ) 
Rotate the top three cell pairs on the stack bringing cell pair x1 x2 to the top of the stack. 
8.6.2.1270 DU< “d-u-less” DOUBLE EXT 
( ud1 ud2 -- flag ) 
flag is true if and only if ud1 is less than ud2. 
ANSI X3.215-1994 
70 Collating Sequence: 
9. The optional Exception word set 
9.1 Introduction 
9.2 Additional terms and notation 
None. 
9.3 Additional usage requirements 
9.3.1 THROW values 
The THROW values {-255...-1} shall be used only as assigned by this Standard. The values {-4095...-256} 
shall be used only as assigned by a system. 
If the File-Access or Memory-Allocation word sets are implemented, it is recommended that the non-zero 
values of ior lie within the range of system THROW values, as defined above. In an operating-system 
environment, this can sometimes be accomplished by “biasing” the range of operating-system exceptioncodes to fall within the THROW range. 
Programs shall not define values for use with THROW in the range {-4095...-1}. 
9.3.2 Exception frame 
An exception frame is the implementation-dependent set of information recording the current execution 
state necessary for the proper functioning of CATCH and THROW. It often includes the depths of the data 
stack and return stack. 
9.3.3 Exception stack 
A stack used for the nesting of exception frames by CATCH and THROW. It may be, but need not be, 
implemented using the return stack. 
9.3.4 Environmental queries 
Append table 9.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 9.1 – Environmental query strings 
String Value data type Constant? Meaning 
EXCEPTION flag no Exception word set present 
EXCEPTION-EXT flag no Exception extensions word set present 
9.3.5 Possible actions on an ambiguous condition 
A system choosing to execute THROW when detecting one of the ambiguous conditions listed in table 9.3.6 
shall use the throw code listed there. 
See: 3.4.4 Possible actions on an ambiguous condition. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 71 
Table 9.2 – THROW code assignments 
Code Reserved for Code Reserved for 
 -1 ABORT
 -2 ABORT"
 -3 stack overflow 
 -4 stack underflow 
 -5 return stack overflow 
 -6 return stack underflow 
 -7 do-loops nested too deeply during execution 
 -8 dictionary overflow 
 -9 invalid memory address 
 -10 division by zero 
 -11 result out of range 
 -12 argument type mismatch 
 -13 undefined word 
 -14 interpreting a compile-only word 
 -15 invalid FORGET
 -16 attempt to use zero-length string as a name 
 -17 pictured numeric output string overflow 
 -18 parsed string overflow 
 -19 definition name too long 
 -20 write to a read-only location 
 -21 unsupported operation 
(e.g., AT-XY on a too-dumb terminal) 
 -22 control structure mismatch 
 -23 address alignment exception 
 -24 invalid numeric argument 
 -25 return stack imbalance 
 -26 loop parameters unavailable 
 -27 invalid recursion 
 -28 user interrupt 
 -29 compiler nesting 
 -30 obsolescent feature 
 -31 >BODY used on non-CREATEd definition 
 -32 invalid name argument (e.g., TO xxx) 
 -33 block read exception 
 -34 block write exception 
 -35 invalid block number 
 -36 invalid file position 
 -37 file I/O exception 
 -38 non-existent file 
 -39 unexpected end of file 
 -40 invalid BASE for floating point conversion 
 -41 loss of precision 
 -42 floating-point divide by zero 
 -43 floating-point result out of range 
 -44 floating-point stack overflow 
 -45 floating-point stack underflow 
 -46 floating-point invalid argument 
 -47 compilation word list deleted 
 -48 invalid POSTPONE
 -49 search-order overflow 
 -50 search-order underflow 
 -51 compilation word list changed 
 -52 control-flow stack overflow 
 -53 exception stack overflow 
 -54 floating-point underflow 
 -55 floating-point unidentified fault 
 -56 QUIT
 -57 exception in sending or receiving a character 
 -58 [IF], [ELSE], or [THEN] exception 
9.3.6 Exception handling 
There are several methods of coupling CATCH and THROW to other procedural nestings. The usual nestings 
are the execution of definitions, use of the return stack, use of loops, instantiation of locals and nesting of 
input sources (i.e., with LOAD, EVALUATE, or INCLUDE-FILE). 
When a THROW returns control to a CATCH, the system shall un-nest not only definitions, but also, if 
present, locals and input source specifications, to return the system to its proper state for continued 
execution past the CATCH. 
9.4 Additional documentation requirements 
9.4.1 System documentation 
9.4.1.1 Implementation-defined options 
– Values used in the system by 9.6.1.0875 CATCH and 9.6.1.2275 THROW (9.3.1 THROW values, 9.3.5 
Possible actions on an ambiguous condition). 
ANSI X3.215-1994 
72 Collating Sequence: 
9.4.1.2 Ambiguous conditions 
– no additional requirements. 
9.4.1.3 Other system documentation 
– no additional requirements. 
9.4.2 Program documentation 
– no additional requirements. 
9.5 Compliance and labeling 
9.5.1 ANS Forth systems 
The phrase “Providing the Exception word set” shall be appended to the label of any Standard System that 
provides all of the Exception word set. 
The phrase “Providing name(s) from the Exception Extensions word set” shall be appended to the label of 
any Standard System that provides portions of the Exception Extensions word set. 
The phrase “Providing the Exception Extensions word set” shall be appended to the label of any Standard 
System that provides all of the Exception and Exception Extensions word sets. 
9.5.2 ANS Forth programs 
The phrase “Requiring the Exception word set” shall be appended to the label of Standard Programs that 
require the system to provide the Exception word set. 
The phrase “Requiring name(s) from the Exception Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the Exception Extensions word set. 
The phrase “Requiring the Exception Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the Exception and Exception Extensions word sets. 
9.6 Glossary 
9.6.1 Exception words 
9.6.1.0875 CATCH EXCEPTION 
( i*x xt -- j*x 0 | i*x n ) 
Push an exception frame on the exception stack and then execute the execution token xt (as with 
EXECUTE) in such a way that control can be transferred to a point just after CATCH if THROW
is executed during the execution of xt. 
If the execution of xt completes normally (i.e., the exception frame pushed by this CATCH is not 
popped by an execution of THROW) pop the exception frame and return zero on top of the data 
stack, above whatever stack items would have been returned by xt EXECUTE. Otherwise, the 
remainder of the execution semantics are given by THROW. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 73 
9.6.1.2275 THROW EXCEPTION 
( k*x n -- k*x | i*x n ) 
If any bits of n are non-zero, pop the topmost exception frame from the exception stack, along 
with everything on the return stack above that frame. Then restore the input source 
specification in use before the corresponding CATCH and adjust the depths of all stacks defined 
by this Standard so that they are the same as the depths saved in the exception frame (i is the 
same number as the i in the input arguments to the corresponding CATCH), put n on top of the 
data stack, and transfer control to a point just after the CATCH that pushed that exception frame. 
If the top of the stack is non zero and there is no exception frame on the exception stack, the 
behavior is as follows: 
If n is minus-one (-1), perform the function of 6.1.0670 ABORT (the version of ABORT in 
the Core word set), displaying no message. 
If n is minus-two, perform the function of 6.1.0680 ABORT" (the version of ABORT" in 
the Core word set), displaying the characters ccc associated with the ABORT" that 
generated the THROW. 
Otherwise, the system may display an implementation-dependent message giving 
information about the condition associated with the THROW code n. Subsequently, the 
system shall perform the function of 6.1.0670 ABORT (the version of ABORT in the Core 
word set). 
9.6.2 Exception extension words 
9.6.2.0670 ABORT EXCEPTION EXT 
Extend the semantics of 6.1.0670 ABORT to be: 
( i*x -- ) ( R: j*x -- ) 
Perform the function of -1 THROW . 
See: 6.1.0670 ABORT. 
9.6.2.0680 ABORT" “abort-quote” EXCEPTION EXT 
Extend the semantics of 6.1.0680 ABORT" to be: 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by a " (double-quote). Append the run-time semantics given below to the 
current definition. 
 Run-time: ( i*x x1 -- | i*x ) ( R: j*x -- | j*x ) 
Remove x1 from the stack. If any bit of x1 is not zero, perform the function of -2 THROW, 
displaying ccc if there is no exception frame on the exception stack. 
See: 3.4.1 Parsing, 6.1.0680 ABORT".
ANSI X3.215-1994 
74 Collating Sequence: 
10. The optional Facility word set 
10.1 Introduction 
10.2 Additional terms and notation 
None. 
10.3 Additional usage requirements 
10.3.1 Character types 
Programs that use more than seven bits of a character by 10.6.2.1305 EKEY have an environmental 
dependency. 
See: 3.1.2 Character types. 
10.3.2 Environmental queries 
Append table 10.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 10.1 – Environmental query strings 
String Value data type Constant? Meaning 
FACILITY flag no facility word set present 
FACILITY-EXT flag no facility extensions word set present 
10.4 Additional documentation requirements 
10.4.1 System documentation 
10.4.1.1 Implementation-defined options 
– encoding of keyboard events (10.6.2.1305 EKEY); 
– duration of a system clock tick; 
– repeatability to be expected from execution of 10.6.2.1905 MS. 
10.4.1.2 Ambiguous conditions 
– 10.6.1.0742 AT-XY operation can't be performed on user output device. 
10.4.1.3 Other system documentation 
– no additional requirements. 
10.4.2 Program documentation 
10.4.2.1 Environmental dependencies 
– using more than seven bits of a character in 10.6.2.1305 EKEY. 
10.4.2.2 Other program documentation 
– no additional requirements. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 75 
10.5 Compliance and labeling 
10.5.1 ANS Forth systems 
The phrase “Providing the Facility word set” shall be appended to the label of any Standard System that 
provides all of the Facility word set. 
The phrase “Providing name(s) from the Facility Extensions word set” shall be appended to the label of any 
Standard System that provides portions of the Facility Extensions word set. 
The phrase “Providing the Facility Extensions word set” shall be appended to the label of any Standard 
System that provides all of the Facility and Facility Extensions word sets. 
10.5.2 ANS Forth programs 
The phrase “Requiring the Facility word set” shall be appended to the label of Standard Programs that 
require the system to provide the Facility word set. 
The phrase “Requiring name(s) from the Facility Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the Facility Extensions word set. 
The phrase “Requiring the Facility Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the Facility and Facility Extensions word sets. 
10.6 Glossary 
10.6.1 Facility words 
10.6.1.0742 AT-XY “at-x-y” FACILITY 
( u1 u2 -- ) 
Perform implementation-dependent steps so that the next character displayed will appear in 
column u1, row u2 of the user output device, the upper left corner of which is column zero, row 
zero. An ambiguous condition exists if the operation cannot be performed on the user output 
device with the specified parameters. 
10.6.1.1755 KEY? “key-question” FACILITY 
( -- flag ) 
If a character is available, return true. Otherwise, return false. If non-character keyboard 
events are available before the first valid character, they are discarded and are subsequently 
unavailable. The character shall be returned by the next execution of KEY. 
After KEY? returns with a value of true, subsequent executions of KEY? prior to the execution 
of KEY or EKEY also return true, without discarding keyboard events. 
10.6.1.2005 PAGE FACILITY 
( -- ) 
Move to another page for output. Actual function depends on the output device. On a terminal, 
PAGE clears the screen and resets the cursor position to the upper left corner. On a printer, 
PAGE performs a form feed. 
ANSI X3.215-1994 
76 Collating Sequence: 
10.6.2 Facility extension words 
10.6.2.1305 EKEY “e-key” FACILITY EXT 
( -- u ) 
Receive one keyboard event u. The encoding of keyboard events is implementation defined. 
 See: 10.6.1.1755 KEY?, 6.1.1750 KEY. 
10.6.2.1306 EKEY>CHAR “e-key-to-char” FACILITY EXT 
( u -- u false | char true ) 
If the keyboard event u corresponds to a character in the implementation-defined character set, 
return that character and true. Otherwise return u and false. 
10.6.2.1307 EKEY? “e-key-question” FACILITY EXT 
( -- flag ) 
If a keyboard event is available, return true. Otherwise return false. The event shall be returned 
by the next execution of EKEY. 
After EKEY? returns with a value of true, subsequent executions of EKEY? prior to the 
execution of KEY, KEY? or EKEY also return true, referring to the same event. 
10.6.2.1325 EMIT? “emit-question” FACILITY EXT 
( -- flag ) 
flag is true if the user output device is ready to accept data and the execution of EMIT in place 
of EMIT? would not have suffered an indefinite delay. If the device status is indeterminate, 
flag is true. 
10.6.2.1905 MS FACILITY EXT 
( u -- ) 
Wait at least u milliseconds. 
Note: The actual length and variability of the time period depends upon the implementation-defined 
resolution of the system clock and upon other system and computer characteristics beyond the 
scope of this Standard. 
10.6.2.2292 TIME&DATE “time-and-date” FACILITY EXT 
( -- +n1 +n2 +n3 +n4 +n5 +n6 ) 
Return the current time and date. +n1 is the second {0...59}, +n2 is the minute {0...59}, +n3 is 
the hour {0...23}, +n4 is the day {1...31} +n5 is the month {1...12}, and +n6 is the year (e.g., 
1991). 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 77 
11. The optional File-Access word set 
11.1 Introduction 
These words provide access to mass storage in the form of “files” under the following assumptions: 
– files are provided by a host operating system; 
– file names are represented as character strings; 
– the format of file names is determined by the host operating system; 
– an open file is identified by a single-cell file identifier (fileid); 
– file-state information (e.g., position, size) is managed by the host operating system; 
– file contents are accessed as a sequence of characters; 
– file read operations return an actual transfer count, which can differ from the requested transfer count. 
11.2 Additional terms 
file-access method: A permissible means of accessing a file, such as “read/write” or “read only”. 
file position: The character offset from the start of the file. 
input file: The file, containing a sequence of lines, that is the input source. 
11.3 Additional usage requirements 
11.3.1 Data types 
Append table 11.1 to table 3.1. 
Table 11.1 – Data types 
Symbol Data type Size on stack 
ior I/O results 1 cell 
fam file access method 1 cell 
fileid file identifiers 1 cell 
11.3.1.1 File identifiers 
File identifiers are implementation-dependent single-cell values that are passed to file operators to designate 
specific files. Opening a file assigns a file identifier, which remains valid until closed. 
11.3.1.2 I/O results 
I/O results are single-cell numbers indicating the result of I/O operations. A value of zero indicates that the 
I/O operation completed successfully; other values and their meanings are implementation-defined. 
Reaching the end of a file shall be reported as zero. 
An I/O exception in the execution of a File-Access word that can return an I/O result shall not cause a 
THROW; exception indications are returned in the ior. 
11.3.1.3 File access methods 
File access methods are implementation-defined single-cell values. 
ANSI X3.215-1994 
78 Collating Sequence: 
11.3.1.4 File names 
A character string containing the name of the file. The file name may include an implementation-dependent 
path name. The format of file names is implementation defined. 
11.3.2 Blocks in files 
If the File-Access word set is implemented, the Block word set shall be implemented. 
Blocks may, but need not, reside in files. When they do: 
– Block numbers may be mapped to one or more files by implementation-defined means. An ambiguous 
condition exists if a requested block number is not currently mapped; 
– An UPDATEd block that came from a file shall be transferred back to the same file. 
11.3.3 Environmental queries 
Append table 11.2 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 11.2 – Environmental query strings 
String Value data type Constant? Meaning 
FILE flag no file word set present 
FILE-EXT flag no file extensions word set present 
11.3.4 Input source 
The File-Access word set creates another input source for the text interpreter. When the input source is a 
text file, BLK shall contain zero, SOURCE-ID shall contain the fileid of that text file, and the input buffer 
shall contain one line of the text file. 
Input with INCLUDED, INCLUDE-FILE, LOAD and EVALUATE shall be nestable in any order to at least 
eight levels. 
A program that uses more than eight levels of input-file nesting has an environmental dependency. 
See: 3.3.3.5 Input buffers, 9. Optional Exception word set. 
11.3.5 Other transient regions 
The list of words using memory in transient regions is extended to include 11.6.1.2165 S". 
See: 3.3.3.6 Other transient regions. 
11.3.6 Parsing 
When parsing from a text file using a space delimiter, control characters shall be treated the same as the 
space character. 
Lines of at least 128 characters shall be supported. A program that requires lines of more than 128 
characters has an environmental dependency. 
A program may reposition the parse area within the input buffer by manipulating the contents of >IN. More 
extensive repositioning can be accomplished using SAVE-INPUT and RESTORE-INPUT. 
See: 3.4.1 Parsing. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 79 
11.4 Additional documentation requirements 
11.4.1 System documentation 
11.4.1.1 Implementation-defined options 
– file access methods used by 11.6.1.0765 BIN, 11.6.1.1010 CREATE-FILE, 11.6.1.1970 OPEN-FILE, 
11.6.1.2054 R/O, 11.6.1.2056 R/W, and 11.6.1.2425 W/O; 
– file exceptions; 
– file line terminator (11.6.1.2090 READ-LINE); 
– file name format (11.3.1.4 File names); 
– information returned by 11.6.2.1524 FILE-STATUS; 
– input file state after an exception (11.6.1.1717 INCLUDE-FILE, 11.6.1.1718 INCLUDED); 
– ior values and meaning (11.3.1.2 I/O results); 
– maximum depth of file input nesting (11.3.4 Input source); 
– maximum size of input line (11.3.6 Parsing); 
– methods for mapping block ranges to files (11.3.2 Blocks in files); 
– number of string buffers provided (11.6.1.2165 S"); 
– size of string buffer used by 11.6.1.2165 S". 
11.4.1.2 Ambiguous conditions 
– attempting to position a file outside its boundaries (11.6.1.2142 REPOSITION-FILE); 
– attempting to read from file positions not yet written (11.6.1.2080 READ-FILE, 
11.6.1.2090 READ-LINE); 
– fileid is invalid (11.6.1.1717 INCLUDE-FILE); 
– I/O exception reading or closing fileid (11.6.1.1717 INCLUDE-FILE, 11.6.1.1718 INCLUDED); 
– named file cannot be opened (11.6.1.1718 INCLUDED); 
– requesting an unmapped block number (11.3.2 Blocks in files); 
– using 11.6.1.2218 SOURCE-ID when 7.6.1.0790 BLK is not zero. 
11.4.1.3 Other system documentation 
– no additional requirements. 
11.4.2 Program documentation 
11.4.2.1 Environmental dependencies 
– requiring lines longer than 128 characters (11.3.6 Parsing); 
– using more than eight levels of input-file nesting (11.3.4 Input source). 
11.4.2.2 Other program documentation 
– no additional requirements. 
11.5 Compliance and labeling 
11.5.1 ANS Forth systems 
The phrase “Providing the File Access word set” shall be appended to the label of any Standard System that 
provides all of the File Access word set. 
ANSI X3.215-1994 
80 Collating Sequence: 
The phrase “Providing name(s) from the File Access Extensions word set” shall be appended to the label of 
any Standard System that provides portions of the File Access Extensions word set. 
The phrase “Providing the File Access Extensions word set” shall be appended to the label of any Standard 
System that provides all of the File Access and File Access Extensions word sets. 
11.5.2 ANS Forth programs 
The phrase “Requiring the File Access word set” shall be appended to the label of Standard Programs that 
require the system to provide the File Access word set. 
The phrase “Requiring name(s) from the File Access Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the File Access Extensions word set. 
The phrase “Requiring the File Access Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the File Access and File Access Extensions word sets. 
11.6 Glossary 
11.6.1 File Access words 
11.6.1.0080 ( “paren” FILE 
( “ccc<paren>” -- ) 
Extend the semantics of 6.1.0080 ( to include: 
When parsing from a text file, if the end of the parse area is reached before a right parenthesis is 
found, refill the input buffer from the next line of the file, set >IN to zero, and resume parsing, 
repeating this process until either a right parenthesis is found or the end of the file is reached. 
11.6.1.0765 BIN FILE 
( fam1 -- fam2 ) 
Modify the implementation-defined file access method fam1 to additionally select a “binary”, 
i.e., not line oriented, file access method, giving access method fam2. 
 See: 11.6.1.2054 R/O, 11.6.1.2056 R/W, 11.6.1.2425 W/O.
11.6.1.0900 CLOSE-FILE FILE 
( fileid -- ior ) 
Close the file identified by fileid. ior is the implementation-defined I/O result code. 
11.6.1.1010 CREATE-FILE FILE 
( c-addr u fam -- fileid ior ) 
Create the file named in the character string specified by c-addr and u, and open it with file 
access method fam. The meaning of values of fam is implementation defined. If a file with the 
same name already exists, recreate it as an empty file. 
If the file was successfully created and opened, ior is zero, fileid is its identifier, and the file has 
been positioned to the start of the file. 
Otherwise, ior is the implementation-defined I/O result code and fileid is undefined. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 81 
11.6.1.1190 DELETE-FILE FILE 
( c-addr u -- ior ) 
Delete the file named in the character string specified by c-addr u. ior is the implementationdefined I/O result code. 
11.6.1.1520 FILE-POSITION FILE 
( fileid -- ud ior ) 
ud is the current file position for the file identified by fileid. ior is the implementation-defined 
I/O result code. ud is undefined if ior is non-zero. 
11.6.1.1522 FILE-SIZE FILE 
( fileid -- ud ior ) 
ud is the size, in characters, of the file identified by fileid. ior is the implementation-defined I/O 
result code. This operation does not affect the value returned by FILE-POSITION. ud is 
undefined if ior is non-zero. 
11.6.1.1717 INCLUDE-FILE FILE 
( i*x fileid -- j*x ) 
Remove fileid from the stack. Save the current input source specification, including the current 
value of SOURCE-ID. Store fileid in SOURCE-ID. Make the file specified by fileid the input 
source. Store zero in BLK. Other stack effects are due to the words INCLUDEd. 
Repeat until end of file: read a line from the file, fill the input buffer from the contents of that 
line, set >IN to zero, and interpret. 
Text interpretation begins at the file position where the next file read would occur. 
When the end of the file is reached, close the file and restore the input source specification to its 
saved value. 
An ambiguous condition exists if fileid is invalid, if there is an I/O exception reading fileid, or if 
an I/O exception occurs while closing fileid. When an ambiguous condition exists, the status 
(open or closed) of any files that were being interpreted is implementation-defined. 
See: 11.3.4 Input source. 
ANSI X3.215-1994 
82 Collating Sequence: 
11.6.1.1718 INCLUDED FILE 
( i*x c-addr u -- j*x ) 
Remove c-addr u from the stack. Save the current input source specification, including the 
current value of SOURCE-ID. Open the file specified by c-addr u, store the resulting fileid in 
SOURCE-ID, and make it the input source. Store zero in BLK. Other stack effects are due to 
the words included. 
Repeat until end of file: read a line from the file, fill the input buffer from the contents of that 
line, set >IN to zero, and interpret. 
Text interpretation begins at the file position where the next file read would occur. 
When the end of the file is reached, close the file and restore the input source specification to its 
saved value. 
An ambiguous condition exists if the named file can not be opened, if an I/O exception occurs 
reading the file, or if an I/O exception occurs while closing the file. When an ambiguous 
condition exists, the status (open or closed) of any files that were being interpreted is 
implementation-defined. 
 See: 11.6.1.1717 INCLUDE-FILE. 
11.6.1.1970 OPEN-FILE FILE 
( c-addr u fam -- fileid ior ) 
Open the file named in the character string specified by c-addr u, with file access method 
indicated by fam. The meaning of values of fam is implementation defined. 
If the file is successfully opened, ior is zero, fileid is its identifier, and the file has been 
positioned to the start of the file. 
Otherwise, ior is the implementation-defined I/O result code and fileid is undefined. 
11.6.1.2054 R/O “r-o” FILE 
( -- fam ) 
fam is the implementation-defined value for selecting the “read only” file access method. 
 See: 11.6.1.1010 CREATE-FILE, 11.6.1.1970 OPEN-FILE. 
11.6.1.2056 R/W “r-w” FILE 
( -- fam ) 
fam is the implementation-defined value for selecting the “read/write” file access method. 
 See: 11.6.1.1010 CREATE-FILE, 11.6.1.1970 OPEN-FILE. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 83 
11.6.1.2080 READ-FILE FILE 
( c-addr u1 fileid -- u2 ior ) 
Read u1 consecutive characters to c-addr from the current position of the file identified by 
fileid. 
If u1 characters are read without an exception, ior is zero and u2 is equal to u1. 
If the end of the file is reached before u1 characters are read, ior is zero and u2 is the number of 
characters actually read. 
If the operation is initiated when the value returned by FILE-POSITION is equal to the value 
returned by FILE-SIZE for the file identified by fileid, ior is zero and u2 is zero. 
If an exception occurs, ior is the implementation-defined I/O result code, and u2 is the number 
of characters transferred to c-addr without an exception. 
An ambiguous condition exists if the operation is initiated when the value returned by FILEPOSITION is greater than the value returned by FILE-SIZE for the file identified by fileid, or 
if the requested operation attempts to read portions of the file not written. 
At the conclusion of the operation, FILE-POSITION returns the next file position after the 
last character read. 
11.6.1.2090 READ-LINE FILE 
( c-addr u1 fileid -- u2 flag ior ) 
Read the next line from the file specified by fileid into memory at the address c-addr. At most 
u1 characters are read. Up to two implementation-defined line-terminating characters may be 
read into memory at the end of the line, but are not included in the count u2. The line buffer 
provided by c-addr should be at least u1+2 characters long. 
If the operation succeeded, flag is true and ior is zero. If a line terminator was received before 
u1 characters were read, then u2 is the number of characters, not including the line terminator, 
actually read (0 <= u2 <= u1). When u1 = u2, the line terminator has yet to be reached. 
If the operation is initiated when the value returned by FILE-POSITION is equal to the value 
returned by FILE-SIZE for the file identified by fileid, flag is false, ior is zero, and u2 is zero. 
If ior is non-zero, an exception occurred during the operation and ior is the implementationdefined I/O result code. 
An ambiguous condition exists if the operation is initiated when the value returned by FILEPOSITION is greater than the value returned by FILE-SIZE for the file identified by fileid, or 
if the requested operation attempts to read portions of the file not written. 
At the conclusion of the operation, FILE-POSITION returns the next file position after the 
last character read. 
11.6.1.2142 REPOSITION-FILE FILE 
( ud fileid -- ior ) 
Reposition the file identified by fileid to ud. ior is the implementation-defined I/O result code. 
An ambiguous condition exists if the file is positioned outside the file boundaries. 
At the conclusion of the operation, FILE-POSITION returns the value ud. 
ANSI X3.215-1994 
84 Collating Sequence: 
11.6.1.2147 RESIZE-FILE FILE 
( ud fileid -- ior ) 
Set the size of the file identified by fileid to ud. ior is the implementation-defined I/O result 
code. 
If the resultant file is larger than the file before the operation, the portion of the file added as a 
result of the operation might not have been written. 
At the conclusion of the operation, FILE-SIZE returns the value ud and FILE-POSITION
returns an unspecified value. 
 See: 11.6.1.2080 READ-FILE, 11.6.1.2090 READ-LINE. 
11.6.1.2165 S" “s-quote” FILE 
Extend the semantics of 6.1.2165 S" to be: 
Interpretation: ( “ccc<quote>” -- c-addr u ) 
Parse ccc delimited by " (double quote). Store the resulting string c-addr u at a temporary 
location. The maximum length of the temporary buffer is implementation-dependent but shall 
be no less than 80 characters. Subsequent uses of S" may overwrite the temporary buffer. At 
least one such buffer shall be provided. 
Compilation: ( “ccc<quote>” -- ) 
Parse ccc delimited by " (double quote). Append the run-time semantics given below to the 
current definition. 
 Run-time: ( -- c-addr u ) 
Return c-addr and u that describe a string consisting of the characters ccc.
 See: 3.4.1 Parsing, 6.2.0855 C", 6.1.2165 S", 11.3.5 Other transient regions. 
11.6.1.2218 SOURCE-ID “source-i-d” FILE 
( -- 0 | -1 | fileid ) 
Extend 6.2.2218 SOURCE-ID to include text-file input as follows: 
SOURCE-ID Input source 
 fileid Text file “fileid” 
 -1 String (via EVALUATE) 
 0 User input device 
An ambiguous condition exists if SOURCE-ID is used when BLK contains a non-zero value. 
11.6.1.2425 W/O “w-o” FILE 
( -- fam ) 
fam is the implementation-defined value for selecting the “write only” file access method. 
 See: 11.6.1.1010 CREATE-FILE, 11.6.1.1970 OPEN-FILE. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 85 
11.6.1.2480 WRITE-FILE FILE 
( c-addr u fileid -- ior ) 
Write u characters from c-addr to the file identified by fileid starting at its current position. ior
is the implementation-defined I/O result code. 
At the conclusion of the operation, FILE-POSITION returns the next file position after the 
last character written to the file, and FILE-SIZE returns a value greater than or equal to the 
value returned by FILE-POSITION. 
 See: 11.6.1.2080 READ-FILE, 11.6.1.2090 READ-LINE. 
11.6.1.2485 WRITE-LINE FILE 
( c-addr u fileid -- ior ) 
Write u characters from c-addr followed by the implementation-dependent line terminator to the 
file identified by fileid starting at its current position. ior is the implementation-defined I/O 
result code. 
At the conclusion of the operation, FILE-POSITION returns the next file position after the 
last character written to the file, and FILE-SIZE returns a value greater than or equal to the 
value returned by FILE-POSITION. 
 See: 11.6.1.2080 READ-FILE, 11.6.1.2090 READ-LINE. 
11.6.2 File-Access extension words 
11.6.2.1524 FILE-STATUS FILE EXT 
(c-addr u -- x ior ) 
Return the status of the file identified by the character string c-addr u. If the file exists, ior is 
zero; otherwise ior is the implementation-defined I/O result code. x contains implementationdefined information about the file. 
11.6.2.1560 FLUSH-FILE FILE EXT 
( fileid -- ior ) 
Attempt to force any buffered information written to the file referred to by fileid to be written to 
mass storage, and the size information for the file to be recorded in the storage directory if 
changed. If the operation is successful, ior is zero. Otherwise, it is an implementation-defined 
I/O result code. 
ANSI X3.215-1994 
86 Collating Sequence: 
11.6.2.2125 REFILL FILE EXT 
( -- flag ) 
Extend the execution semantics of 6.2.2125 REFILL with the following: 
When the input source is a text file, attempt to read the next line from the text-input file. If 
successful, make the result the current input buffer, set >IN to zero, and return true. Otherwise 
return false. 
 See: 6.2.2125 REFILL, 7.6.2.2125 REFILL. 
11.6.2.2130 RENAME-FILE FILE EXT 
( c-addr1 u1 c-addr2 u2 -- ior ) 
Rename the file named by the character string c-addr1 u1 to the name in the character string caddr2 u2. ior is the implementation-defined I/O result code. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 87 
12. The optional Floating-Point word set 
12.1 Introduction 
12.2 Additional terms and notation 
12.2.1 Definition of terms 
float-aligned address: The address of a memory location at which a floating-point number can be 
accessed. 
double-float-aligned address: The address of a memory location at which a 64-bit IEEE double-precision 
floating-point number can be accessed. 
single-float-aligned address: The address of a memory location at which a 32-bit IEEE single-precision 
floating-point number can be accessed. 
IEEE floating-point number: A single- or double-precision floating-point number as defined in 
ANSI/IEEE 754-1985. 
12.2.2 Notation 
12.2.2.1 Numeric notation 
The following notation is used to define the syntax of the external representation of floating-point numbers: 
– Each component of a floating-point number is defined with a rule consisting of the name of the 
component (italicized in angle-brackets, e.g., <sign>), the characters := and a concatenation of tokens 
and metacharacters; 
– Tokens may be literal characters (in bold face, e.g., E) or rule names in angle brackets (e.g., <digit>); 
– The metacharacter * is used to specify zero or more occurrences of the preceding token (e.g., <digit>*); 
– Tokens enclosed with [ and ] are optional (e.g., [<sign>]); 
– Vertical bars separate choices from a list of tokens enclosed with braces (e.g., { + | - }). 
12.2.2.2 Stack notation 
Floating-point stack notation when the floating-point stack is separate from the data stack is: 
( F: before -- after ) 
12.3 Additional usage requirements 
12.3.1 Data types 
Append table 12.1 to table 3.1. 
Table 12.1 – Data Types 
Symbol Data type Size on stack 
r floating-point number implementation-defined 
f-addr float-aligned address 1 cell 
sf-addr single-float-aligned address 1 cell 
df-addr double-float-aligned address 1 cell 
ANSI X3.215-1994 
88 Collating Sequence: 
12.3.1.1 Addresses 
The set of float-aligned addresses is an implementation-defined subset of the set of aligned addresses. 
Adding the size of a floating-point number to a float-aligned address shall produce a float-aligned address. 
The set of double-float-aligned addresses is an implementation-defined subset of the set of aligned 
addresses. Adding the size of a 64-bit IEEE double-precision floating-point number to a double-floataligned address shall produce a double-float-aligned address. 
The set of single-float-aligned addresses is an implementation-defined subset of the set of aligned addresses. 
Adding the size of a 32-bit IEEE single-precision floating-point number to a single-float-aligned address 
shall produce a single-float-aligned address. 
12.3.1.2 Floating-point numbers 
The internal representation of a floating-point number, including the format and precision of the significand 
and the format and range of the exponent, is implementation defined. 
Any rounding or truncation of floating-point numbers is implementation defined. 
12.3.2 Floating-point operations 
“Round to nearest” means round the result of a floating-point operation to the representable value nearest 
the result. If the two nearest representable values are equally near the result, the one having zero as its least 
significant bit shall be delivered. 
“Round toward negative infinity” means round the result of a floating-point operation to the representable 
value nearest to and no greater than the result. 
12.3.3 Floating-point stack 
A last in, first out list that shall be used by all floating-point operators. 
The width of the floating-point stack is implementation-defined. By default the floating-point stack shall be 
separate from the data and return stacks. A program may determine whether floating-point numbers are 
kept on the data stack by passing the string “FLOATING-STACK” to ENVIRONMENT?. 
The size of a floating-point stack shall be at least 6 items. 
A program that depends on the floating-point stack being larger than six items has an environmental 
dependency. 
12.3.4 Environmental queries 
Append table 12.2 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 12.2 – Environmental query strings 
String Value Data type Constant? Meaning 
FLOATING flag no floating-point word set present 
FLOATING-EXT flag no floating-point extensions word set present 
FLOATING-STACK n yes If n = zero, floating-point numbers are kept 
on the data stack; otherwise n is the 
maximum depth of the separate floatingpoint stack. 
MAX-FLOAT r yes largest usable floating-point number 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 89 
12.3.5 Address alignment 
Since the address returned by a CREATEd word is not necessarily aligned for any particular class of 
floating-point data, a program shall align the address (to be float aligned, single-float aligned, or doublefloat aligned) before accessing floating-point data at the address. 
See: 3.3.3.1 Address Alignment, 12.3.1.1 Addresses. 
12.3.6 Variables 
A program may address memory in data space regions made available by FVARIABLE. These regions may 
be non-contiguous with regions subsequently allocated with , (comma) or ALLOT. 
See: 3.3.3.3 Variables. 
12.3.7 Text interpreter input number conversion 
If the Floating-Point word set is present in the dictionary and the current base is DECIMAL, the input 
number-conversion algorithm shall be extended to recognize floating-point numbers in this form: 
Convertible string := <significand><exponent> 
<significand> := [<sign>]<digits>[.<digits0>] 
<exponent> := E[<sign>]<digits0> 
<sign> := { + | - } 
<digits> := <digit><digits0> 
<digits0> := <digit>* 
<digit> := { 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 } 
These are examples of valid representations of floating-point numbers in program source: 
1E 1.E 1.E0 +1.23E-1 -1.23E+1 
See: 3.4.1.3 Text interpreter input number conversion, 12.6.1.0558 >FLOAT. 
12.4 Additional documentation requirements 
12.4.1 System documentation 
12.4.1.1 Implementation-defined options 
– format and range of floating-point numbers (12.3.1 Data types, 12.6.1.2143 REPRESENT); 
– results of 12.6.1.2143 REPRESENT when float is out of range; 
– rounding or truncation of floating-point numbers (12.3.1.2 Floating-point numbers); 
– size of floating-point stack (12.3.3 Floating-point stack); 
– width of floating-point stack (12.3.3 Floating-point stack). 
12.4.1.2 Ambiguous conditions 
– DF@ or DF! is used with an address that is not double-float aligned; 
– F@ or F! is used with an address that is not float aligned; 
– floating point result out of range (e.g., in 12.6.1.1430 F/); 
– SF@ or SF! is used with an address that is not single-float aligned; 
– BASE is not decimal (12.6.1.2143 REPRESENT, 12.6.2.1427 F., 12.6.2.1513 FE., 12.6.2.1613 FS.); 
– both arguments equal zero (12.6.2.1489 FATAN2); 
– cosine of argument is zero for 12.6.2.1625 FTAN; 
– d can't be precisely represented as float in 12.6.1.1130 D>F; 
– dividing by zero (12.6.1.1430 F/); 
ANSI X3.215-1994 
90 Collating Sequence: 
– exponent too big for conversion (12.6.2.1203 DF!, 12.6.2.1204 DF@, 12.6.2.2202 SF!, 
12.6.2.2203 SF@); 
– float less than one (12.6.2.1477 FACOSH); 
– float less than or equal to minus-one (12.6.2.1554 FLNP1); 
– float less than or equal to zero (12.6.2.1553 FLN, 12.6.2.1557 FLOG); 
– float less than zero (12.6.2.1487 FASINH, 12.6.2.1618 FSQRT); 
– float magnitude greater than one (12.6.2.1476 FACOS, 12.6.2.1486 FASIN, 12.6.2.1491 FATANH); 
– integer part of float can't be represented by d in 12.6.1.1470 F>D; 
– string larger than pictured-numeric output area (12.6.2.1427 F., 12.6.2.1513 FE., 12.6.2.1613 FS.). 
12.4.1.3 Other system documentation 
– no additional requirements. 
12.4.2 Program documentation 
12.4.2.1 Environmental dependencies 
– requiring the floating-point stack to be larger than six items (12.3.3 Floating-point stack). 
12.4.2.2 Other program documentation 
– no additional requirements. 
12.5 Compliance and labeling 
12.5.1 ANS Forth systems 
The phrase “Providing the Floating-Point word set” shall be appended to the label of any Standard System 
that provides all of the Floating-Point word set. 
The phrase “Providing name(s) from the Floating-Point Extensions word set” shall be appended to the label 
of any Standard System that provides portions of the Floating-Point Extensions word set. 
The phrase “Providing the Floating-Point Extensions word set” shall be appended to the label of any 
Standard System that provides all of the Floating-Point and Floating-Point Extensions word sets. 
12.5.2 ANS Forth programs 
The phrase “Requiring the Floating-Point word set” shall be appended to the label of Standard Programs 
that require the system to provide the Floating-Point word set. 
The phrase “Requiring name(s) from the Floating-Point Extensions word set” shall be appended to the label 
of Standard Programs that require the system to provide portions of the Floating-Point Extensions word set. 
The phrase “Requiring the Floating-Point Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the Floating-Point and Floating-Point Extensions word 
sets. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 91 
12.6 Glossary 
12.6.1 Floating-Point words 
12.6.1.0558 >FLOAT “to-float” FLOATING 
( c-addr u -- true | false ) ( F: -- r | ) or ( c-addr u -- r true | false ) 
An attempt is made to convert the string specified by c-addr and u to internal floating-point 
representation. If the string represents a valid floating-point number in the syntax below, its 
value r and true are returned. If the string does not represent a valid floating-point number only 
false is returned. 
A string of blanks should be treated as a special case representing zero. 
The syntax of a convertible string := <significand>[<exponent>] 
<significand> := [<sign>]{<digits>[.<digits0>] | .<digits> } 
<exponent> := <marker><digits0> 
<marker> := {<e-form> | <sign-form>} 
<e-form> := <e-char>[<sign-form>] 
<sign-form> := { + | – } 
<e-char>:= { D | d | E | e } 
12.6.1.1130 D>F “d-to-f” FLOATING 
( d -- ) ( F: -- r ) or ( d -- r ) 
r is the floating-point equivalent of d. An ambiguous condition exists if d cannot be precisely 
represented as a floating-point value. 
12.6.1.1400 F! “f-store” FLOATING 
( f-addr -- ) ( F: r -- ) or ( r f-addr -- ) 
 Store r at f-addr. 
12.6.1.1410 F* “f-star” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
Multiply r1 by r2 giving r3. 
12.6.1.1420 F+ “f-plus” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
Add r1 to r2 giving the sum r3. 
12.6.1.1425 F- “f-minus” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
Subtract r2 from r1, giving r3. 
ANSI X3.215-1994 
92 Collating Sequence: 
12.6.1.1430 F/ “f-slash” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
Divide r1 by r2, giving the quotient r3. An ambiguous condition exists if r2 is zero, or the 
quotient lies outside of the range of a floating-point number. 
12.6.1.1440 F0< “f-zero-less-than” FLOATING 
( -- flag ) ( F: r -- ) or ( r -- flag ) 
flag is true if and only if r is less than zero. 
12.6.1.1450 F0= “f-zero-equals” FLOATING 
( -- flag ) ( F: r -- ) or ( r -- flag ) 
flag is true if and only if r is equal to zero. 
12.6.1.1460 F< “f-less-than” FLOATING 
( -- flag ) ( F: r1 r2 -- ) or ( r1 r2 -- flag ) 
flag is true if and only if r1 is less than r2. 
12.6.1.1470 F>D “f-to-d” FLOATING 
( -- d ) ( F: r -- ) or ( r -- d ) 
d is the double-cell signed-integer equivalent of the integer portion of r. The fractional portion 
of r is discarded. An ambiguous condition exists if the integer portion of r cannot be precisely 
represented as a double-cell signed integer. 
12.6.1.1472 F@ “f-fetch” FLOATING 
( f-addr -- ) ( F: -- r ) or ( f-addr -- r ) 
r is the value stored at f-addr. 
12.6.1.1479 FALIGN “f-align” FLOATING 
( -- ) 
If the data-space pointer is not float aligned, reserve enough data space to make it so. 
12.6.1.1483 FALIGNED “f-aligned” FLOATING 
( addr -- f-addr ) 
f-addr is the first float-aligned address greater than or equal to addr. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 93 
12.6.1.1492 FCONSTANT “f-constant” FLOATING 
( “<spaces>name” -- ) ( F: r -- ) or ( r “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. 
name is referred to as an “f-constant”. 
name Execution: ( -- ) ( F: -- r ) or ( -- r ) 
Place r on the floating-point stack. 
See: 3.4.1 Parsing.
12.6.1.1497 FDEPTH “f-depth” FLOATING 
( -- +n ) 
+n is the number of values contained on the default separate floating-point stack. If floatingpoint numbers are kept on the data stack, +n is the current number of possible floating-point 
values contained on the data stack. 
12.6.1.1500 FDROP “f-drop” FLOATING 
( F: r -- ) or ( r -- ) 
Remove r from the floating-point stack. 
12.6.1.1510 FDUP “f-dupe” FLOATING 
( F: r -- r r ) or ( r -- r r ) 
Duplicate r. 
12.6.1.1552 FLITERAL “f-literal” FLOATING 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( F: r -- ) or ( r -- ) 
Append the run-time semantics given below to the current definition. 
 Run-time: ( F: -- r ) or ( -- r ) 
Place r on the floating-point stack. 
12.6.1.1555 FLOAT+ “float-plus” FLOATING 
( f-addr1 -- f-addr2 ) 
Add the size in address units of a floating-point number to f-addr1, giving f-addr2. 
ANSI X3.215-1994 
94 Collating Sequence: 
12.6.1.1556 FLOATS FLOATING 
( n1 -- n2 ) 
n2 is the size in address units of n1 floating-point numbers. 
12.6.1.1558 FLOOR FLOATING 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
Round r1 to an integral value using the “round toward negative infinity” rule, giving r2. 
12.6.1.1562 FMAX “f-max” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
r3 is the greater of r1 and r2. 
12.6.1.1565 FMIN “f-min” FLOATING 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
r3 is the lesser of r1 and r2. 
12.6.1.1567 FNEGATE “f-negate” FLOATING 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the negation of r1. 
12.6.1.1600 FOVER “f-over” FLOATING 
( F: r1 r2 -- r1 r2 r1 ) or ( r1 r2 -- r1 r2 r1 ) 
Place a copy of r1 on top of the floating-point stack. 
12.6.1.1610 FROT “f-rote” FLOATING 
( F: r1 r2 r3 -- r2 r3 r1 ) or ( r1 r2 r3 -- r2 r3 r1 ) 
Rotate the top three floating-point stack entries. 
12.6.1.1612 FROUND “f-round” FLOATING 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
Round r1 to an integral value using the “round to nearest” rule, giving r2. 
 See: 12.3.2 Floating-point operations. 
12.6.1.1620 FSWAP “f-swap” FLOATING 
( F: r1 r2 -- r2 r1 ) or ( r1 r2 -- r2 r1 ) 
Exchange the top two floating-point stack items. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 95 
12.6.1.1630 FVARIABLE “f-variable” FLOATING 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name
with the execution semantics defined below. Reserve 1 FLOATS address units of data space at 
a float-aligned address. 
name is referred to as an “f-variable”. 
name Execution: ( --f-addr ) 
f-addr is the address of the data space reserved by FVARIABLE when it created name. A 
program is responsible for initializing the contents of the reserved space. 
See: 3.4.1 Parsing.
12.6.1.2143 REPRESENT FLOATING 
( c-addr u -- n flag1 flag2 ) (F: r -- ) or ( r c-addr u -- n flag1 flag2 ) 
At c-addr, place the character-string external representation of the significand of the floatingpoint number r. Return the decimal-base exponent as n, the sign as flag1 and “valid result” as 
flag2. The character string shall consist of the u most significant digits of the significand 
represented as a decimal fraction with the implied decimal point to the left of the first digit, and 
the first digit zero only if all digits are zero. The significand is rounded to u digits following the 
“round to nearest” rule; n is adjusted, if necessary, to correspond to the rounded magnitude of 
the significand. If flag2 is true then r was in the implementation-defined range of floating-point 
numbers. If flag1 is true then r is negative. 
An ambiguous condition exists if the value of BASE is not decimal ten. 
When flag2 is false, n and flag1 are implementation defined, as are the contents of c-addr. 
Under these circumstances, the string at c-addr shall consist of graphic characters. 
 See: 3.2.1.2 Digit conversion, 6.1.0750 BASE, 12.3.2 Floating-point operations. 
12.6.2 Floating-Point extension words 
12.6.2.1203 DF! “d-f-store” FLOATING EXT 
( df-addr -- ) ( F: r -- ) or ( r df-addr -- ) 
Store the floating-point number r as a 64-bit IEEE double-precision number at df-addr. If the 
significand of the internal representation of r has more precision than the IEEE double-precision 
format, it will be rounded using the “round to nearest” rule. An ambiguous condition exists if 
the exponent of r is too large to be accommodated in IEEE double-precision format. 
 See: 12.3.1.1 Addresses, 12.3.2 Floating-point operations. 
ANSI X3.215-1994 
96 Collating Sequence: 
12.6.2.1204 DF@ “d-f-fetch” FLOATING EXT 
( df-addr -- ) ( F: -- r ) or ( df-addr -- r ) 
Fetch the 64-bit IEEE double-precision number stored at df-addr to the floating-point stack as r
in the internal representation. If the IEEE double-precision significand has more precision than 
the internal representation it will be rounded to the internal representation using the “round to 
nearest” rule. An ambiguous condition exists if the exponent of the IEEE double-precision 
representation is too large to be accommodated by the internal representation. 
 See: 12.3.1.1 Addresses, 12.3.2 Floating-point operations. 
12.6.2.1205 DFALIGN “d-f-align” FLOATING EXT 
( -- ) 
If the data-space pointer is not double-float aligned, reserve enough data space to make it so. 
 See: 12.3.1.1 Addresses. 
12.6.2.1207 DFALIGNED “d-f-aligned” FLOATING EXT 
( addr -- df-addr ) 
df-addr is the first double-float-aligned address greater than or equal to addr. 
 See: 12.3.1.1 Addresses. 
12.6.2.1208 DFLOAT+ “d-float-plus” FLOATING EXT 
( df-addr1 -- df-addr2 ) 
Add the size in address units of a 64-bit IEEE double-precision number to df-addr1, giving dfaddr2. 
 See: 12.3.1.1 Addresses. 
12.6.2.1209 DFLOATS “d-floats” FLOATING EXT 
( n1 -- n2 ) 
n2 is the size in address units of n1 64-bit IEEE double-precision numbers. 
12.6.2.1415 F** “f-star-star” FLOATING EXT 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
Raise r1 to the power r2, giving the product r3. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 97 
12.6.2.1427 F. “f-dot” FLOATING EXT 
( -- ) ( F: r -- ) or ( r -- ) 
Display, with a trailing space, the top number on the floating-point stack using fixed-point 
notation: 
[-] <digits>.<digits0> 
An ambiguous condition exists if the value of BASE is not (decimal) ten or if the character 
string representation exceeds the size of the pictured numeric output string buffer. 
See: 12.6.1.0558 >FLOAT. 
12.6.2.1474 FABS “f-abs” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the absolute value of r1. 
12.6.2.1476 FACOS “f-a-cos” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the principal radian angle whose cosine is r1. An ambiguous condition exists if |r1| is 
greater than one. 
12.6.2.1477 FACOSH “f-a-cosh” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the floating-point value whose hyperbolic cosine is r1. An ambiguous condition exists if r1
is less than one. 
12.6.2.1484 FALOG “f-a-log” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
Raise ten to the power r1, giving r2. 
12.6.2.1486 FASIN “f-a-sine” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the principal radian angle whose sine is r1. An ambiguous condition exists if |r1| is greater 
than one. 
12.6.2.1487 FASINH “f-a-cinch” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the floating-point value whose hyperbolic sine is r1. An ambiguous condition exists if r1 is 
less than zero. 
ANSI X3.215-1994 
98 Collating Sequence: 
12.6.2.1488 FATAN “f-a-tan” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the principal radian angle whose tangent is r1. 
12.6.2.1489 FATAN2 “f-a-tan-two” FLOATING EXT 
( F: r1 r2 -- r3 ) or ( r1 r2 -- r3 ) 
r3 is the radian angle whose tangent is r1/r2. An ambiguous condition exists if r1 and r2 are 
zero. 
12.6.2.1491 FATANH “f-a-tan-h” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the floating-point value whose hyperbolic tangent is r1. An ambiguous condition exists if 
r1 is outside the range of -1E0 to 1E0. 
12.6.2.1493 FCOS “f-cos” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the cosine of the radian angle r1. 
12.6.2.1494 FCOSH “f-cosh” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the hyperbolic cosine of r1. 
12.6.2.1513 FE. “f-e-dot” FLOATING EXT 
( -- ) ( F: r -- ) or ( r -- ) 
Display, with a trailing space, the top number on the floating-point stack using engineering 
notation, where the significand is greater than or equal to 1.0 and less than 1000.0 and the 
decimal exponent is a multiple of three. 
An ambiguous condition exists if the value of BASE is not (decimal) ten or if the character 
string representation exceeds the size of the pictured numeric output string buffer. 
See: 6.1.0750 BASE, 12.3.2 Floating-point operations, 12.6.1.2143 REPRESENT. 
12.6.2.1515 FEXP “f-e-x-p” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
Raise e to the power r1, giving r2. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 99 
12.6.2.1516 FEXPM1 “f-e-x-p-m-one” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
Raise e to the power r1 and subtract one, giving r2. 
12.6.2.1553 FLN “f-l-n” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the natural logarithm of r1. An ambiguous condition exists if r1 is less than or equal to 
zero. 
12.6.2.1554 FLNP1 “f-l-n-p-one” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the natural logarithm of the quantity r1 plus one. An ambiguous condition exists if r1 is 
less than or equal to negative one. 
12.6.2.1557 FLOG “f-log” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the base-ten logarithm of r1. An ambiguous condition exists if r1 is less than or equal to 
zero. 
12.6.2.1613 FS. “f-s-dot” FLOATING EXT 
( -- ) ( F: r -- ) or ( r -- ) 
Display, with a trailing space, the top number on the floating-point stack in scientific notation: 
<significand><exponent> 
where: 
<significand> := [–]<digit>.<digits0> 
<exponent> := E[–]<digits> 
An ambiguous condition exists if the value of BASE is not (decimal) ten or if the character 
string representation exceeds the size of the pictured numeric output string buffer. 
See: 6.1.0750 BASE, 12.3.2 Floating-point operations, 12.6.1.2143 REPRESENT. 
12.6.2.1614 FSIN “f-sine” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the sine of the radian angle r1. 
ANSI X3.215-1994 
100 Collating Sequence: 
12.6.2.1616 FSINCOS “f-sine-cos” FLOATING EXT 
( F: r1 -- r2 r3 ) or ( r1 -- r2 r3 ) 
r2 is the sine of the radian angle r1. r3 is the cosine of the radian angle r1. 
12.6.2.1617 FSINH “f-cinch” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the hyperbolic sine of r1. 
12.6.2.1618 FSQRT “f-square-root” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the square root of r1. An ambiguous condition exists if r1 is less than zero. 
12.6.2.1625 FTAN “f-tan” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the tangent of the radian angle r1. An ambiguous condition exists if cos(r1) is zero. 
12.6.2.1626 FTANH “f-tan-h” FLOATING EXT 
( F: r1 -- r2 ) or ( r1 -- r2 ) 
r2 is the hyperbolic tangent of r1. 
12.6.2.1640 F~ “f-proximate” FLOATING EXT 
( -- flag ) ( F: r1 r2 r3 -- ) or ( r1 r2 r3 -- flag ) 
If r3 is positive, flag is true if the absolute value of (r1 minus r2) is less than r3. 
If r3 is zero, flag is true if the implementation-dependent encoding of r1 and r2 are exactly 
identical (positive and negative zero are unequal if they have distinct encodings). 
If r3 is negative, flag is true if the absolute value of (r1 minus r2) is less than the absolute value 
of r3 times the sum of the absolute values of r1 and r2. 
12.6.2.2035 PRECISION FLOATING EXT 
( -- u ) 
Return the number of significant digits currently used by F., FE., or FS. as u. 
12.6.2.2200 SET-PRECISION FLOATING EXT 
( u -- ) 
Set the number of significant digits currently used by F., FE., or FS. to u. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 101 
12.6.2.2202 SF! “s-f-store” FLOATING EXT 
( sf-addr -- ) ( F: r -- ) or ( r sf-addr -- ) 
Store the floating-point number r as a 32-bit IEEE single-precision number at sf-addr. If the 
significand of the internal representation of r has more precision than the IEEE single-precision 
format, it will be rounded using the “round to nearest” rule. An ambiguous condition exists if 
the exponent of r is too large to be accommodated by the IEEE single-precision format. 
See: 12.3.1.1 Addresses, 12.3.2 Floating-point operations. 
12.6.2.2203 SF@ “s-f-fetch” FLOATING EXT 
( sf-addr -- ) ( F: -- r ) or ( sf-addr -- r ) 
Fetch the 32-bit IEEE single-precision number stored at sf-addr to the floating-point stack as r
in the internal representation. If the IEEE single-precision significand has more precision than 
the internal representation, it will be rounded to the internal representation using the “round to 
nearest” rule. An ambiguous condition exists if the exponent of the IEEE single-precision 
representation is too large to be accommodated by the internal representation. 
See: 12.3.1.1 Addresses, 12.3.2 Floating-point operations. 
12.6.2.2204 SFALIGN “s-f-align” FLOATING EXT 
( -- ) 
If the data-space pointer is not single-float aligned, reserve enough data space to make it so. 
See: 12.3.1.1 Addresses. 
12.6.2.2206 SFALIGNED “s-f-aligned” FLOATING EXT 
( addr -- sf-addr ) 
sf-addr is the first single-float-aligned address greater than or equal to addr. 
See: 12.3.1.1 Addresses. 
12.6.2.2207 SFLOAT+ “s-float-plus” FLOATING EXT 
( sf-addr1 -- sf-addr2 ) 
Add the size in address units of a 32-bit IEEE single-precision number to sf-addr1, giving sfaddr2. 
See: 12.3.1.1 Addresses. 
12.6.2.2208 SFLOATS “s-floats” FLOATING EXT 
( n1 -- n2 ) 
n2 is the size in address units of n1 32-bit IEEE single-precision numbers. 
See: 12.3.1.1 Addresses. 
ANSI X3.215-1994 
102 Collating Sequence: 
13. The optional Locals word set 
13.1 Introduction 
See: Annex A.13 The Locals Word Set. 
13.2 Additional terms and notation 
None. 
13.3 Additional usage requirements 
13.3.1 Locals 
A local is a data object whose execution semantics shall return its value, whose scope shall be limited to the 
definition in which it is declared, and whose use in a definition shall not preclude reentrancy or recursion. 
13.3.2 Environmental queries 
Append table 13.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 13.1 – Environmental query strings 
String Value data type Constant? Meaning 
#LOCALS n yes maximum number of local variables in a 
definition 
LOCALS flag no locals word set present 
LOCALS-EXT flag no locals extensions word set present 
13.3.3 Processing locals 
To support the locals word set, a system shall provide a mechanism to receive the messages defined by 
(LOCAL) and respond as described here. 
During the compilation of a definition after : (colon), :NONAME, or DOES>, a program may begin sending 
local identifier messages to the system. The process shall begin when the first message is sent. The process 
shall end when the “last local” message is sent. The system shall keep track of the names, order, and 
number of identifiers contained in the complete sequence. 
13.3.3.1 Compilation semantics 
The system, upon receipt of a sequence of local-identifier messages, shall take the following actions at 
compile time: 
a) Create temporary dictionary entries for each of the identifiers passed to (LOCAL), such that each 
identifier will behave as a local. These temporary dictionary entries shall vanish at the end of the 
definition, denoted by ; (semicolon), ;CODE, or DOES>. The system need not maintain these 
identifiers in the same way it does other dictionary entries as long as they can be found by normal 
dictionary searching processes. Furthermore, if the Search-Order word set is present, local identifiers 
shall always be searched before any of the word lists in any definable search order, and none of the 
Search-Order words shall change the locals’ privileged position in the search order. Local identifiers 
may reside in mass storage. 
b) For each identifier passed to (LOCAL), the system shall generate an appropriate code sequence that 
does the following at execution time: 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 103 
1) Allocate a storage resource adequate to contain the value of a local. The storage shall be allocated 
in a way that does not preclude re-entrancy or recursion in the definition using the local. 
2) Initialize the value using the top item on the data stack. If more than one local is declared, the top 
item on the stack shall be moved into the first local identified, the next item shall be moved into the 
second, and so on. 
 The storage resource may be the return stack or may be implemented in other ways, such as in registers. 
The storage resource shall not be the data stack. Use of locals shall not restrict use of the data stack 
before or after the point of declaration. 
c) Arrange that any of the legitimate methods of terminating execution of a definition, specifically ;
(semicolon), ;CODE, DOES> or EXIT, will release the storage resource allocated for the locals, if any, 
declared in that definition. ABORT shall release all local storage resources, and CATCH / THROW (if 
implemented) shall release such resources for all definitions whose execution is being terminated. 
d) Separate sets of locals may be declared in defining words before DOES> for use by the defining word, 
and after DOES> for use by the word defined. 
A system implementing the Locals word set shall support the declaration of at least eight locals in a 
definition. 
13.3.3.2 Syntax restrictions 
Immediate words in a program may use (LOCAL) to implement syntaxes for local declarations with the 
following restrictions: 
a) A program shall not compile any executable code into the current definition between the time 
(LOCAL) is executed to identify the first local for that definition and the time of sending the single 
required “last local” message; 
b) The position in program source at which the sequence of (LOCAL) messages is sent, referred to here 
as the point at which locals are declared, shall not lie within the scope of any control structure; 
c) Locals shall not be declared until values previously placed on the return stack within the definition have 
been removed; 
d) After a definition’s locals have been declared, a program may place data on the return stack. However, 
if this is done, locals shall not be accessed until those values have been removed from the return stack; 
e) Words that return execution tokens, such as ' (tick), ['], or FIND, shall not be used with local names; 
f) A program that declares more than eight locals in a single definition has an environmental dependency; 
g) Locals may be accessed or updated within control structures, including do-loops; 
h) Local names shall not be referenced by POSTPONE and [COMPILE]. 
See: 3.4 The Forth text interpreter. 
13.4 Additional documentation requirements 
13.4.1 System documentation 
13.4.1.1 Implementation-defined options 
– maximum number of locals in a definition (13.3.3 Processing locals, 13.6.2.1795 LOCALS|). 
13.4.1.2 Ambiguous conditions 
– executing a named local while in interpretation state (13.6.1.0086 (LOCAL)); 
– name not defined by VALUE or LOCAL (13.6.1.2295 TO). 
13.4.1.3 Other system documentation 
– no additional requirements. 
ANSI X3.215-1994 
104 Collating Sequence: 
13.4.2 Program documentation 
13.4.2.1 Environmental dependencies 
– declaring more than eight locals in a single definition (13.3.3 Processing locals). 
13.4.2.2 Other program documentation 
– no additional requirements. 
13.5 Compliance and labeling 
13.5.1 ANS Forth systems 
The phrase “Providing the Locals word set” shall be appended to the label of any Standard System that 
provides all of the Locals word set. 
The phrase “Providing name(s) from the Locals Extensions word set” shall be appended to the label of any 
Standard System that provides portions of the Locals Extensions word set. 
The phrase “Providing the Locals Extensions word set” shall be appended to the label of any Standard 
System that provides all of the Locals and Locals Extensions word sets. 
13.5.2 ANS Forth programs 
The phrase “Requiring the Locals word set” shall be appended to the label of Standard Programs that 
require the system to provide the Locals word set. 
The phrase “Requiring name(s) from the Locals Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the Locals Extensions word set. 
The phrase “Requiring the Locals Extensions word set” shall be appended to the label of Standard Programs 
that require the system to provide all of the Locals and Locals Extensions word sets. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 105 
13.6 Glossary 
13.6.1 Locals words 
13.6.1.0086 (LOCAL) “paren-local-paren” LOCAL 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( c-addr u -- ) 
When executed during compilation, (LOCAL) passes a message to the system that has one of 
two meanings. If u is non-zero, the message identifies a new local whose definition name is 
given by the string of characters identified by c-addr u. If u is zero, the message is “last local” 
and c-addr has no significance. 
The result of executing (LOCAL) during compilation of a definition is to create a set of named 
local identifiers, each of which is a definition name, that only have execution semantics within 
the scope of that definition’s source. 
local Execution: ( -- x ) 
Push the local’s value, x, onto the stack. The local’s value is initialized as described in 13.3.3 
Processing locals and may be changed by preceding the local’s name with TO. An ambiguous 
condition exists when local is executed while in interpretation state. 
 Note: This word does not have special compilation semantics in the usual sense because it provides 
access to a system capability for use by other user-defined words that do have them. However, 
the locals facility as a whole and the sequence of messages passed defines specific usage rules 
with semantic implications that are described in detail in section 13.3.3 Processing locals. 
 Note: This word is not intended for direct use in a definition to declare that definition’s locals. It is 
instead used by system or user compiling words. These compiling words in turn define their 
own syntax, and may be used directly in definitions to declare locals. In this context, the syntax 
for (LOCAL) is defined in terms of a sequence of compile-time messages and is described in 
detail in section 13.3.3 Processing locals. 
 Note: The Locals word set modifies the syntax and semantics of 6.2.2295 TO as defined in the Core 
Extensions word set. 
See: 3.4 The Forth text interpreter.
ANSI X3.215-1994 
106 Collating Sequence: 
13.6.1.2295 TO LOCAL 
Extend the semantics of 6.2.2295 TO to be: 
 Interpretation: ( x “<spaces>name” -- ) 
Skip leading spaces and parse name delimited by a space. Store x in name. An ambiguous 
condition exists if name was not defined by VALUE. 
 Compilation: ( “<spaces>name” -- ) 
Skip leading spaces and parse name delimited by a space. Append the run-time semantics given 
below to the current definition. An ambiguous condition exists if name was not defined by 
either VALUE or (LOCAL). 
 Run-time: ( x -- ) 
Store x in name. 
 Note: An ambiguous condition exists if either POSTPONE or [COMPILE] is applied to TO. 
 See: 3.4.1 Parsing, 6.2.2295 TO, 6.2.2405 VALUE, 13.6.1.0086 (LOCAL).
13.6.2 Locals extension words 
13.6.2.1795 LOCALS| “locals-bar” LOCAL EXT
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( “<spaces>name1” “<spaces>name2” ... “<spaces>namen” “|” -- ) 
Create up to eight local identifiers by repeatedly skipping leading spaces, parsing name, and 
executing 13.6.1.0086 (LOCAL). The list of locals to be defined is terminated by |. Append 
the run-time semantics given below to the current definition. 
 Run-time: ( xn ... x2 x1 -- ) 
Initialize up to eight local identifiers as described in 13.6.1.0086 (LOCAL), each of which 
takes as its initial value the top stack item, removing it from the stack. Identifier name1 is 
initialized with x1, identifier name2 with x2, etc. When invoked, each local will return its value. 
The value of a local may be changed using 13.6.1.2295 TO. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 107 
14. The optional Memory-Allocation word set 
14.1 Introduction 
14.2 Additional terms and notation 
None. 
14.3 Additional usage requirements 
14.3.1 I/O Results data type 
I/O results are single-cell numbers indicating the result of I/O operations. A value of zero indicates that the 
I/O operation completed successfully; other values and their meanings are implementation-defined. 
Append table 14.1 to table 3.1. 
Table 14.1 – Data types 
Symbol Data type Size on stack 
ior I/O results 1 cell 
14.3.2 Environmental queries 
Append table 14.2 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 14.2 – Environmental query strings 
String Value data type Constant? Meaning 
MEMORY-ALLOC flag no memory-allocation word set present 
MEMORY-ALLOC-EXT flag no memory-allocation extensions word set 
present 
14.3.3 Allocated regions 
A program may address memory in data space regions made available by ALLOCATE or RESIZE and not 
yet released by FREE. 
See: 3.3.3 Data space. 
14.4 Additional documentation requirements 
14.4.1 System documentation 
14.4.1.1 Implementation-defined options 
– values and meaning of ior (14.3.1 I/O Results data type, 14.6.1.0707 ALLOCATE, 14.6.1.1605 FREE, 
14.6.1.2145 RESIZE). 
14.4.1.2 Ambiguous conditions 
– no additional requirements. 
ANSI X3.215-1994 
108 Collating Sequence: 
14.4.1.3 Other system documentation 
– no additional requirements. 
14.4.2 Program documentation 
– no additional requirements. 
14.5 Compliance and labeling 
14.5.1 ANS Forth systems 
The phrase “Providing the Memory-Allocation word set” shall be appended to the label of any Standard 
System that provides all of the Memory-Allocation word set. 
The phrase “Providing name(s) from the Memory-Allocation Extensions word set” shall be appended to the 
label of any Standard System that provides portions of the Memory-Allocation Extensions word set. 
The phrase “Providing the Memory-Allocation Extensions word set” shall be appended to the label of any 
Standard System that provides all of the Memory-Allocation and Memory-Allocation Extensions word sets. 
14.5.2 ANS Forth programs 
The phrase “Requiring the Memory-Allocation word set” shall be appended to the label of Standard 
Programs that require the system to provide the Memory-Allocation word set. 
The phrase “Requiring name(s) from the Memory-Allocation Extensions word set” shall be appended to the 
label of Standard Programs that require the system to provide portions of the Memory-Allocation 
Extensions word set. 
The phrase “Requiring the Memory-Allocation Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide all of the Memory-Allocation and Memory-Allocation 
Extensions word sets. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 109 
14.6 Glossary 
14.6.1 Memory-Allocation words 
14.6.1.0707 ALLOCATE MEMORY
( u -- a-addr ior ) 
Allocate u address units of contiguous data space. The data-space pointer is unaffected by this 
operation. The initial content of the allocated space is undefined. 
If the allocation succeeds, a-addr is the aligned starting address of the allocated space and ior is 
zero. 
If the operation fails, a-addr does not represent a valid address and ior is the implementationdefined I/O result code. 
 See: 6.1.1650 HERE, 14.6.1.1605 FREE, 14.6.1.2145 RESIZE. 
14.6.1.1605 FREE MEMORY 
( a-addr -- ior ) 
Return the contiguous region of data space indicated by a-addr to the system for later 
allocation. a-addr shall indicate a region of data space that was previously obtained by 
ALLOCATE or RESIZE. The data-space pointer is unaffected by this operation. 
If the operation succeeds, ior is zero. If the operation fails, ior is the implementation-defined 
I/O result code. 
See: 6.1.1650 HERE, 14.6.1.0707 ALLOCATE, 14.6.1.2145 RESIZE. 
14.6.1.2145 RESIZE MEMORY 
( a-addr1 u -- a-addr2 ior ) 
Change the allocation of the contiguous data space starting at the address a-addr1, previously 
allocated by ALLOCATE or RESIZE, to u address units. u may be either larger or smaller than 
the current size of the region. The data-space pointer is unaffected by this operation. 
If the operation succeeds, a-addr2 is the aligned starting address of u address units of allocated 
memory and ior is zero. a-addr2 may be, but need not be, the same as a-addr1. If they are not 
the same, the values contained in the region at a-addr1 are copied to a-addr2, up to the 
minimum size of either of the two regions. If they are the same, the values contained in the 
region are preserved to the minimum of u or the original size. If a-addr2 is not the same as aaddr1, the region of memory at a-addr1 is returned to the system according to the operation of 
FREE. 
If the operation fails, a-addr2 equals a-addr1, the region of memory at a-addr1 is unaffected, 
and ior is the implementation-defined I/O result code. 
 See: 6.1.1650 HERE, 14.6.1.0707 ALLOCATE, 14.6.1.1605 FREE. 
14.6.2 Memory-Allocation extension words 
None 
ANSI X3.215-1994 
110 Collating Sequence: 
15. The optional Programming-Tools word set 
15.1 Introduction 
This optional word set contains words most often used during the development of applications. 
15.2 Additional terms and notation 
None. 
15.3 Additional usage requirements 
15.3.1 Environmental queries 
Append table 15.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 15.1 – Environmental query strings 
String Value data type Constant? Meaning 
TOOLS flag no programming-tools word set present 
TOOLS-EXT flag no programming-tools extensions word set 
present 
15.3.2 The Forth dictionary 
A program using the words CODE or ;CODE associated with assembler code has an environmental 
dependency on that particular instruction set and assembler notation. 
Programs using the words EDITOR or ASSEMBLER require the Search Order word set or an equivalent 
implementation-defined capability. 
See: 3.3 The Forth dictionary. 
15.4 Additional documentation requirements 
15.4.1 System documentation 
15.4.1.1 Implementation-defined options 
– ending sequence for input following 15.6.2.0470 ;CODE and 15.6.2.0930 CODE; 
– manner of processing input following 15.6.2.0470 ;CODE and 15.6.2.0930 CODE; 
– search-order capability for 15.6.2.1300 EDITOR and 15.6.2.0740 ASSEMBLER (15.3.3 The Forth 
dictionary); 
– source and format of display by 15.6.1.2194 SEE. 
15.4.1.2 Ambiguous conditions 
– deleting the compilation word-list (15.6.2.1580 FORGET); 
– fewer than u+1 items on control-flow stack (15.6.2.1015 CSPICK, 15.6.2.1020 CSROLL); 
– name can't be found (15.6.2.1580 FORGET); 
– name not defined via 6.1.1000 CREATE (15.6.2.0470 ;CODE); 
– 6.1.2033 POSTPONE applied to 15.6.2.2532 [IF]; 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 111 
– reaching the end of the input source before matching 15.6.2.2531 [ELSE] or 15.6.2.2533 [THEN]
(15.6.2.2532 [IF]); 
– removing a needed definition (15.6.2.1580 FORGET). 
15.4.1.3 Other system documentation 
– no additional requirements. 
15.4.2 Program documentation 
15.4.2.1 Environmental dependencies 
– using the words 15.6.2.0470 ;CODE or 15.6.2.0930 CODE. 
15.4.2.2 Other program documentation 
– no additional requirements. 
15.5 Compliance and labeling 
15.5.1 ANS Forth systems 
The phrase “Providing the Programming-Tools word set” shall be appended to the label of any Standard 
System that provides all of the Programming-Tools word set. 
The phrase “Providing name(s) from the Programming-Tools Extensions word set” shall be appended to the 
label of any Standard System that provides portions of the Programming-Tools Extensions word set. 
The phrase “Providing the Programming-Tools Extensions word set” shall be appended to the label of any 
Standard System that provides all of the Programming-Tools and Programming-Tools Extensions word sets. 
15.5.2 ANS Forth programs 
The phrase “Requiring the Programming-Tools word set” shall be appended to the label of Standard 
Programs that require the system to provide the Programming-Tools word set. 
The phrase “Requiring name(s) from the Programming-Tools Extensions word set” shall be appended to the 
label of Standard Programs that require the system to provide portions of the Programming-Tools 
Extensions word set. 
The phrase “Requiring the Programming-Tools Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide all of the Programming-Tools and ProgrammingTools Extensions word sets. 
ANSI X3.215-1994 
112 Collating Sequence: 
15.6 Glossary 
15.6.1 Programming-Tools words 
15.6.1.0220 .S “dot-s” TOOLS 
( -- ) 
Copy and display the values currently on the data stack. The format of the display is 
implementation-dependent. 
.S may be implemented using pictured numeric output words. Consequently, its use may 
corrupt the transient region identified by #>. 
See: 3.3.3.6 Other transient regions. 
15.6.1.0600 ? “question” TOOLS 
( a-addr -- ) 
Display the value stored at a-addr. 
? may be implemented using pictured numeric output words. Consequently, its use may corrupt 
the transient region identified by #>. 
See: 3.3.3.6 Other transient regions. 
15.6.1.1280 DUMP TOOLS 
( addr u -- ) 
Display the contents of u consecutive addresses starting at addr. The format of the display is 
implementation dependent. 
DUMP may be implemented using pictured numeric output words. Consequently, its use may 
corrupt the transient region identified by #>. 
See: 3.3.3.6 Other Transient Regions. 
15.6.1.2194 SEE TOOLS 
( “<spaces>name” -- ) 
Display a human-readable representation of the named word’s definition. The source of the 
representation (object-code decompilation, source block, etc.) and the particular form of the 
display is implementation defined. 
SEE may be implemented using pictured numeric output words. Consequently, its use may 
corrupt the transient region identified by #>. 
See: 3.3.3.6 Other transient regions. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 113 
15.6.1.2465 WORDS TOOLS 
( -- ) 
List the definition names in the first word list of the search order. The format of the display is 
implementation-dependent. 
WORDS may be implemented using pictured numeric output words. Consequently, its use may 
corrupt the transient region identified by #>. 
See: 3.3.3.6 Other Transient Regions. 
15.6.2 Programming-Tools extension words 
15.6.2.0470 ;CODE “semicolon-code” TOOLS EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( C: colon-sys -- ) 
Append the run-time semantics below to the current definition. End the current definition, 
allow it to be found in the dictionary, and enter interpretation state, consuming colon-sys. 
Subsequent characters in the parse area typically represent source code in a programming 
language, usually some form of assembly language. Those characters are processed in an 
implementation-defined manner, generating the corresponding machine code. The process 
continues, refilling the input buffer as needed, until an implementation-defined ending sequence 
is processed. 
 Run-time: ( -- ) ( R: nest-sys -- ) 
Replace the execution semantics of the most recent definition with the name execution 
semantics given below. Return control to the calling definition specified by nest-sys. An 
ambiguous condition exists if the most recent definition was not defined with CREATE or a 
user-defined word that calls CREATE. 
name Execution: ( i*x -- j*x ) 
Perform the machine code sequence that was generated following ;CODE. 
 See: 6.1.1250 DOES>. 
15.6.2.0702 AHEAD TOOLS EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
Compilation: ( C: -- orig ) 
Put the location of a new unresolved forward reference orig onto the control flow stack. 
Append the run-time semantics given below to the current definition. The semantics are 
incomplete until orig is resolved (e.g., by THEN). 
 Run-time: ( -- ) 
Continue execution at the location specified by the resolution of orig. 
ANSI X3.215-1994 
114 Collating Sequence: 
15.6.2.0740 ASSEMBLER TOOLS EXT 
( -- ) 
Replace the first word list in the search order with the ASSEMBLER word list. 
 See: 16. The optional Search-Order word set. 
15.6.2.0830 BYE TOOLS EXT 
( -- ) 
Return control to the host operating system, if any. 
15.6.2.0930 CODE TOOLS EXT 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name, 
called a “code definition”, with the execution semantics defined below. 
Subsequent characters in the parse area typically represent source code in a programming 
language, usually some form of assembly language. Those characters are processed in an 
implementation-defined manner, generating the corresponding machine code. The process 
continues, refilling the input buffer as needed, until an implementation-defined ending sequence 
is processed. 
name Execution: ( i*x -- j*x ) 
Execute the machine code sequence that was generated following CODE. 
See: 3.4.1 Parsing.
15.6.2.1015 CS-PICK “c-s-pick” TOOLS EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( C: destu ... orig0|dest0 -- destu ... orig0|dest0 destu ) 
( S: u -- ) 
Remove u. Copy destu to the top of the control-flow stack. An ambiguous condition exists if 
there are less than u+1 items, each of which shall be an orig or dest, on the control-flow stack 
before CS-PICK is executed. 
If the control-flow stack is implemented using the data stack, u shall be the topmost item on the 
data stack. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 115 
15.6.2.1020 CS-ROLL “c-s-roll” TOOLS EXT 
 Interpretation: Interpretation semantics for this word are undefined. 
 Execution: ( C: origu|destu origu-1|destu-1 ... orig0|dest0 -- origu-1|destu-1 ... orig0|dest0 origu|destu ) 
( S: u -- ) 
Remove u. Rotate u+1 elements on top of the control-flow stack so that origu|destu is on top of 
the control-flow stack. An ambiguous condition exists if there are less than u+1 items, each of 
which shall be an orig or dest, on the control-flow stack before CS-ROLL is executed. 
If the control-flow stack is implemented using the data stack, u shall be the topmost item on the 
data stack. 
15.6.2.1300 EDITOR TOOLS EXT 
( -- ) 
Replace the first word list in the search order with the EDITOR word list. 
 See: 16. The Optional Search-Order Word Set. 
15.6.2.1580 FORGET TOOLS EXT 
( “<spaces>name” -- ) 
Skip leading space delimiters. Parse name delimited by a space. Find name, then delete name
from the dictionary along with all words added to the dictionary after name. An ambiguous 
condition exists if name cannot be found. 
If the Search-Order word set is present, FORGET searches the compilation word list. An 
ambiguous condition exists if the compilation word list is deleted. 
An ambiguous condition exists if FORGET removes a word required for correct execution. 
Note: This word is obsolescent and is included as a concession to existing implementations.
See: 3.4.1 Parsing.
15.6.2.2250 STATE TOOLS EXT 
( -- a-addr ) 
Extend the semantics of 6.1.2250 STATE to allow ;CODE to change the value in STATE. A 
program shall not directly alter the contents of STATE. 
 See: 3.4 The Forth text interpreter, 6.1.0450 :, 6.1.0460 ;, 6.1.0670 ABORT, 6.1.2050 QUIT, 
6.1.2250 STATE, 6.1.2500 [, 6.1.2540 ], 6.2.0455 :NONAME, 15.6.2.0470 ;CODE. 
ANSI X3.215-1994 
116 Collating Sequence: 
15.6.2.2531 [ELSE] “bracket-else” TOOLS EXT
 Compilation: Perform the execution semantics given below. 
 Execution: ( “<spaces>name ... ” -- ) 
Skipping leading spaces, parse and discard space-delimited words from the parse area, including 
nested occurrences of [IF] ... [THEN] and [IF] ... [ELSE] ... [THEN], until 
the word [THEN] has been parsed and discarded. If the parse area becomes exhausted, it is 
refilled as with REFILL. [ELSE] is an immediate word. 
See: 3.4.1 Parsing. 
15.6.2.2532 [IF] “bracket-if” TOOLS EXT
 Compilation: Perform the execution semantics given below. 
 Execution: ( flag | flag “<spaces>name ... ” -- ) 
If flag is true, do nothing. Otherwise, skipping leading spaces, parse and discard spacedelimited words from the parse area, including nested occurrences of [IF] ... [THEN] and 
[IF] ... [ELSE] ... [THEN], until either the word [ELSE] or the word [THEN] has 
been parsed and discarded. If the parse area becomes exhausted, it is refilled as with REFILL. 
[IF] is an immediate word. 
An ambiguous condition exists if [IF] is POSTPONEd, or if the end of the input buffer is 
reached and cannot be refilled before the terminating [ELSE] or [THEN] is parsed. 
See: 3.4.1 Parsing. 
15.6.2.2533 [THEN] “bracket-then” TOOLS EXT
 Compilation: Perform the execution semantics given below. 
 Execution: ( -- ) 
Does nothing. [THEN] is an immediate word. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 117 
16. The optional Search-Order word set 
16.1 Introduction 
16.2 Additional terms and notation 
compilation word list: The word list into which new definition names are placed. 
search order: A list of word lists specifying the order in which the dictionary will be searched. 
16.3 Additional usage requirements 
16.3.1 Data types 
Word list identifiers are implementation-dependent single-cell values that identify word lists. 
Append table 16.1 to table 3.1. 
Table 16.1 – Data types 
Symbol Data type Size on stack 
wid word list identifiers 1 cell 
See: 3.1 Data types, 3.4.2 Finding definition names, 3.4 The Forth text interpreter. 
16.3.2 Environmental queries 
Append table 16.2 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 16.2 – Environmental query strings 
String Value data type Constant? Meaning 
SEARCH-ORDER flag no search-order word set present 
SEARCH-ORDER-EXT flag no search-order extensions word set present 
WORDLISTS n yes maximum number of word lists usable in the 
search order 
16.3.3 Finding definition names 
When searching a word list for a definition name, the system shall search each word list from its last 
definition to its first. The search may encompass only a single word list, as with SEARCH-WORDLIST, or 
all the word lists in the search order, as with the text interpreter and FIND. 
Changing the search order shall only affect the subsequent finding of definition names in the dictionary. 
A system with the Search-Order word set shall allow at least eight word lists in the search order. 
An ambiguous condition exists if a program changes the compilation word list during the compilation of a 
definition or before modification of the behavior of the most recently compiled definition with ;CODE, 
DOES>, or IMMEDIATE. 
A program that requires more than eight word lists in the search order has an environmental dependency. 
See: 3.4.2 Finding definition names
ANSI X3.215-1994 
118 Collating Sequence: 
16.3.4 Contiguous regions 
The regions of data space produced by the operations described in 3.3.3.2 Contiguous regions may be noncontiguous if WORDLIST is executed between allocations. 
16.4 Additional documentation requirements 
16.4.1 System documentation 
16.4.1.1 Implementation-defined options 
– maximum number of word lists in the search order (16.3.3 Finding definition names, 16.6.1.2197 
SET-ORDER); 
– minimum search order (16.6.1.2197 SET-ORDER, 16.6.2.1965 ONLY). 
16.4.1.2 Ambiguous conditions 
– changing the compilation word list (16.3.3 Finding definition names); 
– search order empty (16.6.2.2037 PREVIOUS); 
– too many word lists in search order (16.6.2.0715 ALSO). 
16.4.1.3 Other system documentation 
– no additional requirements. 
16.4.2 Program documentation 
16.4.2.1 Environmental dependencies 
– requiring more than eight word-lists in the search order (16.3.3 Finding definition names). 
16.4.2.2 Other program documentation 
– no additional requirements. 
16.5 Compliance and labeling 
16.5.1 ANS Forth systems 
The phrase “Providing the Search-Order word set” shall be appended to the label of any Standard System 
that provides all of the Search-Order word set. 
The phrase “Providing name(s) from the Search-Order Extensions word set” shall be appended to the label 
of any Standard System that provides portions of the Search-Order Extensions word set. 
The phrase “Providing the Search-Order Extensions word set” shall be appended to the label of any 
Standard System that provides all of the Search-Order and Search-Order Extensions word sets. 
16.5.2 ANS Forth programs 
The phrase “Requiring the Search-Order word set” shall be appended to the label of Standard Programs that 
require the system to provide the Search-Order word set. 
The phrase “Requiring name(s) from the Search-Order Extensions word set” shall be appended to the label 
of Standard Programs that require the system to provide portions of the Search-Order Extensions word set. 
The phrase “Requiring the Search-Order Extensions word set” shall be appended to the label of Standard 
Programs that require the system to provide all of the Search-Order and Search-Order Extensions word sets. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 119 
16.6 Glossary 
16.6.1 Search-Order words 
16.6.1.1180 DEFINITIONS SEARCH 
( -- ) 
Make the compilation word list the same as the first word list in the search order. Specifies that 
the names of subsequent definitions will be placed in the compilation word list. Subsequent 
changes in the search order will not affect the compilation word list. 
See: 16.3.3 Finding Definition Names. 
16.6.1.1550 FIND SEARCH 
Extend the semantics of 6.1.1550 FIND to be: 
( c-addr -- c-addr 0 | xt 1 | xt -1 ) 
Find the definition named in the counted string at c-addr. If the definition is not found after 
searching all the word lists in the search order, return c-addr and zero. If the definition is 
found, return xt. If the definition is immediate, also return one (1); otherwise also return minusone (-1). For a given string, the values returned by FIND while compiling may differ from 
those returned while not compiling. 
 See: 3.4.2 Finding definition names, 6.1.0070 ', 6.1.1550 FIND, 6.1.2033 POSTPONE, 
6.1.2510 ['], D.6.7 Immediacy. 
16.6.1.1595 FORTH-WORDLIST SEARCH 
( -- wid ) 
Return wid, the identifier of the word list that includes all standard words provided by the 
implementation. This word list is initially the compilation word list and is part of the initial 
search order. 
16.6.1.1643 GET-CURRENT SEARCH 
( -- wid ) 
Return wid, the identifier of the compilation word list. 
16.6.1.1647 GET-ORDER SEARCH 
( -- widn ... wid1 n ) 
Returns the number of word lists n in the search order and the word list identifiers widn ... wid1
identifying these word lists. wid1 identifies the word list that is searched first, and widn the 
word list that is searched last. The search order is unaffected. 
ANSI X3.215-1994 
120 Collating Sequence: 
16.6.1.2192 SEARCH-WORDLIST SEARCH 
( c-addr u wid -- 0 | xt 1 | xt -1 ) 
Find the definition identified by the string c-addr u in the word list identified by wid. If the 
definition is not found, return zero. If the definition is found, return its execution token xt and 
one (1) if the definition is immediate, minus-one (-1) otherwise. 
16.6.1.2195 SET-CURRENT SEARCH 
( wid -- ) 
Set the compilation word list to the word list identified by wid. 
16.6.1.2197 SET-ORDER SEARCH 
( widn ... wid1 n -- ) 
Set the search order to the word lists identified by widn ... wid1. Subsequently, word list wid1
will be searched first, and word list widn searched last. If n is zero, empty the search order. If n
is minus one, set the search order to the implementation-defined minimum search order. The 
minimum search order shall include the words FORTH-WORDLIST and SET-ORDER. A 
system shall allow n to be at least eight. 
16.6.1.2460 WORDLIST SEARCH 
( -- wid ) 
Create a new empty word list, returning its word list identifier wid. The new word list may be 
returned from a pool of preallocated word lists or may be dynamically allocated in data space. 
A system shall allow the creation of at least 8 new word lists in addition to any provided as part 
of the system. 
16.6.2 Search-Order extension words 
16.6.2.0715 ALSO SEARCH EXT 
( -- ) 
Transform the search order consisting of widn, ... wid2, wid1 (where wid1 is searched first) into 
widn, ... wid2, wid1, wid1. An ambiguous condition exists if there are too many word lists in the 
search order. 
16.6.2.1590 FORTH SEARCH EXT 
( -- ) 
Transform the search order consisting of widn, ... wid2, wid1 (where wid1 is searched first) into 
widn, ... wid2, widFORTH-WORDLIST. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 121 
16.6.2.1965 ONLY SEARCH EXT 
( -- ) 
Set the search order to the implementation-defined minimum search order. The minimum 
search order shall include the words FORTH-WORDLIST and SET-ORDER. 
16.6.2.1985 ORDER SEARCH EXT 
( -- ) 
Display the word lists in the search order in their search order sequence, from first searched to 
last searched. Also display the word list into which new definitions will be placed. The display 
format is implementation dependent. 
ORDER may be implemented using pictured numeric output words. Consequently, its use may 
corrupt the transient region identified by #>. 
 See 3.3.3.6 Other Transient Regions. 
16.6.2.2037 PREVIOUS SEARCH EXT 
( -- ) 
Transform the search order consisting of widn, ... wid2, wid1 (where wid1 is searched first) into 
widn, ... wid2. An ambiguous condition exists if the search order was empty before PREVIOUS
was executed. 
ANSI X3.215-1994 
122 Collating Sequence: 
17. The optional String word set 
17.1 Introduction 
17.2 Additional terms and notation 
None. 
17.3 Additional usage requirements 
Append table 17.1 to table 3.5. 
See: 3.2.6 Environmental queries. 
Table 17.1 – Environmental query strings 
String Value data type Constant? Meaning 
STRING flag no string word set present 
STRING-EXT flag no string extensions word set present 
17.4 Additional documentation requirements 
None. 
17.5 Compliance and labeling 
17.5.1 ANS Forth systems 
The phrase “Providing the String word set” shall be appended to the label of any Standard System that 
provides all of the String word set. 
The phrase “Providing name(s) from the String Extensions word set” shall be appended to the label of any 
Standard System that provides portions of the String Extensions word set. 
The phrase “Providing the String Extensions word set” shall be appended to the label of any Standard 
System that provides all of the String and String Extensions word sets. 
17.5.2 ANS Forth programs 
The phrase “Requiring the String word set” shall be appended to the label of Standard Programs that require 
the system to provide the String word set. 
The phrase “Requiring name(s) from the String Extensions word set” shall be appended to the label of 
Standard Programs that require the system to provide portions of the String Extensions word set. 
The phrase “Requiring the String Extensions word set” shall be appended to the label of Standard Programs 
that require the system to provide all of the String and String Extensions word sets. 
 ANSI X3.215-1994 
! " # $ % & ' ( ) * + , - . / digits : ; < = > ? @ ALPHA [ \ ] ^ _ ` alpha { | } ~ 123 
17.6 Glossary 
17.6.1 String words 
17.6.1.0170 -TRAILING “dash-trailing” STRING 
( c-addr u1 -- c-addr u2 ) 
If u1 is greater than zero, u2 is equal to u1 less the number of spaces at the end of the character 
string specified by c-addr u1. If u1 is zero or the entire string consists of spaces, u2 is zero. 
17.6.1.0245 /STRING “slash-string” STRING 
( c-addr1 u1 n -- c-addr2 u2 ) 
Adjust the character string at c-addr1 by n characters. The resulting character string, specified 
by c-addr2 u2, begins at c-addr1 plus n characters and is u1 minus n characters long. 
17.6.1.0780 BLANK STRING 
( c-addr u -- ) 
If u is greater than zero, store the character value for space in u consecutive character positions 
beginning at c-addr. 
17.6.1.0910 CMOVE “c-move” STRING 
( c-addr1 c-addr2 u -- ) 
If u is greater than zero, copy u consecutive characters from the data space starting at c-addr1 to 
that starting at c-addr2, proceeding character-by-character from lower addresses to higher 
addresses. 
 Contrast with: 17.6.1.0920 CMOVE>. 
17.6.1.0920 CMOVE> “c-move-up” STRING 
( c-addr1 c-addr2 u -- ) 
If u is greater than zero, copy u consecutive characters from the data space starting at c-addr1 to 
that starting at c-addr2, proceeding character-by-character from higher addresses to lower 
addresses. 
 Contrast with: 17.6.1.0910 CMOVE. 
ANSI X3.215-1994 
124 Collating Sequence: 
17.6.1.0935 COMPARE STRING 
( c-addr1 u1 c-addr2 u2 -- n ) 
Compare the string specified by c-addr1 u1 to the string specified by c-addr2 u2. The strings 
are compared, beginning at the given addresses, character by character, up to the length of the 
shorter string or until a difference is found. If the two strings are identical, n is zero. If the two 
strings are identical up to the length of the shorter string, n is minus-one (-1) if u1 is less than u2
and one (1) otherwise. If the two strings are not identical up to the length of the shorter string, n
is minus-one (-1) if the first non-matching character in the string specified by c-addr1 u1 has a 
lesser numeric value than the corresponding character in the string specified by c-addr2 u2 and 
one (1) otherwise. 
17.6.1.2191 SEARCH STRING 
( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 flag ) 
Search the string specified by c-addr1 u1 for the string specified by c-addr2 u2. If flag is true, a 
match was found at c-addr3 with u3 characters remaining. If flag is false there was no match 
and c-addr3 is c-addr1 and u3 is u1. 
17.6.1.2212 SLITERAL STRING 
 Interpretation: Interpretation semantics for this word are undefined. 
 Compilation: ( c-addr1 u -- ) 
Append the run-time semantics given below to the current definition. 
 Run-time: ( -- c-addr2 u ) 
Return c-addr2 u describing a string consisting of the characters specified by c-addr1 u during 
compilation. A program shall not alter the returned string. 
17.6.2 String extension words 
None 
 ANSI X3.215-1994 
 125
