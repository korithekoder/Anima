package anima.entity.player;

import anima.backend.exceptions.InvalidInventoryLocationException;
import anima.components.item.Item;
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
     * 
     * ## Structure
     * ```
     * group: {  
     *     size: 1,  
     *     contents: []  
     * }
     * ```
     */
    public var inventory(get, never):Dynamic;
    private var _inventory:Dynamic = {
        food: {
            size: 5, // Size = amount of objects in the "contents" array
            contents: []
        }
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
     * Adds a new item in the player's inventory to the said location. If an invalid location is passed down, then an `InvalidInventoryLocationException` will be thrown.
     * @param item     The item to be added.
     * @param location The location 
     */
    public function addNewInvItem(item:Item, location:String):Void {
        switch (location) {
            case ("food"):
                if (!(this._inventory.food.contents.length >= this._inventory.food.size))
                    this._inventory.food.contents.push(item);
            default:
                throw new InvalidInventoryLocationException("Attempted to put a new item in the player's inventory into invalid location: \"" + location + "\"");
        }
    }
}
