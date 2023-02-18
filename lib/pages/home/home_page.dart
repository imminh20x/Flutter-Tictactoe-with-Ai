import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nlcsn/game/game_page.dart';
import 'package:nlcsn/widgets/cross_widget.dart';
import 'package:nlcsn/widgets/circle_widget.dart';

part 'game_mode.dart';
part 'game_title.dart';
  //const HomePage({Key? key}) : super(key: key);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //widget giao diện trang chủ
    return Scaffold( //widget Scaffold dùng như widget mẹ.
      body: Column( //dùng để sắp xếp các widget con thành 1 cột
        children: const [
          Spacer(flex: 2), //Khoảng trắng với diện tích là 2
          GameTitle(), //Hiển thị Title 
          Spacer(), //Khoảng trắng với diện tích là 1
          GameMode(), //Hiển thị title và 2 button chế độ
          Spacer(flex: 2), //Khoảng trắng với diện tích là 2
        ],
      ),
    );
  }
}
