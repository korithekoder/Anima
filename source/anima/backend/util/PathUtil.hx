package anima.backend.util;

/**
 * Backend utility for shortening directories.
 */
class PathUtil {
    
    /**
     * Obtain and return a full pathway of an entity image.
     * @param entityType The type of entity it is (i.e. Player, Passive, Hostile, etc.).
     * @param pathway    The path to the image.
     * @return           The full pathway.
     */
    public static inline function ofEntityImg(entityType:String, pathway:String):String {
        return "assets/images/entities/" + entityType + "/anims/" + pathway + ".png";
    }

    /**
     * Obtain and return a full pathway of an item image.
     * @param itemId  The ID of the item.
     * @param pathway The path to the image.
     * @return        The full pathway.
     */
    public static inline function ofItemImg(itemId:String, pathway:String):String {
        return "assets/images/items/" + itemId + "/" + pathway + ".png";
    }

    /**
     * Obtain and return a full pathway of an item image.
     * @param musicType The type of music it is.
     * @param musicName The name of the music.
     * @return          The music pathway.
     */
    public static inline function ofMusicAsset(musicType:String, musicName:String):String {
        return "assets/music/" + musicType + "/" + musicName + #if html5 ".mp3" #else ".ogg" #end;
    }
}
