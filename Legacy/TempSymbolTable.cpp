#include <bits/stdc++.h>
#include "SymbolTable.h"

using namespace std;
int curr_token_id=0;

struct SymbTab *first, *last;
struct SymbTab* Search(char lab[])
{
    int i, flag = 0;
    struct SymbTab *symbol_entry;
    symbol_entry = first;
    //printf("Inside Search, before loop");
    for (i = 0; i < curr_token_id; i++)
    {
        //printf("Inside search loop\n");
        //printf("%s %s\n",symbol_entry->symbol, lab);
        if (strcmp(symbol_entry->symbol, lab) == 0)
        {   return symbol_entry;
            //printf("MATCH");
        }
        symbol_entry = symbol_entry->next;
    }
    return NULL;
};

void Insert(char symbol[], int line_no, char symbol_type[])
{
    struct SymbTab* n;
    // search for the symbol in the table
    n = Search(symbol);
    // if token already exists in the symbol table
    if (n)
    {
        n->lines[n->line_count] = line_no;
        n->line_count++;
    }
    else{
        // If token does not exist in the table
        struct SymbTab *symbol_entry;
        symbol_entry = (SymbTab*) malloc(sizeof(struct SymbTab));
        
        // Token Label as TK<NO>   
        string token_id = "TK_" + to_string(curr_token_id);
        
        cout <<"type,size " << symbol_type << sizeof(symbol) << sizeof(symbol[0]) << endl;

        symbol_entry->token_id = (char*)malloc(sizeof(char)*20);
        symbol_entry->symbol_type = (char*)malloc(sizeof(char)*100);
        symbol_entry->symbol = (char*)malloc(sizeof(char)*100);
        
        strcpy(symbol_entry->token_id,(char *)token_id.c_str());

        // Token read
        strcpy(symbol_entry->symbol, symbol);
        strcpy(symbol_entry->symbol_type,symbol_type);
        
        
        // Updating line count
        symbol_entry->lines[0] = line_no;
        symbol_entry->line_count=1;
        symbol_entry->next = NULL;

        
        // Updating the HEAD and TAIL for the symbol table
        if (curr_token_id == 0)
        {
            first = symbol_entry;
            last = symbol_entry;
        }
        else
        {
            last->next = symbol_entry;
            last = symbol_entry;
        }

        if(symbol_type=="T_IDENTIFIER"){
            Identifier* new_identifier = (Identifier*)malloc(sizeof(Identifier));
            new_identifier->data_type = 0;
            symbol_entry->identifier = new_identifier;
        }
        else {
            symbol_entry->identifier=NULL;
        }
        // Updating the next incoming token_id
        curr_token_id++;
    }
}
void Display()
{
    int i;
    struct SymbTab *symbol_entry;
    symbol_entry = first;
    for(int i=0;i<65;i++)
        printf("-");
    printf("\n LABEL\t  | SYMBOL\t\t | SYMBOL_TYPE\t        | ADDRESS\n");
    for(int i=0;i<65;i++)
        printf("-");
    cout << endl;
    for (i = 0; i < curr_token_id; i++)
    {   
        printf(" %-8s | %-20s | %-20s | ", symbol_entry->token_id, symbol_entry->symbol,symbol_entry->symbol_type);
        for (int i=0;i<symbol_entry->line_count;i++){
            printf("%d,",symbol_entry->lines[i]);
        }
        printf("\n");
        symbol_entry = symbol_entry->next;
    }
    for(int i=0;i<65;i++)
        printf("-");
    cout << endl;
}