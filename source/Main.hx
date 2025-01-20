package;

import flixel.FlxState;
import flixel.FlxGame;
import openfl.display.Sprite;

/**
 * The entry point for the entire game of Anima.
 * Unless you want to make changes to the starting attributes,
 * you will most likely not need to touch this file,
 * as the actually setup for the game is in `InitState.hx`.
 */
class Main extends Sprite {

	/**
	 * The game's width of the window.
	 * Set to `0` to use the default `Project.xml` value.
	 */
	private final WINDOW_WIDTH:Int = 1280;

	/**
	 * The game's height of the window.
	 * Set to `0` to use the default `Project.xml` value.
	 */
	private final WINDOW_HEIGHT:Int = 720;

	/**
	 * Entry point of the game.
	 */
	private final INITIAL_STATE:Class<FlxState> = InitState;

	/**
	 * How fast the game will update.
	 */
	private final UPDATE_FRAMERATE:Int = 60;

	/**
	 * How fast the game will draw.
	 */
	private final DRAW_FRAMERATE:Int = 60;

	/**
	 * Skip the splash screen.
	 */
	private final SKIP_SPLASH_SCREEN:Bool = true;

	/**
	 * Start in fullscreen.
	 */
	private final START_FULLSCREEN:Bool = false;

	/**
	 * Constructor.
	 */
	public function new() {
		super();

		#if !debug
		trace("Debugging mode isn't enabled!");
		#else
		trace("Debugging mode is enabled!");
		#end

		// Add the game object
		addChild(new FlxGame(
			WINDOW_WIDTH,
			WINDOW_HEIGHT,
			INITIAL_STATE,
			UPDATE_FRAMERATE,
			DRAW_FRAMERATE,
			SKIP_SPLASH_SCREEN,
			START_FULLSCREEN
		));
	}
}
