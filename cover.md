<div style="display: flow;
            flex-direction: row;
            margin: 0 25mm;">
  <div style="margin-top: 10em;
            font-size: 16Q;
            line-height: 23Q;
            text-align: right;">
American National Standard<br style="margin-bottom: 2em;">
for Information Systems —  
  </div>
  <div style="margin-top: 2em;
            font-size: 22Q;
            line-height: 26Q;
            text-align: right;">
Programming Languages —  <br>
Forth 
  </div>
  <div style="margin-top: 10em;
            text-align: left;">
Secretariat<br>
<div style="font-weight: 700;">Computer and Business Equipment Manufacturers Association</div>
  </div>  

  <div style="margin-top: 10em;
            text-align: left;">
Approved: March 24, 1994<br>
<div style="font-weight: 700;">American National Standards Institute, Inc.</div>
  </div>
</div>

<hr class="page-wrap" />

## Special Electronic Edition

Copyright (c) 1994 by Technical Committee X3J14. All rights reserved.

This is a working document of Technical Committee X3J14 which represents the last draft of ANS Forth  submitted to ANSI for publication. Permission is hereby granted to copy this document provided that it is  copied in its entirety without alteration or as altered by (1) adding text that is clearly marked as an insertion;  (2) shading or highlighting existing text; and/or (3) deleting examples.

Specifically, permission is granted to use this working document as the foundation for textbooks, system  manuals, and online documentation so long as the requirements in the preceding paragraph are met and the  resulting product addresses a technical need that is not practically met by the official ANS.

**NOTE**: This file is provided as a working document of the TC for public review and comment as well as  documentation uses described above. It is not intended as a substitute for the official ANS Forth document  published by ANSI. In the event of conflict, only the printed document X3.215-1994 represents the official  ANS Forth.

To obtain the official standard, please contact the American National Standards Institute Sales Department,  at (212) 642-4900 or FAX (212) 302-1286, or Global Engineering Documents, at (800) 854-7179 or FAX  (303) 843-9880, and request Document X3.215-1994. Thank you very much for your interest.


## TOC SHOULD BE IN HERE

<hr class="page-wrap" />

<foreword>

||Foreword||
(This foreword is not a part of American National Standard X3.215-1994)

Forth is a language for direct communication between human beings and machines. Using  natural-language diction and machine-oriented syntax, Forth provides an economical,  productive environment for interactive compilation and execution of programs. Forth also  provides low-level access to computer-controlled hardware, and the ability to extend the  language itself. This extensibility allows the language to be quickly expanded and adapted  to special needs and different hardware systems.

Forth was invented by Mr. Charles Moore to increase programmer productivity without  sacrificing machine efficiency. Forth is a layered environment containing the elements of  a computer language as well as those of an operating system and a machine monitor. This  extensible, layered environment provides for highly interactive program development and  testing.

In the interests of transportability of application software written in Forth, standardization  efforts began in the mid-1970s by an international group of users and implementors who  adopted the name “Forth Standards Team”. This effort resulted in the Forth-77 Standard.
As the language continued to evolve, an interim Forth-78 Standard was published by the  Forth Standards Team. Following Forth Standards Team meetings in 1979, the Forth-79  Standard was published in 1980. Major changes were made by the Forth Standards Team  in the Forth-83 Standard, which was published in 1983.

1988, May 25-28, 1988, August 10-13, 1988, October 26-29, 1988, January 25-28, 1989, 
1990, August 21-25, 1990, November 6-10,1990, January 29-February 2, 1991, May 3-4, 
1991, June 16-19, 1991, July 30-August 3, 1991, March 17-21, 1992, October 13-17, 

The first meeting of the Technical Committee on Forth Programming Systems was  convened by the Organizing Committee of the X3J14 Forth Technical Committee on  August 3, 1987, and has met subsequently on November 11-12, 1987, February 10-12,  May 3-6, 1989, July 26-29, 1989, October 25-28, 1989, January 24-27, 1990, May 22-26,  1992, January 26-30, 1993, June 28-30, 1993, and June 21, 1994.

> Requests for interpretation, suggestions for improvement or addenda, or defect reports are  welcome. They should be sent to the X3 Secretariat, Computer and Business Equipment  Manufacturers Association, 1250 Eye Street, NW, Suite 200, Washington, DC 20005.

||X3 Membership||
This standard was processed and approved for submittal to ANSI by the Accredited Standards Committee on Information Processing Systems, X3. Committee approval of this  standard does not necessarily imply that all committee members voted for its approval. At  the time it approved this standard, the X3 Committee had the following members:

James D. Converse, Chair<br>
Donald C. Loughry, Vice-Chair<br>
Joanne Flanagan, Secretary

<membership>
Producer Group|Name of Representative
AMP Incorporated| Edward Kelly
                |Charles Brill (Alt.) 
AT&T/NCR Corporation | Thomas W. Kern
                    |Thomas F. Frost (Alt.) 
