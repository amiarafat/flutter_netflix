import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobiflix/models/movie_model.dart';
import 'package:mobiflix/widgets/circular_clipper.dart';
import 'package:mobiflix/widgets/content_scroll.dart';

class MovieScreen extends StatefulWidget {

  final Movie movie;

  const MovieScreen({this.movie});


  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0,-50.0,0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child:ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow:Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: AssetImage(widget.movie.imageUrl),

                    )
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                  Image(
                    image: AssetImage("assets/images/netflix_logo.png"),
                    height: 60.0,
                    width: 150.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => print("Add to Favorites"),
                    icon: Icon(Icons.favorite_border),
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed:  ()=> print("Play Video") ,
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: ()=> print("Add to My List"),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: ()=> print("Share this Video"),
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.movie.categories.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text("⭐ ⭐ ⭐ ⭐",style: TextStyle(fontSize: 25.0),),
                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Year",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Year",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          widget.movie.country.toUpperCase(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Year",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Text(
                          '${widget.movie.length}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                  child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54
                    ),
                  ),
                  )
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: "ScreenShots",
            imageWidth: 250.0,
            imageHeight: 200.0,
          )
        ],
      ),
    );
  }
}
