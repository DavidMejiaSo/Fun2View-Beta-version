import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario.internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario.internal();

  late SharedPreferences _prefs;

  iniciarPreferencias() async {
    _prefs = await SharedPreferences.getInstance();
  }

  limpiar() async {
    _prefs.clear();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String valor) {
    _prefs.setString('token', valor);
  }

  String get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String valor) {
    _prefs.setString('usuario', valor);
  }

  String get balance {
    return _prefs.getString('balance') ?? '';
  }

  set balance(String valor) {
    _prefs.setString('balance', valor);
  }

  String get coverPhoto {
    return _prefs.getString('coverPhoto') ?? '';
  }

  set coverPhoto(String valor) {
    _prefs.setString('coverPhoto', valor);
  }

  String get portadaPhoto {
    return _prefs.getString('portadaPhoto ') ?? '';
  }

  set portadaPhoto(String valor) {
    _prefs.setString('portadaPhoto ', valor);
  }

  double get latitud {
    return _prefs.getDouble('latitud') ?? 0.0;
  }

  set latitud(double valor) {
    _prefs.setDouble('latitud', valor);
  }

  double get longitud {
    return _prefs.getDouble('longitud') ?? 0.0;
  }

  set longitud(double valor) {
    _prefs.setDouble('longitud', valor);
  }

  String get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String valor) {
    _prefs.setString('password', valor);
  }

  String get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String valor) {
    _prefs.setString('email', valor);
  }

  bool get check {
    return _prefs.getBool('check') ?? false;
  }

  set check(bool valor) {
    _prefs.setBool('check', valor);
  }

  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String valor) {
    _prefs.setString('nombreUsuario', valor);
  }

  List<String> get restaurantFavorite {
    return _prefs.getStringList('restaurantFavorite') ?? [];
  }

  set restaurantFavorite(List<String> valor) {
    _prefs.setStringList('restaurantFavorite', valor);
  }

  String get descripcion {
    return _prefs.getString('descripcion ') ?? '0';
  }

  set descripcion(String valor) {
    _prefs.setString('descripcion ', valor);
  }
}
