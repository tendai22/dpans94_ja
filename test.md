## 6.1 Core words{id=Z6_1}

<std-glossary>
||6.1.0010||!||"store"||CORE||( x a-addr -- )||
Store x at a-addr. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0030||#||"number-sign"||CORE||( ud1 -- ud2 )||
Divide *ud1* by the number in `BASE` giving the quotient *ud2* and the remainder *n*. (*n* is the least-significant digit of *ud1*.) Convert n to external form and add the resulting character to the  beginning of the pictured numeric output string. An ambiguous condition exists if `#` executes  outside of a `<#` `#>` delimited number conversion. 
|See:| **6.1.0040 #>**, **6.1.0050 #S**, **6.1.0490 <#**. 
||6.1.0040||#>||"number-sign-greater"||CORE||( xd -- c-addr u )||
Drop xd. Make the pictured numeric output string available as a character string. c-addr and u specify the resulting character string. A program may replace characters within the string. 
|See:| **6.1.0030 #**, **6.1.0050 #S**, **6.1.0490 `<#`**. 
||6.1.0050||#S||"number-sign-s"||CORE||( ud1 -- ud2 )||
Convert one digit of ud1 according to the rule for `#`. Continue conversion until the quotient is  zero. ud2 is zero. An ambiguous condition exists if #S executes outside of a `<#` `#>` delimited  number conversion. 
|See:| **6.1.0030 #**, **6.1.0040 #>**, **6.1.0490 `<#`**. 
||6.1.0070||'||"tick"||CORE||( "&lt;spaces>name" -- xt )||
Skip leading space delimiters. Parse name delimited by a space. Find name and return xt, the  execution token for name. An ambiguous condition exists if name is not found. 

