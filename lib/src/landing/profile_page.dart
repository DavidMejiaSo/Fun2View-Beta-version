import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fun2view_appli/Responsive/Adapt.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
import 'package:fun2view_appli/src/host.dart';
import 'package:http/http.dart' as http;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final prefs = PreferenciasUsuario();
  final ButtonStyle style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      primary: Color.fromARGB(255, 101, 214, 242),
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  @override
  void initState() {
    print("Sucede que aquí esta el token de la app");
    print(PreferenciasUsuario().token);
    prefs.iniciarPreferencias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Row(children: [
            Expanded(
                child: Column(
              children: [
                myCard(),
              ],
            )),
          ]),
        ),
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
      ),
    )));
  }

  Card myCard() {
    final size = MediaQuery.of(context).size;
    const spaceBetween = SizedBox(height: 30);
    return Card(
      // Con esta propiedad modificamos la forma de nuestro card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: const EdgeInsets.all(20),
      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Container(
        // ignore: sort_child_properties_last
        child: Column(
          children: <Widget>[
            // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
            Container(
              child: const Image(image: AssetImage('assets/fun2vie.png')),
              margin: const EdgeInsets.only(bottom: 3),
            ),

            // Usamos una fila para ordenar los botones del card
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Text("Bienvenido",
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 101, 214, 242)))),
                spaceBetween,
                profilePhoto(),
                SizedBox(
                  height: Adapt.hp(2),
                ),
                Center(
                    child: Text(prefs.usuario,
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 101, 214, 242)))),
                Center(
                    child: Text("App para creadores",
                        style: TextStyle(
                          color: Color.fromARGB(255, 151, 165, 176),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ))),
                spaceBetween,
                Center(
                    child: Container(
                  width: Adapt.wp(55),
                  child: Text(prefs.descripcion,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                )),
                SizedBox(
                  height: Adapt.hp(2),
                ),
                spaceBetween,
                SizedBox(
                  height: Adapt.hp(2),
                ),
                Container(
                  height: Adapt.hp(6),
                  width: Adapt.wp(40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(90.0),
                          topRight: const Radius.circular(90.0))),
                  //color: Color.fromARGB(255, 94, 175, 241),
                  child: ElevatedButton(
                    style: style,
                    child: Text("Ingrese",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 238, 234, 234))),
                    onPressed: () => {
                      Navigator.pushReplacementNamed(context, '/pantallappal')
                    },
                  ),
                ),
              ],
            )
          ],
        ),
        height: Adapt.hp(85),
        width: Adapt.wp(90),
      ),
    );
  }

  void getUserData() async {
    final getDataUser = GetUserInfoService();
    Map respuesta = await getDataUser.getInfo();

    String? token = "";
    await FirebaseMessaging.instance.getToken().then((value) {
      token = value;
    });
    //respuesta["idTelefono"] = token;
    if (respuesta["idTelefono"] == "") {
      print("Está vacío mi reeeey");
      //changeInfoUser.changeInfo("idTelefono", token);
      //changeInfoUser.act)ualizarUser(respuesta);
    } else if (respuesta["idTelefono"] != token) {
      print("Es diferente de TOKEN PAI");
      //changeInfoUser.changeInfo("idTelefono", token);
    }
    https: //DavidMej:ATBBY7eSB5qwBuHwwEPKfrSZ6QgU885678AA@bitbucket.org/intel2saverd/fun2view-app.git
    setState(() {});
  }

  Widget profilePhoto() {
    return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 15, 208, 225),
        radius: 70.5,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 15, 208, 225),
          radius: 65.5,
          backgroundImage: NetworkImage(prefs.coverPhoto),
        ));
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
//
  //  setState(() {});
  //}
}

class GetUserInfoService {
  final prefs = PreferenciasUsuario();
  Future<dynamic> getInfo() async {
    final url = '${apiHost}user/fcm-token';

    final res = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json '},
    );

    dynamic respuesta = jsonDecode(res.body);

    return respuesta;
  }
}


//Card que contiene la bienvenida de la apliación

