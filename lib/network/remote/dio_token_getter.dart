import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioTokenGetter
{
  static String token = "";
  static Dio dio;
  static init()
  {
    dio = Dio(
        BaseOptions(
          baseUrl: "https://sandbox-authservice.priaid.ch/",
          receiveDataWhenStatusError: true,
          headers: {
            "format" : "json",
            "Authorization" : "Bearer maroelshamloul@hotmail.com:IaCxVFbNAK3fzNL11SUHkw==",
          },
        )
    );
  }
  static Future<Response> postData({
    @required String url,
    Map<String,dynamic> query,
    @required Map<String,dynamic> data,
  })
  async {
    return await dio.post(
        url,
        data: data);
  }
  static void getToken()
  {
    postData(url: "login", data: {"data":"dummy"}).then((value)
    {
      token = value.data['Token'];
      print("Token initialized : "+token);
    }).catchError((error){
      print(error.toString());
    });
  }
}