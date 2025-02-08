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

    /**
     * Function for initiating Discord rich presence.
     */
    public static function initClient():Void {
        // Initialize the client
        Discord.Initialize(_clientId, null, true, null);
        // Start the timer (for the amount of time the player has played Anima)
        _presence.startTimestamp = Math.floor(Sys.time());

        // Start a thread that runs in the background that
        // makes regular callbacks back to Discord
        Thread.create(() -> {
            // Keep looping until the game exits
            while (true) {
                // Set the presence with the said attributes
                setPresence("Exploring", "In the Fields", "antonio");
                // Update rich presence
                Discord.RunCallbacks();
                // Wait for one second so the game doesn't crash lol
                Sys.sleep(1.0);
            }
        });

        // Add an event listener that shuts down Discord rich presence
        // when the game closes
        Application.current.window.onClose.add(() -> {
            Discord.Shutdown();
            trace("Shutdown Discord rich presence successfully!");
        });
    }

    /**
     * Set the game's Discord rich presence.
     * @param details       The details of the current presence.
     * @param state         The state of the current presence.
     * @param largeImageKey The ID of the large image to be set.
     */
    public static function setPresence(details:String = "Exploring", state:String = "", largeImageKey:String = ""):Void {
        _presence.details = details;
        _presence.state = state;
        _presence.largeImageKey = largeImageKey;

        Discord.UpdatePresence(RawConstPointer.addressOf(_presence));
    }
}
#end
