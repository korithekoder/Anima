package anima.sys;

import flixel.input.keyboard.FlxKey;
import flixel.system.FlxAssets;
import flixel.FlxG;

/**
 * System configurations for the game.
 */
class AnimaConfig {
    
    /**
     * Used for setting system configurations when
     * the game first starts up.
     */
    public static function setupBaseSys():Void {
        
        // Use the dedicated system cursor
        FlxG.mouse.useSystemCursor = true;

        // Disable auto pause when the window isn't on focus
        FlxG.autoPause = false;

        // Set the default font
        // NOTE: This doesn't work for some reason lol
        // Use the Constants.RR_FONT for setting fonts when creating FlxText objects
        FlxAssets.FONT_DEFAULT = "assets/fonts/Retro Gaming.ttf";
    }

    /**
     * Check if the user is trying to go fullscreen when the
     * fullscreen button is pressed.
     */
    public static function isUserAttemptingFullscreen():Void {
        if (FlxG.keys.anyJustPressed([FlxKey.F11])) FlxG.fullscreen = !FlxG.fullscreen;
    }
}
