package anima.components;


/**
 * Class for creating and registering items.
 */
class Item {

    /**
     * The ID of the item.
     */
    public var id:String;

    /**
     * Image pathway to the item's texture.
     */
    public var texture:String;

    /**
     * Determine if an entity (that is not the player) can pick `this` item up.
     */
    public var canEntityObtain:Bool;

    /**
     * The maximum count that `this` item can stack up in a single inventory slot.
     */
    public var maxStack:Int;
    
    /**
     * Constructor.
     * @param texture         Image pathway to the item's texture.
     * @param canEntityObtain Determine if an entity (that is not the player) can pick `this` item up.
     * @param maxStack        The maximum count that `this` item can stack up in a single inventory slot.
     */
    public function new(id:String, texture:String, canEntityObtain:Bool = true, maxStack:Int = 100) {
        this.texture = texture;
        this.canEntityObtain = canEntityObtain;
        this.maxStack = maxStack;
    }
}
