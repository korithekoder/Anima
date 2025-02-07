package anima.entity.player;

import anima.component.Entity;

/**
 * The player that is used by the user for the world of Anima.
 */
class Player extends Entity {
    
    /**
     * Constructor.
     * @param x           X position of `this` player. Default value is `0`.
     * @param y           Y position of `this` player. Default value is `0`.
     * @param speed       Base speed of `this` player. Default value is `15`.
     * @param scale       The scale of `this` player. This is as a ratio and not in pixels. Default value is `1`.
     * @param imageAssets The JSON object for `this` player's image pathways.
     */
    public function new(x:Float = 0, y:Float = 0, speed:Float = 15, scale:Float = 1, imageAssets:Dynamic) {
        super(x, y, speed, scale, imageAssets);

        // Set the frames
        this._idleFrames = this._imageAssets.idle;
        this._strafeLeftFrames = this._imageAssets.walking.left;
        this._strafeDownFrames = this._imageAssets.walking.down;
        this._strafeUpFrames = this._imageAssets.walking.up;
        this._strafeRightFrames = this._imageAssets.walking.right;
    }
}
