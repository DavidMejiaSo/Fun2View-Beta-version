import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun2view_appli/src/Notifications/listadoNotis.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static StreamController<String> _messageStream =
      new StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('_onbackgroundHandler ${message.notification?.title}');
    //print('_onbackgroundHandler ${message.notification?.body}');
    //titulosNotificaciones
    //    .add('_onbackgroundHandler ${message.notification?.title}');
//
    _messageStream.add(message.notification?.body ?? "No Title");
    notisListado.notis.add(message.notification?.body ?? "No Title");
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    _messageStream.add(message.notification?.body ?? "No Title");
    notisListado.notis.add(message.notification?.body ?? "No Title");
    //notisListado.notis.add(message.notification?.body ?? "No Title");
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    _messageStream.add(message.notification?.body ?? "No Title");
    notisListado.notis.add(message.notification?.body ?? "No Title");
    //notisListado.notis.add(message.notification?.body ?? "No Title");
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('este es el token de la app:$token.');

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreamsb() {
    _messageStream.close();
  }
}
