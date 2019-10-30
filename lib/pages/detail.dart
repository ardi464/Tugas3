import 'package:flutter/material.dart';
import 'package:tugas3/models/olahraga.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final Olahraga data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                title: Text(
                  data.judul,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: data.id,
                    child: FadeInImage(
                      image: AssetImage(data.img),
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/images/loading.gif'),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 5,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    data.sub,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
