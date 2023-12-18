import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pick_and_drop_driver/Api%20services/api_services/apiBasehelper.dart';
import 'package:pick_and_drop_driver/Api%20services/api_services/apiStrings.dart';
import 'package:pick_and_drop_driver/Helper/Colors.dart';
import 'package:pick_and_drop_driver/Screen/dashboard/dashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/loadingwidget.dart';
import '../../Widget/custom_app_button.dart';
import '../../Widget/customeTost.dart';
import 'custumScreen.dart';
import 'forgetPassword.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [


            customAuthDegine(context,"Login"),


            Container(
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.36),
              height: MediaQuery.of(context).size.height * 0.69,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30),),
              ),
              child:



              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 13,),
Row(
  children: [
        Text('Login',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  ],
),
SizedBox(height: 13,),
Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",style: TextStyle(fontSize: 12,),),

                     SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        Radio(

                          value: 'Email',
                          groupValue: login,
                          onChanged: (value) {
                            updateLoginType(value ?? '');
                          },
                          activeColor: AppColors.primary,

                        ),
                        const Text(


                          "Email",
                          style: TextStyle(
                              color: AppColors.blackTemp, fontSize: 15),

                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Radio(
                          value: 'Mobile no.',
                          groupValue: login,
                          onChanged: (value) {
                            updateLoginType(value??'');
                          },
                          activeColor: AppColors.primary,
                        ),
                        const Text(
                          'Mobile No',
                          style: TextStyle(
                              color: AppColors.blackTemp, fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),



                    num==1?
                      TextFormField(
                        maxLength: 10,
                        controller: mobilecontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          prefixIcon: const Icon(
                            Icons.call,
                            color: AppColors.blackTemp,
                          ),
                          hintText: 'Mobile Number',
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
                            return 'Please Enter Mobile Number';
                          }
                          else if (value.length<10) {
                            return 'Please Enter Valid Mobile Number';
                          }
                          return null; // Return null if the input is valid
                        },
                      )

:
                      TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(

                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.blackTemp,
                          ),
                          hintText: 'Email',
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
                            return 'Please Enter Email';
                          }
                          else if (!value.contains('@')||!value.contains(".com")) {
                            return 'Please Enter Valid Email';
                          }
                          return null; // Return null if the input is valid
                        },
                      ),


                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        controller: passwordC,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,color: AppColors.secondary,size:16 ,),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.blackTemp,
                          ),

                          hintText: 'Password',

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
                            return 'Please Enter Password';
                          }
                          return null; // Return null if the input is valid
                        },


                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const forgotPassword()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          child:

                          const Text(
                            'Forgot Password ?',
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: AppColors.secondary),
                          ),



                        ),
                      ),







                    const SizedBox(
                      height: 70,
                    ),



                   InkWell(

                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          loginApi();
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));

                        }
                      },
                      child:
                      !isLoading?
                      CustomButton(textt: "Login",):

                      LoadingWidget(context),
                    ),



SizedBox(height: 100,)

                  ],
                ),
              ),



            )
          ],
        ),
      ),
    );
  }


  void loginApi(){
    setState(() {
      isLoading=true;
    });
var param;
if(num==1) {
   param = {
    'mobile': mobilecontroller.text.toString(),
    'password': passwordC.text.toString(),
     'type':'mobile'
  };
}else{
  param = {
    'email': emailC.text.toString(),
    'password': passwordC.text.toString(),
    'type':'email'

  };

}
    apiBaseHelper.postAPICall(loginurl, param).then((getData){
    bool error=getData['error'];
      String msg=getData['message'];

if(!error){

setState(() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userId', '${getData['data'][0]['id']}');
  await prefs.setString('name', '${getData['data'][0]['username']}');
  await prefs.setString('email', '${getData['data'][0]['email']}');
  await prefs.setString('userimage','${getData['data'][0]['image']}');

  customSnackbar(context,msg.toString());
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
  setState(() {
    isLoading=false;
  });
});

}
else{
  customSnackbar(context,msg.toString());
  setState(() {
    isLoading=false;
  });
}
    });
  }

  TextEditingController mobilecontroller =TextEditingController();
  bool isLoading = false ;

  bool _obscureText = true;
  String login = 'Email';

  void updateLoginType(String value) {
    if (value == 'Email') {
      num = 0;
    } else {
      num = 1;
    }
    login = value;

    setState(() {

    });
  }

  int num = 0;


}