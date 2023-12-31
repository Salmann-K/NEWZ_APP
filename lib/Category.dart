import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model.dart';

class CategoryPage extends StatefulWidget {
  final String Query;

  const CategoryPage({super.key, required this.Query});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  bool isLoading = true;
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];

  getNewsByQuery(String query) async {
    String url = "";
    if(query=="Top News" || query=='India'){
         url= "https://newsapi.org/v2/top-headlines?country=in&apiKey=f5efee8feb9548fcaa4e40db871be3e6";
    }else{
      url ="https://newsapi.org/v2/everything?q=$query&apiKey=f5efee8feb9548fcaa4e40db871be3e6";
    }
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsByQuery(widget.Query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text("NEWZ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body:
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin : const EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
        
                    Text(widget.Query, style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 28
                    ),),
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newsModelList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 1.0,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(newsModelList[index].newsImg ,fit: BoxFit.fitHeight, height: 230,width: double.infinity, )),
        
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
                                              end: Alignment.bottomCenter
                                          )
                                      ),
                                      padding: const EdgeInsets.fromLTRB(15, 15, 10, 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newsModelList[index].newsHead,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(newsModelList[index].newsDes.length > 50 ? "${newsModelList[index].newsDes.substring(0,55)}...." : newsModelList[index].newsDes , style: const TextStyle(color: Colors.white , fontSize: 12)
                                            ,)
                                        ],
                                      )))
                            ],
                          )),
                    );
                  }),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text("SHOW MORE")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
