import 'package:flutter/material.dart';
import 'package:tugas3/data/data_olahraga.dart';
import 'package:tugas3/pages/detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kumpulan Olahraga',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridPage(),
    );
  }
}

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  var data = DataOlahraga.olahraga;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
        ),
        itemCount: data.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    DetailPage.routeName,
                    arguments: data[i]
                  );
                },
                borderRadius: BorderRadius.circular(5.0),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0)),
                            child: Hero(
                              tag: data[i].id,
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                                image: AssetImage(data[i].img),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.width * 0.41,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            child: Container(
                              color: Colors.black54,
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              width: 170,
                              child: Text(
                                data[i].judul,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
