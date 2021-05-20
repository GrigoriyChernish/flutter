import 'package:flutter_app/components/alertBar.dart';

/// Flutter code sample for ScaleTransition

// The following code implements the [ScaleTransition] as seen in the video
// above:
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/auth/authModel.dart';
import 'package:flutter_app/service/http/auth/AuthHttp.dart';

/// This is the main application widget.
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              var response = await AuthHttp.logout();
              if (response.status == 200) {
                //  UserModel user = UserModel.fromJson(response.data as Map<String, dynamic>);
                context.read<Authentication>().set(AuthStatus.unauthenticated);
              }
              Alert.error(response.message).show(context);
              context.read<Authentication>().set(AuthStatus.unauthenticated);
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Almost before we',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
