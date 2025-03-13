import 'package:flutter/material.dart';
import 'package:proyectoasistencia/screens/login_page.dart';
import 'package:proyectoasistencia/widgets/drawer_header.dart';
import 'package:proyectoasistencia/widgets/menu_item.dart';
import 'package:proyectoasistencia/widgets/section_title.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1A1A2E),
        child: Column(
          children: [
            const DrawerHeaderWidget(), // Widget extraído
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  // Sección Menú
                  const SectionTitle('Menú'),
                  MenuItem(
                    icon: Icons.post_add,
                    title: 'Agregar Noticia',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.chat,
                    title: 'Gestionar Chat',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.edit_note,
                    title: 'Modificar Descripción',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.web,
                    title: 'Personalizar Header',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Alumno
                  const SectionTitle('Alumno'),
                  MenuItem(
                    icon: Icons.list,
                    title: 'Estudiante',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.family_restroom,
                    title: 'Acudiente',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Docente
                  const SectionTitle('Docente'),
                  MenuItem(
                    icon: Icons.person,
                    title: 'Docentes',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.assignment,
                    title: 'Curriculares',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.grade,
                    title: 'Calificaciones',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Curso
                  const SectionTitle('Curso'),
                  MenuItem(
                    icon: Icons.school,
                    title: 'Cursos',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.school,
                    title: 'Gestionar Curso',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Matrícula
                  const SectionTitle('Matrícula'),
                  MenuItem(
                    icon: Icons.assignment_ind,
                    title: 'Matrícula',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Configuraciones
                  const SectionTitle('Configuraciones'),
                  MenuItem(
                    icon: Icons.insights,
                    title: 'Dashboard Predicción',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.calendar_today,
                    title: 'Crear Periodo',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.school,
                    title: 'Nivel Académico',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.class_,
                    title: 'Grado y Sección',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.list,
                    title: 'Cupos',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.schedule,
                    title: 'Horario',
                    onTap: () => Navigator.pop(context),
                  ),
                  MenuItem(
                    icon: Icons.assignment_ind,
                    title: 'Docentes y Cursos',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white24),
                  ),

                  // Sección Administrar Usuario
                  const SectionTitle('Administrar Usuario'),
                  MenuItem(
                    icon: Icons.person_add,
                    title: 'Registrar',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          Padding(
  padding: const EdgeInsets.all(16),
  child: ElevatedButton.icon(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
    icon: const Icon(Icons.logout, size: 20),
    label: const Text('Cerrar Sesión'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}   
