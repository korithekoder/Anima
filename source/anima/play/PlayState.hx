package anima.play;

import anima.components.sprite.AnimaSprite;
import anima.data.Constants;
import anima.entity.player.Player;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	private var player:Player;
	private var bg:AnimaSprite;

	override public function create() {
		super.create();
		player = new Player(0, 0, 5, 0.25, Constants.PLAYER_ANIM_FRAMES);
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

		if (FlxG.keys.justPressed.SPACE) FlxG.sound.play("assets/sounds/player/interaction/player-hit.mp3");

		if (FlxG.keys.pressed.W) player.changeY(player.speed);
		if (FlxG.keys.pressed.A) player.changeX(-1 * player.speed);
		if (FlxG.keys.pressed.S) player.changeY(-1 * player.speed);
		if (FlxG.keys.pressed.D) player.changeX(player.speed);
	}
}
