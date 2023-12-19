import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop_driver/Api%20services/api_services/apiBasehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api services/api_services/apiStrings.dart';
import '../../Helper/Colors.dart';
import '../../Helper/loadingwidget.dart';
import '../../Model/compleateDeliverModel.dart';
import '../../Model/getBannerModel.dart';
import '../auth/custumScreen.dart';
import '../order details/orderdetails.dart';
import '../tqscreen/tqScreen.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    return


    RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async{

        getSlider();
        getcountDeliver();
        getdeliveries();

      },
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return



          bannerList.isNotEmpty?

          Stack(
            children: [

              customdecorationhomeScreen(context,"Home"),

              Container(
                margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30),),
                ),

                child: SingleChildScrollView(
                  child: Column(children: [


                    const SizedBox(
                      height: 10,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.22,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: bannerList
                          .map(
                            (item) => Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "${item.image}",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 8,
                        child: Center(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: bannerList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == currentIndex
                                      ? AppColors.secondary
                                      :  AppColors.blackTemp,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 5,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Deliveries",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 19),),
                      ],
                    ),

                    SizedBox(height: 7,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Stack(
                          children: [
                            Container(

                              height: 80,
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(

                                  image: DecorationImage(image: AssetImage('assets/images/img1.png'),fit: BoxFit.fill



                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),

                            Positioned(
                                left: 39,
                                right: 37,

                                top: 18,

                                child:

                                SizedBox(

                                    width: 30,
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        Text('${completedelcount??'0'}',style: TextStyle(color: AppColors.whiteTemp,fontSize: 12),),
                                      ],
                                    ))


                            )
                          ],
                        ),

                        Stack(
                            children: [
                              Container(

                                height: 80,
                                width: MediaQuery.of(context).size.width/3.5,
                                decoration: BoxDecoration(

                                    image: DecorationImage(image: AssetImage('assets/images/img2.png'),fit: BoxFit.fill



                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                              ),

                              Positioned(
                                  left: 39,
                                  right: 37,
                                  top: 18,
                                  child:

                                  SizedBox(

                                      width: 30,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          Text('${curenntdelcount??'0'}',style: TextStyle(color: AppColors.whiteTemp,fontSize: 12),),
                                        ],
                                      )))
                            ]
                        ),

                        Stack(
                          children: [
                            Container(

                              height: 80,
                              width: MediaQuery.of(context).size.width/3.5,
                              decoration: BoxDecoration(

                                  image: DecorationImage(image: AssetImage('assets/images/img3.png'),fit: BoxFit.fill



                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),

                            Positioned(
                                left: 39,
                                right: 37,
                                top: 18,
                                child:
                                SizedBox(

                                    width: 30,
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        Text('${pendingdelcount??'0'}',style: TextStyle(color: AppColors.whiteTemp,fontSize: 12),),
                                      ],
                                    ))
                            )
                          ],
                        ),


                      ],),

                    SizedBox(height: 5,),

                    Row(
                      children: [
                        Text("New delivery list",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blackTemp,fontSize: 19),),
                      ],
                    ),
                    SizedBox(height: 6,),

                    TodayDeliverList.isNotEmpty?

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: TodayDeliverList.length,
                      itemBuilder: (context, index) {
                        return


                          InkWell(
                            onTap: () {


                              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScr(orderdetails: TodayDeliverList[index]),));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),

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
                                          Text("Pickup Location",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                          Spacer(),
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width/2.3,
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text("${TodayDeliverList[index].pickupAddress??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

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
                                          Text("Drop Location",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                          Spacer(),
                                          SizedBox(
                                              width: MediaQuery.of(context).size.width/2.3,
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Text("${TodayDeliverList[index].dropAddress??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                                  maxLines: 3,overflow: TextOverflow.ellipsis,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text("Date",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                          Spacer(),
                                          Text("${TodayDeliverList[index].createdAt?.day??""}-${TodayDeliverList[index].createdAt?.month??""}-${TodayDeliverList[index].createdAt?.year??""}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

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
                                          Text("${TodayDeliverList[index].createdAt?.hour??''}:${TodayDeliverList[index].createdAt?.minute??''}",style: TextStyle(fontWeight:FontWeight.bold, color: AppColors.tabtextColor,fontSize: 15),

                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text("Fare",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                          Spacer(),
                                          Text("${TodayDeliverList[index].price??''}RS",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text("Quantity",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),),
                                          Spacer(),
                                          Text("${TodayDeliverList[index].qty??''}",style: TextStyle(fontWeight:FontWeight.bold,color: AppColors.tabtextColor,fontSize: 15),

                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],),
                                )



                                ,),
                            ),
                          );


                      },):

                    Container(

                      height: MediaQuery.of(context).size.height/1.9,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child:Text('Delivery Not Found'),),
                    ),
SizedBox(height:250,),

                  ],
                  ),
                ),
              ),


            ],

          ):

          Container(

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child: LoadingWidget2(context),),
          );

        },),
    );



  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getSlider();
    getcountDeliver();
    getdeliveries();
  }

  String ?completedelcount;
  String ?curenntdelcount;
  String ?pendingdelcount;
  int currentIndex = 99;
  bool isLoading=false;
List<BannerModelList> bannerList =[];
void getSlider(){
    setState(() {
      isLoading=true;
    });

apiBaseHelper.getAPICall(getBannerurl).then((getDta){
  bool error=getDta['error'];
  if(error==false){

    setState(() {
      bannerList=GetBannerModel.fromJson(getDta).data??[];
      isLoading=false;
    });

  }


});
}

void getcountDeliver(){

  setState(() {
    isLoading=true;
  });

  apiBaseHelper.getAPICall(getDeliverCounturl).then((getDta){
    bool error=getDta['error'];
    if(error==false){

      setState(() {
        completedelcount=getDta['complete_deliveries'].toString();
        curenntdelcount=getDta['current_deliveries'].toString();
        pendingdelcount=getDta['total_deliveries'].toString();

        print(completedelcount);
        print(curenntdelcount);
        print(pendingdelcount);
        isLoading=false;
      });

    }


  });

}


  CompleateHistryModel?compleateHistryModel;
  List<CompleateDeliver> TodayDeliverList =[];
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
    apiBaseHelper.postAPICall(getDeliverurl,param ).then((getDta) {

      bool error =getDta['error'];
      if(error==false){
        setState(() {

          TodayDeliverList=CompleateHistryModel.fromJson(getDta).data??[];
          setState(() {
            isLoading=false;
          });
        });

      }

    });



  }

}