When interpreting, ' xyz EXECUTE is equivalent to xyz. 
|See:| 3.4 **The Forth text interpreter**, **3.4.1 Parsing**, **A.6.1.2033 POSTPONE**, **A.6.1.2510 [']**,  **D.6.7 Immediacy**.
||6.1.0080||(||"paren"||CORE||
|Compilation:|Perform the execution semantics given below. 
|Execution:|( "ccc&lt;paren>" -- )

Parse ccc delimited by ) (right parenthesis). ( is an immediate word. 

The number of characters in ccc may be zero to the number of characters in the parse area. 
|See:| **3.4.1 Parsing**, **11.6.1.0080 (**.


||6.1.0090||*||"star"||CORE||( n1|u1 n2|u2 -- n3|u3 )||
Multiply n1|u1 by n2|u2 giving the product n3|u3. 
||6.1.0100||*/||"star-slash"||CORE||( n1 n2 n3 -- n4 )||
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 giving the  single-cell quotient n4. An ambiguous condition exists if n3 is zero or if the quotient n4 lies  outside the range of a signed number. If d and n3 differ in sign, the implementation-defined  result returned will be the same as that returned by either the phrase >R M* R> FM/MOD  SWAP DROP or the phrase >R M* R> SM/REM SWAP DROP. 
|See:| **3.2.2.1 Integer division**. 
||6.1.0110||*/MOD||"star-slash-mod"||CORE||( n1 n2 n3 -- n4 n5 )||
Multiply n1 by n2 producing the intermediate double-cell result d. Divide d by n3 producing the  single-cell remainder n4 and the single-cell quotient n5. An ambiguous condition exists if n3 is  zero, or if the quotient n5 lies outside the range of a single-cell signed integer. If d and n3 differ  in sign, the implementation-defined result returned will be the same as that returned by either  the phrase >R M* R> FM/MOD or the phrase >R M* R> SM/REM. 
|See:| **3.2.2.1 Integer division**. 
||6.1.0120||+||"plus"||CORE||( n1|u1 n2|u2 -- n3|u3 )||
Add n2|u2 to n1|u1, giving the sum n3|u3. 
|See:| **3.3.3.1 Address alignment**. 

TRAILER  ANSI X3.215-1994 27
||6.1.0130||+!||"plus-store"||CORE||( n|u a-addr -- )||
Add n|u to the single-cell number at a-addr. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0140||+LOOP||"plus-loop"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: do-sys -- )

Append the run-time semantics given below to the current definition. Resolve the destination of  all unresolved occurrences of LEAVE between the location given by do-sys and the next  location for a transfer of control, to execute the words following `+LOOP`. 
|Run-time:|( n -- ) ( R: loop-sys1 -- | loop-sys2 )

An ambiguous condition exists if the loop control parameters are unavailable. Add n to the loop  index. If the loop index did not cross the boundary between the loop limit minus one and the  loop limit, continue execution at the beginning of the loop. Otherwise, discard the current loop  control parameters and continue execution immediately following the loop. 
|See:| **6.1.1240 DO**, **6.1.1680 I**, **6.1.1760 LEAVE**. 
||6.1.0150||,||"comma"||CORE||( x -- )||
Reserve one cell of data space and store x in the cell. If the data-space pointer is aligned when  , begins execution, it will remain aligned when , finishes execution. An ambiguous condition  exists if the data-space pointer is not aligned prior to execution of ,. 
|See:| **3.3.3 Data space**, **3.3.3.1 Address alignment**. 
||6.1.0160||-||"minus"||CORE||( n1|u1 n2|u2 -- n3|u3 )||
Subtract n2|u2 from n1|u1, giving the difference n3|u3. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0180||.||"dot"||CORE||( n -- )||
Display n in free field format. 
|See:| **3.2.1.2 Digit conversion**, **3.2.1.3 Free-field number display**. 
||6.1.0190||."||"dot-quote"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( "ccc&lt;quote>" -- )

Parse ccc delimited by " (double-quote). Append the run-time semantics given below to the  current definition. 
|Run-time:|( -- )

Display ccc. 
|See:| **3.4.1 Parsing**, **6.2.0200 .(**. 
||6.1.0230||/||"slash"||CORE||( n1 n2 -- n3 )||
Divide n1 by n2, giving the single-cell quotient n3. An ambiguous condition exists if n2 is zero. 

If n1 and n2 differ in sign, the implementation-defined result returned will be the same as that  returned by either the phrase >R S>D R> FM/MOD SWAP DROP or the phrase >R S>D R>  SM/REM SWAP DROP. 
|See:| **3.2.2.1 Integer division**. 
||6.1.0240||/MOD||"slash-mod"||CORE||( n1 n2 -- n3 n4 )||
Divide n1 by n2, giving the single-cell remainder n3 and the single-cell quotient n4. An  ambiguous condition exists if n2 is zero. If n1 and n2 differ in sign, the implementation-defined  result returned will be the same as that returned by either the phrase >R S>D R> FM/MOD or  the phrase >R S>D R> SM/REM. 
|See:| **3.2.2.1 Integer division**. 
||6.1.0250||0<||"zero-less"||CORE||( n -- flag )||
flag is true if and only if n is less than zero. 
||6.1.0270||0=||"zero-equals"||CORE||( x -- flag )||
flag is true if and only if x is equal to zero. 
||6.1.0290||1+||"one-plus"||CORE||( n1|u1 -- n2|u2 )||
Add one (1) to n1|u1 giving the sum n2|u2. 

TRAILER  ANSI X3.215-1994 29
||6.1.0300||1-||"one-minus"||CORE||( n1|u1 -- n2|u2 )||
Subtract one (1) from n1|u1 giving the difference n2|u2. 
||6.1.0310||2!||"two-store"||CORE||( x1 x2 a-addr -- )||
Store the cell pair x1 x2 at a-addr, with x2 at a-addr and x1 at the next consecutive cell. It is  equivalent to the sequence SWAP OVER ! CELL+ !. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0320||2*||"two-star"||CORE||( x1 -- x2 )||
x2 is the result of shifting x1 one bit toward the most-significant bit, filling the vacated least-significant bit with zero. 
||6.1.0330||2/||"two-slash"||CORE||( x1 -- x2 )||
x2 is the result of shifting x1 one bit toward the least-significant bit, leaving the most-significant  bit unchanged. 
||6.1.0350||2@||"two-fetch"||CORE||( a-addr -- x1 x2 )||
Fetch the cell pair x1 x2 stored at a-addr. x2 is stored at a-addr and x1 at the next consecutive  cell. It is equivalent to the sequence DUP CELL+ @ SWAP @. 
|See:| **3.3.3.1 Address alignment**, **6.1.0310 2!**. 
||6.1.0370||2DROP||"two-drop"||CORE||( x1 x2 -- )||
Drop cell pair x1 x2 from the stack. 
||6.1.0380||2DUP||"two-dupe"||CORE||( x1 x2 -- x1 x2 x1 x2 )||
Duplicate cell pair x1 x2. 
||6.1.0400||2OVER||"two-over"||CORE||( x1 x2 x3 x4 -- x1 x2 x3 x4 x1 x2 )||
Copy cell pair x1 x2 to the top of the stack. 
||6.1.0430||2SWAP||"two-swap"||CORE||( x1 x2 x3 x4 -- x3 x4 x1 x2 )||
Exchange the top two cell pairs. 
||6.1.0450||:||"colon"||CORE||( C: "&lt;spaces>name" -- colon-sys )||
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name,  called a "colon definition". Enter compilation state and start the current definition, producing  colon-sys. Append the initiation semantics given below to the current definition. 

The execution semantics of name will be determined by the words compiled into the body of the  definition. The current definition shall not be findable in the dictionary until it is ended (or until  the execution of DOES> in some systems). 
|Initiation:|( i*x -- i*x ) ( R: -- nest-sys )

Save implementation-dependent information nest-sys about the calling definition. The stack  effects i*x represent arguments to name. 
|name Execution:|( i*x -- j*x )

Execute the definition name. The stack effects i*x and j*x represent arguments to and results  from name, respectively. 
|See:| **3.4 The Forth text interpreter**, **3.4.1 Parsing**, **3.4.5 Compilation**, **6.1.1250 DOES>**, **6.1.2500  [**, **6.1.2540 ]**, **15.6.2.0470 ;CODE**. 
||6.1.0460||;||"semicolon"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: colon-sys -- )

Append the run-time semantics below to the current definition. End the current definition,  allow it to be found in the dictionary and enter interpretation state, consuming colon-sys. If the  data-space pointer is not aligned, reserve enough data space to align it. 
|Run-time:|( -- ) ( R: nest-sys -- )

Return to the calling definition specified by nest-sys. 
|See:| **3.4 The Forth text interpreter**, **3.4.5 Compilation**. 
||6.1.0480||<||"less-than"||CORE||( n1 n2 -- flag )||
flag is true if and only if n1 is less than n2. 
|See:| **6.1.2340 `U<`**. 

TRAILER  ANSI X3.215-1994 31
||6.1.0490||<#||"less-number-sign"||CORE||( -- )||
Initialize the pictured numeric output conversion process. 
|See:| **6.1.0030 #**, **6.1.0040 #>**, **6.1.0050 #S**. 
||6.1.0530||=||"equals"||CORE||( x1 x2 -- flag )||
flag is true if and only if x1 is bit-for-bit the same as x2. 
||6.1.0540||>||"greater-than"||CORE||( n1 n2 -- flag )||
flag is true if and only if n1 is greater than n2. 
|See:| **6.2.2350 U**>. 
||6.1.0550||>BODY||"to-body"||CORE||( xt -- a-addr )||
a-addr is the data-field address corresponding to xt. An ambiguous condition exists if xt is not  for a word defined via CREATE. 
|See:| **3.3.3 Data space**. 
||6.1.0560||>IN||"to-in"||CORE||( -- a-addr )||
a-addr is the address of a cell containing the offset in characters from the start of the input  buffer to the start of the parse area. 
||6.1.0570||>NUMBER||"to-number"||CORE||( ud1 c-addr1 u1 -- ud2 c-addr2 u2 )||
ud2 is the unsigned result of converting the characters within the string specified by c-addr1 u1 into digits, using the number in BASE, and adding each into ud1 after multiplying ud1 by the  number in BASE. Conversion continues left-to-right until a character that is not convertible,  including any "+" or "-", is encountered or the string is entirely converted. c-addr2 is the  location of the first unconverted character or the first character past the end of the string if the  string was entirely converted. u2 is the number of unconverted characters in the string. An  ambiguous condition exists if ud2 overflows during the conversion. 
|See:| **3.2.1.2 Digit conversion**. 
||6.1.0580||>R||"to-r"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( x -- ) ( R: -- x )

Move x to the return stack. 
|See:| **3.2.3.3 Return stack**, **6.1.2060 R>**, **6.1.2070 R@**, **6.2.0340 2>R**, **6.2.0410 2R>**, **6.2.0415 2R@**. 
||6.1.0630||?DUP||"question-dupe"||CORE||( x -- 0 | x x )||
Duplicate x if it is non-zero. 
||6.1.0650||@||"fetch"||CORE||( a-addr -- x )||
x is the value stored at a-addr. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0670||ABORT||"xxxxx"||CORE||( i\*x -- ) ( R: j\*x -- )||
Empty the data stack and perform the function of QUIT, which includes emptying the return  stack, without displaying a message. 
|See:| **9.6.2.0670 ABORT**. 
||6.1.0680||ABORT"||"abort-quote"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( "ccc&lt;quote>" -- )

Parse ccc delimited by a " (double-quote). Append the run-time semantics given below to the  current definition. 
|Run-time:|( i*x x1 -- | i*x ) ( R: j*x -- | j*x )

Remove x1 from the stack. If any bit of x1 is not zero, display ccc and perform an  implementation-defined abort sequence that includes the function of ABORT. 
|See:| **3.4.1 Parsing**, **9.6.2.0680 ABORT"**. 
||6.1.0690||ABS||"abs"||CORE||( n -- u )||
u is the absolute value of n. 
||6.1.0695||ACCEPT||"xxxxx"||CORE||  ( c-addr +n1 -- +n2 )||
Receive a string of at most +n1 characters. An ambiguous condition exists if +n1 is zero or  greater than 32,767. Display graphic characters as they are received. A program that depends  on the presence or absence of non-graphic characters in the string has an environmental  dependency. The editing functions, if any, that the system performs in order to construct the  string are implementation-defined. 
Input terminates when an implementation-defined line terminator is received. When input  terminates, nothing is appended to the string, and the display is maintained in an  implementation-defined way. 

+n2 is the length of the string stored at c-addr. 
||6.1.0705||ALIGN||"xxxxx"||CORE||  ( -- )||
If the data-space pointer is not aligned, reserve enough space to align it. 
|See:| **3.3.3 Data space**, **3.3.3.1 Address alignment**. 
||6.1.0706||ALIGNED||"xxxxx"||CORE||  ( addr -- a-addr )||
a-addr is the first aligned address greater than or equal to addr. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0710||ALLOT||"xxxxx"||CORE||  ( n -- )||
If n is greater than zero, reserve n address units of data space. If n is less than zero, release |n|  address units of data space. If n is zero, leave the data-space pointer unchanged. 

If the data-space pointer is aligned and n is a multiple of the size of a cell when `ALLOT` begins  execution, it will remain aligned when `ALLOT` finishes execution. 
If the data-space pointer is character aligned and n is a multiple of the size of a character when  `ALLOT` begins execution, it will remain character aligned when `ALLOT` finishes execution. 
|See:| **3.3.3 Data space**. 
||6.1.0720||AND||"xxxxx"||CORE||  ( x1 x2 -- x3 )||
x3 is the bit-by-bit logical "and" of x1 with x2. 
||6.1.0750||BASE||"xxxxx"||CORE||  ( -- a-addr )||
a-addr is the address of a cell containing the current number-conversion radix {{2...36}}. 
||6.1.0760||BEGIN||"xxxxx"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: -- dest )

Put the next location for a transfer of control, dest, onto the control flow stack. Append the run-time semantics given below to the current definition. 
|Run-time:|( -- )

Continue execution. 
|See:| **3.2.3.2 Control-flow stack**, **6.1.2140 REPEAT**, **6.1.2390 UNTIL**, **6.1.2430 WHILE**. 
||6.1.0770||BL||"b-l"||CORE||( -- char )||
char is the character value for a space. 
||6.1.0850||C!||"c-store"||CORE||( char c-addr -- )||
Store char at c-addr. When character size is smaller than cell size, only the number of low-order bits corresponding to character size are transferred. 
|See:| **3.3.3.1 Address alignment** 
||6.1.0860||C,||"c-comma"||CORE||( char -- )||
Reserve space for one character in the data space and store char in the space. If the data-space  pointer is character aligned when C, begins execution, it will remain character aligned when C, finishes execution. An ambiguous condition exists if the data-space pointer is not character-aligned prior to execution of C,. 
|See:| **3.3.3 Data space**, **3.3.3.1 Address alignment**. 
||6.1.0870||C@||"c-fetch"||CORE||( c-addr -- char )||
Fetch the character stored at c-addr. When the cell size is greater than character size, the  unused high-order bits are all zeroes. 
|See:| **3.3.3.1 Address alignment**. 

TRAILER  ANSI X3.215-1994 35
||6.1.0880||CELL+||"cell-plus"||CORE||( a-addr1 -- a-addr2 )||
Add the size in address units of a cell to a-addr1, giving a-addr2. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0890||CELLS||"xxxxx"||CORE||  ( n1 -- n2 )||
n2 is the size in address units of n1 cells. 
||6.1.0895||CHAR||"char"||CORE||( "&lt;spaces>name" -- char )||
Skip leading space delimiters. Parse name delimited by a space. Put the value of its first  character onto the stack. 
|See:| **3.4.1 Parsing**, **6.1.2520 [CHAR**].
||6.1.0897||CHAR+||"char-plus"||CORE||( c-addr1 -- c-addr2 )||
Add the size in address units of a character to c-addr1, giving c-addr2. 
|See:| **3.3.3.1 Address alignment**. 
||6.1.0898||CHARS||"chars"||CORE||( n1 -- n2 )||
n2 is the size in address units of n1 characters. 
||6.1.0950||CONSTANT||"xxxxx"||CORE||  ( x "&lt;spaces>name" -- )||
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name with the execution semantics defined below. 

name is referred to as a "constant". 
|name Execution:|( -- x )

Place x on the stack. 
|See:| **3.4.1 Parsing**. 
||6.1.0980||COUNT||"xxxxx"||CORE||  ( c-addr1 -- c-addr2 u )||
Return the character string specification for the counted string stored at c-addr1. c-addr2 is the  address of the first character after c-addr1. u is the contents of the character at c-addr1, which  is the length in characters of the string at c-addr2. 
||6.1.0990||CR||"c-r"||CORE||( -- )||
Cause subsequent output to appear at the beginning of the next line. 
||6.1.1000||CREATE||"xxxxx"||CORE|| ( "&lt;spaces>name" -- )||
Skip leading space delimiters. Parse name delimited by a space. Create a definition for name with the execution semantics defined below. If the data-space pointer is not aligned, reserve  enough data space to align it. The new data-space pointer defines name’s data field. CREATE does not allocate data space in name’s data field. 
|name Execution:|( -- a-addr )

a-addr is the address of name’s data field. The execution semantics of name may be extended  by using DOES>. 
|See:| **3.3.3 Data space**, **6.1.1250 DOES**>. 
||6.1.1170||DECIMAL||"xxxxx"||CORE|| ( -- )||
Set the numeric conversion radix to ten (decimal). 
||6.1.1200||DEPTH||"xxxxx"||CORE|| ( -- +n )||
+n is the number of single-cell values contained in the data stack before +n was placed on the  stack. 
||6.1.1240||DO||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: -- do-sys )

