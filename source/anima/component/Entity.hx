package anima.component;

import anima.component.item.Item;
import anima.component.sprite.AnimaSprite;

/**
 * Class for creating living things in the world of Anima.
 */
class Entity extends AnimaSprite {
    
    /**
     * JSON object containing the pathways for `this` entity's animations.
     * 
     * ## Structure Example
     * 
     * ```json
     * {
     *   "idle": [
     *     "pathway/number/1",
     *     "pathway/number/2",
     *     "etc..."
     *   ],
     *   "walking": {
     *     "left": [
     *       "pathway/number/1",
     *       "pathway/number/2",
     *       "etc..."
     *     ],
     *     "down": [
     *       "pathway/number/1",
     *       "pathway/number/2",
     *       "etc..."
     *     ],
     *     "up": [
     *       "pathway/number/1",
     *       "pathway/number/2",
     *       "etc..."
     *     ],
     *     "right": [
     *       "pathway/number/1",
     *       "pathway/number/2",
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
     * The contents of `this` entity's inventory.
     * 
     * `weight` = The amount of slots that `this` entity's inventory can hold.  
     * `contents` = JSON objects that hold what kind of item is in the slot (by its ID) and
     * how much of that item is in the said slot.  
     * 
     * ## Structure
     * 
     * ```json
     * {
     *   "weight": 25,
     *   "contents": [
     *     {
     *       "item": "woah-an-item",
     *       "count": 5
     *     },
     *     {
     *       "item": "another-item-uwu",
     *       "count": 32
     *     }
     *   ]
     * }
     * ```
     */
    public var inventory(get, never):Dynamic;
	private var _inventory:Dynamic = {
        weight: 1,
        contents: []
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

    public function setInventoryWeight(newWeight:Int):Void {
        this._inventory.weight = newWeight;
    }

    /**
	 * Adds a new item in the player's inventory to the said location.
	 * @param item The item to be added.
     */
	public function addItemToInventory(item:Item):Void {
		// Loop through the inventory and search for a slot that
		// has the same item in it
		for (i in 0...this._inventory.contents.length) {
            // Check if the current checked item is the wanted one
			if (this._inventory.contents[i].item == item.get_id()) {
                // If the incremented amount is not over the current amount, then
                // add one to the amount of the said item
				if (!(this._inventory.contents[i].count + 1 > item.get_maxStack())) {
					this._inventory.contents[i].count++;
					return;
				}
			}
		}
		// If the item wasn't found (or if the slot reached the maximum), 
        // add a new slot (if it isn't over the weight)
        if (!(this._inventory.contents.length + 1 > this._inventory.weight)) {
            this._inventory.contents.push(
                {
                    item: item.get_id(),
                    count: 1
                }
            );
        }
    }

    /**
     * Removes an item from `this` entity's inventory.
     * @param item The item to be removed.
     */
    public function removeItemFromInventory(item:Item):Void {
        // Loop through the inventory and search for the slot
        // with the said item in it
        for (i in 0...this._inventory.contents.length) {
            // Check if the current checked item is the wanted one
            if (this._inventory.contents[i].item == item.get_id()) {
                // If so, deduct the said amount
				this._inventory.contents[i].count--;
                // If there are no more items in the said slot,
                // delete the slot to save memory
                if (this._inventory.contents[i].count <= 0) {
                    this._inventory.contents.splice(i, 1);
                }
                // Exit out of the function since the said item is already found
                return;
			}
        }
    }
}
