
%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
int yylex (void);
void yyerror (const char *);

char * tabs(int n)
{
  char *s = (char *)malloc(n+1);
  memset(s, '\t', n);
  s[n]='\0';
  return s;
}
typedef struct Node
{
  char *str;
  struct Node* next;
} Node;

typedef struct List
{
  struct Node* head, *tail;
} List;
int left;
void printList(List* l)
{
  Node* n = l->head;
  while(n != NULL)
  {
	if(strcmp(n->str, "{") == 0)
    {
		left++;
		printf("%s\n%s", n->str, tabs(left));
	}
	else if(strcmp(n->str, "}") == 0)
	{
		left--;
		printf("\n%s%s\n%s",tabs(left), n->str, tabs(left));
	}
	else if(strcmp(n->str, ";") == 0)
	{
		printf("%s\n%s", n->str, tabs(left));
	}
	else{
		printf("%s ", n->str);
	}
    n = n->next;
  }
}
typedef struct Macro
{
  Node* id;
  List* args, *replacement;
  bool isExpr;
  struct Macro* next;
} Macro;

Macro* newMacro(Node* id, List* args, List *replacement, bool isExpr)
{
  Macro * m = (Macro *)malloc(sizeof(Macro));
  m->id = id;
  m->args = args;
  m->replacement = replacement;
  m->isExpr = isExpr;
  m->next = NULL;
}

typedef struct MacroList
{
  Macro* head,* tail; 
} MacroList;

MacroList *macros;


void appendMacro(Macro* m)
{
  if(macros->head == NULL)
  {
    macros->head = m;
    macros->tail = m;
  }
  else
  {
    macros->tail->next = m;
    macros->tail = m;
  }
}
Node* newNode(char* str)
{
  Node* n = (Node*)malloc(sizeof(Node));
  n->str = malloc(strlen(str)+1);
  n->next = NULL;
  strcpy(n->str, str);
  return n;
};

void addNode(Node* n, List* l)
{
  if(l->head == NULL)
  {
    l->head = n;
    l->tail = n;
  }
  else
  {
    l->tail->next = n;
    l->tail = n;
  }
}

int isEmpty(List* l)
{
  return l->head == NULL;
}

void combineList(List* l1, List* l2)
{
  if(!isEmpty(l2)){
    if(isEmpty(l1)){
      l1->head = l2->head;
      l1->tail = l2->tail;
    }
    else{
      l1->tail->next = l2->head;
      l1->tail = l2->tail;
    }
  }
};

List* createList()
{
  List* l = (struct List*)malloc(sizeof(List));
  l->head = NULL;
  l->tail = NULL;
  return l;
};
List* createNodeList(char* str)
{
  List* l = createList();
  addNode(newNode(str), l);
  return l;
}

List* copyList(struct List* l)
{
	struct List* copyList = createList();
	struct Node* n = l->head;
	while(n!=NULL)
	{
		addNode(newNode(n->str), copyList);
		n = n->next;
	}	
	return copyList;
}

typedef struct ExpressionNode{
	List* list;
	struct ExpressionNode* next;
} ExpressionNode;

typedef struct ExpressionList{
	ExpressionNode* head, *tail;
} ExpressionList;

ExpressionNode* createExpressionNode(List* l)
{
	ExpressionNode* n = (ExpressionNode*)malloc(sizeof(ExpressionNode));
	n->list = copyList(l);
	n->next = NULL;
}

ExpressionList* createExpressionList()
{
	ExpressionList* l = (ExpressionList*)malloc(sizeof(ExpressionList));
	l->head = NULL;
	l->tail = NULL;
	return l;
}

