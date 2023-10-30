import 'package:flutter/material.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryColor,
    required this.title,
    required this.onPress,
    this.height = 50,
    this.width = 60,
    this.loading = false
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: loading? const Center(child: CircularProgressIndicator(),)
      :Center(
        child: Text(title,
            style:Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white)),
      ),
    );
  }
}
