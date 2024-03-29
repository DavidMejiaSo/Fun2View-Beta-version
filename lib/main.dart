import 'package:flutter/material.dart';
import 'package:fun2view_appli/src/Notifications/Notifications.dart';
import 'package:fun2view_appli/src/Notifications/Notifications_firebase.dart';
import 'package:fun2view_appli/src/Notifications/listadoNotis.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
import 'package:fun2view_appli/src/landing/Routes/routes.dart';
import 'package:fun2view_appli/src/landing/alert_dialog.dart/alert_dialog.dart';
import 'package:fun2view_appli/src/landing/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'dart:html';
import 'firebase_options.dart';

void main() async {
  final prefs = PreferenciasUsuario();
  WidgetsFlutterBinding();
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  await UserSimplePreferences.init();
  await prefs.iniciarPreferencias();
  await NotificationService().initNotification;
  //prefs.token = " ";

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    PushNotificationService.messagesStream.listen((message) async {
      print('MyApp: $message');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogCustom(
            bodyText: message,
            bottonAcept: 'false',
            bottonCancel: Container(),
          );
        },
      );

      final mens = SnackBar(
          content: Text("Nueva notificaicon: $message"),
          duration: Duration(seconds: 2));

      messengerKey.currentState?.showSnackBar(mens);

      await UserSimplePreferences.setPets(notisListado.notis);

      setState(() {});
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Routes();
  }
}
