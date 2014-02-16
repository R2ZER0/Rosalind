module revc;

import std.stdio;
import std.algorithm;
import std.conv;
import std.string;

pure bool isACGT(T)(T c) {
    return (c == 'A' || c == 'C' || c == 'G' || c == 'T');
}

pure char getComplement(char c) {
    if(isACGT(c)) {
        final switch(c) {
            case 'A': return 'T';
            case 'C': return 'G';
            case 'G': return 'C';
            case 'T': return 'A';
        }
    } else return c;
}

void main() {
    char[] buffer;
    stdin.readln(buffer);
    buffer = chomp(buffer);
    
    foreach(ref char c; buffer)
        c = getComplement(c);
    
    reverse(buffer);
    
    writeln(buffer);
}