package anima.backend;

/**
 * Backend utility for shortening directories.
 */
class PathUtil {
    
    public static inline function ofAnimImg(entityType:String, pathway:String):String {
        return "assets/images/entities/" + entityType + "/anims/" + pathway + ".png";
    }
}
