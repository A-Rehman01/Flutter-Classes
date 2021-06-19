import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
   var result = '';
    
    Widget numBtn (var num) {
    return Container(
      child: ElevatedButton(onPressed: (){
        setState(() {
          result = result + num;
        });
      },
          child: Text(num,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
        ),
      height: 80,
      width: 80,
        );
    }
    Widget clearBtn (var num) {
    return Container(
      child: ElevatedButton(onPressed: (){
       setState(() {
        result='';
        });
      },
          child: Text(num,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
        ),
      height: 80,
      width: 80,
        );
      
    }

Widget ouputBtn (var num) {
    return Container(
      child: ElevatedButton(onPressed: (){
         Parser p = Parser();
         Expression exp = p.parse(result);
         ContextModel cm = ContextModel();
         double eval = exp.evaluate(EvaluationType.REAL, cm);
         setState(() {
        result=eval.toString();
        });
      },
          child: Text(num,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red
        ),
      height: 80,
      width: 80,
        );
      
    }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding( padding: EdgeInsets.only(bottom: 10), child: Text(result,style: TextStyle(fontSize: 20),textAlign: TextAlign.center ,)),
            decoration: BoxDecoration(border: Border(bottom: BorderSide( 
              color: Colors.grey,
              // width: 1.0,
              ),
           )
        ),
            
            ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            numBtn('1'),
            numBtn('2'),
            numBtn('3'),
            numBtn('/'),
          ],),
          SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
            numBtn('4'),
            numBtn('5'),
            numBtn('6'),
            numBtn('*'),
          ],),
                    SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            numBtn('7'),
            numBtn('8'),
            numBtn('9'),
            numBtn('+'),
          ],),
                    SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            numBtn('0'),
            clearBtn('clear'),
            ouputBtn('='),
            numBtn('-'),
          ],)
        ],),
      ),
    );
  }
}