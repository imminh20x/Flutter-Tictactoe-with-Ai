part of 'home_page.dart';

class GameMode extends StatelessWidget {
  const GameMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Chọn chế độ chơi",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        _ButtonWidget(
          color: Colors.lightBlue,
          label: "Chơi với Máy",
          onPressed: () {
            Get.to(() => GamePage(),
                binding: GamePageBinding(isMultiPlayer: false));
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        _ButtonWidget(
          color: Colors.orange,
          label: "Chơi đối kháng",
          onPressed: () {
            Get.to(() => GamePage(),
                binding: GamePageBinding(isMultiPlayer: true));
          },
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;
  const _ButtonWidget({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: const Size.fromWidth(250.0),
        shape: const StadiumBorder(),
        elevation: 0.0,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
