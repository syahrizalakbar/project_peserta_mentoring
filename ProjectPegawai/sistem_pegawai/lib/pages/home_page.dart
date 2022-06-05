import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sistem_pegawai/pages/list_pegawai.dart';

class HomePage extends StatefulWidget {
  final item;

  HomePage({this.item});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController posisiController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  bool loading = false;

  Future<void> addData() async {
    setState(() {
      loading = true;
    });
    // await Future.delayed(Duration(seconds: 2));
    Response res = await http.post(
      Uri.parse(
          "http://server-pegawai.indonesiafintechforum.org/addPegawai.php"),
      body: {
        "namaPegawai": namaController.text,
        "posisiPegawai": posisiController.text,
        "gajiPegawai": gajiController.text,
      },
    );
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);

    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    } else {
      print('Gagal');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    }

    // Map a = {
    //   "nama": "Rizal",
    // };
    // String b = "{nama:Rizal}";

    // print(a['nama']);

    // ubah string ke integer
    // int result = int.parse("10");
  }

  Future<void> editData() async {
    setState(() {
      loading = true;
    });
    // await Future.delayed(Duration(seconds: 2));
    Response res = await http.post(
      Uri.parse(
          "http://server-pegawai.indonesiafintechforum.org/editPegawai.php"),
      body: {
        "idPegawai": widget.item['id'],
        "namaPegawai": namaController.text,
        "posisiPegawai": posisiController.text,
        "gajiPegawai": gajiController.text,
      },
    );
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);

    if (data['is_success'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    } else {
      print('Gagal');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    }

    // Map a = {
    //   "nama": "Rizal",
    // };
    // String b = "{nama:Rizal}";

    // print(a['nama']);

    // ubah string ke integer
    // int result = int.parse("10");
  }

  @override
  void initState() {
    if (widget.item != null) {
      namaController = TextEditingController(text: widget.item['nama']);
      posisiController = TextEditingController(text: widget.item['posisi']);
      gajiController = TextEditingController(text: widget.item['gaji']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pegawai"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// Nama Pegawai
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Input Pegawai",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText: "Nama Pegawai",
                  labelText: "Nama Pegawai",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            /// Posisi
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextFormField(
                controller: posisiController,
                decoration: InputDecoration(
                  hintText: "Posisi Pegawai",
                  labelText: "Posisi Pegawai",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            /// Gaji
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextFormField(
                controller: gajiController,
                decoration: InputDecoration(
                  hintText: "Gaji Pegawai",
                  labelText: "Gaji Pegawai",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 60,
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : MaterialButton(
                                  child: Text(widget.item == null
                                      ? "Tambah Data"
                                      : "Edit Data"),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  onPressed: () {
                                    if (widget.item == null) {
                                      addData();
                                    } else {
                                      editData();
                                    }
                                  },
                                ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 60,
                          child: MaterialButton(
                            child: Text("List Data"),
                            color: Colors.white,
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListPegawai()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 60,
                        child: MaterialButton(
                          child: Text("X"),
                          color: Colors.white,
                          textColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
