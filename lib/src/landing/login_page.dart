import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fun2view_appli/Responsive/Adapt.dart';
import 'package:fun2view_appli/src/host.dart';
import 'package:fun2view_appli/src/landing/profile_page.dart';
import 'package:fun2view_appli/src/landing/Routes/routes.dart';

import 'package:http/http.dart' as http;

import '../Preferencias/preferencias.dart';
import 'alert_dialog.dart/alert_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _check = false;
  bool _mostrarPassword = true;

  String _usuario = '';
  String _password = '';

  String _tokenLogin = '';

  int _validarUser = 0;
  int _validarPassword = 0;

  final prefs = PreferenciasUsuario();
  final loginService = LoginServiceL();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _check = prefs.check;
    _usuario = prefs.usuario;
    _password = prefs.password;
    _tokenLogin = prefs.token;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo(context),
    );
  }

  Widget _cuerpo(BuildContext context) {
    return Stack(
      children: [_fondo(), _logos(context), _login(context)],
    );
  }

  Widget _login(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: Adapt.hp(70),
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                //color: const Color.fromARGB(178, 15, 15, 15),
                //border: Border.all(color: Color.fromARGB(255, 248, 247, 247)),
                borderRadius: BorderRadius.circular(20.0),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: size.height * 0.003,
                //       spreadRadius: size.height * 0.001)
                // ]
              ),
              margin: const EdgeInsets.only(top: 220.0),
              child: _accesorios(context),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 270.0),
            //   height: size.height * 0.4,
            //   width: size.width * 0.7,
            //   child: Card(
            //     elevation: 10.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget ver() {
    return Container(
      height: Adapt.hp(1),
      width: Adapt.wp(1),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage("assets/blind.png"),
        ),
      ),
    );
  }

  Widget No_ver() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage("assets/blind.png"),
        ),
      ),
    );
  }

  Widget _accesorios(BuildContext context) {
    const spaceBetweenWidth = SizedBox(width: 20);
    const spaceBetweenHeight = SizedBox(height: 20);
    return SingleChildScrollView(
      child: Form(
        //key: formKey,
        child: Column(
          children: [
            Container(
                child: Text("LOGIN",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 101, 214, 242)))),
            SizedBox(height: Adapt.hp(2)),
            Container(
                width: Adapt.wp(58),
                child: Center(
                  child: Text(
                      "We help content creators to monetize their content",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 143, 151, 158))),
                )),
            SizedBox(
              height: Adapt.wp(8),
            ),
            _usuarioText(context),
            const SizedBox(
              height: 40.0,
            ),
            _passwordText(context),
            const SizedBox(
              height: 30.0,
            ),
            _checkRecordarCredenciales(context),
            const SizedBox(
              height: 30.0,
            ),
            _botonIngresaar(),
            spaceBetweenHeight,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }

  Widget _usuarioText(BuildContext context) {
    return Container(
      //color: Colors.red,
      //height: Adapt.hp(10),
      width: Adapt.wp(75),
      child: Center(
        child: TextFormField(
          //keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            label: Row(
              children: [
                Container(
                  height: Adapt.hp(3),
                  width: Adapt.wp(3),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/personIcon.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: Adapt.wp(2),
                ),
                Text("User",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 79, 78, 78),
                    )),
              ],
            ),
          ),
          onChanged: (value) {
            _usuario = value;
            _validarUser = _usuario.indexOf('@');
          },
          validator: (valor) {
            if (valor == '') {
              return 'El campo es obligatorio *';
            } else {
              if (_validarUser < 0) {
                return 'El correo no es un correo valido*';
              } else {
                return null;
              }
            }
          },
        ),
      ),
    );
  }

  Widget _checkRecordarCredenciales(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Adapt.wp(6),
        ),
        Container(
          width: Adapt.wp(6),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Color.fromARGB(255, 70, 179, 222),
            ),
            child: CheckboxListTile(
                activeColor: Color.fromARGB(255, 70, 179, 222),
                checkColor: Color.fromARGB(255, 255, 255, 255),
                value: _check,
                onChanged: (valor) {
                  _check = valor!;

                  if (_check) {
                    prefs.usuario = _usuario;
                    prefs.password = _password;
                    prefs.check = _check;
                  } else {
                    prefs.usuario = '';
                    prefs.password = '';
                    prefs.check = false;
                  }

                  setState(() {});
                }),
          ),
        ),
        SizedBox(
          width: Adapt.wp(3),
        ),
        Text("Acepto Terminos",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  void _ingresar() async {
    //String tipoAcceso = "CORREO";
    dynamic respuestas = await loginService.login(_usuario, _password);
    print(respuestas);
    if (respuestas == null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (respuestas != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialogCustom(
              bodyText: "ERROR: Checkout your credentials and try again",
              bottonAcept: 'false',
              bottonCancel: Container(),
            );
          });
    } else {
      //_tokenLogin = respuestas['auth_token'];
      //prefs.token = _tokenLogin;
    }
  }

