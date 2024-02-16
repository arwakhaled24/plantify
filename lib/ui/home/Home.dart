import 'package:flutter/material.dart';
import 'package:plantify/ui/tabs/ChatBotTab/ChatBotTab.dart';
import 'package:plantify/ui/tabs/CommunityTab/CommunityTab.dart';
import 'package:plantify/ui/tabs/HomeTab/HomeTab.dart';
import 'package:plantify/ui/tabs/ProfileTab/ProfileTab.dart';
import 'package:plantify/ui/tabs/ScanTab/ScanTab.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plantify'
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60.0),bottom: Radius.circular(60)),
        child: BottomAppBar(
          color: Color(0xffF3FAEC),
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(

            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                  icon: Icon(
                      Icons.home
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/bot.png'),
                  ),
                  label: 'Chat Bot'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/community.png'),
                  ),
                  label: 'Community'),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: ImageIcon(
                    AssetImage('assets/images/icons/Profile.png'),
                  ),
                  label: 'Profile'),
            ],
            iconSize: 20,
            type: BottomNavigationBarType.fixed,
            // Disable animation
            backgroundColor: Colors.transparent ,
        selectedItemColor: Color(0xff82CD3E),
            elevation: 0,
            unselectedItemColor: Color(0xff8C8C8C),
            showUnselectedLabels: true,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff82CD3E),
        shape: StadiumBorder(),
        onPressed: () {
        },
        child: ImageIcon(size:28 ,color: Colors.white,
          AssetImage('assets/images/icons/scan.png'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[selectedIndex],
    );
  }

  List<Widget> screens = [
    HomeTab(),
    ChatBotTab(),
    CommunityTab(),
    ProfileTab(),
  ];
}
