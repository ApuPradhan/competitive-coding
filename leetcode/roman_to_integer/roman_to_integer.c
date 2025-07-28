int value(char ch) {
    switch (ch) {
        case 'I': return 1;
        case 'V': return 5;
        case 'X': return 10;
        case 'L': return 50;
        case 'C': return 100;
        case 'D': return 500;
        case 'M': return 1000;
        default: return 0;
    }
}

int romanToInt(char* s) {
    int total = 0;
    int i = 0;
    
    while (s[i] != '\0') {
        int current = value(s[i]);
        int next = value(s[i + 1]);

        if (next > current) {
            total += (next - current);
            i += 2;  // skip the next character
        } else {
            total += current;
            i++;
        }
    }

    return total;
}

// #include <stdio.h>

// int value(char ch);
// int romanToInt(char* s);

// int main() {
//     char s[] = "MCMXCIV";
//     printf("Roman numeral: %s\n", s);
//     printf("Integer: %d\n", romanToInt(s));
//     return 0;
// }