#include <stdio.h>
#include <string.h>

// Returns the shortest string length in the array
int getMinLength(char** strs, int strsSize) {
    int minLen = strlen(strs[0]);
    for (int i = 1; i < strsSize; i++) {
        int len = strlen(strs[i]);
        if (len < minLen) minLen = len;
    }
    return minLen;
}

// Function to return the longest common prefix
char* longestCommonPrefix(char** strs, int strsSize) {
    if (strsSize == 0 || strs[0] == NULL) return "";

    static char prefix[201]; // Assumes max prefix length 200
    int minLen = getMinLength(strs, strsSize);

    for (int i = 0; i < minLen; i++) {
        char currentChar = strs[0][i];

        for (int j = 1; j < strsSize; j++) {
            if (strs[j][i] != currentChar) {
                prefix[i] = '\0';
                return prefix;
            }
        }
        prefix[i] = currentChar;
    }

    prefix[minLen] = '\0';  // Complete match for minLen characters
    return prefix;
}


int main() {
    // Example 1
    char* strs1[] = {"flower", "flow", "flight"};
    int size1 = sizeof(strs1) / sizeof(strs1[0]);
    printf("Example 1 - Common Prefix: \"%s\"\n", longestCommonPrefix(strs1, size1));

    // Example 2
    char* strs2[] = {"dog", "racecar", "car"};
    int size2 = sizeof(strs2) / sizeof(strs2[0]);
    printf("Example 2 - Common Prefix: \"%s\"\n", longestCommonPrefix(strs2, size2));

    // Example 3
    char* strs3[] = {"interview", "internet", "internal", "into"};
    int size3 = sizeof(strs3) / sizeof(strs3[0]);
    printf("Example 3 - Common Prefix: \"%s\"\n", longestCommonPrefix(strs3, size3));

    return 0;
}