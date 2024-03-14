import 'package:flutter/material.dart';
import '../../theme.dart';
import 'ConstPlants.dart';
import 'myStack.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage("assets/images/horizontal_logo.png"),height: 50,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("  Hello chegue!",style: TextStyle(
                fontSize: 10
              ),),
              Text("  What are you looking for ?",style: TextStyle(
                fontSize: 13,
              ),),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.background,


                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "search for plants..",
                            hintStyle: TextStyle(
                              color: AppTheme.lightText,
                              fontFamily: "assets/fonts/Poppins-Regular.ttf",
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.search,color: AppTheme.lightText,),
                            suffixIcon: Icon(Icons.mic,color: Color(0xff868889),)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(onPressed: (){

                      }, icon: ImageIcon(AssetImage("assets/images/icons/filter.png"),color: AppTheme.green_1,)),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.green_3,),
                width:double.infinity,height: 200,
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(children: [
                    Image.asset("assets/images/aloe-vera.png",width:120),
                  SizedBox(width: 5,),
                  Column(
                    children: [SizedBox(height: 40),
                    Text('''Asplenium
Houseplant ''',style: TextStyle(
                         color: AppTheme.darkText,
                        fontWeight: FontWeight.w900,
                        fontSize: 16),),
                    Text('''Lorem ipsum dolor sit amet, consetetur 
sadipscing elitr, sed diam nonumy ''',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),),
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            color: AppTheme.orange,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: const Text(
                            "Read more",
                              style: TextStyle(color: Colors.white, fontSize: 13.0),
                            ),
                          ),
                        ),
                      ),

                  ],)]
                                ),
                ),),
              MyStack("Know about plants"),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:plant1.length,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Stack(
                      children: [
                        Container(

                          width: 150,
                          height: 150,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(plant1[index]),
                                  fit: BoxFit.fill)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,)
                  ],
                ))
          ),
              MyStack("Popular plants"),
              Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:plant2.length,
                      itemBuilder: (BuildContext context, int index) => Row(
                        children: [
                          Stack(
                            children: [
                              Container(

                                width: 150,
                                height: 180,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(plant2[index]),
                                        fit: BoxFit.fill)
                                ),
                              ),
                              Positioned(bottom:10,child: Row(
                                children: [ Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(children: [
                                                                  Text("Fits well",style: TextStyle(
                                      color: AppTheme.darkText,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14
                                                                  ),),
                                      Text('''Peperomia ''',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16
                                      ),), Text('''Houseplant ''',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16
                                      ),),
                                    ],),

                                  ),Container(
                                  width: 20,
                                    height: 30,
                                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:Colors.white60,


                  ),

                                    child: Text(" > ",style:TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),),

                  ),
                                ],
                              ))
                            ],
                          ),
                          SizedBox(width: 10,)
                        ],
                      ))
              ),              MyStack("Common FAQs"),        Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:plant1.length,
                      itemBuilder: (BuildContext context, int index) => Row(
                        children: [
                          Stack(
                            children: [
                              Container(

                                width: 150,
                                height: 150,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(plant1[index]),
                                        fit: BoxFit.fill)
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,)
                        ],
                      ))
              ),

            ],
          ),
        ),
      ),
    );
  }
}
