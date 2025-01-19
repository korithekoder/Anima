package anima.backend.exceptions;

import haxe.Exception;

/**
 * Exception that is used to throw if an item's ID has any characters other than:
 * - Lowercase Letters
 * - Numbers (1234567890)
 * - Underscores (_)
 */
class InvalidItemNameException extends Exception {}
