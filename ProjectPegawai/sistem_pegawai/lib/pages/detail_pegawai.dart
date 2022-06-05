import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sistem_pegawai/pages/list_pegawai.dart';

class DetailPegawai extends StatelessWidget {
  final data;

  DetailPegawai(this.data);
  // DetailPegawai({this.data});

  Future<void> delete(context) async {
    http.Response res = await http.post(
      Uri.parse(
          "http://server-pegawai.indonesiafintechforum.org/deletePegawai.php"),
      body: {
        "idPegawai": this.data['id'],
      },
    );
    Map data = jsonDecode(res.body);

    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListPegawai()));
    } else {
      print('Gagal');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    }
  }

  void deletePegawaiDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus pegawai?"),
          scrollable: true,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: Text("Ya"),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  /// delete
                  delete(context);
                },
              ),
              MaterialButton(
                child: Text("Tidak"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pegawai"),
        actions: [
          IconButton(
            onPressed: () {
              deletePegawaiDialog(context);
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Nama: ${data['nama'] ?? "-"}",
                style: TextStyle(fontSize: 24)),
            Text("Posisi: ${data['posisi'] ?? "-"}",
                style: TextStyle(fontSize: 24)),
            Text("Gaji: ${data['gaji'] ?? "-"}",
                style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
