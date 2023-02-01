import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
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
  String balance = "";
  bool notis = false;
  final Mywallet = infoWallet();
  @override
  @override
  void initState() {
    Cuerpo_pantalla();
    setState(() {});
    super.initState();
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
                      image: AssetImage("assets/iconos/home.png"),
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
                        image: AssetImage("assets/iconos/birrete.png"),
                      ),
                    ),
                  ),
                  title: Text('Dashboard'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialogCustom(
                          bodyText: "Página en actualizacion**",
                          bottonAcept: 'false',
                          bottonCancel: Container(),
                        );
                      },
                    );
                    //Navigator.pushNamed(context, '/Dashboardpage');
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
                        bodyText: "Página en constuccion**",
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
                          bodyText: "Página en constuccion**",
                          bottonAcept: 'false',
                          bottonCancel: Container(),
                        );
                      },
                    );
                  }),
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
                      image: AssetImage("assets/iconos/sobre.png"),
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
          : Center(
              child: Container(
                height: Adapt.hp(30),
                width: Adapt.wp(30),
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/fun2vie.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: Adapt.wp(40),
                      height: Adapt.hp(8),
                    ),
                    Text("You don't have notifications yet..:(",
                        style: TextStyle(
                          textBaseline: TextBaseline.ideographic,
                          color: Color.fromARGB(255, 15, 208, 225),
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                )),
              ),
            ),
    );
  }

  Widget barraPpal() {
    return Container(
      color: Colors.white,
      height: Adapt.hp(11),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: Adapt.hp(3),
          ),
          Row(
            children: [
              SizedBox(
                width: Adapt.wp(3),
              ),
              GestureDetector(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  radius: 28.5,
                  child: Container(
                      height: Adapt.hp(10),
                      width: Adapt.wp(10),
                      child: Image.asset("assets/iconos/menu.png")),
                ), //COntainer para evitar usar Scaffold
              ),
              SizedBox(
                width: Adapt.wp(10),
              ),
              Container(
                width: Adapt.wp(50),
                child: Image(image: AssetImage("assets/fun2vie.png")),
              ),
              SizedBox(
                width: Adapt.wp(5),
              ),
              GestureDetector(
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
                  radius: 28.5,
                  child: Container(
                      height: Adapt.hp(7),
                      width: Adapt.wp(7),
                      child:
                          Image.asset("assets/iconos/drawer/Notificacion.png")),
                ),
              ), //COntainer para evitar usar Scaffold
            ],
          ),
        ],
      ),
    );
  }

  Widget Cuerpo_pantalla() {
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
                  height: Adapt.hp(15),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: Adapt.wp(90),
                    child: balanceContainer(),
                  ),
                ),
                SizedBox(
                  height: Adapt.hp(10),
                ),
                Center(child: Container())
              ],
            ),
          ),
          barraPpal(),
          (notis == true)
              ? Align(alignment: Alignment(0.70, -0.74), child: NotisLista())
              : Container()
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

  Widget tittleWallet() {
    return Container(
      child: Row(
        children: [
          Container(
            height: Adapt.hp(8),
            width: Adapt.wp(8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/iconos/wallet.png"),
              ),
            ),
          ),
          SizedBox(
            width: Adapt.wp(8),
          ),
          Text("My Wallet",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0))),
          SizedBox(
            width: Adapt.wp(5),
          ),
        ],
      ),
    );
  }

  Widget balanceContainer() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: Adapt.wp(13),
            ),
            tittleWallet(),
          ],
        ),
        SizedBox(
          height: Adapt.hp(8),
        ),
        Text("You have available....",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: Adapt.hp(5),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 5, 174, 230),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )),
          child: Row(
            children: [
              SizedBox(
                width: Adapt.wp(8),
              ),
              Text(prefs.balance,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 220, 248, 255))),
              SizedBox(
                width: Adapt.wp(5),
              ),
              Text("USD",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 220, 248, 255))),
              SizedBox(
                width: Adapt.wp(18),
              ),
              Transform(
                child: Container(
                  height: Adapt.hp(8),
                  width: Adapt.wp(8),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/wallet.png"),
                    ),
                  ),
                ),
                transform: new Matrix4.identity()
                  ..rotateZ(60 * 3.1415927 / 180),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Adapt.hp(3),
        ),
        Text(
            "If you want more information about your wallet you can go to the website...",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: Adapt.hp(3),
        ),
        GestureDetector(
          onLongPress: () async {},
          child: Text("https://design2.fun2view.com/",
              style: TextStyle(
                color: Color.fromARGB(255, 9, 92, 193),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
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
