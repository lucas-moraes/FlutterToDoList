import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do List",
      theme: ThemeData(
        primaryColor: Colors.amber[700],
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
  List<String> lista = [];

  void _addList(String item) {
    setState(() {
      lista.add(item);
    });
  }

  void _deleteList(int index) {
    setState(() {
      lista.removeAt(index);
    });
  }

  Widget _buildList() {
    return new ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Row(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 7.0, top: 20.0, right: 7.0, bottom: 0.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.done,
                        color: Colors.blue,
                        size: 25,
                      ),
                      title: Text(lista[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => _deleteList(index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }

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
      backgroundColor: Colors.amber[600],
      body: _buildList(),
    );
  }


  _changeCommand() {
    setState(() {
      this._isFalse = _isFalse ? false : true;
      if (_isFalse) {
        
        TextEditingController _controller = new TextEditingController();
        
        this._textTitle = new TextField(
            style: new TextStyle(color: Colors.black),
            controller: _controller,
            decoration: new InputDecoration(
                border: InputBorder.none,
                hintStyle: new TextStyle(color: Colors.black45),
                hintText: 'Digite para Adicionar'),
            onSubmitted: (val) {
              _addList(val);
              _controller.clear();
            });
        this._submitButton = new IconButton(
          icon: Icon(Icons.check_circle),
          tooltip: 'Save item',
          onPressed: () => _addList,
        );
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

