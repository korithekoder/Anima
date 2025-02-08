package anima.backend.util;

/**
 * Class for name utility stuff.
 */
class NameUtil {

    private static var _validChars = "abcdefghijklmnopqrstuvwxyz1234567890-";

    /**
     * Check if the given name is valid under the Anima naming standards for items, entities, etc.
     * @param toCheck The name to be checked.
     * @return Whether or not the name is valid.
     */
    public static function isValidName(toCheck:String):Bool {
        // Loop through each letter of the ID
        for (i in 0...toCheck.length) {
            // If the current letter is not in the "_validChars" string,
            // return false (respectivly)
            if (_validChars.indexOf(toCheck.charAt(i)) == -1) {
                return false;
            }
        }
        // Return true since no invalid characters were found
        return true;
    }
}
