package com.proyecto.controlador;



import org.springframework.web.bind.annotation.*;

import com.proyecto.modelo.Usuario;

import java.util.ArrayList;
import java.util.List;
@CrossOrigin(origins = "http://192.168.1.X:8080")
@RestController
@RequestMapping("/api/usuarios")
public class UsuarioController {

    @GetMapping
    public List<Usuario> obtenerUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        Usuario usuario = new Usuario();
        usuario.setId(1L);
        usuario.setNombre("Juan peere pablo");
        usuario.setEmail("juan@example.com");
        usuarios.add(usuario);
        return usuarios;
    }

    @PostMapping
    public Usuario crearUsuario(@RequestBody Usuario usuario) {
        // Lógica para guardar el usuario (puede ser en una BD)
        return usuario;
    }
}