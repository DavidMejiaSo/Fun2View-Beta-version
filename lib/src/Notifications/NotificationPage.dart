import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fun2view_appli/src/Preferencias/preferencias.dart';

import '../../Responsive/Adapt.dart';
import 'listadoNotis.dart';

class notificationHome extends StatefulWidget {
  const notificationHome({Key? key}) : super(key: key);

  @override
  State<notificationHome> createState() => _notificationHomeState();
}

class _notificationHomeState extends State<notificationHome> {
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
    @override
    void initState() {
      descripcionNotificacion = UserSimplePreferences.getPets() ?? [];

      super.initState();
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height + 45,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: Adapt.hp(20)),
                        (UserSimplePreferences.getPets() != [])
                            ? listadoNotis(
                                UserSimplePreferences.getPets() ?? [])
                            : Container(
                                color: Colors.red,
                                height: Adapt.hp(20),
                                width: Adapt.wp(10),
                                child: Text("No tienes Notis"),
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget Avataruser3() {
    return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 15, 208, 225),
        radius: 25.5,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 15, 208, 225),
          radius: 23.5,
          child: Image.network(prefs.coverPhoto),
        ));
  }

  Widget notiIndividual(dynamic item) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: Colors.white,
            width: Adapt.wp(89),
            height: Adapt.hp(1),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(width: Adapt.wp(35)),
                    Container(
                      child: Text("Funt2View",
                          style: TextStyle(
                              fontFamily: 'Montserrat-ExtraBold',
                              fontSize: Adapt.px(25))),
                    ),
                    SizedBox(height: Adapt.hp(4)),
                    Container(
                      child: Text(item,
                          style: TextStyle(
                              fontFamily: 'Montserrat-ExtraBold',
                              fontSize: Adapt.px(13))),
                    )
                  ],
                ),
                SizedBox(
                    width: Adapt.wp(
                  28,
                )),
                //Column donde iran los textos
                Container(
                    width: Adapt.wp(20),
                    height: Adapt.hp(47),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/cono.png'),
                      fit: BoxFit.scaleDown,
                    )))
              ], //Row donde va imagen y datos
            ),
          ),
        ),
      ],
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

          return Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: Adapt.px(10), right: Adapt.px(10)),
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Adapt.px(10)),
                              color: Color.fromARGB(255, 246, 243, 243),
                            ),
                            height: Adapt.hp(8),
                            width: Adapt.wp(18),
                            child: Image.asset("assets/cono.png"),
                          ),
                          SizedBox(
                            width: Adapt.wp(5),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Adapt.wp(45),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat-ExtraBold',
                                        fontSize: Adapt.px(25)),
                                  ),
                                ),
                                Container(
                                    width: Adapt.wp(30),
                                    child: Text("Fun2View")),
                                SizedBox(
                                  height: Adapt.hp(2),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Avataruser3(),
            ],
          );
        },
      ),
    );
  }

  Widget botonVolver(context) {
    //boton de enviar calificacion
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: Adapt.wp(40),
        height: Adapt.hp(5),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                primary: Colors.white,
                textStyle: TextStyle(
                    fontSize: Adapt.px(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            child: Text("⇐ Volver",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            onPressed: () async {
              UserSimplePreferences.setPets(notisListado.notis);
              Navigator.pushNamed(context, '/home');
            }),
      ),
    );
  }
}
