import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String username; // Nombre de usuario recibido como parámetro

   const Profile({Key? key, required this.username}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(

            radius: 80,
            backgroundImage: AssetImage('assets/img/bocchi_user.jpg'), // Reemplaza 'ruta_de_la_imagen' con la ruta de tu imagen de perfil
          ),
          SizedBox(height: 20),
          Text(
            widget.username, // Utilizar el nombre de usuario recibido
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Raza de Mascota',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Información Personal',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
