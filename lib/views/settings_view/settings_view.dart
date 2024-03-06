import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/consts/list.dart';
import 'package:doctor_qppointment_app/controllers/auth_controller.dart';
import 'package:doctor_qppointment_app/controllers/settings_controller.dart';
import 'package:doctor_qppointment_app/views/login_view/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsConrtoller());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          AppStrings.settings,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.whiteColor
          ),
        ),
      ),
      body: Obx(()=>
      controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(AppAssets.icAvatar),
                  ),
                  title: Text(controller.username.value),
                  subtitle: Text(controller.email.value),
                ),
                20.heightBox,
                Divider(),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      settingsList.length,
                          (index) => ListTile(
                            onTap: (){
                              if(index == 2){
                                AuthController().signout();
                                Get.offAll(() => const LoginView());
                              }
                            } ,
                            leading: Icon(settingsListIcon[index], color: AppColors.blueColor,),
                            title: Text(settingsList[index],),
                          )
                  ),
                )
              ],
            ),
      ),
    );
  }
}
