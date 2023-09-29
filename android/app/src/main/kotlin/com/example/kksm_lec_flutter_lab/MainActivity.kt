package com.example.kksm_lec_flutter_lab

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    /*
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        var channel = BasicMessageChannel<String>(FlutterEngine.dartExecutor, name: "myMessageChannel", StringCodec.INSTANCE)
        channel.setMessageHandler {message, reply ->
            Log.d(tag: "Msg", msg: "receive: $message")
            reply.reply("Reply from Android")
            channel.send(message: "Hello from Android") { reply ->
                Log.d(tag: "msg", msg: "reply: $reply")
            }
        }
    }
    */
}
