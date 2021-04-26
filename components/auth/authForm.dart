import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/auth/formModel.dart';

class AuthForm extends StatefulWidget {
  AuthForm({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    print(widget.child);
  }

  _verification() {
    if (_formKey.currentState.validate()) {
      print(context.read<FormModel>().toJson());
    } else {
      _autovalidate = AutovalidateMode.onUserInteraction;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidate,
              child: widget.child,
            ),
          )),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Заходи четам'),
              onPressed: () {
                _verification();
              },
            ),
          ),
        ),
      ],
    );
  }
}
