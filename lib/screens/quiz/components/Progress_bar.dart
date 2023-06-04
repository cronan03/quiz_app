import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple,width: 3),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Stack(
        children: [
          LayoutBuilder(
              builder: (context,constraints)=>Container(
                  width: constraints.maxWidth*0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.cyan,Colors.greenAccent],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  )
              )
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("60 sec"),
                    WebsafeSvg.asset("assets/icons/clock.svg")
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }
}