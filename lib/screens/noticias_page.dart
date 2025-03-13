import 'package:flutter/material.dart';
import 'package:proyectoasistencia/models/Noticia.dart';
import 'package:proyectoasistencia/services/noticia_service.dart';
import 'package:proyectoasistencia/widgets/admin_drawer.dart';
import 'package:proyectoasistencia/widgets/video_widget.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  late Future<List<Noticia>> noticiasFuture;
  final NoticiaService noticiaService = NoticiaService();

  @override
  void initState() {
    super.initState();
    noticiasFuture = noticiaService.obtenerNoticias();
  }

  void _refreshNoticias() {
    setState(() {
      noticiasFuture = noticiaService.obtenerNoticias();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshNoticias,
          ),
        ],
      ),
      drawer: const AdminDrawer(), // Widget extraído
      body: FutureBuilder<List<Noticia>>(
        future: noticiasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay noticias disponibles'));
          }

          final noticias = snapshot.data!;
          return ListView.builder(
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final noticia = noticias[index];
              return Card(
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (noticia.imagen != null)
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(16)),
                        child: Image.network(
                          noticia.imagen!,
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Text('Error al cargar imagen'),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        noticia.titulo,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        noticia.contenido,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    if (noticia.video != null)
                      VideoWidget(videoUrl: noticia.video!), // Widget extraído
                    const SizedBox(height: 10),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}