Place do-sys onto the control-flow stack. Append the run-time semantics given below to the  current definition. The semantics are incomplete until resolved by a consumer of do-sys such as  LOOP. 
|Run-time:|( n1|u1 n2|u2 -- ) ( R: -- loop-sys )

Set up loop control parameters with index n2|u2 and limit n1|u1. An ambiguous condition exists  if n1|u1 and n2|u2 are not both the same type. Anything already on the return stack becomes  unavailable until the loop-control parameters are discarded. 
|See:| **3.2.3.2 Control-flow stack**, **6.1.0140 +LOOP**, **6.1.1800 LOOP**. 
||6.1.1250||DOES>||"does"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: colon-sys1 -- colon-sys2 )

Append the run-time semantics below to the current definition. Whether or not the current  definition is rendered findable in the dictionary by the compilation of DOES> is implementation  defined. Consume colon-sys1 and produce colon-sys2. Append the initiation semantics given  below to the current definition. 
|Run-time:|( -- ) ( R: nest-sys1 -- )

Replace the execution semantics of the most recent definition, referred to as name, with the  name execution semantics given below. Return control to the calling definition specified by  nest-sys1. An ambiguous condition exists if name was not defined with `CREATE` or a user-defined word that calls `CREATE`. 
|Initiation:|( i*x -- i*x a-addr ) ( R: -- nest-sys2 )

