// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// class HttpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future: fetch(),
//           builder: (BuildContext context, AsyncSnapshot snap) {
//             return Text(snap.data.toString());
//           },
//         ),
//       ),
//     );
//   }
//
//   Future fetch() async {
//     String url = 'https://서버주소.com';
//     var res = await http.get(url);
//     return json.decode(res.body);
//   }
// }
