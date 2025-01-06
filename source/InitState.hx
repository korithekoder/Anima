package;

import anima.backend.ClientPrefs;
import anima.backend.Constants;
import flixel.util.FlxSave;
import anima.play.PlayState;
import flixel.FlxG;
import anima.sys.AnimaConfig;
import flixel.FlxState;

/**
 * Class that initiates the setup for the game.
 */
class InitState extends FlxState {

    override function create() {
        super.create();

        // System configurations
        initSysConfig();

        // Load the player's saves
        loadSaves();

        // Start the play state
        FlxG.switchState(new PlayState());
    }

    private function initSysConfig():Void {
        // Setup the base config
        AnimaConfig.setupBaseSys();
    }

    private function loadSaves():Void {
        var controlsSave:FlxSave = new FlxSave();
        controlsSave.bind("controls");

        // NOTE: THIS WILL NOT WORK
        // TODO: fix later :p

        // Check if the defaults exist
        
        // if (controlsSave.data.movement == null) {
        //     ClientPrefs.controls.movement = Constants.DEFAULT_CONTROLS;
        //     controlsSave.data.movement = Constants.DEFAULT_CONTROLS;
        // } else {
        //     ClientPrefs.controls.movement = controlsSave.data.movement;
        // }

        // trace(controlsSave.data.movement);
        // controlsSave.close();
    }
}
