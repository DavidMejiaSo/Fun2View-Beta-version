import 'package:flutter/material.dart';
import 'package:fun2view_appli/Responsive/Adapt.dart';

import '../Preferencias/preferencias.dart';
import 'alert_dialog.dart/alert_dialog.dart';

//import 'package:prueba_vaco_app/preferences/preferences_user.dart';
//import 'package:prueba_vaco_app/service/login_service.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
class dashboardPage extends StatefulWidget {
  const dashboardPage({Key? key}) : super(key: key);

  @override
  _dashboardPage createState() => _dashboardPage();
}

class _dashboardPage extends State<dashboardPage> {
  //bool _check = false;
  //bool _mostrarPassword = true;

  //String _usuario = '';
  //String _password = '';

  final prefs = PreferenciasUsuario();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _check = prefs.check;
    // _usuario = prefs.usuario;
    // _password = prefs.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Cuerpo_pantalla(),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 195, 212, 226),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                child: Column(children: [
                  Container(
                    width: Adapt.wp(50),
                    child: Image(image: AssetImage("assets/fun2vie.png")),
                  ),
                  Row(
                    children: [
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
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )
                ]),
              )),
              ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/home.png"),
                    ),
                  ),
                ),
                title: Text(
                  'My Page',
                  style: TextStyle(color: Colors.blue),
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
                        image: AssetImage("assets/iconos/birrete.png"),
                      ),
                    ),
                  ),
                  title: Text('Dashboard'),
                  onTap: () {
                    Navigator.pushNamed(context, '/Dashboardpage');
                  }),
              ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/desconectar.png"),
                    ),
                  ),
                ),
                title: Text('Payments'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogCustom(
                        bodyText: "Página en construccion**",
                        bottonAcept: 'false',
                        bottonCancel: Container(),
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/hucha.png"),
                    ),
                  ),
                ),
                title: Text("Balance"),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogCustom(
                        bodyText: "Página en construccion**",
                        bottonAcept: 'false',
                        bottonCancel: Container(),
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/wallet.png"),
                    ),
                  ),
                ),
                title: Text('Wallet'),
                onTap: () {
                  Navigator.pushNamed(context, '/walletPage');
                },
              ),
              ListTile(
                leading: Container(
                  height: Adapt.hp(5),
                  width: Adapt.wp(5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/sobre.png"),
                    ),
                  ),
                ),
                title: Text('Notification'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogCustom(
                        bodyText: "Estamos Actualizando**",
                        bottonAcept: 'false',
                        bottonCancel: Container(),
                      );
                    },
                  );
                  //Navigator.pushNamed(context, '/NotificationPage');
                },
              ),
              SizedBox(
                height: Adapt.hp(20),
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
        ));
  }

  Widget Cuerpo_pantalla() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Adapt.hp(10),
          ),
          Logoppal(),
          SizedBox(
            height: Adapt.hp(10),
          ),
          Center(child: Contenedores_pantalla())
        ],
      ),
    );
  }

  Widget Logoppal() {
    return Container(
      width: Adapt.wp(50),
      child: Image(image: AssetImage("assets/fun2vie.png")),
    );
  }

  Widget Contenedores_pantalla() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      )),
                  Text(" Warranty earnings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/security.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                  Text(" Earning Net",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/Manomoneda.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 222, 204),
                      )),
                  Text(" Balance Make withdrawal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/billetera.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 47, 222, 204), width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      )),
                  Text(" Subscriptions active",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/persons.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 94, 33, 33),
                      )),
                  Text(" Commission earnings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/Moneyperson.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 94, 33, 33), width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Adapt.hp(5),
                  ),
                  Text(" USD 000",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 56, 160, 192),
                      )),
                  Text(" Referral earnings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                  height: Adapt.hp(35),
                  width: Adapt.wp(35),
                  child: Image(image: AssetImage("assets/person.jpg")))
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 56, 160, 192), width: 5.8)),
          height: Adapt.hp(30),
          width: Adapt.wp(90),
        ),
        SizedBox(
          height: Adapt.hp(3),
        )
      ],
    ));
  }
}
