module gc;
// calulate the GC-content of a given DNA string

import std.stdio;
import std.string : chomp;
import std.conv : to;

pure bool isACGT(char c) {
    return (c == 'A' || c == 'C' || c == 'G' || c == 'T');
}

struct NTCount { ulong A, C, G, T; }

pure NTCount getNTCount(in char[] str) {
    
    NTCount count;
    
    foreach(char nt; str) {
        if(nt.isACGT) {
            final switch(nt) {
                case 'A': ++count.A; break;
                case 'C': ++count.C; break;
                case 'G': ++count.G; break;
                case 'T': ++count.T; break;
            }
        }
    }
    
    return count;    
}

class DNAString {
    string id;
    char[] dna;
    NTCount count;
    double gc_content = 0.0;
}

void main() {
    
    DNAString[] strings;
    DNAString current;
    
    // process each string seperately
    string buffer;
    while((buffer = stdin.readln()) !is null) {
        if(buffer[0] == '>') {
            // we have a new DNA string!
            current = new DNAString;
            strings ~= current;
            current.id = chomp(buffer[1 .. $]);
        } else {
            current.dna ~= chomp(buffer);
        }
    }
    
    
    DNAString max = current;
    foreach(DNAString str; strings) {
        str.count = getNTCount(str.dna);
        str.gc_content = 100.0 * (to!double(str.count.C + str.count.G) / to!double(str.count.A + str.count.C + str.count.G + str.count.T));
        if(str.gc_content > max.gc_content) { max = str; }
    }
    
    writeln(max.id);
    writefln("%.6f", max.gc_content);
}