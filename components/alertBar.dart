import 'package:flutter/material.dart';
import 'package:flutter_app/style/MainStyle.dart';

class Alert extends StatelessWidget {
  final String _text;
  final Color color;

  Alert._(this._text, this.color);

  Alert.info(this._text) : this.color = StyleTheme.infoColor;
  Alert.success(this._text) : this.color = StyleTheme.successColor;
  Alert.error(this._text) : this.color = StyleTheme.errorColor;

  show(BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(Alert._(this._text, this.color).build(context));
  }

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: this.color,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(_text, overflow: TextOverflow.ellipsis)),
          IconButton(
            splashRadius: 20,
            visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
            padding: EdgeInsets.all(0.0),
            color: Colors.white,
            icon: Icon(Icons.close),
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: 5000),
    );
  }
}
