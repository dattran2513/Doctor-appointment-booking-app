import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/consts/list.dart';
import 'package:doctor_qppointment_app/controllers/home_controller.dart';
import 'package:doctor_qppointment_app/res/components/custom_textfield.dart';
import 'package:doctor_qppointment_app/views/category_details_view/category_details_view.dart';
import 'package:doctor_qppointment_app/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:doctor_qppointment_app/views/search_view/search_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.welcome,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColors.whiteColor,
                      textColor: AppColors.whiteColor,
                      inputColor: AppColors.whiteColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: (){
                        Get.to(()=> SearchView(
                            searchQuery: controller.searQueryController.text
                        ));
                      },
                      icon: Icon(Icons.search, color: AppColors.whiteColor,)
                  )
                ],
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(()=>CategoryDetailsView(
                                catName: iconsTittleList[index],
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.blueColor
                              ),
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 8),
                              child: Column(
                                children: [
                                  Image.asset(iconsList[index],
                                    width: 30,
                                  ),
                                  5.heightBox,
                                  Text(iconsTittleList[index],
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Popular doctor",
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }else{
                          var data = snapshot.data?.docs;
                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data?.length ?? 0,
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: (){
                                    Get.to(()=> DoctorProfileView(doc: data[index]));
                                  },
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: AppColors.bgDarkColor,
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    margin: EdgeInsets.only(right: 8),
                                    height: 100,
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          alignment: Alignment.center,
                                          color: AppColors.blueColor,
                                          child: Image.asset( AppAssets.icAvatar,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        5.heightBox,
                                        Text(data![index]['doctorName']),
                                        5.heightBox,
                                        Text(data![index]['doctorCategory'],style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      }
                  ),
                 5.heightBox,
                  GestureDetector(
                    onTap: (){},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("View all",
                        style: TextStyle(
                          color: AppColors.blueColor
                        ),
                      ),
                    ),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                      List.generate(4, (index) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Image.asset(AppAssets.icBody,
                              width: 25,
                              color: AppColors.whiteColor,
                            ),
                            5.heightBox,
                            Text("Lab test",
                              style: TextStyle(
                                color: AppColors.whiteColor
                              ),
                            )
                          ],
                        ),
                      )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
