
import 'dart:async';

import 'package:untitled1/src/validators/validationCheck1.dart';

class bloC1 {
  final StreamController _userController = new StreamController();
  final StreamController _passController = new StreamController();
  final StreamController _phoneController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  Stream get phoneStream => _phoneController.stream;

  bool isValidIn4(String userName, String passWord, int phoneNumber) {
    if(!ValidationCheck1.isValidUser(userName)) {
      _userController.sink.addError("Tài khoản không hợp lệ!");
      return false;
    }

    if(!ValidationCheck1.isValidPass(passWord)) {
      _passController.sink.addError("Mật khẩu quá yếu!");
      return false;
    }

    if(!ValidationCheck1.isValidPhone(phoneNumber)) {
      _phoneController.sink.addError("Số điện thoại không đúng định dạng!");
      return true;
    }
    return true;
  }
  void dispose() {
    _userController.close();
    _passController.close();
    _phoneController.close();
  }
}