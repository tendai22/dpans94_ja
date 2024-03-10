<std-glossary>

||6.1.1250||DOES>||"does"||CORE||
|Interpretation:| Interpretation semantics for this word are undefined. 

|Compilation:| ( C: colon-sys1 -- colon-sys2 )  Append the run-time semantics below to the current definition. Whether or not the current  definition is rendered findable in the dictionary by the compilation of DOES> is implementation  defined. Consume colon-sys1 and produce colon-sys2. Append the initiation semantics given  below to the current definition. 
|Run-time:| ( -- ) ( R: nest-sys1 -- )  Replace the execution semantics of the most recent definition, referred to as name, with the  name execution semantics given below. Return control to the calling definition specified by  nest-sys1. An ambiguous condition exists if name was not defined with `CREATE` or a user-defined word that calls `CREATE`. 
|Initiation:| ( i*x -- i*x a-addr ) ( R: -- nest-sys2 )  Save implementation-dependent information nest-sys2 about the calling definition. Place  name’s data field address on the stack. The stack effects i*x represent arguments to name. 
|name Execution:| ( i\*x -- j\*x )  Execute the portion of the definition that begins with the initiation semantics appended by the  DOES> which modified name. The stack effects i\*x and j\*x represent arguments to and results  from name, respectively. 
|See:| **6.1.1000 CREATE**. 

||6.1.1260||DROP||"xxxxx"||CORE|| ( x -- )||
Remove x from the stack. 

one more line

||6.1.1290||DUP||"dupe"||CORE||( x -- x x )||
Duplicate x. 

||6.1.1310||ELSE||"xxxxx"||CORE|| 
|Interpretation:|Interpretation semantics for this word are undefined. 
|Compilation:|( C: orig1 -- orig2 )

Put the location of a new unresolved forward reference orig2 onto the control flow stack. 

Append the run-time semantics given below to the current definition. The semantics will be  incomplete until orig2 is resolved (e.g., by THEN). Resolve the forward reference orig1 using  the location following the appended run-time semantics. 
|Run-time:|( -- )  Continue execution at the location given by the resolution of orig2. 
|See:|**6.1.1700 IF**, **6.1.2270 THEN**. 

</std-glossary>
