char** command_parse(char*);
char* run_command(char** arglist);
void command_freelist(char **arglist);
int is_builtin(char** arg);