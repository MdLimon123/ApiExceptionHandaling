import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {

  final VoidCallback onPress;

  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height:  height * .15,),
            const Icon(Icons.cloud_off,
              color: Colors.red,
              size: 50,
            ),
            Center(child: Text('general_exception'.tr,
              textAlign: TextAlign.center,)),
            SizedBox(height:  height * .15,),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                alignment: Alignment.center,
                height: 44,
                width: 160,
                decoration:  BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text('Retry',
                    style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
