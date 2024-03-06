import 'package:doctor_qppointment_app/controllers/appointment_controller.dart';
import 'package:doctor_qppointment_app/res/components/custom_textfield.dart';

import '../../consts/consts.dart';
import '../../res/components/custom_button.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointmentView({super.key, required this.docId, required this.docName });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title: Text(docName,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select appointment day",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              5.heightBox,
              CustomTextField(
                hint: "Select day",
                textController: controller.appDayController,
              ),
              10.heightBox,
              Text("Select appointment time",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              5.heightBox,
              CustomTextField(
                  hint: "Select time",
                  textController: controller.appTimeController
              ),
              20.heightBox,
              Text("Mobile number:",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              5.heightBox,
              CustomTextField(
                  hint: "Enter your mobile number",
                  textController: controller.appMobileController
              ),
              10.heightBox,
              Text("Full name:",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              5.heightBox,
              CustomTextField(
                  hint: "Enter your full name",
                  textController: controller.appNameController
              ),
              10.heightBox,
              Text("Message:",
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              5.heightBox,
              CustomTextField(
                  hint: "Enter your message",
                  textController: controller.appMessageController
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(()=>
        Padding(
          padding: EdgeInsets.all(10.0),
          child: controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  buttonText: "Book a appointment",
                  onTap: ()async{
                    await controller.bookingAppointment(docId, docName, context);
                  },
                ),
        ),
      ),
    );
  }
}
