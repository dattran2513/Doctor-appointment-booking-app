import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/controllers/appointment_controller.dart';
import 'package:doctor_qppointment_app/controllers/auth_controller.dart';
import 'package:doctor_qppointment_app/views/appointment_details_view/appointment_details_view.dart';

import '../../consts/consts.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView ({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
          title: Text("Appointments",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        actions: [
          IconButton(
              onPressed: (){
                AuthController().signout();
              },
              icon: Icon(Icons.power_settings_new_rounded)
          )
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getAppointments(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      onTap: (){
                        Get.to(() => AppointmentDetailsView(doc: data[index],));
                      },
                      leading: CircleAvatar(
                        child: Image.asset(AppAssets.icLogin),
                      ),
                      title: Text(data[index][isDoctor ?'appWithName':'appName']),
                      subtitle: Text("${data[index]['appDay']} - ${data[index]['appTime']}",
                        style: TextStyle(
                            color: AppColors.textColor.withOpacity(0.5)
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
