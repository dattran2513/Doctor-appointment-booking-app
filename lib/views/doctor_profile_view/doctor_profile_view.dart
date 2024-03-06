import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/res/components/custom_button.dart';
import 'package:doctor_qppointment_app/views/book_appointment_view/book_appointment_view.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text("Doctor details ",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: Image.asset(AppAssets.icLogin),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['doctorName'],
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                          Text(doc['doctorCategory'],
                            style: TextStyle(
                                color: AppColors.textColor.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),
                          ),
                          const Spacer(),
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
                    Text("See all reviews",
                      style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whiteColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text("Phone number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor
                        ),
                      ),
                      subtitle: Text(doc['doctorPhone'],
                        style: TextStyle(
                          color: AppColors.textColor.withOpacity(0.5),
                          fontSize: 12
                        ),
                      ),
                      trailing: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.yellowColor
                        ),
                        child: Icon(Icons.phone, color: AppColors.whiteColor ,),
                      ),
                    ),
                    10.heightBox,
                    Text("About ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 16
                      ),
                    ),
                    5.heightBox,
                    Text(doc['doctorAbout'],
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                    ),
                    10.heightBox,
                    Text("Address ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 16
                      ),
                    ),
                    5.heightBox,
                    Text(doc['doctorAddress'],
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                    ),
                    10.heightBox,
                    Text("Worktime ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 16
                      ),
                    ),
                    5.heightBox,
                    Text(doc['doctorTiming'],
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                    ),
                    10.heightBox,
                    Text("Services",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 16
                      ),
                    ),
                    5.heightBox,
                    Text(doc['doctorService'],
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0),
        child: CustomButton(
          buttonText: "Book a appointment",
          onTap: (){
            Get.to(()=> BookAppointmentView(
              docId: doc['doctorID'],
              docName: doc['doctorName'],
            ));
          },
         ),
      ),
    );
  }
}
