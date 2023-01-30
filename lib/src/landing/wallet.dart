import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';

import '../../Responsive/Adapt.dart';
import 'alert_dialog.dart/alert_dialog.dart';
import 'package:http/http.dart' as http;

class walletPage extends StatefulWidget {
  walletPage({Key? key}) : super(key: key);

  @override
  State<walletPage> createState() => _walletPageState();
}

class _walletPageState extends State<walletPage> {
  final prefs = PreferenciasUsuario();
  String balance = "";
  final Mywallet = infoWallet();
  @override
  @override
  void initState() {
    traerinfoWallet();
    super.initState();
  }

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
                      image: AssetImage("assets/iconos/sobre.png"),
                    ),
                  ),
                ),
                title: Text('Notification'),
                onTap: () {
                  Navigator.pushNamed(context, '/NotificationPage');
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
                    Navigator.pushNamed(context, '/login');
                  }),
            ],
          ),
        ));
    ;
  }

  Widget Cuerpo_pantalla() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Adapt.hp(10),
          ),
          Container(
            width: Adapt.wp(90),
            child: balanceContainer(),
          ),
          SizedBox(
            height: Adapt.hp(10),
          ),
          Center(child: Container())
        ],
      ),
    );
  }

  void traerinfoWallet() async {
    final respuestas = await Mywallet.Mywallet(prefs.token);
    print(respuestas);
    print(respuestas["balance"]);
    balance = respuestas["balance"];
    print("oeoeooee es aqui");
    print(balance);
  }

  Widget balanceContainer() {
    return FutureBuilder(
        future: infoWallet().Mywallet(prefs.token),
        builder: (context, snapshot) {
          return Container(
            color: Colors.blue,
            child: Row(
              children: [
                SizedBox(
                  width: Adapt.wp(8),
                ),
                Text(snapshot.data["balance"],
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 101, 214, 242))),
                Text("USD",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 101, 214, 242))),
                SizedBox(
                  width: Adapt.wp(30),
                ),
                Transform(
                  child: Container(
                    height: Adapt.hp(5),
                    width: Adapt.wp(5),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/iconos/wallet.png"),
                      ),
                    ),
                  ),
                  transform: new Matrix4.identity()
                    ..rotateZ(60 * 3.1415927 / 180),
                )
              ],
            ),
          );
        });
  }
}

class infoWallet extends ChangeNotifier {
  Future<dynamic> Mywallet(String token) async {
    final prefs = PreferenciasUsuario();

    String url = 'https://design2.fun2view.com/mobile/v1/my-wallet';

    final Map<String, String> data = {"token": token};

    var datadecode = json.encode(data);

    final res = await http.post(
      Uri.parse(url),
      body: datadecode,
      headers: {
        'Content-Type': 'application/json ',
      },
    );

    dynamic respuesta = json.decode(res.body);
    print(data);

    return respuesta;
//
  }
}
