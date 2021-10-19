import 'package:flutter/material.dart';
import 'package:flutter_instagram_cloneapp2/pages/AddScreen.dart';
import 'package:flutter_instagram_cloneapp2/pages/FavoriteScreen.dart';
import 'package:flutter_instagram_cloneapp2/pages/ProfileScreen.dart';
import 'package:flutter_instagram_cloneapp2/pages/SearchScreen.dart';
import 'package:flutter_instagram_cloneapp2/pages/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();
  late List<Widget> _screenList;
  int _currentIndex=0;
  HomeScreen _homeScreen = HomeScreen();
  AddScreen _addScreen = AddScreen();
  FavoriteScreen _favoriteScreen = FavoriteScreen();
  ProfileScreen _profileScreen = ProfileScreen();
  SearchScreen _searchScreen = SearchScreen();
  @override
  void initState() {
    super.initState();
    _screenList=[
              _homeScreen,
              _searchScreen,
              _addScreen,
              _favoriteScreen,
              _profileScreen,
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildNavigation(),
    );
  }
  _buildBody() {
    return PageView(
      controller: _pageController,
      children: _screenList,
    );
  }
  _buildNavigation() {
    return BottomNavigationBar(
      onTap: (index) {
          setState(() {
            _currentIndex=index;
          });
          _pageController.animateToPage(
              _currentIndex,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut
          );
      },
      currentIndex: _currentIndex,
      selectedItemColor: Color.fromRGBO(203, 73, 101, 1),
      unselectedItemColor: Color.fromRGBO(40, 40, 40, 1),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined,size: 28,),title: SizedBox()),
        BottomNavigationBarItem(icon: Icon(Icons.search,size: 28,),title: SizedBox()),
        BottomNavigationBarItem(icon: Icon(Icons.add_comment_outlined,size: 28,),title: SizedBox()),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined,size: 28,),title: SizedBox()),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,size: 28,),title: SizedBox()),
      ],
    );
  }
}
