package anima.component;

import anima.backend.exceptions.InvalidInventoryLocationException;
import anima.component.item.Item;
import anima.component.sprite.AnimaSprite;

/**
 * Class for creating living things in the world of Anima.
 */
class Entity extends AnimaSprite {
    
    /**
     * JSON object containing the pathways for the `this` entity's animations.
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
     * `this` entity's inventory.
     * 
     * `groupnameexample` is the group ID for the said items to be stored in.
     * 
     * ## Structure
     * ```
     * groupnameexample: {  
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
     * The base speed of `this` entity.
     */
    public var speed:Float;

    /**
     * Constructor.
     * @param x           X position of `this` entity. Default value is `0`.
     * @param y           Y position of `this` entity. Default value is `0`.
     * @param speed       Base speed of `this` entity. Default value is `15`.
     * @param scale       The scale of `this` entity. This is as a ratio and not in pixels. Default value is `1`.
     * @param imageAssets The JSON object for `this` entity's image pathways.
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

        this.scale.set(scale, scale);
        this.setX(x);
        this.setY(y);
    }
    
    public function get_imageAssets():Dynamic {
        return _imageAssets;
    }

    public function get_inventory():Dynamic {
        return _inventory;
    }

    public function getIdleFrames():Dynamic {
        return this._idleFrames;
    }

    public function getStrafeLeftFrames():Dynamic {
        return this._strafeLeftFrames;
    }

    public function getStrafeDownFrames():Dynamic {
        return this._strafeDownFrames;
    }

    public function getStrafeUpFrames():Dynamic {
        return this._strafeUpFrames;
    }

    public function getStrafeRightFrames():Dynamic {
        return this._strafeRightFrames;
    }

    /**
     * Adds a new item in the player's inventory to the said location. 
     * If an invalid location is passed down, then an `InvalidInventoryLocationException` will be thrown.
     * @param item     The item to be added.
     * @param location The group ID that the item will be added in.
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
