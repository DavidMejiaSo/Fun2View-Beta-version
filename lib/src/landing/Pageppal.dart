import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fun2view_appli/Responsive/Adapt.dart';
import 'package:fun2view_appli/src/controller/posts_controller.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Preferencias/preferencias.dart';
import 'alert_dialog.dart/alert_dialog.dart';

//import 'package:prueba_vaco_app/preferences/preferences_user.dart';
//import 'package:prueba_vaco_app/service/login_service.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
class Pageppal extends StatefulWidget {
  const Pageppal({Key? key}) : super(key: key);

  @override
  _Pageppal createState() => _Pageppal();
}

class _Pageppal extends State<Pageppal> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _check = false;
  bool _mostrarPassword = true;

  String _usuario = '';
  String _password = '';
  String comentario = '';
  String pathImage = "";
  String _imageSend = "";

  List<Map> postsText = [];
  List<dynamic> postsTDes = [];
  List<dynamic> mediaImagen = [];
  List<dynamic> Imagenes = [];

  final ButtonStyle styleOK = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      primary: Colors.blue,
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));
  final ButtonStyle styleOK2 = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      primary: Colors.white,
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  final prefs = PreferenciasUsuario();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Cuerpo_pantalla();
    super.initState();
    // _check = prefs.check;
    // _usuario = prefs.usuario;
    // _password = prefs.password;
    //traerPosts();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        body: RefreshIndicator(
            color: Color.fromARGB(255, 15, 208, 225),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            strokeWidth: 4.0,
            onRefresh: () {
              Navigator.pushNamed(context, '/pantallappal');
              return Future<void>.delayed(const Duration(seconds: 3));
            },
            child: Cuerpo_pantalla()),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(90),
                bottomRight: Radius.circular(180)),
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
                  // Navigator.pushNamed(context, '/NotificationPage');
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
                  }),
            ],
          ),
        ));
  }

  Widget ImagenesAvatarPortada() {
    return Stack(
      children: [
        Portadauser(),
        Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: Adapt.hp(25),
                ),
                Avataruser()
              ],
            ))
      ],
    );
  }

  Widget Cuerpo_pantalla() {
    return SingleChildScrollView(
      child: GestureDetector(
        onDoubleTap: () {
          _key.currentState!.openDrawer();
        },
        child: Container(
          color: Color.fromARGB(255, 243, 243, 243),
          child: Column(
            children: [
              Container(
                height: Adapt.hp(10),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: Adapt.hp(2),
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
                          child:
                              AvataruserII(), //COntainer para evitar usar Scaffold
                        ),
                        SizedBox(
                          width: Adapt.wp(10),
                        ),
                        Container(
                          width: Adapt.wp(50),
                          child: Image(image: AssetImage("assets/fun2vie.png")),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ImagenesAvatarPortada(),
              SizedBox(
                height: Adapt.hp(3),
              ),
              Nameuser(),
              SizedBox(
                height: Adapt.hp(2),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(width: Adapt.wp(90), child: NameuserDes())),
              SizedBox(
                height: Adapt.hp(8),
              ),
              Itemsuser(),
              SizedBox(
                height: Adapt.hp(8),
              ),
              newPublication(),
              SizedBox(
                height: Adapt.hp(2),
              ),
              notificationsList(),
              SizedBox(
                height: Adapt.hp(5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Logoppal() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fun2vie.png"),
          fit: BoxFit.fill,
        ),
      ),
      width: Adapt.wp(60),
      height: Adapt.hp(8),
    );
  }

  Widget notificationsList() {
    //Notificaciones principales
    return FutureBuilder(
        future: Myposts_service().myPost(prefs.token),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                width: Adapt.wp(95),
                height: Adapt.hp(35),
                child: ListView.builder(
                  itemCount: snapshot.data["posts"].length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      elevation: 10.2,
                      child: Container(
                        //color: Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Adapt.wp(2),
                                ),
                                AvataruserII(),
                                SizedBox(
                                  width: Adapt.wp(1),
                                ),
                                Column(
                                  children: [
                                    Text(prefs.usuario,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 103, 103, 103),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Text(
                                        DateFormat('MMMM dd, yyyy').format(
                                            DateTime.parse(snapshot
                                                .data["posts"][index]["date"])),
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 136, 134, 134),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: Adapt.wp(2),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // height: Adapt.hp(30),
                              // width: Adapt.wp(95),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Adapt.wp(3),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            snapshot.data["posts"][index]
                                                    ["description"]
                                                .toString(),
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 97, 97, 97),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                    ],
                                  ),
                                  (snapshot.data["posts"][index]["media"]
                                              .length !=
                                          0)
                                      ? Container(
                                          height: Adapt.hp(20),
                                          width: double.infinity,
                                          child: Stack(
                                            children: [
                                              Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              snapshot.data["posts"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      "media"][0]
                                                                  ["image"])))),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: Adapt.wp(4),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            snapshot.data["posts"][index]
                                                    ["likes"]
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(
                                          width: Adapt.wp(2),
                                        ),
                                        Text("Likes")
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  void traerPosts() async {
    String token = prefs.token;

    dynamic respuestas = await Myposts_service().myPost(token);

    postsText = respuestas["posts"];

    //for (int i = 0; i < postsText.length; i++) {
    //  for (Map description in postsText[i]) {
    //    mediaImagen.add(description["media"]);
    //  }
    //}
    ////print("Son estos $mediaImagen");
//
    //for (int i = 0; i < postsText.length; i++) {
    //  for (Map description in postsText[i]) {
    //    postsTDes.add(description["description"]);
    //  }
    //}
    setState(() {});
  }

  void traerPhotos() {
    String links = "";
    for (int i = 0; i < mediaImagen.length; i++) {
      for (Map image in mediaImagen[i]) {
        if (image["image"] == "") {
          Imagenes.add(links);
        } else {
          links = image["image"];
          Imagenes.add(links);
        }
      }

      setState(() {});
    }
    print("Estos son $Imagenes");
  }

  Widget Portadauser() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(prefs.portadaPhoto.toString()),
          fit: BoxFit.fill,
        ),
      ),
      height: Adapt.hp(30),
      width: double.infinity,
    );
  }

  Widget Avataruser() {
    return CircleAvatar(
        radius: 90.5,
        child: CircleAvatar(
          radius: 87.5,
          child: Image.network(prefs.coverPhoto),
        ));
  }

  Widget AvataruserII() {
    return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 15, 208, 225),
        radius: 20.5,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 15, 208, 225),
          radius: 18.5,
          child: Image.network(prefs.coverPhoto),
        ));
  }

  Widget AvataruserIV() {
    return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 15, 208, 225),
        radius: 20.5,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 15, 208, 225),
          radius: 18.5,
          child: Image.network(prefs.coverPhoto),
        ));
  }

  Widget Cerrar() {
    return GestureDetector(
      onTap: () {
        pathImage = "";
        setState(() {});
      },
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 19.5,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18.5,
            child: Text("X",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                )),
          )),
    );
  }

