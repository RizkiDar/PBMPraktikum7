import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'anggota.dart';
import 'list_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.anggota});

  final Anggota anggota;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(width: 300, child: Text("Detail")),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Container(
                  width: double.infinity,
                  child: Text(
                    widget.anggota.nama,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                  width: double.infinity,
                  child: Text(
                    widget.anggota.jabatan,
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: Container(
                  width: double.infinity,
                  child: Text(
                    widget.anggota.bidang,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: double.infinity,
                  child: Text(widget.anggota.keterangan)),
            ),
          ],
        ),
      ),
    );
  }
}
