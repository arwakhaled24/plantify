import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../tabs/ChatBotTab/ChatBotTab.dart';
import '../tabs/CommunityTab/CommunityTab.dart';
import '../tabs/HomeTab/HomeTab .dart';
import '../tabs/ProfileTab/ProfileTab.dart';
import '../tabs/ScanTab/ScanTab.dart';
import '../theme.dart';


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
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff82CD3E),
        shape: StadiumBorder(),
        onPressed: () {
          bottomSheet( context, path[index], index);
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
  int index=0;
  List<String>path=[
    "assets/images/sheet1.jpg",
    "assets/images/sheet2.jpg",
    "assets/images/sheet3.jpg",
    "assets/images/sheet4.jpg"
  ];
  void bottomSheet(BuildContext context,String imagePath,int index) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(imagePath,fit: BoxFit.fill,),flex: 5,),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Text("Back",style: TextStyle(
                          color: AppTheme.green_1
                        ),),
                        onTap: (){
                          if(index==0){
                            Navigator.of(context).pop();
                          }
                          else{
                            index--;
                            Navigator.of(context).pop();
                            bottomSheet( context, path[index], index);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Text("Next",style: TextStyle(
                          color: AppTheme.green_1
                        ),),
                        onTap: () async {
                          if(index==3) {
                            await availableCameras().then((value) => Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => ScanTab(cameras: value))));
                          }else{
                            index++;
                            Navigator.of(context).pop();
                            bottomSheet( context, path[index], index);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        );
      },
    );
  }
}
