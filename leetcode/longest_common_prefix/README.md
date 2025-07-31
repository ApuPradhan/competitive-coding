# 🌼 Longest Common Prefix — C Implementation

## 🧩 Problem Statement

Write a function to find the **longest common prefix** string amongst an array of strings.

If there is no common prefix, return an empty string `""`.

---

## 📘 Examples

### ✅ Example 1:
Input: ["flower", "flow", "flight"]
Output: "fl"


### ✅ Example 2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.


### ✅ Example 3:
Input: ["interspecies", "interstellar", "interstate"]
Output: "inters"


---
## 🧠 Approach & Explanation

To solve the Longest Common Prefix problem efficiently:

1. **Find the length of the shortest string** in the array, since the prefix cannot be longer than that.
2. **Compare characters at the same index** for all strings.
3. As long as all strings share the same character at index `i`, continue.
4. If a mismatch is found or any string ends, stop and return the prefix found so far.

### 💡 Key Observations:
- Prefix checking is a **column-wise comparison**.
- Efficient early stopping helps reduce time complexity.
- If the first string ends or a mismatch occurs, we’ve found the prefix.

---

## 🧮 Time and Space Complexity

| Complexity       | Value             |
|------------------|-------------------|
| Time             | O(S) — where S is the total number of characters in all strings |
| Space (prefix)   | O(1) (using static buffer of fixed size) |

---

## 💻 Full C Code

```c
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

    static char prefix[201]; // Static buffer to return prefix (max length 200)
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

    prefix[minLen] = '\0';  // End the string
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
    char* strs3[] = {"interspecies", "interstellar", "interstate"};
    int size3 = sizeof(strs3) / sizeof(strs3[0]);
    printf("Example 3 - Common Prefix: \"%s\"\n", longestCommonPrefix(strs3, size3));

    return 0;
}