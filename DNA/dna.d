module dna;

import std.stdio;
import std.exception;
import std.conv : to;

pure bool isACGT(char c) {
    return (c == 'A' || c == 'C' || c == 'G' || c == 'T');
}

void main() {
    
    ulong A, C, G, T;
    
    foreach(c; stdin.byChunk(1)) {
        char nt = c[0];
        if(nt.isACGT) {
            final switch(c[0]) {
                case 'A': ++A; break;
                case 'C': ++C; break;
                case 'G': ++G; break;
                case 'T': ++T; break;
            }
        }
    }
    
    writefln("%s %s %s %s", A, C, G, T);
    
}