package anima.world;

import anima.component.item.Item;
import anima.component.item.FoodItem;

/**
 * Class for storing all of the items of Anima.
 */
class Items {
    
    public static final IDFK:Item = new Item("idfk", "food", true, 250);
    public static final BREAD:FoodItem = new FoodItem("bread", "food", true, 100, 20.0);
}
