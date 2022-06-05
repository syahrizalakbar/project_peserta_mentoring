part of 'widgets.dart';

class CustomBottonNavbar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index) onTap;

  CustomBottonNavbar({
    this.selectedIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: greyPage,
        //     offset: Offset(0.0, 1.0),
        //     blurRadius: 6,
        //   )
        // ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTap(0),
            child: Container(
              width: 40,
              height: 32,
              color: Colors.white,
              child: Column(
                children: [
                  Icon(Icons.explore_rounded,
                      color: selectedIndex == 0 ? mainBlueColor : silverColor),
                  SizedBox(height: 3),
                  CircleAvatar(
                      radius: 2,
                      backgroundColor:
                          selectedIndex == 0 ? mainBlueColor : Colors.white)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(1),
            child: Container(
              width: 40,
              height: 32,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 83),
              child: Column(
                children: [
                  Icon(Icons.developer_board_rounded,
                      color: selectedIndex == 1 ? mainBlueColor : silverColor),
                  SizedBox(height: 3),
                  CircleAvatar(
                      radius: 2,
                      backgroundColor:
                          selectedIndex == 1 ? mainBlueColor : Colors.white)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              width: 40,
              height: 32,
              color: Colors.white,
              child: Column(
                children: [
                  Icon(Icons.touch_app_rounded,
                      color: selectedIndex == 2 ? mainBlueColor : silverColor),
                  SizedBox(height: 3),
                  CircleAvatar(
                      radius: 2,
                      backgroundColor:
                          selectedIndex == 2 ? mainBlueColor : Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
