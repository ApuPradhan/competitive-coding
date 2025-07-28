🏛️ Roman to Integer Converter (C Implementation)
This program is a simple and efficient implementation in C to convert a Roman numeral string (like "IX" or "MCMXCIV") into its corresponding integer value based on Roman numeral rules.

📌 How It Works
The conversion logic is split into two parts:

value(char ch) Function
This helper function returns the integer value for a given Roman numeral character:

'I' → 1

'V' → 5

'X' → 10

'L' → 50

'C' → 100

'D' → 500

'M' → 1000
If the input character is not valid, it returns 0.

romanToInt(char* s) Function
This function scans the input string s from left to right. For each character:

It fetches the current Roman numeral value and the next one.

If the next value is greater than the current, it applies the subtraction rule (e.g., "IV" = 5 - 1 = 4), adds the result to the total, and skips the next character.

Otherwise, it adds the current value to the total and moves to the next character.

This continues until the entire string is processed.

🧠 Roman Numeral Rules Recap
In Roman numerals:

Smaller values placed before larger values indicate subtraction.

Smaller or equal values placed after indicate addition.

✅ Examples
Input: "IX"
Explanation: 'I' = 1, 'X' = 10 → Since 10 > 1, result = 10 - 1 = 9

Input: "XIII"
Explanation: 'X' = 10, 'I' = 1, 'I' = 1, 'I' = 1 → All added → 10 + 1 + 1 + 1 = 13