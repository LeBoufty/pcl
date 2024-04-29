def find_pattern(text, pattern):
    if len(text) < len(pattern):
        return []
    else:
        if text[:len(pattern)] == pattern:
            return [0] + [i + 1 for i in find_pattern(text[1:], pattern)]
        else:
            return [i + 1 for i in find_pattern(text[1:], pattern)]

text = "ABABCABABABCABABABC"
pattern = "ABAB"
print(find_pattern(text, pattern))