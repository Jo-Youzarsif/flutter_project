import 'package:flutter/material.dart';

class LoadingIcon extends StatefulWidget {
  @override
  _LoadingIconState createState() => _LoadingIconState();
}

class _LoadingIconState extends State<LoadingIcon> with SingleTickerProviderStateMixin {
  AnimationController rotationController;
  //--
  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(vsync: this, duration: Duration(seconds: 4))..repeat();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  //--
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.black87.withOpacity(0.5),
            //border: Border.all(width: 3, color: Colors.black45),
          ),
          padding: EdgeInsets.all(20.0),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
            child: Image.asset(
              "Assets/Images/loading.png",
            ),
          ),
        ),
      ),
    );
  }
}
