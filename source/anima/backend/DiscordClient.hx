package anima.backend;

#if DISCORD_ALLOWED
import cpp.RawConstPointer;
import lime.app.Application;
import hxdiscord_rpc.Types.DiscordRichPresence;
import hxdiscord_rpc.Discord;
import sys.thread.Thread;

/**
 * Class for initializing Discord rich presence. ***(ONLY ENABLED FOR DESKTOP!!!)***
 */
class DiscordClient {

    private static var _presence:DiscordRichPresence = new DiscordRichPresence();
    private static var _clientId:String = "1330433524016222208";  // Client ID for the Discord application

    public static function initClient():Void {
        Discord.Initialize(_clientId, null, true, null);
        _presence.startTimestamp = Math.floor(Sys.time());

        Thread.create(() -> {
            while (true) {
                setPresence("Exploring", "In the Fields", "antonio");
                Discord.RunCallbacks();
                Sys.sleep(1.0);
            }
        });

        Application.current.window.onClose.add(() -> {
            Discord.Shutdown();
            trace("Shutdown Discord Rich presence successfully!");
        });
    }

    public static function setPresence(details:String = "Exploring", state:String = "", largeImageKey:String = ""):Void {
        _presence.details = details;
        _presence.state = state;
        _presence.largeImageKey = largeImageKey;

        Discord.UpdatePresence(RawConstPointer.addressOf(_presence));
    }
}
#end