void combineExpressionList(ExpressionList*l1 ,ExpressionList* l2)
{
	if(!(l2->head == NULL)){
		if(l1->head == NULL){
			l1->head = l2->head;
			l1->tail = l2->tail;
		}
		else{
			l1->tail->next = l2->head;
			l1->tail = l2->tail;
		}
	}
}
void addExpressionNode(ExpressionNode* n, ExpressionList* l)
{ 
	if(l->head == NULL){
		l->head = n;
		l->tail = n;
	}
	else{
		l->tail->next = n;
		l->tail = n;
	}
}
List* listOfExpressionList(ExpressionList* l)
{
	List* list=createList();
	ExpressionNode* n = l->head;
	while(n)
	{
		combineList(list, n->list);
		n = n->next;
		if(n)
		{
			addNode(newNode(","), list);
		}
	}
	return list;
}
void replaceNodeByList(Node** n, List* l) //Assuming l is never empty
{
	(*n)->str = (l)->head->str;
  if(l->head->next == NULL)
  {
    return;
  }
	Node* tmp=(*n)->next;
	(*n)->next = (l)->head->next;
	((l)->tail)->next = tmp;
  
  (*n)=(l)->tail;
}
void deleteList(List* l)
{
  Node* n = l->head;
  while(n)
  {
    Node* tmp = n->next;
    free (n->str);
    free (n);
    n = tmp;
  }
  free (l);
}
void deleteMarcoList(MacroList* l)
{
  Macro* n = l->head;
  while(n)
  {
    Macro* tmp = n->next;
    free (n->id);
    deleteList(n->args);
    deleteList(n->replacement);
    free (n);
    n = tmp;
  }
  free (l);
}
%}

%union {
  char* string;
  List* list;
  ExpressionList* expressionList;
}

%token<string>  EQ LEQ AND OR NOT ADD SUB MUL DIV NEQ
%token<string>  DOT TRUE FALSE THIS NEW LEFTPAR RIGHTPAR LEFTCURLY 
%token<string>  RIGHTCURLY CLASS PRINTLN PUBLIC STATIC VOID MAIN SEMICOLON 
%token<string>  EXTENDS LEFTSQUARE RIGHTSQUARE COMMA RETURN IF ELSE WHILE 
%token<string>  STRING INT BOOLEAN IDENTIFIER LENGTH INTEGER
%token<string>  DEFINESTMT DEFINESTMT0 DEFINESTMT1 DEFINESTMT2
%token<string>  DEFINEEXPR DEFINEEXPR0 DEFINEEXPR1 DEFINEEXPR2

%type <list> eq leq and or not add sub mul div neq
%type <list> dot true false this new leftpar rightpar leftcurly 
%type <list> rightcurly class println public static void main semicolon 
%type <list> extends leftsquare rightsquare comma return if else while 
%type <list> string int boolean identifier length integer
%type <list> definestmt definestmt0 definestmt1 definestmt2 
%type <list> defineexpr defineexpr0 defineexpr1 defineexpr2 
%type <list> goal macroDef typeDeclare mainClass typeDeclaration 
%type <list> identifierDeclaration multipleIdentifierDeclaration multipleMethodDeclaration
%type <list> methodDeclaration arguments multipleArguments type statement multipleStatements
%type <list> primaryExpression macroDefinition expression
%type <list> macroDefStatement macroDefExpression multipleIdentifiers 

%type<expressionList> expressions multipleExpressions
%%              
goal  : 
    macroDef mainClass typeDeclare 
    {
      $$=createList();
      combineList($$, $2);
      combineList($$, $3);
      printList($$);
      deleteList($$);     
      deleteMarcoList(macros);
    }
      
;
macroDef: macroDefinition macroDef 
        | %empty {$$=createList();} 
;
macroDefinition : macroDefExpression
                | macroDefStatement
