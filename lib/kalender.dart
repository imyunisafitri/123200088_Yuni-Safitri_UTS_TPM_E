import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KalenderPage extends StatefulWidget {
  const KalenderPage({Key? key}) : super(key: key);

  @override
  State<KalenderPage> createState() => _KalenderPageState();
}

class _KalenderPageState extends State<KalenderPage> {

  String _zonaWaktu = "WIB";
  int _jamOffset = 0;

  TextEditingController _dateController = TextEditingController();
  DateFormat _dateFormat = DateFormat("EEEE, dd MMMM yyyy");
  DateTime _currentDate = DateTime.now();
  DateFormat _timeFormat = DateFormat("HH:mm:ss");

  void _setZonaWaktu(String zonaWaktu) {
    setState(() {
      _zonaWaktu = zonaWaktu;
      switch (zonaWaktu) {
        case "WIB":
          _jamOffset = 0;
          break;
        case "WITA":
          _jamOffset = 1;
          break;
        case "WIT":
          _jamOffset = 2;
          break;
        default:
          _jamOffset = 0;
      }
    }
    );
  }

  void _updateTime() {
    setState(() {
      _currentDate = DateTime.now().add(Duration(hours: _jamOffset));
    });
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) => _updateTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Kalender'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Zona Waktu:'),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  value: _zonaWaktu,
                  items: <String>['WIB', 'WITA', 'WIT']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _setZonaWaktu(value!);
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _dateFormat.format(_currentDate),
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              _timeFormat.format(_currentDate),
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
