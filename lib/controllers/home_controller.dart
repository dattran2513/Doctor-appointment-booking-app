import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_qppointment_app/consts/consts.dart';

class HomeController extends GetxController{
  var searQueryController = TextEditingController();
  var isLoading = false.obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async{
    var doctors = FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}