;
macroDefStatement : definestmt  identifier leftpar  identifier comma  identifier comma  identifier multipleIdentifiers rightpar leftcurly multipleStatements rightcurly/* more than 2 arguments */
                  {
                    Node* id= $2->head;
                    List* args=createList();
                    combineList(args, $4);
                    combineList(args, $6);
                    combineList(args, $8);
                    combineList(args, $9);
                    List* replacement=copyList($12);
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
                  | definestmt0  identifier leftpar rightpar leftcurly multipleStatements rightcurly
                  {
                    Node* id= $2->head;
                    List* args=createList();
                    List* replacement=copyList($6);
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
                  | definestmt1  identifier leftpar  identifier rightpar leftcurly multipleStatements rightcurly
                  {
                    Node* id= $2->head;
                    List* args=createList();
                    combineList(args, $4);
                    List* replacement=copyList($7);
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
                  | definestmt2  identifier leftpar  identifier comma  identifier rightpar leftcurly multipleStatements rightcurly
                  {
                    Node* id= $2->head;
                    List* args=createList();
                    combineList(args, $4);
                    combineList(args, $6);
                    List* replacement=$9;

                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
;
macroDefExpression : defineexpr  identifier leftpar  identifier comma  identifier comma  identifier multipleIdentifiers rightpar leftpar expression rightpar /* More than 2 arguments */ 
                    {
                      Node* id= $2->head;
                      List* args=createList();
                      combineList(args, $4);
                      combineList(args, $6);
                      combineList(args, $8);
                      combineList(args, $9);
                      List* replacement=copyList($11);
                      combineList(replacement, $12);
                      combineList(replacement, $13);
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
                   | defineexpr0  identifier leftpar  rightpar leftpar expression rightpar 
                    {
                      Node* id= $2->head;
                      List* args=createList();
                      List* replacement=copyList($5);
                      combineList(replacement, $6);
                      combineList(replacement, $7);
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
                   | defineexpr1  identifier leftpar  identifier rightpar leftpar expression rightpar
                    {
                      Node* id= $2->head;
                      List* args=createList();
                      combineList(args, $4);
                      List* replacement=copyList($6);
                      combineList(replacement, $7);
                      combineList(replacement, $8);
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
                   | defineexpr2  identifier leftpar  identifier comma  identifier rightpar leftpar expression rightpar
                    {
                      Node* id= $2->head;
                      List* args=createList();
                      combineList(args, $4);
                      combineList(args, $6);
                      List* replacement=copyList($8);
                      combineList(replacement, $9);
                      combineList(replacement, $10);
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
;
multipleIdentifiers:%empty {$$=createList();}  
                    | comma  identifier multipleIdentifiers 
                    {
                      $$=createList();
                      combineList($$, $2);
                      combineList($$, $3);
                    }
;
typeDeclare :typeDeclaration typeDeclare 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
            }
            | %empty {$$=createList();}  
;
mainClass  :class identifier leftcurly public static void main leftpar string leftsquare rightsquare  identifier rightpar leftcurly println leftpar expression rightpar semicolon rightcurly rightcurly 
            {
				
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
              combineList($$, $6);
              combineList($$, $7);
              combineList($$, $8);
              combineList($$, $9);
              combineList($$, $10);
              combineList($$, $11);
              combineList($$, $12);
              combineList($$, $13);
              combineList($$, $14);
              combineList($$, $15);
              combineList($$, $16);
              combineList($$, $17);
              combineList($$, $18);
              combineList($$, $19);
              combineList($$, $20);
              combineList($$, $21);
            }
;
typeDeclaration  : class  identifier leftcurly multipleIdentifierDeclaration multipleMethodDeclaration rightcurly 
                  {
                    $$=createList();
                    combineList($$, $1);
                    combineList($$, $2);
                    combineList($$, $3);
                    combineList($$, $4);
                    combineList($$, $5);
                    combineList($$, $6);
                  }
                 | class  identifier extends  identifier leftcurly multipleIdentifierDeclaration  multipleMethodDeclaration rightcurly 
                 {
                  $$=createList();
                  combineList($$, $1);
                  combineList($$, $2);
                  combineList($$, $3);
                  combineList($$, $4);
                  combineList($$, $5);
                  combineList($$, $6);
                  combineList($$, $7);
                  combineList($$, $8);
                 }
;
identifierDeclaration: type identifier semicolon 
                      {
                        $$=createList();
                        combineList($$, $1);
                        combineList($$, $2);
                        combineList($$, $3);
                      }
;
multipleIdentifierDeclaration :%empty {$$=createList();}  
                             |multipleIdentifierDeclaration identifierDeclaration
                             {
                              $$=createList();
                              combineList($$, $1);
                              combineList($$, $2);
                             }  
;
multipleMethodDeclaration :%empty {$$=createList();}  
                          |methodDeclaration multipleMethodDeclaration 
                          {
                            $$=createList();
                            combineList($$, $1);
                            combineList($$, $2);
                          }
;
methodDeclaration  : public type  identifier  leftpar arguments rightpar leftcurly multipleIdentifierDeclaration multipleStatements return expression semicolon rightcurly 
                    {
                      $$=createList();
                      combineList($$, $1);
                      combineList($$, $2);
                      combineList($$, $3);
                      combineList($$, $4);
                      combineList($$, $5);
                      combineList($$, $6);
                      combineList($$, $7);
                      combineList($$, $8);
                      combineList($$, $9);
                      combineList($$, $10);
                      combineList($$, $11);
                      combineList($$, $12);
                      combineList($$, $13);
                    }
;
arguments : %empty {$$=createList();}  
          |type  identifier multipleArguments 
          {
            $$=createList();
            combineList($$, $1);
            combineList($$, $2);
            combineList($$, $3);
          }
;
multipleArguments:%empty {$$=createList();}  
                 |comma type  identifier multipleArguments 
                 {
                  $$=createList();
                  combineList($$, $1);
                  combineList($$, $2);
                  combineList($$, $3);
				          combineList($$, $4);
                 }
;
type    : int leftsquare rightsquare 
        {
          $$=createList();
          combineList($$, $1);
          combineList($$, $2);
          combineList($$, $3);
        }
        | boolean 
        {
          $$=createList();
          combineList($$, $1);
        }
        | int 
        {
          $$=createList();
          combineList($$, $1);
        }
        | identifier 
        {
          $$=createList();
          combineList($$, $1);
        }
;      
statement   : leftcurly multipleStatements rightcurly 
            {                                                                                    
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | println leftpar expression rightpar semicolon 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
            }
            | identifier eq expression semicolon 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
            }
            | identifier leftsquare expression rightsquare eq expression semicolon 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
              combineList($$, $6);
              combineList($$, $7);
            }
            | if leftpar expression rightpar statement 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
            }
            | if leftpar expression rightpar statement else statement 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
              combineList($$, $6);
              combineList($$, $7);
            }
            | while leftpar expression rightpar statement 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, $5);
            }
            | identifier leftpar multipleExpressions rightpar semicolon /* Macro stmt call */ 
            {
              $$=createList();
              Macro* m= macros->head;
			        ExpressionNode* reparg= $3->head;
              int cnt1=0;
              ExpressionNode* tmp1= $3->head;
              while(tmp1)
              {
                cnt1++;
                tmp1=tmp1->next;
              }
              while(m)
              {
                if(m->isExpr)
                {
                  m=m->next;
                  continue;
                }
                if(strcmp(m->id->str, $1->head->str)==0)
                {				
                  int cnt2=0;
                  Node* tmp2= m->args->head;
                  while(tmp2)
                  {
                    cnt2++;
                    tmp2= tmp2->next;
                  }
                  if(cnt2!=cnt1)
                  {
                    m=m->next;
                    continue;
                  }
                  Node* a= m->args->head;
                  List* replaced = copyList(m->replacement);
                  while(a && reparg)
                  {
                    
                    Node* repl= replaced->head;
                    while(repl)
                    {
                      if(strcmp(a->str, repl->str)==0)
                      {
                        
                        replaceNodeByList(&repl, copyList(reparg->list));
                        
                      }
                      if((repl->next)==NULL)
                      {
                        replaced->tail=repl;
                      }
                      repl=repl->next;
                      
                    }
                    a=a->next;
                    reparg=reparg->next;

                  }
                  $$=replaced;
                  break;
                }
                m=m->next;
              
			        }
              if(!m)
              {
              printf("//Macro Statement Definition not found\n");
              return -1;
              }
			        
            }
;
multipleStatements : %empty {$$=createList();}  
                    |statement multipleStatements  
                    {
                      $$=createList();
                      combineList($$, $1);
                      combineList($$, $2);
                    }
;     
expression  : primaryExpression and primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression or primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression neq primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression leq primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression add primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression sub primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression mul primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression div primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression leftsquare primaryExpression rightsquare
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
            }
            | primaryExpression dot length 
            {
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
            }
            | primaryExpression 
            {
              $$=createList();
              combineList($$, $1);
            }
            | primaryExpression dot  identifier leftpar multipleExpressions rightpar
            {
			
              $$=createList();
              combineList($$, $1);
              combineList($$, $2);
              combineList($$, $3);
              combineList($$, $4);
              combineList($$, listOfExpressionList($5));
              combineList($$, $6);
            }
            | identifier leftpar multipleExpressions rightpar/* Macro expr call */
            {
              $$=createList();
              Macro* m= macros->head;
              ExpressionNode* reparg= $3->head;
              int cnt1=0;

              ExpressionNode* tmp1= $3->head;
              while(tmp1)
              {
                cnt1++;
                tmp1=tmp1->next;
              }
              
              while(m)
              {
                if(!(m->isExpr))
                {
                  m=m->next;
                  continue;
                }
                if(strcmp(m->id->str, $1->head->str)==0)
                {				
                  int cnt2=0;
                  Node* tmp2= m->args->head;
                  while(tmp2)
                  {
                    cnt2++;
                    tmp2= tmp2->next;
                  }
                  if(cnt2!=cnt1)
                  {
                    m=m->next;
                    continue;
                  }
                  Node* a= m->args->head;
                  List* replaced = copyList(m->replacement);
                  while(a && reparg)
                  {
                    Node* repl= (replaced)->head;
                    while(repl)
                    {
                      if(strcmp(a->str, repl->str)==0)
                      {
                        replaceNodeByList(&repl, (copyList(reparg->list)));
                      }
                      repl=repl->next;
                    }
                    a=a->next;
                    reparg=reparg->next;

                  }
                  $$=copyList(replaced);
                  break;
                }
                m=m->next;
              
              }
              if(!m)
              {
                printf("//Macro Expression Definition not found\n");
                return -1;
              }
            }
