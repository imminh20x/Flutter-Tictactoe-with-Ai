import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nlcsn/constants/ui_constants.dart';
import 'package:nlcsn/controllers/game_controller.dart';
import '../../game_ai/game_util.dart';
import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

part 'board_widget.dart';
part 'current_player_widget.dart';
part 'game_action_widget.dart';
part 'game_status_widget.dart';

class GamePageBinding extends Bindings {
  final bool isMultiPlayer;

  GamePageBinding({required this.isMultiPlayer});

  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController(isMultiPlayer));
  }
}
//const GamePage({Key? key}) : super(key: key);

// class GamePage build giao diện trang trò chơi
class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // đặt màu cho background
      body: SafeArea(
        //Dùng để giữ UI trong vùng an toàn
        child: Padding(
          //set padding 2 cạnh dài màn hình tất cả widget con 
          padding: const EdgeInsets.symmetric(vertical: 20.0), 
          child: Column( 
            children: [
              const Spacer(), 
              const GameStatusWidget(), //hiển thị lượt thắng - hòa
              const Spacer(flex: 2),
              //set chiều rộng và dài của bàn cờ bằng 76% chiều rộng màn hình
              BoardWidget(size: MediaQuery.of(context).size.width * 0.76),
              const Spacer(),
              const CurrentPlayerWidget(), //hiển thị lượt đi hiện tại
              const Spacer(),
              const GameActionWidget(), // các button chức năng 
              const Spacer(),
            ],),),),);}}

Future<bool?> showConfirmDialog({
  required BuildContext context,
  String title = "Confirm!",
  required String content,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("Ok"),
        ),
      ],
    ),
  );
}
