import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/views/doctor_profile_view/doctor_profile_view.dart';

import '../../consts/list.dart';

class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text("Category name",
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("doctors")
            .where('doctorCategory', isEqualTo: catName).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return const Center(
                child: CircularProgressIndicator()
            );
          }else{
            var data = snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8
                  ),
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
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
                          Text(data![index]['doctorName']),
                          VxRating(
                            normalColor: AppColors.yellowColor,
                            onRatingUpdate: (value){},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(data![index]['doctorRating'].toString()),
                            stepInt: true,
                          )
                        ],
                      ),
                    ).onTap(() { 
                      Get.to(()=>DoctorProfileView(doc: data[index]));
                    });
                  }
              ),
            );
          }

        },
      ),
    );
  }
}