;
expressions : %empty {$$=createExpressionList();}  
            | comma expression expressions
            {
              $$=createExpressionList();
              addExpressionNode(createExpressionNode($2), $$);
              combineExpressionList($$, $3);
            }
;
multipleExpressions: %empty {$$=createExpressionList();}  
                    |expression expressions  
                    {
                      $$=createExpressionList();
                      addExpressionNode(createExpressionNode($1), $$);
                      combineExpressionList($$, $2);
                    } 
;     
primaryExpression : integer
                  {
                    $$=createList();
                    combineList($$, $1);
                  }
                  | true
                  {
                    $$=createList();
                    combineList($$, $1);
                  }
                  | false
                  {
                    $$=createList();
                    combineList($$, $1);
                  }
                  | identifier
                  {
                    $$=createList();
                    combineList($$, $1);
                  }
                  | this 
                  {
                    $$=createList();
                    combineList($$, $1);
                  }
                  | new int leftsquare expression rightsquare
                  {
                    $$=createList();
                    combineList($$, $1);
                    combineList($$, $2);
                    combineList($$, $3);
                    combineList($$, $4);
                    combineList($$, $5);
                  }
                  | new  identifier leftpar rightpar
                  {
                    $$=createList();
                    combineList($$, $1);
                    combineList($$, $2);
                    combineList($$, $3);
                    combineList($$, $4);
                  }
                  | not expression
                  {
                    $$=createList();
                    combineList($$, $1);
                    combineList($$, $2);
                  }
                  | leftpar expression rightpar
                  {
                    $$=createList();
                    combineList($$, $1);
                    combineList($$, $2);
                    combineList($$, $3);
                  }
