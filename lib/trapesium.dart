import 'package:flutter/material.dart';
import 'dart:math';

import 'bangundatar_page.dart';

void main() => runApp(TrapesiumCalculator());

class TrapesiumCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trapesium Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trapesium Calculator'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BangunDatar(),
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Trapesium(),
          ),
        )
      ),
    );
  }
}

class Trapesium extends StatefulWidget {
  @override
  _TrapesiumState createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  final _formKey = GlobalKey<FormState>();
  final sisiAtasController = TextEditingController();
  final sisiBawahController = TextEditingController();
  final tinggiController = TextEditingController();

  double luas = 0;
  double keliling = 0;

  @override
  void dispose() {
    sisiAtasController.dispose();
    sisiBawahController.dispose();
    tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: sisiAtasController,
            decoration: InputDecoration(
              labelText: 'Sisi Atas',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Sisi Atas tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: sisiBawahController,
            decoration: InputDecoration(
              labelText: 'Sisi Bawah',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Sisi Bawah tidak boleh kosong';
              }
              return null;
            },
          ),
          TextFormField(
            controller: tinggiController,
            decoration: InputDecoration(
              labelText: 'Tinggi',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Tinggi tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                double sisiAtas = double.parse(sisiAtasController.text);
                double sisiBawah = double.parse(sisiBawahController.text);
                double tinggi = double.parse(tinggiController.text);

                luas = ((sisiAtas + sisiBawah) * tinggi) / 2;
                double sisiMiring = sqrt(pow((sisiBawah - sisiAtas) / 2, 2) + pow(tinggi, 2));
                keliling = sisiAtas + sisiBawah + (2 * sisiMiring);

                setState(() {});
              }
            },
            child: Text('Hitung'),
          ),
          SizedBox(height: 20),
          Text('Luas: $luas'),
          Text('Keliling: $keliling'),
        ],
      ),
    );
  }
}
