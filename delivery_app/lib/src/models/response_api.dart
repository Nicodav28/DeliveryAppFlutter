// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);

import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? error;
  String? message;
  bool? success;
  dynamic data;

  ResponseApi({
    this.error,
    this.message,
    this.success,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    message = json["message"];
    success = json["success"];
    try{
      data = json['data'];
    }catch(e){
      print('Exception data $e');
    }
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "success": success,
  };
}