//  void _ingresar() async {
//    final loginService = LoginServiceL();
//
//    Map<String, dynamic>? respuesta =
//        await loginService.login(_usuario, _password);
//
//    if (_check) {
//      prefs.usuario = _usuario;
//      prefs.password = _password;
//    } else {
//      prefs.usuario = '';
//      prefs.password = '';
//    }
//
//    if (respuesta is Map) {
//      Navigator.pushReplacementNamed(context, '/pantallappal');
//    } else {
//      // mensaje error
//    }
//  }

  Widget _botonIngresaar() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
        primary: Color.fromARGB(255, 101, 214, 242),
        textStyle: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black));
    return ElevatedButton(
      style: style,
      onPressed: () => {
        if (_check == true)
          {
            _ingresar(),
          }
        else
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialogCustom(
                  bodyText: "Por favor acepta los terminos y condiciones",
                  bottonAcept: 'false',
                  bottonCancel: Container(),
                );
              },
            )
          }
      },
      child: Text("Login",
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255))),
    );
  }

  Widget _passwordText(BuildContext context) {
    return Container(
      width: Adapt.wp(75),
      child: TextFormField(
        obscureText: _mostrarPassword == true ? true : false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            label: Row(
              children: [
                Container(
                  height: Adapt.hp(3),
                  width: Adapt.wp(3),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/iconos/candadoIcon.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: Adapt.wp(2),
                ),
                Text("Password",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 79, 78, 78),
                    )),
                SizedBox(
                  width: Adapt.wp(10),
                ),
              ],
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  _mostrarPassword = !_mostrarPassword;
                  setState(() {});
                },
                child: Container(
                    width: Adapt.wp(1),
                    child: _mostrarPassword == true ? ver() : No_ver()))),
        onChanged: (value) {
          _password = value;
          _validarPassword = _password.length;
        },
        validator: (valor) {
          if (valor == '') {
            return 'El campo es obligatorio *';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _logos(BuildContext context) {
    const spaceBetween = SizedBox(height: 20);
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Adapt.hp(4),
              ),
              Container(
                height: Adapt.hp(18),
                width: Adapt.wp(80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/fun2vie.png"),
                  ),
                ),
              ),
              SizedBox(
                height: Adapt.hp(5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fondo() {
    final size = MediaQuery.of(context).size;
    return Container();
  }

  Widget _botonRegistrarse() {
    final ButtonStyle style = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        primary: Color.fromARGB(255, 18, 102, 177),
        textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)));
    return ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/register');
      },
      child: Text("registrate",
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0))),
    );
  }
}

class LoginServiceL extends ChangeNotifier {
  final prefs = PreferenciasUsuario();
  Future<dynamic> login(String usuario, String password) async {
    final prefs = PreferenciasUsuario();

    String url = '${apiHost}auth/login';

    final Map<String, String> data = {"email": usuario, "password": password};

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
    if (respuesta.containsKey("auth_token")) {
      prefs.usuario = respuesta['name'];
      prefs.email = respuesta['email'];
      prefs.token = respuesta['auth_token'];
      prefs.coverPhoto = respuesta['avatar'];
      prefs.portadaPhoto = respuesta['cover'];
      prefs.descripcion = respuesta['story'];
      prefs.balance = respuesta['balance'];
      prefs.nombreUsuario = respuesta['username'];

      return null;
    } else {
      print(respuesta);
      return respuesta;
    }
//
  }

  Future<String> checkToken() async {
    String url = '${apiHost}auth/login';
    final res = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${prefs.token}',
      },
    );
    String respuesta2 = res.body;
    try {
      return respuesta2;
    } catch (e) {
      return respuesta2;
    }
  }

  String obtenerTokenLogin(Map data) {
    return data['token'];
  }
}
