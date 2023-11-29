/* LEX Code that accepts the string having even binary number over input alphabet {0,1} */

%{
%}
  
%s A DEAD
  
%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");}
  
<A>0 BEGIN A;
<A>1 BEGIN INITIAL;
<A>[^01\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("Accepted\n");}
  
<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 
  
%%

int yywrap()
{
    return 1;
}  
int main()
{
    printf("Enter String\n");
    yylex();
return 0;
}