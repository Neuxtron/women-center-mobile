import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // verticalDirection: VerticalDirection.up,
      children: [
        const Text(
          "Already have an account ?",
          style: TextStyle(
            color: Color(0xFFF9F5F6),
            fontSize: 12,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Color(0xFFF2BED1),
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                height: 0,
              ),
            ))
      ],
    );
  }
}