Save implementation-dependent information nest-sys2 about the calling definition. Place  name’s data field address on the stack. The stack effects i*x represent arguments to name. 
|name Execution:|( i\*x -- j\*x )

Execute the portion of the definition that begins with the initiation semantics appended by the  DOES> which modified name. The stack effects i\*x and j\*x represent arguments to and results  from name, respectively. 
|See:| **6.1.1000 CREATE**. 
||6.1.1260||DROP||"xxxxx"||CORE|| ( x -- )||
Remove x from the stack. 
||6.1.1290||DUP||"dupe"||CORE||( x -- x x )||
Duplicate x. 
||6.1.1310||ELSE||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: orig1 -- orig2 )

Put the location of a new unresolved forward reference orig2 onto the control flow stack. 

Append the run-time semantics given below to the current definition. The semantics will be  incomplete until orig2 is resolved (e.g., by THEN). Resolve the forward reference orig1 using  the location following the appended run-time semantics. 
|Run-time:|( -- )

Continue execution at the location given by the resolution of orig2. 
|See:| **6.1.1700 IF**, **6.1.2270 THEN**. 
||6.1.1320||EMIT||"xxxxx"||CORE|| ( x -- )||
If x is a graphic character in the implementation-defined character set, display x. The effect of  EMIT for all other values of x is implementation-defined. 

