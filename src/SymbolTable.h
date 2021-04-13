typedef struct
{
    char* token_id; // token id
    char symbol[100]; // token read
    char symbol_type; // token type from lexer eg IDENTIFIER
    int line_no; 
    char *value;
    char *datatype;
}SymbTab;


//Symbol Table functions
void lookup(char *,int,char,char*,char* );
//void insert(char *,int,char,char*,char* );
void update(char *,int,char *);
void search_id(char *,int );
int get_val(char *token);
void Display();
