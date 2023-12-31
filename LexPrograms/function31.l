/* LEX Code that accepts the string with 0 only */

%{ 
%} 

%s A DEAD 

// logic for dead state 
%% 
<INITIAL>0 BEGIN A; 
<INITIAL>[^0\n] BEGIN DEAD; 
<INITIAL>\n BEGIN INITIAL; {printf("Not Accepted\n");} 

// Initial node - Accepted 
<A>0 BEGIN A; 
<A>[^0\n] BEGIN DEAD; 
<A>\n BEGIN INITIAL; {printf("Accepted\n");} 

// Invalid Case 
<DEAD>[^\n] BEGIN DEAD; 
<DEAD>\n BEGIN INITIAL; {printf("Invalid\n");} 

%% 

	
// Method - yywrap 
int yywrap() 
{ 
return 1; 
} 

// main method 
int main() 
{ 
printf("Enter String\n"); 
// called yylex method 
yylex(); 
return 0; 
}
