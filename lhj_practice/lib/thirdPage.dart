import 'package:flutter/material.dart';
import 'package:lhj_practice/models/detailModel.dart';

class PageThird extends StatelessWidget {
  DetailModel model;
  PageThird({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.arrow_downward),
              Icon(Icons.more_horiz),
            ],
          )
        ],
        backgroundColor: Colors.grey[900],
        title: Column(
          children: [
            Text(
              this.model.title,
            ),
            Text(
              this.model.name,
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 50.0, bottom: 30.0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(this.model.img))),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    '999',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '유사곡',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                this.model.des,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