When passed a character whose character-defining bits have a value between hex 20 and 7E  inclusive, the corresponding standard character, specified by **3.1.2.1 Graphic characters**, is  displayed. Because different output devices can respond differently to control characters,  programs that use control characters to perform specific functions have an environmental  dependency. Each EMIT deals with only one character. 
|See:| **6.1.2310 TYPE**. 
||6.1.1345||ENVIRONMENT?||"environment-query"||CORE||( c-addr u -- false | i*x true )||
*c-addr* is the address of a character string and u is the string’s character count. u may have a  value in the range from zero to an implementation-defined maximum which shall not be less  than 31. The character string should contain a keyword from **3.2.6 Environmental queries** or  the optional word sets to be checked for correspondence with an attribute of the present  environment. If the system treats the attribute as unknown, the returned flag is false; otherwise,  the flag is true and the i*x returned is of the type specified in the table for the attribute queried. 
||6.1.1360||EVALUATE||"xxxxx"||CORE||( i*x c-addr u -- j*x )||
Save the current input source specification. Store minus-one (-1) in SOURCE-ID if it is  present. Make the string described by c-addr and u both the input source and input buffer, set  >IN to zero, and interpret. When the parse area is empty, restore the prior input source  specification. Other stack effects are due to the words EVALUATEd. 
||6.1.1370||EXECUTE||"xxxxx"||CORE|| ( i*x xt -- j*x )||
Remove xt from the stack and perform the semantics identified by it. Other stack effects are due  to the word EXECUTEd. 
|See:| 6.1.0070 ', **6.1.2510 [**']. 


