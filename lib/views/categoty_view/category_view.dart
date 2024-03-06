import 'package:doctor_qppointment_app/consts/consts.dart';
import 'package:doctor_qppointment_app/consts/list.dart';
import 'package:doctor_qppointment_app/views/category_details_view/category_details_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(AppStrings.category,
          style: TextStyle(
            fontSize: 18
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200
            ),
          itemCount: iconsList.length,
          itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  Get.to(()=>CategoryDetailsView(catName: iconsTittleList[index],));
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.blueColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(iconsList[index], width: 60,),
                      ),
                      30.heightBox,
                      Text(iconsTittleList[index],
                        style: TextStyle(
                            color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      20.heightBox,
                      Text("13 specialize",
                        style: TextStyle(
                            color: AppColors.whiteColor.withOpacity(0.5),
                            fontSize: 16
                        ),
                      ),

                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}