//void getUserData() async {
//  final getDataUser = GetUserInfoService();
//  Map respuesta = await getDataUser.getInfo();
//
//  String? token = "";
//  await FirebaseMessaging.instance.getToken().then((value) {
//    token = value;
//  });
//  //respuesta["idTelefono"] = token;
//  if (respuesta["idTelefono"] == "") {
//    print("Está vacío mi reeeey");
//    changeInfoUser.changeInfo("idTelefono", token);
//    //changeInfoUser.actualizarUser(respuesta);
//  } else if (respuesta["idTelefono"] != token) {
//    print("Es diferente de TOKEN PAI");
//    changeInfoUser.changeInfo("idTelefono", token);
//  }
// https://DavidMej:ATBBY7eSB5qwBuHwwEPKfrSZ6QgU885678AA@bitbucket.org/intel2saverd/fun2view-app.git
//  setState(() {});
//}

  Widget Nameuser() {
    return Text(prefs.usuario,
        style: TextStyle(
          textBaseline: TextBaseline.ideographic,
          color: Color.fromARGB(255, 15, 208, 225),
          fontSize: 46,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ));
  }

  Widget NameuserDes() {
    return Text(prefs.descripcion,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget newPublication() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      elevation: 10.2,
      child: Container(
        width: Adapt.wp(95),
        child: Column(
          children: [
            Row(
              children: [
                AvataruserIV(),
                SizedBox(
                  width: Adapt.wp(2),
                ),
                Padding(
                    padding: EdgeInsets.all(Adapt.px(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 65, 65, 66), width: 0.5),
                      ),
                      height: Adapt.hp(12),
                      width: Adapt.wp(70),
                      child: Center(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontSize: Adapt.px(24),
                              color: Color.fromARGB(255, 48, 49, 49)),
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "New post...",
                            hintStyle: TextStyle(
                                fontSize: Adapt.px(20),
                                color: Color.fromARGB(255, 99, 99, 99)),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              comentario = value;
                            });
                          },
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: Adapt.hp(2),
            ),
            Column(
              children: [
                Container(
                  child: (pathImage != "")
                      ? mostrarImagen(pathImage)
                      : Container(),
                ),
                SizedBox(
                  height: Adapt.hp(2),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Adapt.wp(48),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {});
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Color.fromARGB(0, 148, 141, 141),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: Adapt.hp(45),
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              final picker = new ImagePicker();
                                              final PickedFile? pickedFile =
                                                  await picker.getImage(
                                                      source:
                                                          ImageSource.gallery,
                                                      imageQuality: 100);

                                              if (pickedFile == null) {
                                                print("nada de nada");
                                                setState(() {});
                                                return;
                                              }
                                              setState(() {});
                                              print(
                                                  "Aqui tenemos esto ${pickedFile.path}");
                                              pathImage = pickedFile.path;
                                              List<int> bytes =
                                                  await new File(pathImage)
                                                      .readAsBytesSync();

                                              _imageSend = base64.encode(bytes);
                                              Navigator.of(context).pop();

                                              setState(() {});
                                            },
                                            child: Container(
                                              height: Adapt.hp(8),
                                              width: Adapt.wp(8),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/iconos/galeriaIcon.png"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Adapt.hp(10),
                                          ),
                                          ElevatedButton(
                                            style: styleOK2,
                                            child: Container(
                                              height: Adapt.hp(8),
                                              width: Adapt.wp(8),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/iconos/camaraIcon.png"),
                                                ),
                                              ),
                                            ),
                                            onPressed: () async {
                                              final picker = new ImagePicker();
                                              final PickedFile? pickedFile =
                                                  await picker.getImage(
                                                      source:
                                                          ImageSource.camera,
                                                      imageQuality: 100);

                                              if (pickedFile == null) {
                                                setState(() {});
                                                print("nada de nada");
                                                return;
                                              }
                                              setState(() {});
                                              print(
                                                  "Aqui tenemos esto ${pickedFile.path}");
                                              pathImage = pickedFile.path;
                                              List<int> bytes =
                                                  await new File(pathImage)
                                                      .readAsBytesSync();

                                              _imageSend = base64.encode(bytes);
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: Adapt.hp(5)),
                                      ElevatedButton(
                                        style: styleOK,
                                        child: Text(
                                          "Cancelar",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(height: Adapt.hp(5)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: Adapt.hp(7),
                        width: Adapt.wp(7),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/iconos/galeriaIcon.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Adapt.wp(6),
                    ),
                    GestureDetector(
                      onTap: () {
                        _enviarPost();
                        Navigator.pushReplacementNamed(
                            context, '/pantallappal');
                        setState(() {});
                      },
                      child: Card(
                        color: Color.fromARGB(255, 88, 175, 246),
                        elevation: 10.2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14))),
                        child: Container(
                          height: Adapt.hp(4),
                          width: Adapt.wp(22),
                          child: Center(
                            child: Text(
                              "Publish",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Adapt.wp(5),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _enviarPost() async {
    //String tipoAcceso = "CORREO";
    dynamic respuestas =
        await Myposts_service().Post(prefs.token, comentario, _imageSend);
    // print(respuestas);
    setState(() {});
  }

  Widget Itemsuser() {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              width: Adapt.wp(15),
            ),
            //Icon(Icons.heart_broken),
            SizedBox(height: Adapt.hp(2)),
            Text("Post")
          ],
        ),
        SizedBox(
          width: Adapt.wp(10),
        ),
        Column(
          children: [
            //Icon(Icons.heart_broken),
            SizedBox(height: Adapt.hp(2)),
            Text("Photos")
          ],
        ),
        SizedBox(
          width: Adapt.wp(10),
        ),
        Column(
          children: [
            //Icon(Icons.heart_broken),
            SizedBox(height: Adapt.hp(2)),
            Text("Videos")
          ],
        ),
        SizedBox(
          width: Adapt.wp(10),
        ),
        Column(
          children: [
            //Icon(Icons.heart_broken),
            SizedBox(height: Adapt.hp(2)),
            Text("Audio")
          ],
        ),
        SizedBox(
          width: Adapt.wp(10),
        ),
        Column(
          children: [
            //Icon(Icons.heart_broken),
            SizedBox(height: Adapt.hp(2)),
            Text("Shop")
          ],
        ),
      ],
    );
  }

  Widget mostrarImagen(String Picture) {
    if (Picture == null) {
      return Container();
    }

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              CircularProgressIndicator(),
              Container(
                  height: Adapt.hp(30),
                  width: Adapt.wp(40),
                  child: Image.file(File(Picture), fit: BoxFit.cover)),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: Adapt.wp(60),
            ),
            Cerrar(),
          ],
        )
      ],
    );
  }
}

class Myposts_service {
  File? newPictureFile;

  final prefs = PreferenciasUsuario();
  Future<dynamic> myPost(
    String token,
  ) async {
    String url = 'https://design2.fun2view.com/mobile/v1/my-posts';

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

  Future<dynamic> Post(String Token, String publi, String image) async {
    final prefs = PreferenciasUsuario();

    String url = 'https://design2.fun2view.com/mobile/v1/send-post';

    final Map<String, String> data = {
      "token": Token,
      "description": publi,
      "image": image
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
    print(data);
  }
}

//if (respuesta is String) {
//  print(respuesta);
//  return respuesta;
//} else {
//  Map<dynamic, dynamic> respuestaTipoMap = respuesta;

//  print('==================================');
//  print('resputa del login $respuesta');

//  print('==================================');
//prefs.usuario = respuesta['name'];
//prefs.email = respuesta['email'];
//prefs.nombreUsuario = respuesta['username'];
////}
//prefs.usuario = respuesta['0']['name'];
//prefs.email = respuesta['3']['email'];
//prefs.nombreUsuario = respuesta['1']['username'];

//
