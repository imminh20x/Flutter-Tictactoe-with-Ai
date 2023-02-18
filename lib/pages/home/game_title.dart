part of 'home_page.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 54.0,
              width: 54.0,
              child: CrossWidget(
                strokeWidth: 18.0,
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            SizedBox(
              height: 54.0,
              width: 54.0,
              child: CircleWidget(
                strokeWidth: 16.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
