package anima.backend;

import anima.backend.util.PathUtil;
import flixel.input.keyboard.FlxKey;

/**
 * Class for holding all of the values that don't change.
 */
class Constants {

    /**
     * The ID for saving data for Anima.
     */
    public static final ANIMA_SAVE_BIND_ID:String = "anima";

	/**
	 * The directory for the game's font.
	 */
	public static final ANIMA_MAIN_FONT:String = "assets/font/yoster.ttf";
    
    /**
     * The animation image pathways for the player.
     */
    public static final PLAYER_ANIM_FRAMES:Dynamic = {
        idle: [
            PathUtil.ofImageAsset("player/idle/player-idle-1")
        ],
        walking: {
            left: [
                PathUtil.ofImageAsset("player/idle/player-walk-left-1")
            ],
            down: [],
            up: [],
            right: [
                PathUtil.ofImageAsset("player/idle/player-walk-right-1")
            ]
        }
    };

    /**
     * The default controls for the player.
     */
    public static final DEFAULT_CONTROLS:Dynamic = {
        movement: {
            left: [FlxKey.A],
            down: [FlxKey.S],
            up: [FlxKey.W],
            right: [FlxKey.D]
        },
        system: {
            fullscreen: [FlxKey.F11]
        }
    };
}