;
eq: EQ {$$=createNodeList("=");}
;
leq: LEQ {$$=createNodeList("<=");}
;
and: AND {$$=createNodeList("&&");}
;
or: OR {$$=createNodeList("||");}
;
not: NOT {$$=createNodeList("!");}
;
add: ADD {$$=createNodeList("+");}
;
sub: SUB {$$=createNodeList("-");}
;
mul: MUL {$$=createNodeList("*");}
;
div: DIV {$$=createNodeList("/");}
;

dot: DOT {$$=createNodeList(".");}
;
true: TRUE {$$=createNodeList("true");}
;
false: FALSE {$$=createNodeList("false");}
;
this: THIS {$$=createNodeList("this");}
;
new: NEW {$$=createNodeList("new");}
;
leftpar: LEFTPAR {$$=createNodeList("(");}
;
rightpar: RIGHTPAR {$$=createNodeList(")");}
;
leftcurly: LEFTCURLY {$$=createNodeList("{");}
;

rightcurly: RIGHTCURLY {$$=createNodeList("}");}
;
class: CLASS {$$=createNodeList("class");}
;
println: PRINTLN {$$=createNodeList("System.out.println");}
;
public: PUBLIC {$$=createNodeList("public");}
;
static: STATIC {$$=createNodeList("static");}
;
void: VOID {$$=createNodeList("void");}
;
main: MAIN {$$=createNodeList("main");}
;
semicolon: SEMICOLON {$$=createNodeList(";");}
;

