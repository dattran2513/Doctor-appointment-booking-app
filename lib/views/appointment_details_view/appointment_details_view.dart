import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';

class AppointmentDetailsView extends StatelessWidget {
  final DocumentSnapshot doc;

  const AppointmentDetailsView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.blueColor,
          title: Text(doc['appWithName'],
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select appointment day",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            5.heightBox,
            Text(doc['appDay']),
            10.heightBox,
            Text("Select appointment time",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            5.heightBox,
            Text(doc['appTime']),
            20.heightBox,
            Text("Mobile number:",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            5.heightBox,
            Text(doc['appMobile']),
            10.heightBox,
            Text("Full name:",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            5.heightBox,
            Text(doc['appName']),
            10.heightBox,
            Text("Message:",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            5.heightBox,
            Text(doc['appMessage']),
          ],
        ),
      ),
    );
  }
}
