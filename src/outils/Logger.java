package outils;
public class Logger {
    public static final String COLOR_RESET = "\u001B[0m";
    public static final String COLOR_ERROR = "\u001B[31m";
    public static final String COLOR_WARN = "\u001B[33m";
    public static final String COLOR_INFO = "\u001B[32m";
    public static final String COLOR_DEBUG = "\u001B[36m";
    public static final String COLOR_MILESTONE = "\u001B[35m";

    public static void info(String message) {
        System.out.println(COLOR_INFO+"[INFO] "+message+COLOR_RESET);
    }
    public static void warn(String message) {
        System.out.println(COLOR_WARN+"[WARN] "+message+COLOR_RESET);
    }
    public static void error(String message) {
        System.out.println(COLOR_ERROR+"[ERROR] "+message+COLOR_RESET);
    }
    public static void debug(String message) {
        System.out.println(COLOR_DEBUG+"[DEBUG] "+message+COLOR_RESET);
    }
    public static void milestone(String message) {
        System.out.println(COLOR_MILESTONE+"[INFO] "+message+COLOR_RESET);
    }
}
