package anima.backend.util;

import anima.backend.exceptions.InvalidItemNameException;

/**
 * Class for name utility stuff.
 */
class NameUtil {

    private static var validChars = "abcdefghijklmnopqrstuvwxyz1234567890-";

    /**
     * Check if the given name is valid under the Anima naming standards for items, entities, etc.
     * @param toCheck The name to be checked.
     * @return Whether or not the name is valid.
     */
    public static function isValidName(toCheck:String):Bool {
        for (i in 0...toCheck.length) {
            if (validChars.indexOf(toCheck.charAt(i)) == -1) {
                return false;
            }
        }
        return true;
    }
}
