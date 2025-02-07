package anima.menu;

import anima.play.PlayState;
import anima.backend.Constants;
import anima.backend.util.PathUtil;
import anima.component.text.AnimaText;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxTimer;

/**
 * The intro that is displayed after Anima is done loading in `InitState.hx`.
 */
class IntroState extends FlxState {

    var introText:AnimaText;
    
    override function create() {
        super.create();

        // Startup sound and intro music
        FlxG.sound.play(PathUtil.ofSoundAsset("startup", "startup"));
        var introTimer:FlxTimer = new FlxTimer();
		introTimer.start(4.0, (timer:FlxTimer) -> { 
            FlxG.sound.playMusic(PathUtil.ofMusicAsset("menu", "Destiny")); 
            FlxG.switchState(() -> new PlayState());
        });

        introText = new AnimaText("Team Anima!", Constants.ANIMA_MAIN_FONT);
        introText.size = 50;
        add(introText);
    }
}
