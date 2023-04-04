import 'package:flutter/material.dart';
import 'bangundatar_page.dart';

void main() => runApp(TabungCalculator());

class TabungCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabung Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabung Calculator'),
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
              child: Tabung(),
            ),
          )
      ),
    );
  }
}

class Tabung extends StatefulWidget {
  @override
  _TabungState createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  final _formKey = GlobalKey<FormState>();
  final jariJariController = TextEditingController();
  final tinggiController = TextEditingController();

  double luas = 0;
  double keliling = 0;

  @override
  void dispose() {
    jariJariController.dispose();
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
            controller: jariJariController,
            decoration: InputDecoration(
              labelText: 'Jari-jari',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Jari-jari tidak boleh kosong';
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
                double jariJari = double.parse(jariJariController.text);
                double tinggi = double.parse(tinggiController.text);

                luas = 2 * 3.14 * jariJari * (jariJari + tinggi);
                keliling = 2 * 3.14 * jariJari;

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
