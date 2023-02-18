import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlcsn/pages/home/home_page.dart';

//Hàm void main để chạy ứng dụng
void main(List<String> args) {
  runApp(const MyApp()); //Khởi chạy class MyApp thôi qua runApp.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Loại bỏ banner debug ở giao diện
      title: "Nien Luan Co So",
      theme: ThemeData(
        primarySwatch: Colors.blue, //Theme màu chính của ứng dụng
      ),
      home: HomePage(), // Class HomePage chính là giao diện Trang chủ.
    );
  }
}
