class Noticia {
  final String id;
  final String titulo;
  final String contenido;
  final String? imagen;
  final String? video;
  final String? imagenPath;
  final String? videoPath;

  Noticia({
    required this.id,
    required this.titulo,
    required this.contenido,
    this.imagen,
    this.video,
    this.imagenPath,
    this.videoPath,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    const String baseUrl = 'http://192.168.203.14:9098';
    final imagenUrl = json['imagenPath'] != null ? '$baseUrl/api/noticias/imagen/${json['id']}' : null;
    final videoUrl = json['videoPath'] != null ? '$baseUrl/api/noticias/video/${json['id']}' : null;
    print('Imagen URL: $imagenUrl');
    print('Video URL: $videoUrl');
    return Noticia(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      contenido: json['contenido'] as String,
      imagenPath: json['imagenPath'] as String?,
      videoPath: json['videoPath'] as String?,
      imagen: imagenUrl,
      video: videoUrl,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'contenido': contenido,
        'imagenPath': imagenPath,
        'videoPath': videoPath,
      };
}