||6.1.1380||EXIT||"xxxxx"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- ) ( R: nest-sys -- )

Return control to the calling definition specified by nest-sys. Before executing EXIT within a  do-loop, a program shall discard the loop-control parameters by executing UNLOOP. 
|See:| **3.2.3.3 Return stack**, **6.1.2380 UNLOOP**. 
||6.1.1540||FILL||"xxxxx"||CORE|| ( c-addr u char -- )||
If u is greater than zero, store char in each of u consecutive characters of memory beginning at  c-addr. 
||6.1.1550||FIND||"xxxxx"||CORE|| ( c-addr -- c-addr 0 | xt 1 | xt -1 )||
Find the definition named in the counted string at c-addr. If the definition is not found, return  c-addr and zero. If the definition is found, return its execution token xt. If the definition is  immediate, also return one (1), otherwise also return minus-one (-1). For a given string, the  values returned by FIND while compiling may differ from those returned while not compiling. 
|See:| **3.4.2 Finding definition names**, **A.6.1.0070 '**, **A.6.1.2510 [']**, **A.6.1.2033 POSTPONE**,  **D.6.7 Immediacy**. 
||6.1.1561||FM/MOD||"f-m-slash-mod"||CORE||( d1 n1 -- n2 n3 )||
Divide d1 by n1, giving the floored quotient n3 and the remainder n2. Input and output stack  arguments are signed. An ambiguous condition exists if n1 is zero or if the quotient lies outside  the range of a single-cell signed integer. 
|See:| **3.2.2.1 Integer division**, **6.1.2214 SM/REM**, **6.1.2370 UM/MOD**. 
||6.1.1650||HERE||"xxxxx"||CORE|| ( -- addr )||
addr is the data-space pointer. 
|See:|**3.3.3.2 Contiguous regions**. 
||6.1.1670||HOLD||"xxxxx"||CORE|| ( char -- )||
Add char to the beginning of the pictured numeric output string. An ambiguous condition exists  if HOLD executes outside of a `<#` `#>` delimited number conversion. 
||6.1.1680||I||"xxxxx"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- n|u ) ( R: loop-sys -- loop-sys )  n|u is a copy of the current (innermost)

loop index. An ambiguous condition exists if the loop  control parameters are unavailable. 
||6.1.1700||IF||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: -- orig )

Put the location of a new unresolved forward reference orig onto the control flow stack. Append  the run-time semantics given below to the current definition. The semantics are incomplete  until orig is resolved, e.g., by `THEN` or `ELSE`. 
|Run-time:|( x -- )

If all bits of x are zero, continue execution at the location specified by the resolution of orig. 
|See:| **3.2.3.2 Control flow stack**, **6.1.1310 ELSE**, **6.1.2270 THEN**. 
||6.1.1710||IMMEDIATE||"xxxxx"||CORE|| ( -- )||
Make the most recent definition an immediate word. An ambiguous condition exists if the most  recent definition does not have a name. 
|See:| **D.6.7 Immediacy**. 
||6.1.1720||INVERT||"xxxxx"||CORE||( x1 -- x2 )||
Invert all bits of x1, giving its logical inverse x2. 
|See:| **6.1.1910 NEGATE**, **6.1.0270 0=**. 
||6.1.1730||J||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- n|u ) ( R: loop-sys1 loop-sys2 -- loop-sys1 loop-sys2 )

n|u is a copy of the next-outer loop index. An ambiguous condition exists if the loop control  parameters of the next-outer loop, loop-sys1, are unavailable. 
||6.1.1750||KEY||"xxxxx"||CORE|| ( -- char )||
Receive one character char, a member of the implementation-defined character set. Keyboard  events that do not correspond to such characters are discarded until a valid character is received,  and those events are subsequently unavailable. 

