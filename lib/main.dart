import 'package:flutter/material.dart';

import 'app/modules/home/views/profil_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileView(), // Menampilkan halaman profil
    );
  }
}
