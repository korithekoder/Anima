package;

#if DISCORD_ALLOWED
import anima.backend.DiscordClient;
#end
import anima.menu.IntroState;
import flixel.system.FlxAssets;
import anima.backend.ClientPrefs;
import anima.backend.Constants;
import anima.backend.util.SaveUtil;
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

        // Create the event listeners needed to run in the
        // background (i.e. fullscreen)
        createEventListeners();

        // Load the player's saves
        loadSaves();

        // Initialize Discord Rich Presence
        // This will only be initialized if the application's
        // lime config type is desktop, otherwise it will be disabled
        #if DISCORD_ALLOWED
        DiscordClient.initClient();
        #end

        // Start the intro
        FlxG.switchState(() -> new IntroState());
    }

    private function initSysConfig():Void {
		// Use the dedicated system cursor
		FlxG.mouse.useSystemCursor = true;

		// Disable auto pause when the window isn't on focus
		FlxG.autoPause = false;

        // Set the default font
        FlxAssets.FONT_DEFAULT = "assets/font/yoster.ttf";
    }

    private function createEventListeners():Void {
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

    private function loadSaves():Void {

        // Movement controls
        if (FlxG.save.data.controls_movement == null) {
            FlxG.save.data.controls_movement = Constants.DEFAULT_CONTROLS.movement;
            ClientPrefs.controls.movement = Constants.DEFAULT_CONTROLS.movement;
        } else {
            ClientPrefs.controls.movement = FlxG.save.data.controls_movement;
        }
        // System controls
        if (FlxG.save.data.controls_system == null) {
            FlxG.save.data.controls_system = Constants.DEFAULT_CONTROLS.system;
            ClientPrefs.controls.system = Constants.DEFAULT_CONTROLS.system;
        } else {
            ClientPrefs.controls.system = FlxG.save.data.controls_system;
        }
        // Last fullscreen state
        if (FlxG.save.data.fullscreenState == null) {
            FlxG.save.data.fullscreenState = false;
        } else {
            FlxG.fullscreen = FlxG.save.data.fullscreenState;
        }
    }
}
