package anima.play;

import anima.backend.ClientPrefs;
import anima.components.sprite.AnimaSprite;
import anima.backend.Constants;
import anima.entity.player.Player;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	private var player:Player;
	private var bg:AnimaSprite;

	override public function create() {
		super.create();
		player = new Player(0, 0, 5, 0.25, Constants.PLAYER_ANIM_FRAMES);
		trace(player.imageAssets.idle[0]);
		player.loadGraphic(player.imageAssets.idle[0]);
		bg = new AnimaSprite();
		bg.loadGraphic("assets/images/lmfao.png");
		bg.setXAndY(-640, 360);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);
		add(player);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.up)) player.changeY(player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.left)) player.changeX(-1 * player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.down)) player.changeY(-1 * player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.right)) player.changeX(player.speed);
	}
}
