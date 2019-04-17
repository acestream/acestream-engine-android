package org.acestream.core;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import org.acestream.engine.AceStreamEngineApplication;
import org.acestream.sdk.AceStream;
import org.acestream.sdk.interfaces.IBaseApplicationFactory;

import androidx.multidex.MultiDexApplication;

public class CoreApplication extends MultiDexApplication {

    private final static String TAG = "AS/App";

    private static int sActivitiesCount = 0;

    @Override
    public void onCreate() {
        super.onCreate();
        AceStream.setBaseApplicationFactory(new IBaseApplicationFactory() {
            @Override
            public void initialize(Context context) {
                AceStreamEngineApplication.initialize(context);
            }
        });

        registerActivityLifecycleCallbacks(mActivityCbListener);
    }

	private Application.ActivityLifecycleCallbacks mActivityCbListener = new Application.ActivityLifecycleCallbacks() {
		@Override
		public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}

		@Override
		public void onActivityStarted(Activity activity) {
			++sActivitiesCount;
		}

		@Override
		public void onActivityResumed(Activity activity) {}

		@Override
		public void onActivityPaused(Activity activity) {}

		@Override
		public void onActivityStopped(Activity activity) {
			--sActivitiesCount;
			if (sActivitiesCount == 0) {
				Intent intent = new Intent(AceStream.BROADCAST_APP_IN_BACKGROUND);
				intent.putExtra("pid", android.os.Process.myPid());
                sendBroadcast(intent);
			}
		}

		@Override
		public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

		@Override
		public void onActivityDestroyed(Activity activity) {}
	};
}
