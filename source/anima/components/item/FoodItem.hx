package anima.components.item;

/**
 * Class for creating food items. 
 */
class FoodItem extends Item {
    
    public var hungerBoost:Float;

    /**
     * Constructor.
	 * @param id              The ID of the item. It may only contain lowercase letters, underscores (_) and numbers. If it has any other kind of character, an `InvalidItemNameException` will be thrown.
     * @param group           The group that the item will be registered in. If no group is provided, then it will default to "general".
     * @param canEntityObtain Determine if an entity (that is not the player) can pick `this` item up.
     * @param maxStack        The maximum count that `this` item can stack up in a single inventory slot.
     * @param hungerBoost     The amount of hunger that is given to the player upon consumption.
     */
    public function new(id:String, texture:String, group:String = "default", canEntityObtain:Bool = true, maxStack:Int = 100, hungerBoost:Float = 1.0) {
        super(id, group, canEntityObtain, maxStack);
        this.hungerBoost = hungerBoost;
    }
}
