import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  List<String> navBarItem = ['Top News', "India", "World", "Finance", "Health"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "NEWZ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [
            //Search Container
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white12, borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if ((searchController.text).replaceAll(" ", "") == "") {
                        print("Blank search");
                      } else {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Search(searchController.text)));
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      ),
                      margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search Health"),
                    ),
                  )
                ],
              ),
            ),

            // Horizontal Navigation Bar

            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(navBarItem[index]);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        navBarItem[index],
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            //Slider
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: CarouselSlider(
                  options: CarouselOptions(
                      height: 200, autoPlay: true, enlargeCenterPage: true),
                  items: items.map((item) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Stack(
                            children: [

                              ClipRRect(
                                borderRadius : BorderRadius.circular(10),
                                child: Image.asset("assets/image/news.jpg", fit: BoxFit.fitHeight, height: double.infinity,),
                              ),

                              Positioned(
                                left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black12.withOpacity(0),
                                            Colors.black
                                          ],
                                            begin: Alignment.topCenter,
                                            end : Alignment.bottomCenter
                                        )
                                      ),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                          child: Text("NEWS HEADLINE",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),))
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }).toList()),
            ),


            Container(
              child: Column(
                children: [

                  Container(
                    margin : EdgeInsets.fromLTRB(15,25,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("LATEST NEWS",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                        ),),
                      ],
                    ),
                  ),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset("assets/image/news.jpg")),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0),
                                              Colors.black
                                            ],
                                            begin: Alignment.topCenter,
                                            end : Alignment.bottomCenter
                                          )
                                        ),
                                        padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text("NEWS HEADLINE",
                                                style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                              ),

                                              Text("Blah BLAH BLAH",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                ),
                                              ),

                                            ],
                                          )))
                                ],
                              ),
                            ));
                      }),

                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent
                                ),
                                child: Text("Show More" , style: TextStyle(color: Colors.white,fontSize: 15),)
                            )
                          ],
                        ),
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final List items = [
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.yellowAccent
  ];
}
