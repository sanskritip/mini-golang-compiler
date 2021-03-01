#define NULL 0
struct SymbTab
    {
        char label[10];
        char symbol[50];
        char symbol_type[50];
        int addr[10];
        int addr_no;
        struct SymbTab *next;
    };

void Insert(char symbol[], int address, char symbol_type[]);
void Display();
// void Delete();
struct SymbTab* Search(char lab[]);
