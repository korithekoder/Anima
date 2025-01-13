package anima.backend.util;

import flixel.FlxG;
import flixel.util.FlxSave;

/**
 * Backend utility for saving user data.
 */
class SaveUtil {

    /**
     * Save the user data for ***all*** controls.
     */
    public static function saveUserControls_All():Void {
        FlxG.save.data.controls_movement = ClientPrefs.controls.movement;
        FlxG.save.data.controls_system = ClientPrefs.controls.system;
        if (FlxG.save.flush())
            trace("\"saveUserControls_All\" successfully executed!");
        else
            trace("\"saveUserControls_All\" failed to execute...");
    }

    /**
     * Save everything system related.
     */
    public static function saveSystem_All():Void {
        FlxG.save.data.fullscreenState = FlxG.fullscreen;
        if (FlxG.save.flush())
            trace("\"saveSystem_All\" successfully executed!");
        else
            trace("\"saveSystem_All\" failed to execute...");
    }
}
