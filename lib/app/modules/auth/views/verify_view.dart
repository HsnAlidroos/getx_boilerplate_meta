import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyView extends GetView {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify_title'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'verify_message'.tr,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
