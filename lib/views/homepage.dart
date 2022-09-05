import 'package:flutter/material.dart';
import 'package:news_app_api/helper/widgets.dart';
import '../helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;



  Future<bool> getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {

    });
    return  _loading = false;
  }

  @override
  void initState() {
    _loading = true;

    super.initState();


    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
          onRefresh: getNews,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: newslist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
