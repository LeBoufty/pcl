package outils.Lexeur;

// Classe permettant de savoir le type d'un caractère
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


}
