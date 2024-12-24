package anima.display.graph;

import flixel.FlxG;

/**
 * Core class for calculating useful yet understandable "x" and "y" values
 * for both the programmer and HaxeFlixel to use.
 * 
 * A way to easily understand the use of this is to think of it like this:
 * You pass down a x value (like 30) and this class's `x` function (for example)
 * will take that value and translate it into an acceptable value that HaxeFlixel will allow.
 * 
 * For example, if the value 30 is passed down, and the width of the screen is 640, then the
 * "understandable" value is 30, but in HaxeFlixel (if we use the `x` function) then it will be translated
 * to 350 (since 640/2 = 320 + 30 = 350).
 */
class AnimaGraph {

    /**
     * Return a more understandable "x" value for HaxeFlixel's graph.
     * @param i    Value to be put in.
     * @return     Float
     */
     public static function x(i:Float):Float {
        return (FlxG.width / 2) + i;
    }
    
    /**
     * Return a more understandable "x" value for HaxeFlixel's graph from a HaxeFlixel value.
     * @param i 
     * @return Float
     */
    public static function xFromHaxeValue(i:Float):Float {
        return x(i);
    }

    /**
     * Return a more understandable "y" value for HaxeFlixel's graph from a HaxeFlixel value.
     * @param i 
     * @return Float
     */
    public static function yFromHaxeValue(i:Float):Float {
        return y(i);
    }

    /**
     * Return a more understandable "x" value for HaxeFlixel's graph.
     * This version is for making it more centered based on the width of the
     * object passed down.
     * @param i         Value to be put in.
     * @param width     Width of the object.
     * @return          Float
     */
    public static function xWithWidth(i:Float, width:Float):Float {
        return (FlxG.width / 2) + i - (width / 2);
    }

    /**
     * Return a more understandable "y" value for HaxeFlixel's graph
     * @param i    Value to be put in.
     * @return     Float
     */
    public static function y(i:Float):Float {
        return (FlxG.height / 2) - i;
    }

    /**
     * Return a more understandable "y" value for HaxeFlixel's graph.
     * This version is for making it more centered based on the height of the
     * object passed down.
     * @param i          Value to be put in.
     * @param height     Height of the object.
     * @return           Float
     */
    public static function yWithHeight(i:Float, height:Float):Float {
        return (FlxG.height / 2) - i + (height / 2);
    }
}
