/* LEX Code that accepts the string ending with ‘abb’ over input alphabet {a,b} */

%{
%}
 
%s A B C DEAD

// not accepted state after visiting A 
%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN INITIAL;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}

// not accepted state after visiting A and B state
<A>a BEGIN A;
<A>b BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Not Accepted\n");}
 
// // not accepted state after visiting A and C state  
<B>a BEGIN A;
<B>b BEGIN C;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("Not Accepted\n");}

// Accepted case
<C>a BEGIN A;
<C>b BEGIN INITIAL;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("Accepted\n");}

// Invalid Case 
<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");}
 
%%
// yywrap method
int yywrap()
{
return 1;
}  

// main method 
int main()
{
   printf("Enter String\n");
   // called yylex
   yylex();
return 0;
}