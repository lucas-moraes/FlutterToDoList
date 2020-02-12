import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do List",
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _StateOfMyApp createState() => new _StateOfMyApp();
}

class _StateOfMyApp extends State<MyHome> {
  Widget _textTitle = new Text('To Do List');
  Widget _submitButton = new Text('');
  Widget _buttonChange = new Icon(Icons.add_circle_outline);
  String _buttonChangeTooltip = 'Add item';
  bool _isFalse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: _buttonChange,
          tooltip: _buttonChangeTooltip,
          onPressed: _changeCommand,
        ),
        title: _textTitle,
        actions: <Widget>[_submitButton],
      ),
      body: const Center(
        child: Text(
          'This is the home page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  _changeCommand() {
    setState(() {
      this._isFalse = _isFalse ? false : true;
      if (_isFalse) {
        this._textTitle = new TextField(
          style: new TextStyle(color: Colors.white),
          decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: new TextStyle(color: Colors.black45),
              hintText: 'Digite para Adicionar'),
        );
        this._submitButton = new IconButton(
            icon: Icon(Icons.check_circle),
            tooltip: 'Save item',
            onPressed: () {});
        this._buttonChange = new Icon(Icons.cancel);
        this._buttonChangeTooltip = 'Cancel';
      } else {
        this._textTitle = new Text('To Do List');
        this._submitButton = new Text('');
        this._buttonChange = new Icon(Icons.add_circle_outline);
        this._buttonChangeTooltip = 'Add item';
      }
    });
  }
}