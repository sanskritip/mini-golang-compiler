#include <bits/stdc++.h>
#include "SymbolTable.h"

using namespace std;
int size=0;

    struct SymbTab *first, *last;
    struct SymbTab* Search(char lab[])
    {
        //printf("\n\nInside search ->%s\n\n",lab);
        int i, flag = 0;
        struct SymbTab *p;
        p = first;
        //printf("Inside Search, before loop");
        for (i = 0; i < size; i++)
        {
            //printf("Inside search loop\n");
            //printf("%s %s\n",p->symbol, lab);
            if (strcmp(p->symbol, lab) == 0)
            {   return p;
                //printf("MATCH");
            }
            p = p->next;
        }
        return NULL;
    }
    void Insert(char symbol[], int address, char symbol_type[])
    {
        // printf("Inside ;Insert\n");
        printf(" %s, %d",symbol, address);
        //int n=0;
        // char l[20];
        // printf("\n\tEnter the label : ");
        // scanf("%s", l);
        struct SymbTab* n;
        n = Search(symbol);
        if (n)
        {
            n->addr[n->addr_no] = address;
            n->addr_no++;
        }
        else{
            struct SymbTab *p;
            p = (SymbTab*)malloc(sizeof(struct SymbTab));
            //Token Label as TK<NO>
            string token_no = "TK_"+to_string(size);
            strcpy(p->label,token_no.c_str());
            // printf("\n\tEnter the symbol : ");
            // scanf("%s", p->symbol);
            strcpy(p->symbol, symbol);
            strcpy(p->symbol_type,symbol_type);
            // printf("\n\tEnter the address : ");
            // scanf("%d", &p->addr);
            p->addr[0] = address;
            p->addr_no=1;
            p->next = NULL;
            if (size == 0)
            {
                first = p;
                last = p;
            }
            else
            {
                last->next = p;
                last = p;
            }
            size++;
        
        // printf("\n\tLabel ;inserted\n");
        }
    }
    void Display()
    {
        int i;
        struct SymbTab *p;
        p = first;
        printf("\n\tLABEL\t\tSYMBOL\t\t\tSYMBOL_TYPE\t\t\tADDRESS\n");
        for (i = 0; i < size; i++)
        {   
            printf("\t%s\t\t%s\t\t\t%s\t\t\t", p->label, p->symbol,p->symbol_type);
            for (int i=0;i<p->addr_no;i++){
                printf("%d,",p->addr[i]);
            }
            printf("\n");
            p = p->next;
        }
    }