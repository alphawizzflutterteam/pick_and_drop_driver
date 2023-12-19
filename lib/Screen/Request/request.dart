import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pick_and_drop_driver/Screen/dashboard/dashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/getSpaceRequestModel.dart';
import '../auth/custumScreen.dart';


class RequestScr extends StatefulWidget {
  const RequestScr({Key? key}) : super(key: key);

  @override
  State<RequestScr> createState() => _RequestScrState();
}

class _RequestScrState extends State<RequestScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        bottomSheet: InkWell(
          onTap: () {

            showPPopup();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom:5,left: 5,right: 5 ),
            child: Container(
child: Center(child: Text('Click here to Send Request'),),
height: 50,
      width: MediaQuery.of(context).size.width,


              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),

                color: AppColors.primary
              ),

            ),
          ),
        ),
        body:


        !isLoading?
        Stack(
          children: [

            customdecorationFORScr(context,"Request Screen"),

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
                      getrequestList.isEmpty?Container(

                        height: MediaQuery.of(context).size.height/1.6,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text('Request Not Found',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                      ):

                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height/1.5,
                          child: ListView.builder(

                             itemCount: getrequestList.length,
                            shrinkWrap: true,

                            itemBuilder: (context, index) {
                              return



                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),

                                        border: Border.all(color: AppColors.primary,width: 1)
                                    ),

                                    child:

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Order Id",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              SizedBox(
                                                  width: MediaQuery.of(context).size.width/2.3,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text("${getrequestList[index].id??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                  )),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("From Place",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              SizedBox(
                                                  width: MediaQuery.of(context).size.width/2.3,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text("${getrequestList[index].from??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 3,
                                                    ),
                                                  )),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("To Place",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              SizedBox(
                                                  width: MediaQuery.of(context).size.width/2.3,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text("${getrequestList[index].to??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                      maxLines: 3,overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )),
                                            ],
                                          ),


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text("Vehicle Type",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              Text("${getrequestList[index].vehicle??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                maxLines: 3,overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text("Date",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              Text("${getrequestList[index].date??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                maxLines: 3,overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text("Time",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                              Spacer(),
                                              Text("${getrequestList[index].time??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                maxLines: 3,overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),


                                        ],),
                                    )



                                    ,),
                                );




                            },),
                        ),
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
  List<RequestList> getrequestList=[];
  var userId;

  Future<void> getRequest() async {
    setState(() {
      isLoading=true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param ={

      'user_id': '${userId.toString()}'

    };

    apiBaseHelper.postAPICall(spacegetRequesturl,param).then((getDta){

      if(getDta['error']==false){
        setState(() {

          getrequestList=GetSpaceRequest.fromJson(getDta).data??[];
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
  Future<void> PostRequest() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param ={

      'user_id': '${userId.toString()}',
      'from': fromplaceController.text.toString(),
      'to': toplaceController.text.toString(),
      'vehicle': vehicleTypeController.text.toString(),
      'date': dateController.text.toString(),
      'time': timeController.text.toString(),
    };

    apiBaseHelper.postAPICall(spacePosturl,param).then((getDta){

      if(getDta['error']==false){
        setState(() {
Fluttertoast.showToast(msg:getDta['message'] );
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));

        });

      }
      else{
        Fluttertoast.showToast(msg:getDta['message'] );

        setState(() {
          isLoading=false;
        });
      }


    },);
  }
  void showPPopup() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          // height: MediaQuery.of(context).size.height/3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Column(children: [
                              SizedBox(
                                height: 20,
                              ),

                              Card(
                                child: TextFormField(

                                  controller: fromplaceController,
                                  decoration: InputDecoration(

                                    prefixIcon: const Icon(
                                      Icons.location_on,
                                      color: AppColors.blackTemp,
                                    ),

                                    hintText: 'From Place',

                                    hintStyle: TextStyle(fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        const BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.whiteTemp),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' Please Enter Some Message';
                                    }
                                    return null; // Return null if the input is valid
                                  },


                                ),
                              ),
SizedBox(height: 10,),

                              Card(
                                child: TextFormField(

                                  controller: toplaceController,
                                  decoration: InputDecoration(

                                    prefixIcon: const Icon(
                                      Icons.location_on,
                                      color: AppColors.blackTemp,
                                    ),

                                    hintText: 'To Place',

                                    hintStyle: TextStyle(fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        const BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.whiteTemp),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' Please Enter Some Message';
                                    }
                                    return null; // Return null if the input is valid
                                  },


                                ),
                              ),
                              SizedBox(height: 10,),

                              Card(
                                child: TextFormField(

                                  controller: vehicleTypeController,
                                  decoration: InputDecoration(

                                    prefixIcon: const Icon(
                                      Icons.track_changes,
                                      color: AppColors.blackTemp,
                                    ),

                                    hintText: 'Vehicle Type',

                                    hintStyle: TextStyle(fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        const BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.whiteTemp),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' Please Enter Some Message';
                                    }
                                    return null; // Return null if the input is valid
                                  },


                                ),
                              ),
                              SizedBox(height: 10,),

                              Card(
                                child: TextFormField(
                                  onTap: () {

                                    sselectDate(context);
                                  },
readOnly: true,
                                  controller: dateController,
                                  decoration: InputDecoration(

                                    prefixIcon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.blackTemp,
                                    ),

                                    hintText: 'Date',

                                    hintStyle: TextStyle(fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        const BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.whiteTemp),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' Please Enter Some Message';
                                    }
                                    return null; // Return null if the input is valid
                                  },


                                ),
                              ),
                              SizedBox(height: 10,),

                              Card(
                                child: TextFormField(
readOnly: true,
                                  onTap: () async {


                                    TimeOfDay? picked = await selectTime(context);
                                    if (picked != null) {
                                      setState(() {
                                        timeController.text="${picked.hour}:${picked.minute} ${picked.period.name}";
                                      });
setState(() {

});
print(timeController.text);

                                    //   DateTime dateTime = DateTime(
                                    //       2020, 10, 10, picked.hour, picked.minute);
                                    //   setState(() {
                                    //     timeController.text =
                                    //     "${DateFormat("HH:MM").format(dateTime)}";
                                    //     print(timeController.text);
                                    //   });
                                     }
                                  },
                                  controller: timeController,
                                  decoration: InputDecoration(

                                    prefixIcon: const Icon(
                                      Icons.watch_later_outlined,
                                      color: AppColors.blackTemp,
                                    ),

                                    hintText: 'Time',

                                    hintStyle: TextStyle(fontSize: 13),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        const BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                        BorderSide(color: AppColors.whiteTemp, width: 2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.whiteTemp),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),


                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ' Please Enter Some Message';
                                    }
                                    return null; // Return null if the input is valid
                                  },


                                ),
                              ),

                              SizedBox(width: 30,),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: InkWell(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {


                                          PostRequest();

                                        }
                                      },
                                      child: Card(
                                        elevation: 6,
                                        child: Container(
                                          height: 40,
                                          width: 170,
                                          child: Center(
                                              child: Text(
                                                'Send Request',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors.primary),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                            ),
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
  TextEditingController fromplaceController=TextEditingController();
  TextEditingController toplaceController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController vehicleTypeController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<TimeOfDay?> selectTime(BuildContext context) async {

    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    return picked;
  }

  DateTime selectedDate = DateTime.now();
  Future<void> sselectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(

      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)

      selectedDate = picked;
    dateController.text=
        DateFormat('dd-MM-yyyy').format(selectedDate);
    print("==================${dateController.text}");


    setState(() {

    });
  }


}
