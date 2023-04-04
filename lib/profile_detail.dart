import 'package:flutter/material.dart';
import 'profile.dart';

class ProfileDetailCard extends StatelessWidget {
  final String nim;
  final String nama;
  final String fotoUrl;
  final String kelas;
  final String tempatLahir;
  final String tanggalLahir;
  final String citaCita;

  ProfileDetailCard({
    required this.nim,
    required this.nama,
    required this.fotoUrl,
    required this.kelas,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.citaCita,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            fotoUrl,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    nim,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    nama,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Kelas'),
            subtitle: Text(kelas),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Tempat Lahir'),
            subtitle: Text(tempatLahir),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Tanggal Lahir'),
            subtitle: Text(tanggalLahir),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Cita-Cita'),
            subtitle: Text(citaCita),
          ),
          SizedBox(height: 20),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileCard(nim: '123200088', nama: 'Yuni Safitri', fotoUrl: 'assets/img/yun.png'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
