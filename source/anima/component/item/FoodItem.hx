package anima.component.item;

/**
 * Class for creating food items. 
 */
class FoodItem extends Item {
    
    /**
     * The amount of hunger that `this` food item gives you upon consumption.
     */
    public var hungerBoost:Float;

    /**
     * Constructor.
     * @param id              The ID of `this` food item. Will be check for invalid characters, otherwise an `InvalidItemNameException` will be thrown.
     * @param texture         The pathway to `this` food item's texture.
     * @param group           The group that `this` food item will be accessed from. Default value is `food`.
     * @param canEntityObtain Determines whether or not `this` food item can be picked up by entities. Default value is `true`.
     * @param maxStack        The maximum amount that `this` food item can be stored up to in a single slot. Default value is `100`.
     * @param hungerBoost     How much hunger `this` food item will restore. Default value is `1.0`.
     */
    public function new(id:String, texture:String, group:String = "food", canEntityObtain:Bool = true, maxStack:Int = 100, hungerBoost:Float = 1.0) {
        super(id, group, canEntityObtain, maxStack);
        this.hungerBoost = hungerBoost;
    }
}
