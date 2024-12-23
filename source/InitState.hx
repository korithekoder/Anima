import anima.sys.AnimaConfig;
import flixel.FlxState;

class InitState extends FlxState {

    override function create() {
        super.create();

        AnimaConfig.setupBaseSys();
    }
}
