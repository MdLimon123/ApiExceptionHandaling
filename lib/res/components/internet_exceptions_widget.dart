import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {

  final VoidCallback onPress;

  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
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
            Center(child: Text('internet_exception'.tr,
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
