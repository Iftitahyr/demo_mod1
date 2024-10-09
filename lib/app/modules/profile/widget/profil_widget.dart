import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Membuat elemen rata tengah secara vertikal
      children: [
        // Bagian Foto Profil
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : AssetImage('assets/default_avatar.png') as ImageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: _pickImage,
              ),
            ),
          ],
        ),
        const SizedBox(width: 20), // Jarak antara foto profil dan info pengguna
        // Bagian Informasi Pengguna
        Expanded( // Menggunakan Expanded untuk mengatur ruang antara foto dan teks
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Membuat teks rata kiri
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'User_1945',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.settings, size: 20), // Menambahkan icon pengaturan di samping kanan
                ],
              ),
              const SizedBox(height: 5), // Jarak antara nama dan email
              Text(
                'User1945@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 5), // Jarak antara email dan nomor telepon
              Text(
                '+6281234684952',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
