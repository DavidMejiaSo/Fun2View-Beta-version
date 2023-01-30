import 'package:fun2view_appli/src/Preferencias/preferencias.dart';
import 'package:http/http.dart' as http;

class GetuserINFO {
  final prefs = PreferenciasUsuario();
  Future<dynamic> getInfo() async {
    final url = '';

    final res = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ${prefs.token}',
        'Accept-Charset': 'utf-8',
      },
    );

    //dynamic respuesta = jsonDecode(utf8.decode(res.bodyBytes));

    // return respuesta;
  }
}
