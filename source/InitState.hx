package;

import anima.backend.ClientPrefs;
import anima.backend.Constants;
import anima.backend.util.SaveUtil;
import anima.play.PlayState;
import flixel.FlxG;
import flixel.FlxState;
import lime.app.Application;
import openfl.events.KeyboardEvent;

/**
 * Class that initiates the setup for the game.
 */
class InitState extends FlxState {

    override function create() {
        super.create();

        // System configurations
        initSysConfig();

        // Create the threads and listeners needed to run in the
        // background (i.e. fullscreen)
        createThreadsListeners();

        // Load the player's saves
        loadSaves();

        // Start the play state
        FlxG.switchState(new PlayState());
    }

    private function loadSaves():Void {

        if (FlxG.save.data.controls_movement == null) {
            FlxG.save.data.controls_movement = Constants.DEFAULT_CONTROLS.movement;
            ClientPrefs.controls.movement = Constants.DEFAULT_CONTROLS.movement;
        } else {
            ClientPrefs.controls.movement = FlxG.save.data.controls_movement;
        }
        if (FlxG.save.data.controls_system == null) {
            FlxG.save.data.controls_system = Constants.DEFAULT_CONTROLS.system;
            ClientPrefs.controls.system = Constants.DEFAULT_CONTROLS.system;
        } else {
            ClientPrefs.controls.system = FlxG.save.data.controls_system;
        }
        if (FlxG.save.data.fullscreenState == null) {
            FlxG.save.data.fullscreenState = false;
        } else {
            FlxG.fullscreen = FlxG.save.data.fullscreenState;
        }
    }

    private function initSysConfig():Void {
		// Use the dedicated system cursor
		FlxG.mouse.useSystemCursor = true;

		// Disable auto pause when the window isn't on focus
		FlxG.autoPause = false;
    }

    private function createThreadsListeners():Void {
        // Fullscreen
        FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, (event) -> {
            if (FlxG.keys.anyJustPressed(ClientPrefs.controls.system.fullscreen)) {
                FlxG.fullscreen = !FlxG.fullscreen;
            }
        });

        // On game close
        Application.current.window.onClose.add(() -> {
            SaveUtil.saveUserControls_All();
            SaveUtil.saveSystem_All();
        });
    }
}
