#include <bits/stdc++.h>
#include "SymbolTable.h"

using namespace std;
int size=0;
struct SymbTab
    {
        char label[10];
        char symbol[50];
        int addr;
        struct SymbTab *next;
    };
    struct SymbTab *first, *last;
    int Search(char lab[])
    {
        // printf("Inside search\n");
        int i, flag = 0;
        struct SymbTab *p;
        p = first;
        //printf("Inside Search, before loop");
        for (i = 0; i < size; i++)
        {
            //printf("Inside search loop\n");
            if (strcmp(p->label, lab) == 0)
                flag = 1;
            p = p->next;
        }
        return flag;
    }
    void Insert(char symbol[], int address)
    {
        // printf("Inside ;Insert\n");
        printf(" %s, %d",symbol, address);
        //int n=0;
        // char l[20];
        // printf("\n\tEnter the label : ");
        // scanf("%s", l);
        int n = Search(symbol);
        printf("%d", n);
        if (n == 1)
            printf("\n\tThe label exists already in the symbol table\n\tDuplicate can’t be ;inserted");
        else
        {
            struct SymbTab *p;
            p = (SymbTab*)malloc(sizeof(struct SymbTab));
            //Token Label as TK<NO>
            strcpy(p->label,"TK_0");
            // printf("\n\tEnter the symbol : ");
            // scanf("%s", p->symbol);
            strcpy(p->symbol, symbol);
            // printf("\n\tEnter the address : ");
            // scanf("%d", &p->addr);
            p->addr = address;
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
        }
        // printf("\n\tLabel ;inserted\n");
    }
    void Display()
    {
        int i;
        struct SymbTab *p;
        p = first;
        printf("\n\tLABEL\t\tSYMBOL\t\tADDRESS\n");
        for (i = 0; i < size; i++)
        {
            printf("\t%s\t\t%s\t\t%d\n", p->label, p->symbol, p->addr);
            p = p->next;
        }
    }