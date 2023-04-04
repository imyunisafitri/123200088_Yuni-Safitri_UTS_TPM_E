import 'package:flutter/material.dart';
import 'main_menu.dart';
import 'profile_detail.dart';

class ProfileCard extends StatelessWidget {
  final String nim;
  final String nama;
  final String fotoUrl;

  const ProfileCard({required this.nim, required this.nama, required this.fotoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          Image.asset(
            fotoUrl,
            height: 150,
            width: double.infinity,
          ),
          SizedBox(height: 16.0),
          Text(
            nama,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            nim,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileDetailCard(citaCita: 'sukses', fotoUrl: 'assets/img/yun.png', tempatLahir: 'Duri, Riau', kelas: 'IF - E', nim: '123200088', nama: 'Yuni Safitri', tanggalLahir: '21 Juni 2002',),
                ),
              );
            },
            child: Text('Detail'),
          ),
        ],
      ),
    );
  }
}

