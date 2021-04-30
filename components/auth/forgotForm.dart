import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/widget/emailWidget.dart';

class ForgotForm extends StatelessWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.email,
              size: 120.0,
            ),
          ),
          EmailWidget(),
        ],
      ),
    );
  }
}
