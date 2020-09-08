import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encabezado"),
      ),
      drawer: MediaQuery.of(context).size.width < 700
          ? Drawer(child: _menu())
          : null,
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return _desktopDisplay(context, constraints);
        } else {
          return _mobileDisplay(constraints);
          //return Text("Mibile Display teva");
        }
      }),
      floatingActionButton: MediaQuery.of(context).size.width < 700 ? _buttonContainer() : null
    );
  }

  Widget _buttonContainer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {},
          child: Text("Boton 1"),
        ),
        MaterialButton(
          onPressed: () {},
          child: Text("Boton 2"),
        )
      ],
    );
  }


  Widget _mobileDisplay(BoxConstraints constraints) {
    return _customTabs(context, constraints);
  }

  Widget _desktopDisplay(BuildContext context, BoxConstraints constraints) {
    return Center(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey
            ),
            width: 300,
            child: _menu(),
          ),
          Container(
            width: constraints.maxWidth - 600,
            child: _customTabs(context, constraints),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text("Boton 1"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Boton 2"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _customTabs(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        Container(
          decoration: new BoxDecoration(color: Colors.brown),
          child: new TabBar(
            controller: _controller,
            tabs: [
              new Tab(
                icon: const Icon(Icons.home),
                text: 'Address',
              ),
              new Tab(
                icon: const Icon(Icons.my_location),
                text: 'Location',
              ),
              new Tab(
                icon: const Icon(Icons.my_location),
                text: 'MENU',
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              Container(child: Text("PRIMER TAB"), color: Colors.red),
              Container(child: Text("Segundo TAB")),
              Container(child: Text("Tercer TAB"))
            ],
          ),
        ),
      ],
    );
  }

  Widget _menu() {
    return ListView(
      //padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Text("DrawerHeader"),
        ),
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Menu 2"),
            )
        ),
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Menu 2"),
            )
        ),FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Menu 2"),
            )
        ),FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Menu 2"),
            )
        )
      ],
    );
  }
}

