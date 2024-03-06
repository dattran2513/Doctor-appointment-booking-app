import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/consts/images.dart';
import 'package:doctor_qppointment_app/controllers/auth_controller.dart';
import 'package:doctor_qppointment_app/res/components/custom_button.dart';
import 'package:doctor_qppointment_app/res/components/custom_textfield.dart';
import 'package:doctor_qppointment_app/views/home_view/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../consts/strings.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());


    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top:40),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Image.asset(AppAssets.icSignup, width: 200),
                Text(AppStrings.signupNow,
                  style: AppStyles.normalText,
                  textAlign: TextAlign.center,
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
                              hint: AppStrings.fullname,
                              textController: controller.fullnameController,
                            ),
                            10.heightBox,
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
                            SwitchListTile(
                              title: Text('Sign up as a doctor'),
                                value: isDoctor, onChanged: (newValue){
                                setState(() {
                                  isDoctor = newValue;
                                });
                            }),
                            Visibility(
                                visible: isDoctor,
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      hint: 'About',
                                      textController: controller.aboutController,
                                    ),
                                    10.heightBox,
                                    CustomTextField(
                                      hint: 'Category',
                                      textController: controller.categorydController,
                                    ),
                                    10.heightBox,
                                    CustomTextField(
                                      hint: 'Services',
                                      textController: controller.serviceController,
                                    ),
                                    10.heightBox,
                                    CustomTextField(
                                      hint: 'Address',
                                      textController: controller.addressController,
                                    ),
                                    10.heightBox,
                                    CustomTextField(
                                      hint: 'Phone number',
                                      textController: controller.phoneController,
                                    ),
                                    10.heightBox,
                                    CustomTextField(
                                      hint: 'Timing',
                                      textController: controller.timingController,
                                    ),
                                  ],
                                )
                            ),
                            20.heightBox,
                            CustomButton(
                              buttonText: AppStrings.signup,
                              onTap: ()async{
                                await controller.signupUser(isDoctor);
                                if(controller.userCredential != null){
                                  Get.off(()=>const Home());
                                }
                              },
                            ),
                            20.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.alreadyHaveAccount),
                                8.widthBox,
                                GestureDetector(
                                  onTap: (){
                                    Get.back();
                                  },
                                  child: Text(AppStrings.login,
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
