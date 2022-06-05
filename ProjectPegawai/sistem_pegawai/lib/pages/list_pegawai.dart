import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sistem_pegawai/pages/detail_pegawai.dart';
import 'package:sistem_pegawai/pages/home_page.dart';

class ListPegawai extends StatefulWidget {
  @override
  _ListPegawaiState createState() => _ListPegawaiState();
}

class _ListPegawaiState extends State<ListPegawai> {
  bool loading = false;
  List? pegawai;

  Future<void> getListPegawai() async {
    setState(() {
      loading = true;
    });
    http.Response res = await http.get(Uri.parse(
        "http://server-pegawai.indonesiafintechforum.org/getPegawai.php"));
    setState(() {
      loading = false;
    });

    Map data = jsonDecode(res.body);

    if (data['is_success'] == true) {
      pegawai = data['data'];
    }
  }

  @override
  void initState() {
    getListPegawai();
    super.initState();
  }

  @override
  void dispose() {
    // ketika page/halamannya ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Pegawai"),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pegawai?.length ?? 0,
              itemBuilder: (context, index) {
                var item = pegawai?[index];

                return GestureDetector(
                  onTap: () {
                    print(item);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPegawai(item);
                    }));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => DetailPegawai(item)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 24, top: 24, right: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 18),
                      ],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "${index + 1}. ${item['nama']}",
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(item: item)));
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class AAAA extends StatefulWidget {
  @override
  _AAAAState createState() => _AAAAState();
}

class _AAAAState extends State<AAAA> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
