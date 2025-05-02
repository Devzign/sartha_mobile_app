import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/network/api_service.dart';

class RegistrationController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final RxString stateController = ''.obs;
  final RxString cityController = ''.obs;
  final RxString selectedRole = RxString('');
  final RxString nameError = RxString('');
  final RxString emailError = RxString('');
  final RxString passwordError = RxString('');
  final RxString pinCodeError = RxString('');
  final RxString mobileNoError = RxString('');
  final RxBool isLoading = false.obs;
  final RxString fetchError = RxString('');

  void selectRole(String? role) {
    selectedRole.value = role ?? '';
  }

  Future<void> fetchStateCity(String pinCode) async {
    isLoading.value = true;
    fetchError.value = '';
    stateController.value = '';
    cityController.value = '';
    try {
      print('fetchStateCity method called with pin Code: $pinCode');
      final response = await ApiService.getFullUrl(
        'https://api.postalpincode.in/pincode/$pinCode',
      );
      if (response != null && response is List && response.isNotEmpty) {
        final data = response[0];
        final status = data['Status'];
        final message = data['Message'];
        final postOfficeData = data['PostOffice'];

        if (status == 'Success') {
          if (postOfficeData != null &&
              postOfficeData is List &&
              postOfficeData.isNotEmpty) {
            stateController.value = postOfficeData[0]['State'];
            cityController.value = postOfficeData[0]['District'];
          } else {
            fetchError.value = 'Invalid Pin Code';
          }
        } else if (status == 'Error') {
          fetchError.value = message ?? 'Failed to fetch pin Code details';
        } else {
          fetchError.value = 'Could not process pin Code details';
        }
      } else {
        fetchError.value = 'Could not fetch details for this pin Code';
      }
    } catch (e) {
      if (e is BadRequestException) {
        fetchError.value = 'Bad request: ${e.message}';
      } else if (e is NotFoundException) {
        fetchError.value = 'Pin Code not found';
      } else if (e is ServerErrorException) {
        fetchError.value = 'Server error occurred: ${e.message}';
      } else if (e is ApiException) {
        fetchError.value = 'API error: ${e.message}';
      } else {
        fetchError.value = e.toString();
      }
    } finally {
      isLoading.value = false;
    }
  }

  void validateInputs() {
    nameError.value = nameController.text.isEmpty ? 'Name is required' : '';
    emailError.value = emailController.text.isEmpty ? 'Email is required' : '';
    passwordError.value =
        passwordController.text.length < 6
            ? 'Password must be at least 6 characters'
            : '';
    pinCodeError.value =
        pinCodeController.text.isEmpty ? 'Pin Code is required' : '';
    mobileNoError.value =
        mobileNoController.text.isEmpty ? 'Mobile Number is required' : '';
    if (pinCodeController.text.isNotEmpty &&
        pinCodeController.text.length != 6) {
      pinCodeError.value = 'Pin Code must be 6 digits';
    }

    if (nameError.isEmpty &&
        emailError.isEmpty &&
        passwordError.isEmpty &&
        pinCodeError.isEmpty &&
        selectedRole.value.isNotEmpty &&
        stateController.value.isNotEmpty &&
        cityController.value.isNotEmpty) {
      print('Registration successful!');
    } else {
      if (selectedRole.value.isEmpty) {
        Get.snackbar('Error', 'Please select a role');
      }
      if (stateController.value.isEmpty ||
          cityController.value.isEmpty &&
              pinCodeController.text.length == 6 &&
              fetchError.isEmpty) {
        Get.snackbar('Error', 'Invalid Pin Code');
      } else if (fetchError.isNotEmpty) {
        Get.snackbar('Error', fetchError.value);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    pinCodeController.addListener(() {
      if (pinCodeController.text.length == 6) {
        fetchStateCity(pinCodeController.text);
      } else if (pinCodeController.text.length < 6) {
        stateController.value = '';
        cityController.value = '';
        fetchError.value = '';
      }
      pinCodeError.value = '';
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    pinCodeController.dispose();
    super.onClose();
  }
}
