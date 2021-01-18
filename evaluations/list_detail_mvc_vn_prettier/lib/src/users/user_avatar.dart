import 'package:flutter/widgets.dart';

class UserAvatar extends StatelessWidget {
  final Color color;
  final double size;

  const UserAvatar({
    Key key,
    @required this.color,
    this.size = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Hero(
        tag: color,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color,
          ),
        ),
      ),
    );
  }
}