All standard characters can be received. Characters received by KEY are not displayed. 

Any standard character returned by KEY has the numeric value specified in **3.1.2.1 Graphic  characters**. Programs that require the ability to receive control characters have an  environmental dependency. 
|See:| **10.6.2.1307 EKEY**, **10.6.1.1755 KEY?**. 
||6.1.1760||LEAVE||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- ) ( R: loop-sys -- )

Discard the current loop control parameters. An ambiguous condition exists if they are  unavailable. Continue execution immediately following the innermost syntactically enclosing  DO ... LOOP or DO ... +LOOP. 
|See:| **3.2.3.3 Return stack**, **6.1.0140 +LOOP**, **6.1.1800 LOOP**. 
||6.1.1780||LITERAL||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( x -- )

Append the run-time semantics given below to the current definition. 
|Run-time:|( -- x )

Place x on the stack. 
||6.1.1800||LOOP||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: do-sys -- )

Append the run-time semantics given below to the current definition. Resolve the destination of  all unresolved occurrences of `LEAVE` between the location given by do-sys and the next  location for a transfer of control, to execute the words following the `LOOP`. 
|Run-time:|( -- ) ( R: loop-sys1 -- | loop-sys2 )

An ambiguous condition exists if the loop control parameters are unavailable. Add one to the  loop index. If the loop index is then equal to the loop limit, discard the loop parameters and  continue execution immediately following the loop. Otherwise continue execution at the  beginning of the loop. 
|See:| **6.1.1240 DO**, **6.1.1680 I**, **6.1.1760 LEAVE**. 
||6.1.1805||LSHIFT||"l-shift"||CORE||( x1 u -- x2 )||
Perform a logical left shift of u bit-places on x1, giving x2. Put zeroes into the least significant  bits vacated by the shift. An ambiguous condition exists if u is greater than or equal to the  number of bits in a cell. 
||6.1.1810||M*||"m-star"||CORE||( n1 n2 -- d )||
d is the signed product of n1 times n2. 
||6.1.1870||MAX||"xxxxx"||CORE|| ( n1 n2 -- n3 )||
n3 is the greater of n1 and n2. 
||6.1.1880||MIN||"xxxxx"||CORE|| ( n1 n2 -- n3 )||
n3 is the lesser of n1 and n2. 
||6.1.1890||MOD||"xxxxx"||CORE||( n1 n2 -- n3 )||
Divide n1 by n2, giving the single-cell remainder n3. An ambiguous condition exists if n2 is  zero. If n1 and n2 differ in sign, the implementation-defined result returned will be the same as  that returned by either the phrase >R S>D R> FM/MOD DROP or the phrase >R S>D R>  SM/REM DROP. 
|See:| **3.2.2.1 Integer division**. 
||6.1.1900||MOVE||"xxxxx"||CORE|| ( addr1 addr2 u -- )||
If u is greater than zero, copy the contents of u consecutive address units at addr1 to the u consecutive address units at addr2. After MOVE completes, the u consecutive address units at  addr2 contain exactly what the u consecutive address units at addr1 contained before the move. 
|See:| **17.6.1.0910 CMOVE**, **17.6.1.0920 CMOVE>**. 
||6.1.1910||NEGATE||"xxxxx"||CORE|| ( n1 -- n2 )||
Negate n1, giving its arithmetic inverse n2. 
|See:| **6.1.1720 INVERT**, **6.1.0270 0=.** 
||6.1.1980||OR||"xxxxx"||CORE|| ( x1 x2 -- x3 )||
x3 is the bit-by-bit inclusive-or of x1 with x2. 
||6.1.1990||OVER||"xxxxx"||CORE|| ( x1 x2 -- x1 x2 x1 )||
Place a copy of x1 on top of the stack. 
||6.1.2033||POSTPONE||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( "&lt;spaces>name" -- )

Skip leading space delimiters. Parse name delimited by a space. Find name. Append the  compilation semantics of name to the current definition. An ambiguous condition exists if name is not found. 
|See:| **3.4.1 Parsing**.


||6.1.2050||QUIT||"xxxxx"||CORE||( -- ) ( R: i*x -- )||
Empty the return stack, store zero in SOURCE-ID if it is present, make the user input device the  input source, and enter interpretation state. Do not display a message. Repeat the following: 

- Accept a line from the input source into the input buffer, set >IN to zero, and interpret. 
- Display the implementation-defined system prompt if in interpretation state, all  processing has been completed, and no ambiguous condition exists. 
|See:| 3.4 The Forth text interpreter. 


||6.1.2060||R>||"r-from"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- x ) ( R: x -- )

