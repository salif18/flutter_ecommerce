import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier{

  String _userId;
  String _token;

  AuthNotifier():
    _userId="",
    _token="";

    //fonction de connexion
    void loginUser(String userId, String token){
        _userId = userId;
        _token = token;
        notifyListeners();
    }

     //fonction de connexion
    void logoutUser(){
        _userId = "";
        _token = "";
        notifyListeners();
    }


    bool get isLogin => _token.isNotEmpty;
    String get userId => _userId;
    String get token => _token;
}