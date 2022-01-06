import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

var country = [
  'Africa/Abidjan',
  'Africa/Accra',
  'Africa/Algiers',
  'Africa/Tripoli',
  'Africa/Tunis',
  'Africa/Windhoek',
  'America/Adak',
  'America/Anchorage',
  'America/Araguaina',
  'America/Argentina/Buenos_Aires',
  'America/Argentina/Catamarca',
  'America/Argentina/Cordoba',
  'America/Argentina/Jujuy'
];

Future getTime(i) async {
  final url = Uri.parse('https://worldtimeapi.org/api/timezone/' + country[i]);
  Response response = await get(url);
  Map data = jsonDecode(response.body);
  return data;
}

void show(i, context) {
  getTime(i).then((data) {
    String date = data['datetime'].substring(0, 10);
    String time = data['datetime'].substring(11, 19);
    String week = '';
    int intweek = data['day_of_week'];
    switch (intweek) {
      case 0:
        week = "(日)";
        break;
      case 1:
        week = "(一)";
        break;
      case 2:
        week = "(二)";
        break;
      case 3:
        week = "(三)";
        break;
      case 4:
        week = "(四)";
        break;
      case 5:
        week = "(五)";
        break;
      case 6:
        week = "(六)";
        break;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.yellow,
            title: Text(country[i]),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('日期 : ' + date + week),
                  Text('時間 : ' + time),
                ],
              ),
            ),
          );
        });
  });
}
