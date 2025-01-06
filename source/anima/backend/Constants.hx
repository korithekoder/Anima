package anima.backend;

import flixel.input.keyboard.FlxKey;

/**
 * Class for holding all of the values that don't change.
 */
class Constants {
    
    /**
     * The animation image pathways for the player.
     */
    public static final PLAYER_ANIM_FRAMES:Dynamic = {
        idle: [
            PathUtil.ofAnimImg("player", "idle/player-idle-1")
        ],
        walking: {
            left: [
                PathUtil.ofAnimImg("player", "idle/player-walk-left-1")
            ],
            down: [],
            up: [],
            right: [
                PathUtil.ofAnimImg("player", "idle/player-walk-right-1")
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
        }
    }
}
