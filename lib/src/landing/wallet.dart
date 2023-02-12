import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
import 'package:fun2view_appli/src/host.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Responsive/Adapt.dart';
import '../Notifications/listadoNotis.dart';
import 'alert_dialog.dart/alert_dialog.dart';
import 'package:http/http.dart' as http;

class walletPage extends StatefulWidget {
  walletPage({Key? key}) : super(key: key);

  @override
  State<walletPage> createState() => _walletPageState();
}

class _walletPageState extends State<walletPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final prefs = PreferenciasUsuario();
  final Uri _url = Uri.parse('https://design2.fun2view.com');
  double balance = 0;
  double wid = 0;
  double wid_t = 0;
  double total = 0;
  bool notis = false;
  final Mywallet = infoWallet();
  @override
  @override
  void initState() {
    Cuerpo_pantalla();
    setState(() {});
    super.initState();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: Cuerpo_pantalla(),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
                bottomRight: Radius.circular(400)),
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
                  title: Text('Wallet', style: TextStyle(color: Colors.blue)),
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
                title: Text(
                  'Notification',
                ),
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
        ));
    ;
  }

  Widget listadoNotis(List items) {
    return SingleChildScrollView(
      child: ListView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: Adapt.px(20), right: Adapt.px(20)),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: Adapt.px(20), vertical: Adapt.px(10)),
                      margin: EdgeInsets.symmetric(
                          horizontal: Adapt.px(30), vertical: Adapt.px(7)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Adapt.wp(5),
                          ),
                          Container(
                            width: Adapt.wp(10),
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-ExtraBold',
                                  fontSize: Adapt.px(10)),
                            ),
                          )
                        ],
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget NotisLista() {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        height: Adapt.hp(30),
        width: Adapt.wp(50),
        child: (UserSimplePreferences.getPets() ?? []).isNotEmpty
            ? listadoNotis(UserSimplePreferences.getPets() ?? [])
            : Notisvacias());
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (notis == true) {
                        notis = false;
                      } else {
                        notis = true;
                      }
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      radius: 18.5,
                      child: Container(
                          height: Adapt.hp(6),
                          width: Adapt.wp(6),
                          child: Image.asset(
                              "assets/iconos/drawer/Notificacion.png")),
                    ),
                  ),
                ), //COntainer para evitar usar Scaffold
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget barraPpalLand() {
    //Barra para cuando gire
    return Container(
      //width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: Adapt.hp(4),
          ),
          Center(
            child: Row(
              children: [
                SizedBox(
                  width: Adapt.wp(53),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (notis == true) {
                        notis = false;
                      } else {
                        notis = true;
                      }
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      radius: 18.5,
                      child: Container(
                          height: Adapt.hp(6),
                          width: Adapt.wp(6),
                          child: Image.asset(
                              "assets/iconos/drawer/Notificacion.png")),
                    ),
                  ),
                ), //COntainer para evitar usar Scaffold
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Cuerpo_pantalla() {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return GestureDetector(
          onDoubleTap: () {
            _key.currentState!.openDrawer();
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Adapt.hp(10),
                    ),
                    orientation == Orientation.portrait
                        ? tittleWallet()
                        : tittleWalletLAND(),
                    SizedBox(
                      height: Adapt.hp(8),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Color.fromARGB(255, 205, 230, 251),
                        width: Adapt.wp(90),
                        child: WalletInfo(),
                      ),
                    ),
                    SizedBox(
                      height: Adapt.hp(10),
                    ),
                    Center(child: Container())
                  ],
                ),
              ),
              Container(
                  height: Adapt.hp(11),
                  color: Colors.red,
                  child: Center(
                      child: orientation == Orientation.portrait
                          ? barraPpal()
                          : barraPpalLand())),
              (notis == true)
                  ? Align(
                      alignment: Alignment(0.70, -0.74), child: NotisLista())
                  : Container()
            ],
          ),
        );
      },
    );
  }

  Widget Notisvacias() {
    return Center(
      child: Container(
        color: Color.fromARGB(255, 248, 248, 248),
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
              width: Adapt.wp(10),
              height: Adapt.hp(10),
            ),
            Text("No notification yet",
                style: TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  color: Color.fromARGB(255, 145, 145, 145),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                )),
          ],
        )),
      ),
    );
  }

  Widget tittleWallet() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
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
              width: Adapt.wp(23),
            ),
            Text(" Wallet",
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

  Widget tittleWalletLAND() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
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
              width: Adapt.wp(78),
            ),
            Text(" Wallet",
                style: TextStyle(
                    fontSize: 36,
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

  Widget WalletInfo() {
    return FutureBuilder(
        future: infoWallet().Mywallet(prefs.token),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            wid = double.parse(snapshot.data["withdrawls"]);
            wid_t = double.parse(snapshot.data["withdrawls_pending"]);
            balance = double.parse(snapshot.data["balance"]);

            total = wid + wid_t + balance;

            return Column(
              children: [
                SizedBox(
                  height: Adapt.hp(8),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Text("You Have Available",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                SizedBox(
                  height: Adapt.hp(2),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Text("Total earn",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Container(
                      height: Adapt.hp(8),
                      width: Adapt.wp(8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/iconos/signoPeso.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Text(total.toString(),
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    SizedBox(
                      width: Adapt.wp(7),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Text("My balance",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 130, 130, 130))),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Container(
                      height: Adapt.hp(8),
                      width: Adapt.wp(8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/iconos/signoPeso.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Adapt.wp(2),
                    ),
                    Text(snapshot.data["balance"].toString(),
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0))),
                    SizedBox(
                      width: Adapt.wp(5),
                    ),
                  ],
                ),
                SizedBox(
                  height: Adapt.hp(3),
                ),
                Container(
                  height: Adapt.hp(12),
                  width: Adapt.wp(65),
                  child: Text(
                      "If you want more information about your wallet you can go to the website...",
                      style: TextStyle(
                        color: Color.fromARGB(255, 130, 130, 130),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: Adapt.hp(3),
                ),
                GestureDetector(
                  onTap: () async {
                    _launchUrl();
                  },
                  child: Text("https://design2.fun2view.com/",
                      style: TextStyle(
                        color: Color.fromARGB(255, 9, 92, 193),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: Adapt.hp(3),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class infoWallet extends ChangeNotifier {
  Future<dynamic> Mywallet(String token) async {
    String url = '${apiHost}my-wallet';

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

class Wallet_service {
  final prefs = PreferenciasUsuario();
  Future<dynamic> myWallet(
    String token,
  ) async {
    String url = '${apiHost}my-wallet';

    final data = {
      "token": token,
    };

    var datadecode = json.encode(data);

    final res = await http.post(
      Uri.parse(url),
      body: datadecode,
      headers: {
        'Content-Type': 'application/json ',
      },
    );

    dynamic respuesta = json.decode(res.body);

    print(respuesta);
    return respuesta;
  }
}
