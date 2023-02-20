import 'package:flutter/material.dart';
import 'package:fun2view_appli/src/Notifications/NotificationPage.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
import 'package:fun2view_appli/src/landing/Dashboard_page.dart';
import 'package:fun2view_appli/src/landing/Pageppal.dart';
import 'package:fun2view_appli/src/landing/introPage.dart';
import 'package:fun2view_appli/src/landing/login_page.dart';
import 'package:fun2view_appli/src/landing/profile_page.dart';
import 'package:fun2view_appli/src/landing/wallet.dart';

import '../../Notifications/Notifications.dart';
import '../../Notifications/Notifications_firebase.dart';
import '../../Notifications/listadoNotis.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  final prefs = PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
  }

  /// Streams are created so that app can respond to notification-related events
  /// since the plugin is initialised in the `main` function
  ///

  @override
  Widget build(BuildContext context) {
    new GlobalKey<NavigatorState>();

    final GlobalKey<ScaffoldMessengerState> messengerKey =
        new GlobalKey<ScaffoldMessengerState>();
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      // localizationsDelegates: const [],
//

      debugShowCheckedModeBanner: false,

      initialRoute: PreferenciasUsuario().token == ""
          ? '/pantallaCarga'
          : '/home', //'/pantallaCarga',
      // PreferenciasUsuario().token == "" ? '/home' : '/pantallaCarga',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const WelcomePage(),
        '/pantallaCarga': (context) => const PantallaCarga(),
        '/pantallappal': (context) => const Pageppal(),
        '/Dashboardpage': (context) => const dashboardPage(),
        '/NotificationPage': (context) => const notificationHome(),
        '/walletPage': (context) => walletPage()
      },
    );
  }
}
