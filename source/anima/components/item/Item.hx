package anima.components.item;

import anima.backend.exceptions.InvalidItemNameException;
import anima.backend.util.NameUtil;

/**
 * Class for creating and registering items.
 */
class Item {

    /**
	 * The ID of the item. It may only contain lowercase letters, underscores (_) and numbers. If it has any other kind of character, an `InvalidItemNameException` exception will be thrown. 
     */
    public var id(get, never):String;
    private var _id:String;

    /**
     * The group that `this` item will be added in.
     */
    public var group(get, never):String;
    private var _group:String;

    /**
     * Determine if an entity (that is not the player) can pick `this` item up.
     */
    public var canEntityObtain(get, never):Bool;
    private var _canEntityObtain:Bool;

    /**
     * The maximum count that `this` item can stack up in a single inventory slot.
     */
    public var maxStack(get, never):Int;
    private var _maxStack:Int;

    /**
     * Constructor.
     * @param id              The ID of the item. It may only contain lowercase letters, underscores and numbers. If it has any other kind of character, an `InvalidItemNameException` will be thrown.
     * @param group           The group that the item will be registered in.
     * @param canEntityObtain Determine if an entity (that is not the player) can pick `this` item up.
     * @param maxStack        The maximum count that `this` item can stack up in a single inventory slot.
     */
    public function new(id:String, group:String, canEntityObtain:Bool = true, maxStack:Int = 100) {
		if (NameUtil.isValidName(id)) {
			this._id = id;
        } else {
            throw new InvalidItemNameException(
                "Item with attempted ID \"" + id + "\" contains invalid character(s)!\n" + 
                "Items' IDs can only contain lowercase letters, numbers and underscores."
            );
        }
        this._group = group;
        this._canEntityObtain = canEntityObtain;
        this._maxStack = maxStack;
    }

    public function get_id():String {
        return this._id;
    }

    public function get_group():String {
        return this._group;
    }

    public function get_canEntityObtain():Bool {
        return this._canEntityObtain;
    }

    public function get_maxStack():Int {
        return this._maxStack;
    }
}
