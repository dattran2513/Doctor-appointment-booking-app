import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_qppointment_app/views/category_details_view/category_details_view.dart';
import 'package:doctor_qppointment_app/views/categoty_view/category_view.dart';
import 'package:doctor_qppointment_app/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:doctor_qppointment_app/views/home_view/home_view.dart';
import 'package:doctor_qppointment_app/views/login_view/login_view.dart';
import 'package:doctor_qppointment_app/views/settings_view/settings_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    const HomeView(),
    const CategoryView(),
    const AppointmentView(),
    const SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: TextStyle(
          color: AppColors.whiteColor
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.whiteColor
        ),
        backgroundColor: AppColors.blueColor,
        currentIndex:  selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),

        ],
      ),
    );
  }
}
