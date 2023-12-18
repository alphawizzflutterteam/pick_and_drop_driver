import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop_driver/Api%20services/api_services/apiBasehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/compleateDeliverModel.dart';
import '../auth/custumScreen.dart';
import '../order details/orderdetails.dart';

class CompleteOrderList extends StatefulWidget {
  const CompleteOrderList({Key? key}) : super(key: key);

  @override
  State<CompleteOrderList> createState() => _CompleteOrderListState();
}

class _CompleteOrderListState extends State<CompleteOrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdeliveries();
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        customdecorationhomeScreen(context,"Delivery History"),

        Container(
          margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height*0.13),

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30),),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  Text("Delivery History",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 19),),
                ],
              ),

SizedBox(height: 10,),

              !isLoading?

              CompleateDeliverList.isEmpty?   Container(

                height: MediaQuery.of(context).size.height/1.6,
                width: MediaQuery.of(context).size.width,
                child: Center(child:Text('Delivery Not Found'),),
              ):

              Container(
                height: MediaQuery.of(context).size.height/1.6,
                child:

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: CompleateDeliverList.length,
                  itemBuilder: (context, index) {
                  return

                    InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScr(completeList: true,orderdetails: CompleateDeliverList[index]),));

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),

                              border: Border.all(color: AppColors.primary,width: 1)
                          ),

                          child:

                          Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 13),),
                                    Spacer(),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text("${CompleateDeliverList[index].customer??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),

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
                                    Text("Pickup",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 13),),
                                    Spacer(),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text("${CompleateDeliverList[index].pickupAddress??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),

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
                                    Text("Drop",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 13),),
                                    Spacer(),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width/2.3,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text("${CompleateDeliverList[index].dropAddress??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),

                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Text("Item",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 13),),
                                    Spacer(),
                                    Text("${CompleateDeliverList[index].qty??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),

                                      maxLines: 3,overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Text("Price",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 13),),
                                    Spacer(),
                                    Text("${CompleateDeliverList[index].price??''}RS",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.primary,fontSize: 13),

                                      maxLines: 3,overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),



                              ],),
                          )



                          ,),
                      ),
                    );


                  },),
              )
:
    Container(

     height: MediaQuery.of(context).size.height/1.6,
    width: MediaQuery.of(context).size.width,
    child: Center(child: LoadingWidget2(context),),
    ),

    ],
            ),
          ),
        ),


      ],

    );
  }
  bool isLoading=false;
  CompleateHistryModel?compleateHistryModel;
  List<CompleateDeliver> CompleateDeliverList =[];
  var userId;
  Future<void> getdeliveries() async {

    setState(() {
      isLoading=true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =prefs.getString('userId');
    var param ={

      'user_id': '${userId.toString()}'

    };
    apiBaseHelper.postAPICall(getCompleateDeliverurl,param ).then((getDta) {

      bool error =getDta['error'];
if(error==false){
  setState(() {

    CompleateDeliverList=CompleateHistryModel.fromJson(getDta).data??[];
    setState(() {
      isLoading=false;
    });
  });

}

    });

    

  }
}
