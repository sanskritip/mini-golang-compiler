#include <bits/stdc++.h>
#include "SymbolTable.h"

using namespace std;
int token_count=0;

SymbTab table[10000];

void lookup(char *token,int line,char type,char *value,char *datatype)
{
  //printf("Token %s line number %d\n",token,line);
  int flag = 0;
  for(int i = 0;i < token_count;i++)
  {
    if(!strcmp(table[i].symbol,token))
    {
      flag = 1;
      if(table[i].line_no != line)
      {
        table[i].line_no = line;
      }
    }
  }
  
  //Insert
  if(flag == 0)
  {
    table[token_count].token_id = (char*)malloc(sizeof(char)*20);
    string token_id = "TK_" + to_string(token_count);
    strcpy(table[token_count].token_id,(char *)token_id.c_str());
    strcpy(table[token_count].symbol,token);
    table[token_count].symbol_type = type;
    if(value==NULL)
        table[token_count].value=NULL;
    else
        strcpy(table[token_count].value,value);
        
    if(datatype==NULL)
        table[token_count].datatype=NULL;
    else
        table[token_count].datatype=datatype;
        
    table[token_count].line_no = line;
    token_count++;
  }
}

void search_id(char *token,int lineno)
{
  int flag = 0;
  for(int i = 0;i < token_count;i++)
  {
    if(!strcmp(table[i].symbol,token))
    {
      flag = 1;
      return;
    }
  }
  if(flag == 0)
  {
    printf("Error at line %d : %s is not defined\n",lineno,token);
    exit(0);
  }
}

void update(char *token,int lineno,char *value)
{
  int flag = 0;
  
  for(int i = 0;i < token_count;i++)
  {
    if(!strcmp(table[i].symbol,token))
    {
      flag = 1;
      table[i].value = (char*)malloc(sizeof(char)*strlen(value));
      //sprintf(table[i].value,"%s",value);
      strcpy(table[i].value,value);
      table[i].line_no = lineno;
      return;
    }
  }
  if(flag == 0)
  {
    printf("Error at line %d : %s is not defined\n",lineno,token);
    exit(0);
  }
}

int get_val(char *token)
{
  int flag = 0;
  for(int i = 0;i < token_count;i++)
  {
    if(!strcmp(table[i].symbol,token))
    {
      flag = 1;
      return atoi(table[i].value);
    }
  }
  if(flag == 0)
  {
    printf("Error at line : %s is not defined\n",token);
    exit(0);
  }
}

void Display(){
    for(int i=0;i<82;i++)
        printf("-");
    printf("\n LABEL\t  | SYMBOL\t\t | SYMBOL_TYPE\t        | LINE\t | VALUE\t\n");
    for(int i=0;i<82;i++)
        printf("-");
    cout << endl;
    for (int i = 0; i < token_count; i++)
    {   
        printf(" %-8s | %-20s | %-20c | %-8d | %-10s\n", table[i].token_id, table[i].symbol, table[i].symbol_type, table[i].line_no, table[i].value);
    }
    for(int i=0;i<65;i++)
        printf("-");
    cout << endl;
}