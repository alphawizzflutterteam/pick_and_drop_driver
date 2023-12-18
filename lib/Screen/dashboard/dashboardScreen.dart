import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Colors.dart';
import '../complete delivery list/completeorderList.dart';
import '../homepage/homePage.dart';
import '../profile/userProfile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState

  }



  static const List<Widget> _widgetOptions = <Widget>[
    HomeScr(),
    CompleteOrderList(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm Exit"),
                  content: const Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      child: const Text("YES"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      child: const Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: Scaffold(

          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary,], // Replace with your desired gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              currentIndex: _selectedIndex,
elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon:

                  Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(

                          shape: BoxShape.circle,
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.transparent),
                       child:

                       _selectedIndex == 0?
                      Center(child: Image.asset("assets/images/HOME.png",scale: 2,)):
                       Center(child: Image.asset("assets/images/home (3).png",scale: 1,))



                  ),


                  label: 'Home',

                ),
                BottomNavigationBarItem(
                  icon:

                  Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Colors.transparent),
                      child:

                      _selectedIndex == 1?
                      Center(child: Image.asset("assets/images/deliverhistory.png")):
                      Center(child: Image.asset("assets/images/deliveryyyy.png",scale: 0.5,)
                      )


                  ),
                  label: 'Delivery History',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(

                          shape: BoxShape.circle,
                          color: _selectedIndex == 2
                              ? Colors.white
                              : Colors.transparent),
                      child:
                      _selectedIndex == 2?
                      Center(child: Image.asset("assets/images/PROFILE.png",scale: 2,)):
                      Center(child: Image.asset("assets/images/profile (2).png"))



                  ),
                  label: 'My Profile',
                ),
              ],
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> openDrawer = GlobalKey();
  int _selectedIndex = 0;
  int currentIndex = 99;

  String? name;
  String? email;
  String? profile;
  String? userid ;
  String? role ;

  removesession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    await prefs.remove('role');
  }


  // Future<void> getProfile() async {
  //
  //
  //   var param = {
  //     'user_id': userid,
  //   };
  //
  //   apiBaseHelper.postAPICall(getprofileUrl, param).then((getData) {
  //     bool error = getData['status'];
  //     String msg = getData['message'];
  //
  //     if (error) {
  //       name = getData['data']['first_name'];
  //       email = getData['data']['email'].toString();
  //       profile = getData['data']['user_image'].toString();
  //       setState(() {});
  //     } else {}
  //   });
  // }
}

class DrawerIconTab extends StatefulWidget {
  final IconData? icon;
  final String? titlee;
  final int? tabb;
  final int? indexx;

  DrawerIconTab({Key? key, this.icon, this.titlee, this.tabb, this.indexx})
      : super(key: key);

  @override
  State<DrawerIconTab> createState() => _DrawerIconTabState();
}

class _DrawerIconTabState extends State<DrawerIconTab> {
  var Select = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          color: widget.indexx == widget.tabb ? AppColors.secondary : null),
      child: Row(
        children: [
          const SizedBox(
            width: 13,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: widget.indexx == widget.tabb
                  ? AppColors.whiteTemp
                  : AppColors.secondary,
            ),
            height: 35,
            width: 35,
            child: Center(
                child: Icon(
              widget.icon,
              color: widget.indexx == widget.tabb
                  ? AppColors.secondary
                  : AppColors.whiteTemp,
              size: 20,
            )),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            '${widget.titlee}',
            style: TextStyle(
                fontSize: 15,
                color:
                    widget.indexx == widget.tabb ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
