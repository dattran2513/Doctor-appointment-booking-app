import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/views/doctor_profile_view/doctor_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: Text("Search results",
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("doctors").get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
                child: CircularProgressIndicator()
            );
          }else{
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index){

                    var doc = snapshot.data!.docs[index];
                    return !doc['doctorName'].toString().toLowerCase().contains(searchQuery.toLowerCase())
                      ? const SizedBox.shrink()
                      :GestureDetector(
                        onTap: (){
                          Get.to(() =>DoctorProfileView(doc: doc));
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
                                child: Image.asset( AppAssets.icLogin,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              5.heightBox,
                              Text(doc['doctorName']),
                              VxRating(
                                normalColor: AppColors.yellowColor,
                                onRatingUpdate: (value){},
                                maxRating: 5,
                                count: 5,
                                value: double.parse(doc['doctorRating'].toString()),
                                stepInt: true,
                              )
                            ],
                          ),
                        ),
                      );
                  }
              ),
            );
          }

        },
      ),
    );
  }
}
