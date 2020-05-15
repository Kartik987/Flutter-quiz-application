import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Questionbank  obj=Questionbank();

void main() => runApp(Quizller());

class Quizller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
           appBar: AppBar(
             title:Text('Quizeller'),
             backgroundColor: Colors.red,
           ),
          body:SafeArea(
            
            child:Padding(
              
              padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Quizpage(), 
            
            
            ) ,
            
            )

      ),
      
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
List<Icon> scoreKeeper = [];
int count=0;
int question=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

   Expanded (
    child: Padding(padding:EdgeInsets.all(10.0),
    child: Center(
      child:Text(
        'Your Score is $count',
        style: TextStyle(
fontSize: 15.0,
color: Colors.white,
        ),
      
        ),
     
     ),
    )

   ),
        Expanded(
          flex: 5,
          child:Padding(
            padding:EdgeInsets.symmetric(vertical:0.0),
            child:Center(
              child:Text(
                obj.getquestion(),
                style: TextStyle(
                  fontSize:25.0,
                  color:Colors.white,
                ),

              )
              
               )
             ) 
        ),

       Expanded(
         child:Padding(
           padding:EdgeInsets.all(5.0),
           child:FlatButton(onPressed: (){
             
                 setState(() {
                   
                   if(obj.getanswer()==true)
                 {

             scoreKeeper.add(Icon(
               Icons.check,
               color: Colors.green,

             ));
             count++;
}
else{
   scoreKeeper.add(Icon(
               Icons.clear,
               color: Colors.red,

             ));
}
                obj.next();

                if(obj.find()){
                  
                  Alert(context: context, title: "No More Questions", desc: "You have finished the quiz.").show();
                 
                }
              
                 }
                 );
           },
           color: Colors.green,
           child:Text(
             'True',
             style: TextStyle(
               fontSize:18.0,
               color:Colors.white
             ),
           ) ,

           
           
           )
           
           )
         
          ),

          Expanded(
         child:Padding(
           padding:EdgeInsets.all(5.0),
           child:FlatButton(onPressed: (){
            setState(() {
                   if(obj.getanswer()==false)
                 {
             scoreKeeper.add(Icon(
               Icons.check,
               color: Colors.green,

             ));
             count++;
}else{
   scoreKeeper.add(Icon(
               Icons.clear,
               color: Colors.red,

             ));
}
                 obj.next();
                 
                  if(obj.find()){
                  Alert(context: context, title: "No More Questions", desc: "You have finished the quiz.").show();
                 
                }
                 
                 });
   
                   
           },
           color: Colors.red,
           child:Text(
             'False',
             style: TextStyle(
               fontSize:18.0,
               color:Colors.white
             ),
           ) ,
           
           )
           
           
           )
         
          ),
         Expanded(
           
           child: Row(
             children:scoreKeeper,
           )
           
           
           )

      ],
        
    );
  }
}
