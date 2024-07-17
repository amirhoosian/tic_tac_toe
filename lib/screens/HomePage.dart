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
  int equl = 0;
  bool gamehaseresult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnertitle = '';
  List<String> xoroList = ['','','','','','','','',''];
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
        actions: [
          IconButton(onPressed: (){refress();}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          getScore(),
          SizedBox(height: 20),
          ressetButton(),
          SizedBox(height: 30),
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
          return GestureDetector(onTap: (){taped(index);
          }, child: Container(width: 100, height: 100,child: Center(child: Text(xoroList[index], style: TextStyle(color: xoroList[index] == 'x' ? Colors.white : Colors.red, fontSize: 72),)), decoration: BoxDecoration(border: Border.all(color: Colors.grey)),));
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
        child: Text('$scoreO', style: TextStyle(color: Colors.white, fontSize: 28),),
      )],)),
      Expanded(child: Column(children: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('playe x', style: TextStyle(color: Colors.white, fontSize: 27),),
      ), Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$scoreX', style: TextStyle(color: Colors.white, fontSize: 28),),
      )],)),
    ],);
  }

  Widget ressetButton(){
    return Visibility(
      visible: gamehaseresult,
      child: OutlinedButton(onPressed: (){
        setState(() {
          gamehaseresult = false;
          refress();
        });
      },style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white, width: 2),
        backgroundColor: Colors.transparent,
      ), child: Text('$winnertitle, play agin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }


  void taped(int index) {
    if(gamehaseresult){
      return;
    }

    setState(() {
      if(xoroList[index] != '')
        return;
      if(istrun){
        xoroList[index] = 'o';
        equl++;
      }else{
        xoroList[index] = 'x';
        equl++;
      }
      istrun = !istrun;
      chekeWinner();
    });
  }

  void chekeWinner() {
    if(xoroList[0] == xoroList[1] && xoroList[0] == xoroList[2] && xoroList[0] != ''){
      setResult(xoroList[0], 'winner is'+ xoroList[0]);
      return;
    }

    if(xoroList[3] == xoroList[4] && xoroList[3] == xoroList[5] && xoroList[3] != ''){
      setResult(xoroList[3], 'winner is'+ xoroList[3]);
      return;
    }

    if(xoroList[6] == xoroList[7] && xoroList[6] == xoroList[8] && xoroList[6] != ''){
      setResult(xoroList[6], 'winner is'+ xoroList[6]);
      return;
    }
    if(xoroList[0] == xoroList[3] && xoroList[0] == xoroList[6] && xoroList[0] != ''){
      setResult(xoroList[0], 'winner is'+ xoroList[0]);
      return;
    }
    if(xoroList[1] == xoroList[4] && xoroList[1] == xoroList[7] && xoroList[1] != ''){
      setResult(xoroList[1], 'winner is'+ xoroList[1]);
      return;
    }
    if(xoroList[2] == xoroList[5] && xoroList[2] == xoroList[8] && xoroList[2] != ''){
      setResult(xoroList[2], 'winner is'+ xoroList[2]);
      return;
    }
    if(xoroList[0] == xoroList[4] && xoroList[0] == xoroList[8] && xoroList[0] != ''){
      setResult(xoroList[0], 'winner is'+ xoroList[0]);
      return;
    }
    if(xoroList[2] == xoroList[4] && xoroList[2] == xoroList[6] && xoroList[2] != ''){
      setResult(xoroList[2], 'winner is'+ xoroList[2]);
      return;
    }

    if(equl == 9){
      setResult('', 'equl');
      return;
    }

  }

  void refress(){
    setState(() {
      for(int i= 0; i < xoroList.length; i++){
        xoroList[i] = '';
      }
    });
  equl = 0;
  }

  void setResult(String winner, String title){
    setState(() {
      gamehaseresult = true;
      winnertitle = title;
      if(winner == 'o'){
        scoreO++;
        return;
      }else if(winner == 'x'){
      scoreX++;
      return;
      }else{
      scoreO++;
      scoreX++;
      return;
      }

    });
  }

}
