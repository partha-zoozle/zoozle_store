import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductPurchaseController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var dropdownItems = ["Option 1", "Option 2", "Option 3", "Option 4"];
  var selectedValue = "Option 1".obs; // Default selected value
}
