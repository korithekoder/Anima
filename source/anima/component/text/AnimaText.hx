package anima.component.text;

import anima.backend.AnimaGraph;
import flixel.FlxG;
import flixel.text.FlxText;

/**
 * Similar to `FlxText` but with extra methods and attributes.
 */
class AnimaText extends FlxText {
    
    /**
     * Constructor.
     * @param x X position to be set for the new AnimaText. Default value is `0`.
     * @param y Y position to be set for the new AnimaText. Default value is `0`.
     * @param text The text to be displayed. Default value is an empty string.
     * @param size The size of the text. Default value is `8`.
     * @param font The font of the text. Default value is the built in Anima font (or the default font, according to `FlxAssets`).
     */
    public function new(x:Float = 0, y:Float = 0, text:String = "", size:Int = 8, font:String = null) {
        super(AnimaGraph.x(x), AnimaGraph.y(y), text, size);
        this.font = font;
    }
    
    /**
     * Set the "x" position of the sprite.
     * @param i Position to be set.
     */
    public function setX(i:Float):Void {
        this.x = AnimaGraph.x(i);
    }

    /**
     * Get the "x" position of the AnimaText.
     * @return Float
     */
    public function getX():Float {
        return this.x - (FlxG.width / 2);
    }

    /**
     * Set the "y" position of the sprite.
     * @param i Position to be set.
     */
    public function setY(i:Float):Void {
        this.y = AnimaGraph.y(i);
    }

    /**
     * Get the "y" position of the AnimaText.
     * @return Float
     */
    public function getY():Float {
        return (FlxG.height / 2) - this.y;
    }

    /**
     * Set the "x" and "y" position of the sprite.
     * @param x "x" position to be set.
     * @param y "y" position to be set.
     */
    public function setXAndY(x:Float, y:Float):Void {
        this.x = AnimaGraph.x(x);
        this.y = AnimaGraph.y(y);
    }

    /**
     * Change the "x" position of the sprite.
     * @param i The amount of pixels to move the sprite by.
     */
    public function changeX(i:Float):Void {
        this.x += i;
    }

    /**
     * Change the "y" position of the sprite.
     * @param i The amount of pixels to move the sprite by.
     */
    public function changeY(i:Float):Void {
        this.y -= i;
    }

    /**
     * Change the "x" and "y" positions of the sprite.
     * @param x "x" position to be changed by.
     * @param y "y" position to be changed by.
     */
    public function changeXAndY(x:Float, y:Float):Void {
        this.x += x;
        this.y -= y;
    }
}
