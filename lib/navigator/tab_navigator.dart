import 'package:flutter/material.dart';
import 'package:mytrip/pages/home_page.dart';
import 'package:mytrip/pages/my_page.dart';
import 'package:mytrip/pages/search_page.dart';
import 'package:mytrip/pages/travel_page.dart';


class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();

}

class _TabNavigatorState extends State<TabNavigator>{

  final defaultColor = Colors.grey;
  final activeColor = Colors.blueAccent;
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _navigationBarItem(Icons.home, '首页', 0),
            _navigationBarItem(Icons.search, '搜索', 1),
            _navigationBarItem(Icons.camera, '旅拍', 2),
            _navigationBarItem(Icons.account_box, '我的', 3),
      ]),
    );
  }

  _navigationBarItem(IconData iconData, String itemName,int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: defaultColor,
        ),
        activeIcon: Icon(
          iconData,
          color: activeColor,
        ),
        title: Text(
          itemName,
          style:
          TextStyle(color: _currentIndex == index ? activeColor : defaultColor),
        ));
  }

}