module rna;

import std.stdio;

pure bool isACGT(T)(T c) {
    return (c == 'A' || c == 'C' || c == 'G' || c == 'T');
}

void main() {
    
    for(;;) {
        
        auto nt = getchar();
        
        if(isACGT(nt)) {
            if(nt == 'T') putchar('U');
            else putchar(nt);
        }
        
        if(nt == EOF)
            break;        
    }
    
    writeln();
    
}