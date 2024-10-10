import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/Ascendant.dart';
import 'Server.dart';
import 'package:http/http.dart' as http;
Future<bool> LoginData(BuildContext context,String username,String password) async{
  try{
    final url = Uri.parse(APIBaseURL()+APILogin());
    final request = http.MultipartRequest('POST', url);
    // request.headers.addAll(headerBuilder(Token));
    request.fields['username'] = username;
    request.fields['password'] = password;
    final response = await request.send().timeout(
      Duration(seconds: TimeoutTimeSecond()), // Atur durasi timeout (contoh 10 detik)
      onTimeout: () {
        // Mengembalikan error jika timeout tercapai
        throw TimeoutException("Request to server timed out. Please try again later.");
      },
    );
    final respStr = await response.stream.bytesToString();
    print(jsonDecode(respStr.toString()));
    if(jsonDecode(respStr)['status'].toString() == "true"){
      try{
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', jsonDecode(respStr)['data'][0]['id'].toString());
        await prefs.setString('name', jsonDecode(respStr)['data'][0]['name'].toString());
        await prefs.setString('email', jsonDecode(respStr)['data'][0]['email'].toString());
        await prefs.setString('jenis_kelamin', jsonDecode(respStr)['data'][0]['jenis_kelamin'].toString());
        await prefs.setString('username', jsonDecode(respStr)['data'][0]['username'].toString());
        await prefs.setString('kontak', jsonDecode(respStr)['data'][0]['kontak'].toString());
        await prefs.setString('id_role', jsonDecode(respStr)['data'][0]['id_role'].toString());
        await prefs.setString('photo', jsonDecode(respStr)['data'][0]['photo'].toString());
        await prefs.setString('id_shop', jsonDecode(respStr)['data'][0]['id_shop'].toString());

        LoginSuccessMessage(context, jsonDecode(respStr)['data'][0]['name']);
        return false;
      }catch(e){
        Message("Error Message",e.toString(), context);
        return false;
      }
    }else{
      Message('Login Failed',jsonDecode(respStr)['Message'].toString(), context);
      return false;
    }
  }catch (e){
    if (e is TimeoutException) {
      // Menangani jika terjadi TimeoutException
      Message('Request Timeout', 'The server took too long to respond. Please try again.', context);
    } else {
      // Penanganan untuk exception lain
      Message('Request Failed', e.toString(), context);
    }
    return false;
    // FailedMessage("Login Failed", "Error : "+e.toString(),context);
  }
}