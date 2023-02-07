import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';

import '../../Responsive/Adapt.dart';
import '../landing/alert_dialog.dart/alert_dialog.dart';
import 'listadoNotis.dart';

class notificationHome extends StatefulWidget {
  const notificationHome({Key? key}) : super(key: key);

  @override
  State<notificationHome> createState() => _notificationHomeState();
}

class _notificationHomeState extends State<notificationHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  //final notificacionService = notificationService();

  List<dynamic> tituloNotificacion = [];

  String nombreNotificacion = ""; //Para el banner emergente
  String descripcionTextoNotificacion = ""; //Para el abnner emergente
  String imagenNotificacion = ""; //Para el banner emergente

  dynamic argus;
  dynamic arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List items = [];
  bool abrioNotificacion = false;
  final prefs = PreferenciasUsuario();

  Widget build(BuildContext context) {
    argus = ModalRoute.of(context)?.settings.arguments ??
        'No tienes notificaciones';
    List<String> descripcionNotificacion = [];

    @override
    void initState() {
      descripcionNotificacion = UserSimplePreferences.getPets() ?? [];

      super.initState();
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: true,
      body: RefreshIndicator(
        color: Color.fromARGB(255, 15, 208, 225),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        onRefresh: () {
          setState(() {});
          Navigator.pushNamed(context, '/NotificationPage');
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: Form(
          child: Stack(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  _key.currentState!.openDrawer();
                },
                child: SingleChildScrollView(
                  child: SafeArea(
                      child: Column(
                    children: [
                      SizedBox(
                        height: Adapt.hp(8),
                      ),
                      notificationBack(),
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: Adapt.hp(3)),
                              (UserSimplePreferences.getPets() ?? []).isEmpty
                                  ? Notisvacias()
                                  : listadoNotis(
                                      UserSimplePreferences.getPets() ?? [])
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
                ),
              ),
              barraPpal()
            ],
          ),
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(70), bottomRight: Radius.circular(400)),
        ),
        elevation: 2.5,
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              width: double.infinity,
              child: Column(children: [
                CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 15, 208, 225),
                    radius: 30.5,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 15, 208, 225),
                      radius: 27.5,
                      child: Image.network(prefs.coverPhoto),
                    )),
                Text(prefs.usuario,
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 208, 225),
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    )),
                Text("@User",
                    style: TextStyle(
                      color: Color.fromARGB(255, 167, 167, 167),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: Adapt.hp(2),
                ),
                Container(
                  color: Colors.grey,
                  height: Adapt.hp(0.2),
                  width: double.infinity,
                )
              ]),
            )),
            ListTile(
              leading: Container(
                height: Adapt.hp(5),
                width: Adapt.wp(5),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/iconos/Homep.png"),
                  ),
                ),
              ),
              title: Text(
                'My Page',
              ),
              onTap: () {
                Navigator.pushNamed(context, '/pantallappal');
              },
            ),
            ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/walletIcon.png"),
                    ),
                  ),
                ),
                title: Text('Wallet'),
                onTap: () {
                  Navigator.pushNamed(context, '/walletPage');
                }),
            ListTile(
              leading: Container(
                height: Adapt.hp(5),
                width: Adapt.wp(5),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/iconos/notificacionIcon.png"),
                  ),
                ),
              ),
              title: Text('Notification', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialogCustom(
                //       bodyText: "Estamos Actualizando**",
                //       bottonAcept: 'false',
                //       bottonCancel: Container(),
                //     );
                //   },
                // );
                Navigator.pushNamed(context, '/NotificationPage');
              },
            ),
            SizedBox(
              height: Adapt.hp(2),
            ),
            Container(
              color: Colors.grey,
              height: Adapt.hp(0.2),
              width: double.infinity,
            ),
            SizedBox(
              height: Adapt.hp(5),
            ),
            ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/cerrar-sesion.png"),
                    ),
                  ),
                ),
                title: Text('Logout'),
                onTap: () {
                  Navigator.restorablePushNamed(context, '/login');
                  prefs.limpiar();
                }),
          ],
        ),
      ),
    );
  }

  Widget notificationBack() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: Adapt.wp(95),
        color: Color.fromARGB(255, 63, 217, 255),
        child: Row(
          children: [
            SizedBox(
              width: Adapt.wp(2),
            ),
            Container(
              height: Adapt.hp(8),
              width: Adapt.wp(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/flechaback.png"),
                ),
              ),
            ),
            SizedBox(
              width: Adapt.wp(20),
            ),
            Text(" Notifications",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255))),
            SizedBox(
              width: Adapt.wp(5),
            ),
          ],
        ),
      ),
    );
  }

  Widget barraPpal() {
    return Container(
      color: Colors.white,
      height: Adapt.hp(10),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: Adapt.hp(4),
          ),
          Center(
            child: Row(
              children: [
                SizedBox(
                  width: Adapt.wp(6),
                ),
                GestureDetector(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 15.5,
                    child: Container(
                        // color: Colors.red,
                        height: Adapt.hp(10),
                        width: Adapt.wp(10),
                        child: Image.asset("assets/iconos/menu.png")),
                  ), //COntainer para evitar usar Scaffold
                ),
                SizedBox(
                  width: Adapt.wp(10),
                ),
                Container(
                  height: Adapt.hp(6),
                  width: Adapt.wp(50),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/fun2vie.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: Adapt.wp(9),
                ),
                //COntainer para evitar usar Scaffold
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listadoNotis(List items) {
    return SingleChildScrollView(
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: Adapt.wp(5),
                  ),
                  Container(
                    color: Color.fromARGB(255, 246, 246, 246),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Adapt.wp(55),
                          child: Text(
                            item,
                            style: TextStyle(
                                fontFamily: 'Montserrat-ExtraBold',
                                fontSize: Adapt.px(20)),
                          ),
                        ),
                        Container(
                          width: Adapt.wp(30),
                          child: Text("Fun2View",
                              style: TextStyle(
                                  fontFamily: 'Montserrat-ExtraBold',
                                  fontSize: Adapt.px(15))),
                        ),
                        SizedBox(
                          height: Adapt.hp(2),
                        ),
                        Container(
                          height: Adapt.hp(0.2),
                          width: Adapt.wp(92),
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget Notisvacias() {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 248, 248, 248),
        height: Adapt.hp(50),
        width: Adapt.wp(80),
        child: Center(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/iconos/drawer/Nonot.png"),
                  fit: BoxFit.scaleDown,
                ),
              ),
              width: Adapt.wp(20),
              height: Adapt.hp(20),
            ),
            Text("No notification yet",
                style: TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  color: Color.fromARGB(255, 145, 145, 145),
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                )),
          ],
        )),
      ),
    );
  }
}