Apple Computer, Inc| Karen Higginbottom
Compaq Computers| James Barnes
Digital Equipment Corporation| Delbert Shoemaker
                            |Kevin Lewis 
Hitachi America Ltd| John Neumann
                    |Kei Yamashita (Alt.) 
Hewlett Packard| Donald C. Loughry
Bull HN Information Systems Inc| William George
IBM Corporation| Joel Urman
                |Mary Anne Lawler (Alt.) 
Unisys Corporation | John Hill
                    |Stephen P. Oksala (Alt.) 
Sony Corporation of America| Michael Deese
Storage Technology Corporation| Joseph S. Zajaczkowski
                            |Samuel D. Cheatham (Alt.) 
Sun Microsystems, Inc| Scott Jameson
                    |Gary S. Robinson (Alt.) 
* Xerox Corporation |Dwight McBain 
                    |Roy Pierce (Alt.) 
3M Company |Edie T. Morioka 
            |Paul D. Jahnke (Alt.

Consumers Group|
Boeing Company | Catherine Howells
                | Andrea Vanosdoll (Alt.) 
Eastman Kodak Company| James Converse
                    |Michael Nier (Alt.) 
General Services Administration | Douglas Arai
                                |Larry L. Jackson (Alt.) 
Guide International Inc| Frank Kirshenbaum
                        | Harold Kuneke (Alt.) 
* Hughes Aircraft Company | Harold Zebrack 
National Communications Systems| Dennis Bodson
Northern Telecom Inc. | Mel Woinsky
                        |Subhash Patel (Alt.) 
** Recognition Tech Users Association| Herbert P. Schantz 
                        | G. Edwin Hale (Alt.) 
Share Inc. | Gary Ainsworth
            |David Thewis (Alt.) 
U. S. Department of Defense| William Rinehuls
                        | C. J. Pasquariello (Alt.) 
U. S. Department of Energy| Alton Cox
                        |Lawrence A. Wasson (Alt.) 
Wintergreen Information Services | John Wheeler

General Interest Group|
American Nuclear Society | Geraldine C. Main
                        | Sally Hartzell (Alt.) 
Assn. of the Institute for Certification of Computer Professionals| Kenneth Zemrowski 
Nat'l Institute of Standards and Technology | Robert E. Rountree
                                        | Micharl Hogan (Alt.) 
Neville & Associates|Carlton Neville 
</membership>


||X3J14  Membership||
At the time it approved this draft of the proposed American National Standard, the  Technical Committee X3J14 on the Forth Programming Language had the following  members:  

Elizabeth Rather, Chair  
Mitch Bradley, acting Vice-Chair  
Don Colburn, Secretary  
John Rible, Technical Editor  
Len Zettel, Vocabulary Representative  
Greg Bailey, Technical Subcommittee Chair  

Organization Represented Name of Representative  

ATHENA Programming, Inc. ...............................................Greg Bailey  
Bradley Forthware ...............................................................Mitch Bradley  
Creative Solutions, Inc. .......................................................Don Colburn  
Ford Motor Company ..........................................................Leonard F. Zettel, Jr.  
 Dennis Ruffer (Alt.)  
 Horace Simmons (Alt.)  
 Stephen Egbert (Alt.)  
 John Rible 
 J. E. (Jet) Thomas 
 Kathleen McMillan 

FORTH, Inc. ........................................................................Elizabeth Rather  
Institute for Applied Forth Research....................................Lawrence Forsley  
Johns Hopkins University, Applied Physics Lab..................John Hayes  
Mephistopheles Systems ....................................................Dave Harralson  
NASA/Goddard Space Flight Center...................................James Rash  
Nomadic Software...............................................................John K. Stevenson  
Unisyn, Inc...........................................................................Gary Betts  
Up and Running ..................................................................Martin Tracy  
Vesta Technology................................................................Jack Woehr  
Individual Members .............................................................Loring Craymer  X3  
Liasons ..........................................................................Clyde R. Camp  

The following organizations and individuals have also participated in this project as  Technical Committee members, alternates, or observers. The Technical Committee  recognizes and respects their contributions:  

Organizations  

British Columbia Inst. of Tech. MCI Telecommunications Corp.
Computer Cowboys Micromotion  
Computer Sciences Corp. MicroProcessor Engineering Ltd.  
Computer Strategies, Inc. National Institute of Standards & Technology  
Digalog Corp. NCR Medical Systems Group  
Embedded Sys. Programming Mag. Performance Packages, Inc.  
Forth Interest Group (FIG) Purdue University  
H.B. Pascal & Co., Inc. Robert Berkey Services  
Harris Semiconductor Shaw Laboratories  
IBM Corporation Social Security Administration  
IEEE Software Engineering  
Kelly Enterprises Texas Instruments  
Laboratory Microsystems, Inc. The Dickens Company  
Maxtor Corp.

</foreword>

