import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectoasistencia/models/Noticia.dart';

class NoticiaService {
  static const String baseUrl = 'http://192.168.1.18:9098/api/noticias';

  Future<List<Noticia>> obtenerNoticias() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      print('Solicitando noticias desde: $baseUrl');
      print('Estado de respuesta: ${response.statusCode}');
      print('Cuerpo de respuesta: ${response.body}');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Noticia.fromJson(json)).toList();
      } else {
        throw Exception('Error al obtener noticias: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Excepción al obtener noticias: $e');
      rethrow;
    }
  }

  Future<Noticia> crearNoticia({
    required String titulo,
    required String contenido,
    String? imagenPath,
    String? videoPath,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/crear'));
    request.fields['titulo'] = titulo;
    request.fields['contenido'] = contenido;

    if (imagenPath != null) {
      request.files.add(await http.MultipartFile.fromPath('imagen', imagenPath));
    }
    if (videoPath != null) {
      request.files.add(await http.MultipartFile.fromPath('video', videoPath));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201) {
      return Noticia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear noticia: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Noticia> actualizarNoticia({
    required String id,
    required String titulo,
    required String contenido,
    String? imagenPath,
    String? videoPath,
  }) async {
    var request = http.MultipartRequest('PUT', Uri.parse('$baseUrl/actualizar/$id'));
    request.fields['titulo'] = titulo;
    request.fields['contenido'] = contenido;

    if (imagenPath != null) {
      request.files.add(await http.MultipartFile.fromPath('imagen', imagenPath));
    }
    if (videoPath != null) {
      request.files.add(await http.MultipartFile.fromPath('video', videoPath));
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return Noticia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al actualizar noticia: ${response.statusCode} - ${response.body}');
    }
  }

  Future<void> eliminarNoticia(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/eliminar/$id'));
    if (response.statusCode != 204) {
      throw Exception('Error al eliminar noticia: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Noticia> darLike(String id) async {
    final response = await http.post(Uri.parse('$baseUrl/$id/likes'));
    if (response.statusCode == 200) {
      return Noticia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al dar like: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Noticia> agregarComentario(String id, String autor, String contenido) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$id/comentarios'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'autor': autor, 'contenido': contenido}),
    );

    if (response.statusCode == 200) {
      return Noticia.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al agregar comentario: ${response.statusCode} - ${response.body}');
    }
  }
}