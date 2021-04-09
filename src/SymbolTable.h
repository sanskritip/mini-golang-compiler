#define MAX_LINES 10

typedef struct identifier {
    int data_type;
    /*
        1 - int
        2 - float
        3 - bool 
        4 - float32
        5 - string
    */
    union {
        int n;
        char* c;
        float f;
        bool b;
    };
}Identifier;


struct SymbTab
{
    char* token_id; // token id
    char* symbol; // token read
    char* symbol_type; // token type from lexer eg IDENTIFIER
    int lines[MAX_LINES]; // lines part of it
    int line_count; // count of the lines
    Identifier* identifier;
    struct SymbTab *next;
};



void Insert(char symbol[], int address, char symbol_type[]);
void Display();
// void Delete();
struct SymbTab* Search(char lab[]);
