import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_qppointment_app/views/home_view/home.dart';
import 'package:doctor_qppointment_app/views/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthController extends GetxController{

  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  UserCredential? userCredential;
  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var serviceController = TextEditingController();
  var timingController = TextEditingController();
  var phoneController = TextEditingController();
  var categorydController = TextEditingController();

  isUserAlreadyLoggedIn() async{
    await FirebaseAuth.instance.authStateChanges().listen((User? user)async {
      if(user != null){
        var data = await FirebaseFirestore.instance.collection('doctors').doc(user.uid).get();
        var isDoc = data.data()?.containsKey('doctorName') ?? false;
        if(isDoc){
          Get.offAll(()=> const AppointmentView());
        }else{
          Get.offAll(()=> const Home());
        }
      }else{
        Get.offAll(()=> const LoginView());
      }
    });

  }

  loginUser()async{
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );
  }

  signupUser(bool isDoctor) async{

    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    );
    await storeUserData(
        userCredential!.user!.uid,
        fullnameController.text,
        passwordController.text,
        isDoctor
    );

  }
  storeUserData(String uid, String fullname, String email, bool isDoctor) async{
    var store = FirebaseFirestore.instance.collection(isDoctor? 'doctors': 'user').doc(uid);
    if(isDoctor){
      await store.set({
        'doctorAbout': aboutController.text,
        'doctorAddress': addressController.text,
        'doctorCategory': categorydController.text,
        'doctorName': fullname,
        'doctorPhone': phoneController.text,
        'doctorService': serviceController.text,
        'doctorTiming': timingController.text,
        'doctorID': FirebaseAuth.instance.currentUser?.uid,
        'doctorRating': 1,
        'doctorEmail': email
      });
    }else{
      await store.set({
        'fullname': fullname,
        'email': email
      });
    }
  }

  signout() async{
    await FirebaseAuth.instance.signOut();
  }
}

