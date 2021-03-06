import 'package:flutter/material.dart';

Widget account(nameController) {
  return TextFormField(
    controller: nameController,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su usuario';
      }
    },
    decoration: InputDecoration(hintText: 'Cuenta '),
  );
}

Widget password(passController) {
  return TextFormField(
    controller: passController,
    obscureText: true,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su contraseña';
      }
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: 'Contraseña ',
      suffixIcon: Icon(Icons.lock_open),
      icon: Icon(Icons.lock)
    ),
  );
}

Widget email(emailController) {
  return TextFormField(
    controller: emailController,
    textAlign: TextAlign.center,
    validator: (value) {
      if (value.isEmpty) {
        return 'Por favor digite su email';
      }
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: 'Email ',
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email)
    ),
  );
}
