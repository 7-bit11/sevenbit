package com.example.bit_seven

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

//import android.content.Intent
//import android.net.Uri


class MainActivity: FlutterActivity() {
    //通讯名称
    private val chanel = "example/call/android"
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, chanel).setMethodCallHandler {methodCall: MethodCall, result: MethodChannel.Result ->
            if (methodCall.method.equals("backDesktop")) {//事件-后退到桌面
                moveTaskToBack(false)
                result.success(true)
            }

            //if (methodCall.method.equals("openVideo")) {//启动一个Intent
            //    var url = methodCall.arguments.toString();
            //    var intent =  Intent();
            //    intent.setAction(Intent.ACTION_VIEW);
            //    var type = "video/*"
            //    var uri = Uri.parse(url);
            //    intent.setDataAndType(uri,type);
            //    startActivity(intent);
            //    //startActivity(Intent.createChooser(intent, "Open"));
            //    result.success(true)
            //}
        }
    }
}
