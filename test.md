#### 13.3.3.1 Compilation semantics 

The system, upon receipt of a sequence of local-identifier messages, shall take the following actions at  compile time: 

<ol type="a"> 
  <li>Create temporary dictionary entries for each of the identifiers passed to (LOCAL), such that each  identifier will behave as a local. These temporary dictionary entries shall vanish at the end of the  definition, denoted by ; (semicolon), ;CODE, or DOES>. The system need not maintain these  identifiers in the same way it does other dictionary entries as long as they can be found by normal  dictionary searching processes. Furthermore, if the Search-Order word set is present, local identifiers  shall always be searched before any of the word lists in any definable search order, and none of the  Search-Order words shall change the locals’ privileged position in the search order. Local identifiers  may reside in mass storage.</li>

  <li>For each identifier passed to (LOCAL), the system shall generate an appropriate code sequence that  does the following at execution time:

  <ol>
    <li> Allocate a storage resource adequate to contain the value of a local. The storage shall be allocated  in a way that does not preclude re-entrancy or recursion in the definition using the local. </li>
    <li> Initialize the value using the top item on the data stack. If more than one local is declared, the top  item on the stack shall be moved into the first local identified, the next item shall be moved into the  second, and so on. </li>
  </ol>

The storage resource may be the return stack or may be implemented in other ways, such as in registers. 

The storage resource shall not be the data stack. Use of locals shall not restrict use of the data stack  before or after the point of declaration. </li>
</ol>

<ol type="a" start="3">
  <li>Arrange that any of the legitimate methods of terminating execution of a definition, specifically ;

(semicolon), ;CODE, DOES> or EXIT, will release the storage resource allocated for the locals, if any,  declared in that definition. ABORT shall release all local storage resources, and CATCH / THROW (if  implemented) shall release such resources for all definitions whose execution is being terminated.</li>

  <li>Separate sets of locals may be declared in defining words before DOES> for use by the defining word,  and after DOES> for use by the word defined.</li>
</ol>

A system implementing the Locals word set shall support the declaration of at least eight locals in a  definition. 


#### 13.3.3.2 Syntax restrictions 

Immediate words in a program may use (LOCAL) to implement syntaxes for local declarations with the  following restrictions: 