extends: EXTENDS {$$=createNodeList("extends");}
;
leftsquare: LEFTSQUARE {$$=createNodeList("[");}
;
rightsquare: RIGHTSQUARE {$$=createNodeList("]");}
;
comma: COMMA {$$=createNodeList(",");}
;
return: RETURN {$$=createNodeList("return");}
;
if: IF {$$=createNodeList("if");}
;
else: ELSE {$$=createNodeList("else");}
;
while: WHILE {$$=createNodeList("while");}
;

string: STRING {$$=createNodeList("String");}
;
int: INT {$$=createNodeList("int");}
;
boolean: BOOLEAN {$$=createNodeList("boolean");}
;
identifier: IDENTIFIER { $$=createNodeList( $1);}
;
length: LENGTH {$$=createNodeList("length");}
;
integer: INTEGER {$$=createNodeList($1);}
;

definestmt: DEFINESTMT {$$=createList();} 
;
definestmt0: DEFINESTMT0 {$$=createList();} 
;
definestmt1:  DEFINESTMT1 {$$=createList();} 
;
definestmt2: DEFINESTMT2 {$$=createList();} 
;

defineexpr: DEFINEEXPR {$$=createList();} 
;
defineexpr0: DEFINEEXPR0 {$$=createList();} 
;
defineexpr1: DEFINEEXPR1 {$$=createList();} 
;
defineexpr2: DEFINEEXPR2 {$$=createList();} 
;
neq: NEQ {$$=createNodeList("!=");}
;

%%

void yyerror(const char* s)
{
  printf("//Failed to parse input code");
}
int main()
{
  left=0;
  macros=(MacroList *)malloc(sizeof(MacroList));
  macros->head = macros->tail = NULL;
  yyparse();
  return 0;
}
#include "lex.yy.c"