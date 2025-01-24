import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BmiCalcualtor extends StatefulWidget{
  BmiCalcualtor(){super.key;}

  @override
  State<BmiCalcualtor> createState() => _BmiCalcualtorState();
}
int? bmi=null;
class _BmiCalcualtorState extends State<BmiCalcualtor> {
  double height=140;
  int temp=140;
  int age=50,weight=50;
  String? Gender=null;
  Color con_male=Color(0xFF1E1C32);
  Color conM_icon=Colors.greenAccent;
  Color conM_text=Colors.greenAccent;
  Color con_female=Color(0xFF1E1C32);
  Color conF_icon=Colors.greenAccent;
  Color conF_text=Colors.greenAccent;
  Color border_male=Color(0xFF1E1C32);
  Color border_female=Color(0xFF1E1C32);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(toolbarHeight: 80,
          title: Text("BMI Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),elevation: 40,centerTitle: true,backgroundColor: Color(0xFF080D20),
        ),backgroundColor: Color(0xFF080D20),
       body: Padding(
         padding: const EdgeInsets.only(top: 8.0),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [Expanded(flex: 1,child:  InkWell(onTap: (){
                  setState(() {


                   if(Gender==null) {

                       Gender = "Male";
                      border_male=Colors.greenAccent;



                   }
                   else{
                     if(Gender=="Male"){
                       Gender=null;
                       border_male=con_male;

                     }
                   }

                  });
                 },
                   child: Container(decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),color:con_male ,border: Border.all(color:border_male,width: 3)
                   ),
                     child:Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Icon(Icons.male,size:130,color:conM_icon ,),
                           Text("Male",style: TextStyle(fontWeight: FontWeight.bold,color:conM_text ),)

                         ],
                       ),
                     ) ,
                   ),
                 ),)
                  ,SizedBox(height: 12,width: 12,),
                   Expanded(flex:1,child: Container(decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),color:con_female ,border: Border.all(color: border_female,width: 3)
                   ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: InkWell(onTap: (){
                         setState(() {
                         if(Gender==null){
                           Gender="Female";
                            border_female=Colors.greenAccent;

                         }
                         else{
                           if(Gender=="Female"){  Gender=null;
                              border_female=con_female;
                           }

                         }
                         });
                       },
                         child: Column(
                           children: [
                             Icon(Icons.female,size: 130,color:conF_icon,),
                             Text("Female",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'BebasNeue-Regular',color: conF_text),)
                           ],

                         ),
                       ),
                     ),
                   ))
                 ],
               ),
             ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:Color(0xFF1E1C32)),
               child: Column(
                 children: [

                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left:160.0),
                         child: Text("Height",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
                       ),
                     ],
                   ),SizedBox(width:400 , height: 100,
                     child: Expanded(child:SliderTheme(data: SliderTheme.of(context).copyWith(trackHeight: 10,thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15)), child: Slider(value: height, onChanged:(values){
                       setState(() {
                         height=values;
                         temp=height.toInt();
                       });
                     },min: 21,max: 272.00,thumbColor: Colors.greenAccent,activeColor: Colors.greenAccent,))),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(bottom: 30),
                     child: Text("Height: $temp cm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                   )
                 ],

               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [Expanded(flex: 1,child:  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color(0xFF1E1C32)),
                 child: Column(
                   children: [
                     Text("Age \n  $age",style: TextStyle(
                         fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
                     ),),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 12.0),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 40,right: 10),
                             child: IconButton(onPressed: (){
                               if(age<100){
                                 setState(() {
                                   age++;
                                 });
                               }
                             }, icon: Icon(Icons.add,size: 35),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),),
                           ),
                           IconButton(onPressed: (){
                             if(age!=0){
                             setState(() {

                                 age--;

                             });}
                           }, icon: Icon(CupertinoIcons.minus,size: 35),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),)
                         ],
                       ),
                     )
                   ],
                 ),
               )),SizedBox(height: 12,width: 12,),
                 Expanded(flex:1,child:Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color(0xFF1E1C32)),child: Column(
                   children: [
                     Text("Weight \n     $weight",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 12.0),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 40,right: 10),
                             child: IconButton(onPressed: (){
                               setState(() {
                                 weight++;
                               });
                             }, icon: Icon(Icons.add,size: 35),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),),
                           ),
                           IconButton(onPressed: (){
                             if(weight!=0){
                               setState(() {
                                 weight--;
                               });
                             }
                           }, icon: Icon(CupertinoIcons.minus,size: 35,),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)),)
                         ],
                       ),
                     )

                   ],
                 ),) )

               ],
             ),
           ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(width:300,height:60,child: ElevatedButton(onPressed: (){
             if(Gender!=null) {
              double heighttemp=height/100;
              bmi=(weight/(heighttemp*heighttemp)).toInt();
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => secondPage()));
             }
               },child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 30),),style:ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),shadowColor: Colors.black,elevation: 10))),
             )
           ],
         ),
       ),
      ),
    );
  }

}
String classifyBMI(int bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return "Normal weight";
  } else if (bmi >= 25 && bmi < 29.9) {
    return "Overweight";
  } else {
    return "Obesity";
  }
}
class secondPage extends StatelessWidget {
  final String data = classifyBMI(bmi!); // Ensure bmi is not null before navigation

  secondPage() : super(key: Key('secondPage'));

  @override
  Widget build(BuildContext context) {
    // Determine the message based on BMI classification
    String extra;
    if (data == "Underweight") {
      extra = "Try gaining some weight.";
    } else if (data == "Normal weight") {
      extra = "You have a normal weight. Great job!";
    } else if (data == "Overweight") {
      extra = "Try losing some weight for a healthier life.";
    } else {
      extra = "Consider adopting a healthier lifestyle. Exercise regularly.";
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF080D20),
        elevation: 20,
      ),
      backgroundColor: Color(0xFF080D20),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF1E1C32),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "$data",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$bmi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$extra",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Recalculate",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 12,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
