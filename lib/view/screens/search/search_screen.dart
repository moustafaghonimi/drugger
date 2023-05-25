import 'package:drugger/view/screens/search/search_Items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constance/app_color.dart';
import '../../../constance/assets_constant.dart';
import '../../../constance/string_constant.dart';
import '../../../controller/search/search_controller.dart';
import '../../../model/medicine_model.dart';
import '../../../service/search_medicine_services.dart';
import '../../widget/custemAnimetedTxt.dart';
import '../../widget/search_widget.dart';
import 'filterSearchBottomScheat_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController controller = Get.put(SearchController());


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              filterSearchBottomScheat(context);
            },
            backgroundColor: AppColor.onPrimaryColor,
            child: Icon(Icons.filter_list_alt),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            scrolledUnderElevation: 200,
            toolbarHeight: h * 0.05,
            iconTheme: const IconThemeData.fallback(),
            title: CustemAnimetedText(
                Txt: AppString.searchScreen,
                color: AppColor.blackColor,
                size: 20,
                time: 200),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchWidget(
                  onChange: (value) {
                    setState(() {
                      controller.query.value = value!;
                    });


                    // controller.search();
                    // print(controller.query.value);
                  },
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              controller.query.value==''
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset(
                        AppAssets.searchImage,
                        fit: BoxFit.cover,
                        width: w,
                      ),
                    )
                  : Expanded(
                      child:controller.search().isEmpty?const Text('This product Not Exist ',style:TextStyle( color:AppColor.onPrimaryColor,)):ListView.builder(
                        itemBuilder: (context, index) {
                          return SearchItems(
                              controller.search().elementAt(index));
                        },
                        itemCount: controller.search().length,

                      ),
                    ),
              Text("We Fined:: ${controller.search().length.toString()} ::Product",style: const TextStyle(color: AppColor.onPrimaryColor),),
            ],
          )),
    );
  }

  void filterSearchBottomScheat(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        backgroundColor: AppColor.whiteColor,
        useSafeArea: true,
        elevation: 4,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[FilterSearchBottomScheatDetails()]),
            )));
  }


}
