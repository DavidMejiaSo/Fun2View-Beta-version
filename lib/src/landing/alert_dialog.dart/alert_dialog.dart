import 'package:flutter/material.dart';

import '../../../Responsive/Adapt.dart';

// ignore: must_be_immutable
class AlertDialogCustom extends StatefulWidget {
  AlertDialogCustom(
      {Key? key,
      // required this.titlleText,
      required this.bodyText,
      required this.bottonAcept,
      required this.bottonCancel})
      : super(key: key);

  @override
  State<AlertDialogCustom> createState() => _AlertDialogCustomState();
  String bodyText;
  dynamic bottonAcept, bottonCancel;
}

class _AlertDialogCustomState extends State<AlertDialogCustom> {
  final ButtonStyle styleOK = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      primary: Color.fromARGB(255, 78, 199, 243),
      textStyle: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 20,
      backgroundColor: Colors.white,
      title: Container(
        child: Center(
            child: Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Adapt.hp(3),
                ),
                Container(
                  height: Adapt.hp(10),
                  width: Adapt.wp(20),
                  child: Image(image: AssetImage("assets/iconos/Alerta.png")),
                ),
                SizedBox(
                  height: Adapt.hp(5),
                ),
              ],
            ),
          ),
        )),
      ),
      content: SizedBox(
        height: widget.bodyText.length > 50 ? Adapt.hp(11) : Adapt.hp(6),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              widget.bodyText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
              maxLines: 15,
            ),
          ),
        ),
      ),
      actions: [
        widget.bottonAcept == 'false'
            ? Center(
                child: SizedBox(
                    height: Adapt.hp(6),
                    width: Adapt.wp(50),
                    child: ElevatedButton(
                        style: styleOK,
                        child: Text(
                          "ACEPTAR",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 254, 254)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
              )
            : Center(
                child: SizedBox(
                  height: Adapt.hp(6),
                  width: Adapt.wp(50),
                  child: widget.bottonAcept,
                ),
              ),
        SizedBox(height: Adapt.wp(2)),
        Center(
          child: SizedBox(
            height: Adapt.hp(6),
            width: Adapt.wp(50),
            child: widget.bottonCancel,
          ),
        ),
        SizedBox(
          height: widget.bodyText.length > 40 ? Adapt.hp(1) : Adapt.hp(10),
        ),
      ],
    );
  }
}
