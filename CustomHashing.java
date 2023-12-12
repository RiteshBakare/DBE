public class CustomHashing {

    public static void main(String[] args) {
        // Example usage
        String input = "Hello, World!";
        
        // Custom hash function
        int customHashCode = customHashFunction(input);
        
        // Calculate key using modulo 10
        int key = customHashCode % 10;

        System.out.println("Input: " + input);
        System.out.println("Custom Hash Code: " + customHashCode);
        System.out.println("Key (mod 10): " + key);
    }

    // Custom hash function for strings
    private static int customHashFunction(String input) {
        int hash = 0;

        // Iterate through each character in the string
        for (char c : input.toCharArray()) {
            // Add the ASCII value of each character to the hash
            hash += (int) c;
        }

        return hash;
    }
}
