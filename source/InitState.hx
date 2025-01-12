package;

import flixel.util.FlxSave;
import lime.app.Application;
import openfl.events.Event;
import flixel.input.keyboard.FlxKey;
import openfl.events.KeyboardEvent;
import anima.backend.ClientPrefs;
import anima.backend.Constants;
import anima.play.PlayState;
import flixel.FlxG;
import anima.sys.AnimaConfig;
import flixel.FlxState;

/**
 * Class that initiates the setup for the game.
 */
class InitState extends FlxState {

    static var animaSave:FlxSave = new FlxSave();

    override function create() {
        super.create();

        // Load the player's saves
        loadSaves();

        // System configurations
        initSysConfig();

        // Create the threads and listeners needed to run in the
        // background (i.e. fullscreen)
        createThreadsListeners();

        // Start the play state
        FlxG.switchState(new PlayState());
    }

    private function loadSaves():Void {
        animaSave.bind(Constants.ANIMA_SAVE_BIND_ID);

        if (animaSave.data.controls_movement == null) {
            animaSave.data.controls_movement = Constants.DEFAULT_CONTROLS.movement;
            ClientPrefs.controls.movement = Constants.DEFAULT_CONTROLS.movement;
        } else {
            ClientPrefs.controls.movement = animaSave.data.controls_movement;
        }
        if (animaSave.data.controls_system == null) {
            animaSave.data.controls_system = Constants.DEFAULT_CONTROLS.system;
            ClientPrefs.controls.system = Constants.DEFAULT_CONTROLS.system;
        } else {
            ClientPrefs.controls.system = animaSave.data.controls_system;
        }
        if (animaSave.data.fullscreenState == null) {
            animaSave.data.fullscreenState = false;
        } else {
            FlxG.fullscreen = animaSave.data.fullscreenState;
        }
    }

    private function initSysConfig():Void {
        // Setup the base config
        AnimaConfig.setupBaseSys();
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
            animaSave.data.controls_movement = ClientPrefs.controls.movement;
            animaSave.data.controls_system = ClientPrefs.controls.system;
            animaSave.data.fullscreenState = FlxG.fullscreen;
            trace(animaSave.flush());
        });
    }
}
