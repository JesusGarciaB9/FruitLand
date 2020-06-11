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
<<<<<<< HEAD
    decoration: InputDecoration(hintText: 'Contraseña '),
=======
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: 'Contraseña ',
      suffixIcon: Icon(Icons.lock_open),
      icon: Icon(Icons.lock)
    ),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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
<<<<<<< HEAD
    decoration: InputDecoration(hintText: 'Email '),
=======
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      hintText: 'Email ',
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email)
    ),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
  );
}
