package anima.play;

import flixel.util.FlxTimer;
import anima.world.Items;
import anima.backend.util.PathUtil;
import anima.backend.util.SaveUtil;
import flixel.input.keyboard.FlxKey;
import anima.backend.ClientPrefs;
import anima.components.sprite.AnimaSprite;
import anima.backend.Constants;
import anima.entity.player.Player;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {

	private var player:Player;
	private var bg:AnimaSprite;

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
		player = new Player(0, 0, 5, 0.25, Constants.PLAYER_ANIM_FRAMES);
		player.loadGraphic(player.imageAssets.idle[0]);
		bg = new AnimaSprite();
		bg.loadGraphic("assets/images/lmfao.png");
		bg.setXAndY(-640, 360);
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		add(bg);
		add(player);

		for (i in 0...5) {
			player.addNewInvItem(Items.BREAD, "food");
		}

		// Startup sound and intro music
        FlxG.sound.play(PathUtil.ofSoundAsset("startup", "startup"));
        var introMusicCountdown:FlxTimer = new FlxTimer();
		introMusicCountdown.start(4.0, (timer:FlxTimer) -> { FlxG.sound.playMusic(PathUtil.ofMusicAsset("menu", "Destiny")); });
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.up)) player.changeY(player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.left)) player.changeX(-1 * player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.down)) player.changeY(-1 * player.speed);
		if (FlxG.keys.anyPressed(ClientPrefs.controls.movement.right)) player.changeX(player.speed);

		if (FlxG.keys.justPressed.Y) ClientPrefs.controls = test;
		if (FlxG.keys.justPressed.U) ClientPrefs.controls = Constants.DEFAULT_CONTROLS;
		if (FlxG.keys.justPressed.O) SaveUtil.saveUserControls_All();
		if (FlxG.keys.justPressed.P) SaveUtil.saveSystem_All();
	}
}
