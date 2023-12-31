/*
    Lex program to check whether an year is a leap year or not
*/

%{ 
void check(char *); 
%} 

/*Rule Section*/
%% 
[0-9] ; 
[0-9][0-9] ; 
[0-9][0-9][0-9]	 ; 
[0-9][0-9][0-9][0-9] { printf("%s", yytext);check(yytext); } 
[0-9][0-9][0-9][0-9][0-9]+ ; 
%% 

// driver program 
int main() 
{ 
	extern FILE *yyin; 
	yyin=fopen("num", "r"); 

	// The function that starts the analysis 
	yylex(); 
	return 0; 

} 

void check(char *a) 
{ 
	int x=0, i; 

	for(i=0;i<4;i++) 
		x=x*10+(a[i]-'0'); 

	if(x%400==0) 
		printf("\tleap year\n"); 

	else if(x%4==0&&x%100!=0) 
		printf("\tleap year\n"); 

	else
		printf("\tnot a leap year\n"); 
} 
