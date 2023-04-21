import 'package:flutter/material.dart';

class UhiLoader extends StatelessWidget {
  const UhiLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Image(
            image: AssetImage(
              'assets/images/loader-rolling.gif',
            ),
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
