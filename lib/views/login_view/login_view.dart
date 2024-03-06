import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/consts/images.dart';
import 'package:doctor_qppointment_app/controllers/auth_controller.dart';
import 'package:doctor_qppointment_app/res/components/custom_button.dart';
import 'package:doctor_qppointment_app/res/components/custom_textfield.dart';
import 'package:doctor_qppointment_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_qppointment_app/views/home_view/home_view.dart';
import 'package:doctor_qppointment_app/views/signup_view/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../consts/strings.dart';
import '../home_view/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top:40),
         padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset(AppAssets.icLogin, width: 200),
                Text(AppStrings.welcomeApp,
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: AppFonts.SourceSansPro_Bold
                  ),
                ),
                Text(AppStrings.weAreExcited,
                  style: AppStyles.normalText,
                ),
              ],
            ),
            Expanded(
                child: Form(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                              hint: AppStrings.email,
                              textController: controller.emailController,
                            ),
                            10.heightBox,
                            CustomTextField(
                              hint: AppStrings.password,
                              textController: controller.passwordController,
                            ),
                            10.heightBox,
                            SwitchListTile(value: isDoctor, onChanged: (newValue){
                              setState(() {
                                isDoctor = newValue;
                              });
                            },title: Text("sign in as a doctor"),
                            ),
                            20.heightBox,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(AppStrings.forgetPassword),
                            ),
                            20.heightBox,
                            CustomButton(
                              onTap: ()async{
                                await controller.loginUser();
                                if(controller.userCredential != null){
                                  if(isDoctor){
                                    Get.to(()=> const AppointmentView());
                                  }else{
                                    Get.to(()=> const Home());
                                  }
                                }
                              },
                              buttonText: AppStrings.login,
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.dontHaveAccount),
                                8.widthBox,
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> const SignupView());
                                  },
                                  child: Text(AppStrings.signup,
                                    style: TextStyle(
                                      fontFamily: AppFonts.SourceSansPro_Bold,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
