import 'package:flutter_kalkulatorbmi/modules/bmi/bmi_screen.dart';
import 'package:flutter_kalkulatorbmi/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

// import '../../models/models.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> screens;

  @override
  initState() {
    screens = [
      {"screen": BmiScreen(), "title": Text("Menghitung BMI")},
      {"screen": BMIResultScreen(), "title": Text("Mengetahui Hasil BMI")},
      // {"screen": VolumeScreen(), "title": Text("Menghitung Volume Bangunan")},
    ];
    super.initState();
  }

  var selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(50, 50, 50, 1),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            'assets/images/signout.png',
            height: 5,
            width: 5,
          ),
        ),
      ),
      body: screens[selectedPageIndex]["screen"],
      // bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  // BottomNavigationBar buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     showUnselectedLabels: false,
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Color.fromRGBO(50, 50, 50, 1),
  //     elevation: 5,
  //     selectedFontSize: 15,
  //     selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  //     selectedItemColor: Colors.teal,
  //     currentIndex: selectedPageIndex,
  //     onTap: selectPage,
  //     items: measures
  //         .map((e) => BottomNavigationBarItem(
  //             icon: Image.asset(e["icon"]), label: e["label"]))
  //         .toList(),
  //   );
  // }
}
