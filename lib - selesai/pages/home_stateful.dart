import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse = HttpStateful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  (dataResponse.avatar == null)
                      ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                      : dataResponse.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                (dataResponse.id == null)
                    ? "ID : Belum ada data"
                    : "ID : ${dataResponse.id}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.fullname == null)
                    ? "Belum ada data"
                    : "${dataResponse.fullname}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                (dataResponse.email == null)
                    ? "Belum ada data"
                    : "${dataResponse.email}",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectAPI((1 + Random().nextInt(10)).toString())
                    .then(
                  (value) {
                    setState(() {
                      dataResponse = value;
                    });
                  },
                );
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
