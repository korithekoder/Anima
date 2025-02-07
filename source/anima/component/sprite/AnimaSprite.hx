package anima.component.sprite;

import anima.backend.AnimaGraph;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * Similar to an `FlxSprite` but with extra methods and attributes.
 */
class AnimaSprite extends FlxSprite {
    
    /**
     * Constructor.
     * @param x X position to be set for the new AnimaSprite. Default value is `0`.
     * @param y Y position to be set for the new AnimaSprite. Default value is `0`.
     */
    public function new(x:Float = 0, y:Float = 0) {
        super(AnimaGraph.x(x), AnimaGraph.y(y));
    }
    
    /**
     * Set the "x" position of the sprite.
     * @param i Position to be set.
     */
    public function setX(i:Float):Void {
        this.x = AnimaGraph.x(i);
    }

    /**
     * Get the "x" position of the AnimaSprite.
     * @return Float
     */
    public function getX():Float {
        return this.x - (FlxG.width / 2);
    }

    /**
     * Get the centered X of `this` AnimaSprite.
     * @return Float
     */
    public function getCenterX():Float {
        return this.getX() + this.width / 2;
    }

    /**
     * Get the centered Y of `this` AnimaSprite.
     * @return Float
     */
    public function getCenterY():Float {
        return this.getY() + this.height / 2;
    }

    /**
     * Set the "y" position of the sprite.
     * @param i Position to be set.
     */
    public function setY(i:Float):Void {
        this.y = AnimaGraph.y(i);
    }

    /**
     * Get the "y" position of the AnimaSprite.
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
