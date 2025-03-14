import 'package:flutter/material.dart';

class AgregarNoticiaScreen extends StatefulWidget {
  @override
  _AgregarNoticiaScreenState createState() => _AgregarNoticiaScreenState();
}

class _AgregarNoticiaScreenState extends State<AgregarNoticiaScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  String? _categoriaSeleccionada;
  final List<String> _categorias = ['Deportes', 'Política', 'Tecnología', 'Entretenimiento'];

  void _enviarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Noticia enviada: ${_tituloController.text}')),
      );

      _tituloController.clear();
      _descripcionController.clear();
      setState(() {
        _categoriaSeleccionada = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Noticia')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Nueva Noticia', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    TituloInput(controller: _tituloController),
                    SizedBox(height: 16),
                    DescripcionInput(controller: _descripcionController),
                    SizedBox(height: 16),
                    CategoriaDropdown(
                      categoriaSeleccionada: _categoriaSeleccionada,
                      categorias: _categorias,
                      onChanged: (value) {
                        setState(() {
                          _categoriaSeleccionada = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    PublicarButton(onPressed: _enviarFormulario),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Widget para el campo de título
class TituloInput extends StatelessWidget {
  final TextEditingController controller;

  const TituloInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Título',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese un título';
        }
        return null;
      },
    );
  }
}

/// Widget para la descripción
class DescripcionInput extends StatelessWidget {
  final TextEditingController controller;

  const DescripcionInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Descripción',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese una descripción';
        }
        return null;
      },
    );
  }
}

/// Widget para seleccionar la categoría
class CategoriaDropdown extends StatelessWidget {
  final String? categoriaSeleccionada;
  final List<String> categorias;
  final Function(String?) onChanged;

  const CategoriaDropdown({
    required this.categoriaSeleccionada,
    required this.categorias,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: categoriaSeleccionada,
      decoration: InputDecoration(
        labelText: 'Categoría',
        border: OutlineInputBorder(),
      ),
      items: categorias.map((categoria) {
        return DropdownMenuItem<String>(
          value: categoria,
          child: Text(categoria),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Seleccione una categoría' : null,
    );
  }
}

/// Widget para el botón de enviar
class PublicarButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PublicarButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Publicar Noticia'),
    );
  }
}
