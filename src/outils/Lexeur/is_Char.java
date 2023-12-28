package outils.Lexeur;

// Classe permettant de savoir le type d'un caractère ou d'un mot
public class is_Char {

    public static boolean is_ASCII(char c) {
        return (int) c < 128;
    }

    public static boolean is_letter(char c) {
        return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
    }

    public static boolean is_digit(char c) {
        return c >= '0' && c <= '9';
    }

    public static boolean is_upper(char c) {
        return c >= 'A' && c <= 'Z';
    }

    public static boolean is_lower(char c) {
        return c >= 'a' && c <= 'z';
    }

    public static boolean is_alpha(char c) {
        return is_letter(c) || is_digit(c) || c == '_';
    }

    public static char to_lower(char c) {
        if (is_upper(c)) {
            return (char) (c + 32);
        }
        return c;
    }

    public static boolean is_control_char(char c) {
        return c <= 32;
    }

    public static boolean is_symbol(char c) {
        return c == '.' || c == ',' || c == ';' || c == ':' || c == '=' || c == ',' || c == '(' || c == ')' || c == '/' || c == '<' || c == '>' || c == '+' || c == '-' || c == '*' || c == '\'';
    }

    public static boolean is_symbol_2(char c) {
        return c == '=' || c == '.' || c == '-';
    }

    public static boolean is_idf(String mot) {
        // Test si le mot est un identificateur [a-z][a-z0-9]*
        if (mot.length() == 0) {
            return false;
        }

        if (!is_letter(mot.charAt(0))) {
            return false;
        }

        for (int i = 1; i < mot.length(); i++) {
            if (!is_alpha(mot.charAt(i))) {
                return false;
            }
        }

        return true;        
    }

    public static boolean is_constante_int(String mot) {
        // un entier avec [0-9]+
        if (mot.length() == 0) {
            return false;
        }

        for (int i = 0; i < mot.length(); i++) {
            if (!is_digit(mot.charAt(i))) {
                return false;
            }
        }

        return true;
    }

    public static boolean is_constante_char(String mot) {
        // un caractère avec 'a' a étant un des 95 caractères ASCII imprimables
        if (mot.length() != 3) {
            return false;
        }

        if (mot.charAt(0) != '\'') {
            return false;
        }

        if (mot.charAt(2) != '\'') {
            return false;
        }

        if (mot.charAt(1) < 32 || mot.charAt(1) > 126) {
            return false;
        }

        return true;
    }

    public static boolean is_char(String mot) {
        // un caractère avec 'a' a étant un des 95 caractères ASCII imprimables
        if (mot.length() != 1) {
            return false;
        }

        if (mot.charAt(0) < 32 || mot.charAt(0) > 126) {
            return false;
        }

        return true;
    }
}
