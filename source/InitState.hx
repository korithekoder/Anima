package;

import anima.play.PlayState;
import flixel.FlxG;
import anima.sys.AnimaConfig;
import flixel.FlxState;

class InitState extends FlxState {

    override function create() {
        super.create();

        // Setup the base config
        AnimaConfig.setupBaseSys();

        // Start the play state
        FlxG.switchState(new PlayState());
    }
}
