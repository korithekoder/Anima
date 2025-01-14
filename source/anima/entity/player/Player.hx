package anima.entity.player;

import anima.components.Item;
import anima.components.sprite.AnimaSprite;

/**
 * The player that is used by the user for the world of Anima.
 */
class Player extends AnimaSprite {

    /**
     * JSON object containing the pathways for the players animations.
     * 
     * ## Structure
     * ```
     * {
     *   "idle": [
     *     "pathway/number/1",
     *     "pathway/number/2"
     *     "etc..."
     *   ],
     *   "walking": {
     *     "left": [
     *       "pathway/number/1",
     *       "pathway/number/2"
     *       "etc..."
     *     ],
     *     "down": [
     *       "pathway/number/1",
     *       "pathway/number/2"
     *       "etc..."
     *     ],
     *     "up": [
     *       "pathway/number/1",
     *       "pathway/number/2"
     *       "etc..."
     *     ],
     *     "right": [
     *       "pathway/number/1",
     *       "pathway/number/2"
     *       "etc..."
     *     ]
     *   }
     * }
     * ```
     */
    public var imageAssets(get, never):Dynamic;
    private var _imageAssets:Dynamic;

    // Animation frames for each type of animation
    private var _idleFrames:Array<String> = [];
    private var _strafeLeftFrames:Array<String> = [];
    private var _strafeDownFrames:Array<String> = [];
    private var _strafeUpFrames:Array<String> = [];
    private var _strafeRightFrames:Array<String> = [];

    /**
     * The player's inventory.
     */
    public var inventory(get, never):Dynamic;
    private var _inventory:Dynamic = {
        backpack: []
    };

    /**
     * The base speed of the player.
     */
    public var speed:Float;
    
    /**
     * Constructor.
     * @param x           The X coordinante for the player.
     * @param y           The Y coordinante for the player.
     * @param imageAssets JSON object containing the pathways for the players animations.
     */
    public function new(x:Float = 0, y:Float = 0, speed:Float = 15, scale:Float = 1, imageAssets:Dynamic) {
        super();
        this._imageAssets = imageAssets;
        this.speed = speed;

        // Set the frames
        this._idleFrames = this._imageAssets.idle;
        this._strafeLeftFrames = this._imageAssets.walking.left;
        this._strafeDownFrames = this._imageAssets.walking.down;
        this._strafeUpFrames = this._imageAssets.walking.up;
        this._strafeRightFrames = this._imageAssets.walking.right;

        this.loadGraphic("assets/images/entities/player/shadow-wizard-money-gang.png");
        this.scale.set(scale, scale);
        this.updateHitbox();
        this.setX(x);
        this.setY(y);
    }
    
    public function get_imageAssets():Dynamic {
        return _imageAssets;
    }

    public function get_inventory():Dynamic {
        return _inventory;
    }


    /**
     * Adds a new item in the player's inventory to the said location.
     */
    public function addNewInvItem(item:Item, location:String):Void {
        switch (location) {
            case ("backpack"):
                this._inventory.backpack.push(item);
        }
    }
}
