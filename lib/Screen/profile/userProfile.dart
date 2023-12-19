import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop_driver/Helper/Colors.dart';
import 'package:pick_and_drop_driver/Screen/Request/request.dart';
import 'package:pick_and_drop_driver/Screen/auth/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../auth/custumScreen.dart';
import '../faq/faqScreen.dart';
import '../privecy/privecy.dart';
import '../termcondition/termCondition.dart';
import '../tranjection/gettranjection.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }
  @override
  Widget build(BuildContext context) {
    return
!isloading?
      Stack(
      children: [

        customAuthDegineforprofle(context),

        Container(
        margin:
        EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),

        height: MediaQuery.of(context).size.height * 0.69,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30), topRight: Radius.circular(30),),
    ),

          child: Column(children: [

            SizedBox(height: MediaQuery.of(context).size.height/17,),
            Text("${name.toString()}",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 17),),
            Text("${email.toString()}",style: TextStyle(color: AppColors.graylightTemp,fontSize: 14),),

SizedBox(height: 20,),
            Container(

            height: MediaQuery.of(context).size.height/2.1,
              child: SingleChildScrollView(
                child: Column(children: [

                  InkWell(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Tranjection(),));
                      },
                      child: tabProfile(context,"Wallet")),

                  InkWell(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RequestScr(),));
                      },
                      child: tabProfile(context,'Requst Screen')),

                  InkWell(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PrivecyScr(),));
                      },
                      child: tabProfile(context,'Privacy Policy')),
                  InkWell(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditionScrr(),));
                      },
                      child: tabProfile(context,'Term & Conditions')),

                  InkWell(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FaqsScrr(),));
                      },
                      child: tabProfile(context,'FAQs')),

                  SizedBox(height: MediaQuery.of(context).size.height/9,),
                  InkWell(
                      onTap: () {


                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirm Logout"),
                                content: const Text("Are you sure to Logout?"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: AppColors.primary),
                                    child: const Text("YES"),
                                    onPressed: () async {
                                      setState(() {
                                        sessionremove();
                                      });
                                      Navigator.pop(context);
                                      // SystemNavigator.pop();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginPage(),
                                          ));
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: AppColors.primary),
                                    child: const Text("NO"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      child: CustomButton(textt: "Logout")),
                ]),
              ),
              )


          ]),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          left: 20,
          right: 20,
          child: Stack(
            children: [

              Container(

                decoration: BoxDecoration(shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: AppColors.primary,width: 2)
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(


                      radius: 45,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage("${imagepath}"),

                    ),
                  ),
                ),
              ),

              Positioned(
                left: MediaQuery.of(context).size.width/4.3,
                right: 20,
                top: MediaQuery.of(context).size.height * 0.11,
                child: Container(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/edit icon.png")),
              )
            ],
          ),
        ),


      ],

    ):

    Container(

      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(child: LoadingWidget2(context),),
    );

  }
  Widget tabProfile(BuildContext context,String tabName){


    return Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),),
      elevation: 2,
      child:

      Container (height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),


      child:


        Row(children: [

          SizedBox(width: 15,),

          Text("${tabName}",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.tabtextColor,fontSize: 15),),
          Spacer(),
          Icon(Icons.arrow_forward_ios,color: AppColors.blackTemp,size: 16,),
          SizedBox(width: 5,),


        ]),),

    );
  }

  String? name;
  String? email;
  String ?imagepath;
  bool isloading=false;
  getuserdata() async {
    setState(() {
      isloading=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();

setState(() {
  name=prefs.getString("name");
  email=prefs.getString("email");
  imagepath=prefs.getString("userimage");
});

    setState(() {
      isloading=false;
    });
  }
  Future<void> sessionremove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.remove("userId");
    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("userimage");


  }
}

