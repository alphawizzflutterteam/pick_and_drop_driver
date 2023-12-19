import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/notificationModel.dart';
import '../auth/custumScreen.dart';

class NotificationScr extends StatefulWidget {
  const NotificationScr({Key? key}) : super(key: key);

  @override
  State<NotificationScr> createState() => _NotificationScrState();
}

class _NotificationScrState extends State<NotificationScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotifivcation();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:


            !isLoading?
        Stack(
          children: [

            customdecorationFORScr(context,"Notifications"),

            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child:
                      getNotiList.isEmpty?Container(

                        height: MediaQuery.of(context).size.height/1.6,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Notification Not Found',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                      ):

                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ListView.builder(
                          itemCount: getNotiList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(

                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),

                                  border: Border.all(color: AppColors.primary,width: 1)
                              ),



                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ListTile(title:
                                Text("${getNotiList[index].title??""}",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.blackTemp,fontSize: 13),),

subtitle: Text("${getNotiList[index].message??""}",style: TextStyle(color: AppColors.graylightTemp,fontSize: 10),),


                                    ),
                              ),
                            ),
                          );


                        },),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ):


            Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: LoadingWidget2(context),),
            ),
      ),
    );
  }
  bool isLoading=false;
  var userId;
  List<NotifivationList> getNotiList=[];
  Future<void> getNotifivcation() async {
    setState(() {
      isLoading=true;
    });

    setState(() {
      isLoading=true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param ={

      'user_id': '${userId.toString()}'

    };

    apiBaseHelper.postAPICall(GetNotificationurl,param).then((getDta){

      if(getDta['error']==false){
        setState(() {

          getNotiList=NotificationModel.fromJson(getDta).data??[];
          setState(() {
            isLoading=false;
          });
        });

      }
      else{

        setState(() {
          isLoading=false;
        });
      }


    },);
  }
}
