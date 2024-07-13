import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool istrun = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(
          'TECTACTOE',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          getScore(),
          viewbuilder(),
          showTurn()
        ],
      )
    );
  }

Widget viewbuilder(){
    return  Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3
        ),
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(onTap: (){taped(index); setState(() {
            istrun = !istrun;
          });}, child: Container(width: 100, height: 100, decoration: BoxDecoration(border: Border.all(color: Colors.grey)),));
        },
      ),
    );
}

  Widget showTurn(){
  return Text(istrun ? 'TrunO' : 'TrunX', style: TextStyle(color: Colors.white, fontSize: 29),);
}

  Widget getScore(){
    return  Row(children: [
      Expanded(child: Column(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('playe O', style: TextStyle(color: Colors.white, fontSize: 27),),
      ), Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('0', style: TextStyle(color: Colors.white, fontSize: 28),),
      )],)),
      Expanded(child: Column(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('playe x', style: TextStyle(color: Colors.white, fontSize: 27),),
      ), Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('0', style: TextStyle(color: Colors.white, fontSize: 28),),
      )],)),
    ],);
  }

  taped(index) {
    print('$index');
  }
}
