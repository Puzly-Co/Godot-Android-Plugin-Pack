package co.puzly.deeplink;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import androidx.annotation.NonNull;

import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.UsedByGodot;

public class Deeplink extends GodotPlugin {
    private static final String CLASS_NAME = Deeplink.class.getSimpleName();
    private static final String LOG_TAG = "godot::" + CLASS_NAME;

    public Deeplink(Godot godot) {
        super(godot);
    }

    @UsedByGodot
    public String getUrl() {
        String url = null;

        Intent currentIntent = Godot.getCurrentIntent();

        if (currentIntent != null) {
            url = currentIntent.getDataString();
        }

        Log.d(LOG_TAG, "getUrl() returned " + (url == null ? "null" : url));
        return url;
    }

    @UsedByGodot
    public String getScheme() {
        String scheme = null;

        Intent currentIntent = Godot.getCurrentIntent();

        if (currentIntent != null) {
            Uri uri = currentIntent.getData();
            if (uri != null) {
                scheme = uri.getScheme();
            }
        }

        Log.d(LOG_TAG, "getScheme() returned " + (scheme == null ? "null" : scheme));
        return scheme;
    }

    @UsedByGodot
    public String getHost() {
        String host = null;

        Intent currentIntent = Godot.getCurrentIntent();

        if (currentIntent != null) {
            Uri uri = currentIntent.getData();
            if (uri != null) {
                host = uri.getHost();
            }
        }

        Log.d(LOG_TAG, "getHost() returned " + (host == null ? "null" : host));
        return host;
    }

    @UsedByGodot
    public String getPath() {
        String path = null;

        Intent currentIntent = Godot.getCurrentIntent();

        if (currentIntent != null) {
            Uri uri = currentIntent.getData();
            if (uri != null) {
                path = uri.getPath();
            }
        }

        Log.d(LOG_TAG, "getPath() returned " + (path == null ? "null" : path));
        return path;
    }

    @UsedByGodot
    public void clearData() {
        Intent currentIntent = Godot.getCurrentIntent();

        currentIntent.setData(null);

        Log.d(LOG_TAG, "clearData() " + (currentIntent.getData() == null ? "successfully" : "unsuccessfully") + " cleared");
    }

    @NonNull
    @Override
    public String getPluginName() {
        return CLASS_NAME;
    }
}
