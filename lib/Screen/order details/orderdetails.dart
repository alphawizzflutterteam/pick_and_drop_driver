import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pick_and_drop_driver/Screen/tqscreen/tqScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiBasehelper.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/compleateDeliverModel.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import '../auth/custumScreen.dart';

class OrderDetailsScr extends StatefulWidget {
  bool ?completeList;
  CompleateDeliver ?orderdetails;
  
   OrderDetailsScr({Key? key,this.orderdetails,this.completeList}) : super(key: key);

  @override
  State<OrderDetailsScr> createState() => _OrderDetailsScrState();
}

class _OrderDetailsScrState extends State<OrderDetailsScr> {

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body:

        Stack(
          children: [

            orderdetailsCustom(context,"Order Details"),

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
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

Card(

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
  child: Container(height: 80,
width: MediaQuery.of(context).size.width,

  child: Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

Row(children: [
    Text("Customer Name : ${widget.orderdetails?.customer??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 13),)


      ],),
      Row(children: [
        Text("Mobile : ${widget.orderdetails?.mobilee??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 13),)


      ],),
      Row(children: [
        Text("Email : ${widget.orderdetails?.emaill??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 13),)


      ],)
    ]),
  ),
  ),

),

SizedBox(height: 20,),

                      Row(children: [

SizedBox(width: 5,),
                        Container(
                          height: 80,
                          child: Column(children: [

                            Image.asset('assets/images/Pickup Location.png',scale: 2,),

                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 50, // Set the length of the dotted line
                              lineThickness: 1,
                              dashRadius: 1,
                              dashLength: 2,
                              // Set the thickness of the dotted line
                            ),
                            Image.asset('assets/images/Pickup Location.png',scale: 2,)




                          ],),
                        ),

                        SizedBox(width: 3,),
                        Container(

                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(children: [

                                Text("Pickup Location",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                Spacer(),
                                Text("Drop Location",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),



                              ],),
                            )),
Spacer(),
                        Container(

                            height:80,
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Column(children: [

                                SizedBox(

                                  width: MediaQuery.of(context).size.width/2.5,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text("${widget.orderdetails?.pickupAddress??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),overflow: TextOverflow.ellipsis,maxLines: 3,))),
                                Spacer(),
                                SizedBox(

                                    width: MediaQuery.of(context).size.width/2.5,
                                    child: Align(

                                        alignment: Alignment.topRight,
                                        child: Text("${widget.orderdetails?.dropAddress??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),overflow: TextOverflow.ellipsis,maxLines: 3,))),



                              ],),
                            ))

                      ],),

                      SizedBox(height: 10,),
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("Price",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                            Spacer(),

                            Text("${widget.orderdetails?.price??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 15),

                              maxLines: 3,overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("Date /Time",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                            Spacer(),

                            Text("${widget.orderdetails?.createdAt?.day??''}-${widget.orderdetails?.createdAt?.month??''}-${widget.orderdetails?.createdAt?.year??''} / ${widget.orderdetails?.createdAt?.hour??''}:${widget.orderdetails?.createdAt?.minute??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 15),

                              maxLines: 3,overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),


                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("Item",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                            Spacer(),

                            Text("${widget.orderdetails?.qty??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 15),

                              maxLines: 3,overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        widget.completeList==true?SizedBox.shrink():
                        SizedBox(height: 30,),
                        widget.completeList==true?SizedBox.shrink():
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("OTP",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                            Spacer(),

                            Text("${widget.orderdetails?.otp??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 15),

                              maxLines: 3,overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Text("Status",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                            Spacer(),

                            Text("${widget.orderdetails?.status??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.blackTemp,fontSize: 15),

                              maxLines: 3,overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),


                        SizedBox(height: MediaQuery.of(context).size.height/6.5,),

widget.completeList==true?SizedBox.shrink():
widget.orderdetails?.status.toString()=="delivered"?SizedBox.shrink():
                        InkWell(

                            onTap: () {


                              _showMyDialog();
                            },
                            child: CustomButton(textt: 'Update'))


                      ],)

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  OtpFieldController otpControllerrr = OtpFieldController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return
          AlertDialog(

            backgroundColor: Colors.transparent,
            actions:[
            Container(
              width:300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                  color: AppColors.whiteTemp,
                  border: Border.all(color: AppColors.primary,width: 1)
              ),
              height: MediaQuery.of(context).size.height*0.40,

child: Padding(
  padding: const EdgeInsets.all(10),
  child:   Column(children: [

    SizedBox(height: 20,),
    Text('Enter OTP',style: TextStyle(fontSize: 25,color: AppColors.blackTemp,fontWeight: FontWeight.bold,)),
    SizedBox(height: 10,),
    Text('Add Customer For The Otp',style: TextStyle(fontSize: 20,color: AppColors.blackTemp,fontWeight: FontWeight.bold)),

  OTPTextField(
      controller: otpControllerrr,
      length: 4,
      width: MediaQuery.of(context).size.width,
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldWidth: 40,
      outlineBorderRadius: 15,
      style: TextStyle(fontSize: 17),
      onChanged: (pin) {
        print("Changed: " + pin);

        setState(() {
          inputOtp=pin.toString();
        });

      },
      onCompleted: (pin) {
        print("Completed: " + pin);
      }),

  Spacer(),


  !isLoading?
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

    InkWell(
      onTap: () {


        Navigator.pop(context);
      },
      child: Container(height: 30,width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteTemp,
            border: Border.all(color: AppColors.blackTemp,width: 2)
        ),
  child: Center(child: Text('Cancel',style: TextStyle(fontSize: 15,color: AppColors.blackTemp,))),
      ),
    ),
    InkWell(

      onTap: () {
print("${otp}========${inputOtp}");
print("${otp.runtimeType}========${inputOtp.runtimeType}");
        if(otp==inputOtp.toString()){
          updateStatus();
        }
        else

          {

            customSnackbar(context,'Please Enter OTP');

          }



      },
      child: Container(height: 30,width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
            color: AppColors.primary,
            border: Border.all(color: AppColors.primary,width: 2)
        ),
        child: Center(child: Text('Done',style: TextStyle(fontSize: 15,color: AppColors.blackTemp,))),
      ),
    )

  ],):

  LoadingWidget(context),
SizedBox(height: 10,),
  ]),
),

            ),
        ]
          );

      },
    );
  }


  bool isLoading=false;
var inputOtp;
  TextEditingController otpController =TextEditingController();
var userId;
  Future<void> updateStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
   setState(() {
     isLoading=true;
   });
   var param={

     'otp': inputOtp.toString(),
     'delivery_id': widget.orderdetails?.id.toString(),
     'status': 'delivered',
     'user_id': userId.toString()

   };

   apiBaseHelper.postAPICall(updateorderurl,param ).then((getDta) {
String ?msg=getDta['message'];
     bool error =getDta['error'];
     if(error==false){
       setState(() {

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TQscr(),));
         customSnackbar(context,msg.toString());


         setState(() {
           isLoading=false;
         });
       });

     }
     else{

       customSnackbar(context,msg.toString());
Navigator.pop(context);
       setState(() {
         isLoading=false;
       });
     }

   });


  }
  var otp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    otp=widget.orderdetails?.otp.toString();
  }
}