Move x from the return stack to the data stack. 
|See:| **3.2.3.3 Return stack**, **6.1.0580 >R**, **6.1.2070 R@**, **6.2.0340 2>R**, **6.2.0410 2R>**, **6.2.0415 2R@**. 
||6.1.2070||R@||"r-fetch"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Execution:|( -- x ) ( R: x -- x )

Copy x from the return stack to the data stack. 
|See:| **3.2.3.3 Return stack**, **6.1.0580 >R**, **6.1.2060 R>**, **6.2.0340 2>R**, **6.2.0410 2R>**, **6.2.0415 2R@**. 
||6.1.2120||RECURSE||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( -- )

Append the execution semantics of the current definition to the current definition. An  ambiguous condition exists if `RECURSE` appears in a definition after `DOES>`. 
|See:| **6.1.1250 DOES>**, **6.1.2120 RECURSE**.
||6.1.2140||REPEAT||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: orig dest -- )

Append the run-time semantics given below to the current definition, resolving the backward  reference dest. Resolve the forward reference orig using the location following the appended  run-time semantics. 
|Run-time:|( -- )

Continue execution at the location given by dest. 
|See:| **6.1.0760 BEGIN**, **6.1.2430 WHILE**. 
||6.1.2160||ROT||"rote"||CORE||( x1 x2 x3 -- x2 x3 x1 )||
Rotate the top three stack entries. 
||6.1.2162||RSHIFT||"r-shift"||CORE||( x1 u -- x2 )||
Perform a logical right shift of u bit-places on x1, giving x2. Put zeroes into the most significant  bits vacated by the shift. An ambiguous condition exists if u is greater than or equal to the  number of bits in a cell. 
||6.1.2165||S"||"s-quote"||CORE||
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( "ccc&lt;quote>" -- )

Parse ccc delimited by " (double-quote). Append the run-time semantics given below to the  current definition. 
|Run-time:|( -- c-addr u )

Return c-addr and u describing a string consisting of the characters ccc. A program shall not  alter the returned string. 
|See:| **3.4.1 Parsing**, **6.2.0855 C"**, **11.6.1.2165 S"**.
||6.1.2170||S>D||"s-to-d"||CORE||( n -- d )||
Convert the number n to the double-cell number d with the same numerical value. 
||6.1.2210||SIGN||"xxxxx"||CORE|| ( n -- )||
If n is negative, add a minus sign to the beginning of the pictured numeric output string. An  ambiguous condition exists if SIGN executes outside of a `<#` `#>` delimited number conversion. 
||6.1.2214||SM/REM||"s-m-slash-rem"||CORE||( d1 n1 -- n2 n3 )||
Divide d1 by n1, giving the symmetric quotient n3 and the remainder n2. Input and output stack  arguments are signed. An ambiguous condition exists if n1 is zero or if the quotient lies outside  the range of a single-cell signed integer. 
|See:| **3.2.2.1 Integer division**, **6.1.1561 FM/MOD**, **6.1.2370 UM/MOD**. 
||6.1.2216||SOURCE||"xxxxx"||CORE|| ( -- c-addr u )||
c-addr is the address of, and u is the number of characters in, the input buffer. 
||6.1.2220||SPACE||"xxxxx"||CORE|| ( -- )||
Display one space. 
||6.1.2230||SPACES||"xxxxx"||CORE|| ( n -- )||
If n is greater than zero, display n spaces. 
||6.1.2250||STATE||"xxxxx"||CORE|| ( -- a-addr )||
a-addr is the address of a cell containing the compilation-state flag. STATE is true when in  compilation state, false otherwise. The true value in STATE is non-zero, but is otherwise  implementation-defined. Only the following standard words alter the value in STATE: :

(colon), ; (semicolon), ABORT, QUIT, :NONAME, [ (left-bracket), and ] (right-bracket). 

Note: A program shall not directly alter the contents of STATE. 
|See:| 3.4 The Forth text interpreter, **6.1.0450 :**, **6.1.0460 ;**, **6.1.0670 ABORT**, **6.1.2050 QUIT**, **6.1.2500 [**, **6.1.2540 ]**, **6.2.0455 :NONAME**, **15.6.2.2250 STATE**. 
||6.1.2260||SWAP||"xxxxx"||CORE|| ( x1 x2 -- x2 x1 )||
Exchange the top two stack items. 
||6.1.2270||THEN||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: orig -- )

Append the run-time semantics given below to the current definition. Resolve the forward  reference orig using the location of the appended run-time semantics. 
|Run-time:|( -- )

Continue execution. 
|See:| **6.1.1310 ELSE**, **6.1.1700 IF**. 

</std-glossary>
