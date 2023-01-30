import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fun2view_appli/Responsive/Adapt.dart';
import 'package:fun2view_appli/src/landing/login_page.dart';
import 'package:page_transition/page_transition.dart';

class PantallaCarga extends StatefulWidget {
  const PantallaCarga({Key? key}) : super(key: key);

  @override
  State<PantallaCarga> createState() => _PantallaCargaState();
}

//final prefs = PreferenciasUsuario();

class _PantallaCargaState extends State<PantallaCarga> {
  //final loginService = LoginService();
  dynamic recargarToken;
  String validaToken = "";
  dynamic r;
  bool validarTokken = false;
  @override
  void initState() {
    // validarToken();
    super.initState();
  }

  //void validarToken() async {
  //  validaToken = await loginService.checkToken();

  //  if (validaToken.contains('token is expired')) {
  //    _recargarToken();
  //  } else {
  //    promocionesProvider.cargarPromociones();

  //    validarTokken = true;
  //    setState(() {});
  //  }
  //}

  //void _recargarToken() async {
  //  try {
  //    recargarToken = await loginService.reloadToken();
  //    Future.delayed(const Duration(seconds: 1), () {});
  //    setState(() {
  //      prefs.token;
  //      prefs.usuario;
  //      validarTokken = true;
  //      print(
  //          'ln 51 loading page token: ${prefs.token} usuario ${prefs.usuario} ');
  //      promocionesProvider.cargarPromociones();
  //    });
  //  } catch (e) {
  //    print('error refrescando el token $e');
  //  }
  //}

  //dynamic promocionesProvider;

  @override
  Widget build(BuildContext context) {
    // promocionesProvider =
    //     Provider.of<PromotionsProvider>(context, listen: true);

    return AnimatedSplashScreen(
      splash: Container(
        height: Adapt.hp(100),
        width: double.infinity,
        //decoration: BoxDecoration(
        //  image: DecorationImage(
        //      image: NetworkImage(
        //          "https://static.vecteezy.com/system/resources/previews/004/466/306/non_2x/light-blue-background-design-white-and-blue-background-design-clean-and-modern-design-illustration-vector.jpg")),
        //),
        child: Image.asset("assets/fun2vie.png"),
      ),
      nextScreen: const LoginPage(),
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
