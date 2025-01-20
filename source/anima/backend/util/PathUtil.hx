package anima.backend.util;

/**
 * Backend utility for shortening directories.
 */
class PathUtil {

    /**
     * Obtain and return a full pathway of an object image.
     * @param id      The ID of the said object.
     * @param pathway The path to the image.
     * @return        The full pathway.
     */
    public static inline function ofImageAsset(pathway:String):String {
        return "assets/images/" + pathway + ".png";
    }

    /**
     * Obtain and return a full pathway of an object image inside of a group.
     * @param id      The ID of the said object.
     * @param pathway The path to the image.
     * @return        The full pathway.
     */
    public static inline function ofImageGroupAsset(group:String, id:String, pathway:String):String {
        return "assets/images/" + group + "/" + id + "/" + pathway + ".png";
    }

    /**
     * Obtain and return a full pathway of an item image.
     * @param musicType The type of music it is.
     * @param musicName The name of the music.
     * @return          The music pathway.
     */
    public static inline function ofMusicAsset(group:String, musicName:String):String {
        return "assets/music/" + group + "/" + musicName + #if html5 ".mp3" #else ".ogg" #end;
    }

    /**
     * Obtain and return a full pathway of an item image.
     * @param musicType The type of music it is.
     * @param musicName The name of the music.
     * @return          The music pathway.
     */
     public static inline function ofSoundAsset(group:String, soundName:String):String {
        return "assets/sounds/" + group + "/" + soundName + #if html5 ".mp3" #else ".ogg" #end;
    }
}
