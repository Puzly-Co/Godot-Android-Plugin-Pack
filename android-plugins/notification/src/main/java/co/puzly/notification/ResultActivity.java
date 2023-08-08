package co.puzly.notification;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

public class ResultActivity extends AppCompatActivity {
    private static final String LOG_TAG = "godot::" + ResultActivity.class.getSimpleName();

    private static final String GODOT_APP_CLASSPATH = "com.godot.game.GodotApp";
    private Class<?> godotAppClass = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            godotAppClass = Class.forName(GODOT_APP_CLASSPATH);
        } catch (ClassNotFoundException e) {
            Log.e(LOG_TAG, "could not find " + GODOT_APP_CLASSPATH);
        }
        startActivity(new Intent(getApplicationContext(), godotAppClass));
    }
}