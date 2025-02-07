package anima.play;

import anima.world.Items;
import anima.backend.util.SaveUtil;
import flixel.input.keyboard.FlxKey;
import anima.backend.ClientPrefs;
import anima.component.sprite.AnimaSprite;
import anima.backend.Constants;
import anima.entity.player.Player;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	private var _player:Player;
	private var _bg:AnimaSprite;

	var test:Dynamic = {
        movement: {
            left: [FlxKey.LEFT],
            down: [FlxKey.DOWN],
            up: [FlxKey.UP],
            right: [FlxKey.RIGHT]
        },
        system: {
            fullscreen: [FlxKey.F]
        }
    };

	override public function create() {
		super.create();
		_bg = new AnimaSprite();
		_bg.loadGraphic("assets/images/lmfao.png");
		_bg.setXAndY(-640, 360);
		_bg.setGraphicSize(FlxG.width, FlxG.height);
		_bg.updateHitbox();
		add(_bg);

		_player = new Player(0, 0, 5, 0.25, Constants.PLAYER_ANIM_FRAMES);
		_player.loadGraphic(_player.getIdleFrames()[0]);
		add(_player);

		for (i in 0...5) {
			_player.addNewInvItem(Items.BREAD, "food");
		}
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.up)) _player.changeY(_player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.left)) _player.changeX(-1 * _player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.down)) _player.changeY(-1 * _player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.right)) _player.changeX(_player.speed);

		if (FlxG.keys.justPressed.Y) ClientPrefs.controls = test;
		if (FlxG.keys.justPressed.U) ClientPrefs.controls = Constants.DEFAULT_CONTROLS;
		if (FlxG.keys.justPressed.O) SaveUtil.saveUserControls_All();
		if (FlxG.keys.justPressed.P) SaveUtil.saveSystem_All();
	}
}
