import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/model/movie.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit:BoxFit.cover,
                ),
                // color: Colors.grey,
              ),
            ),
            Icon(
              Icons.play_circle_outline,size:100,
              color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          height: 30,
        )
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:
      Row(
        children: [
          MoviePoster(poster:movie.images[0].toString()),
          SizedBox(width: 16,),
          Expanded(
            child: MovieDetailsHeader(movie:movie),
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;


  const MoviePoster({Key? key,required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(poster),
              fit:BoxFit.cover,
            ),

          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text("${movie.year} . ${movie.genre}".toUpperCase(),style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.indigoAccent,
        ),),
        Text("${movie.title}",style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
        ),children: <TextSpan>[
          TextSpan(
              text: movie.plot
          ),
          TextSpan(
              text: "more...",
              style: TextStyle(
                color: Colors.indigoAccent,
              )
          )
        ])),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MovieField(field:"Cast",value:movie.actors),
          MovieField(field:"Directors",value:movie.director),
          MovieField(field:"Awards",value:movie.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ",style: TextStyle(
          color: Colors.black38,
          fontSize: 12,fontWeight: FontWeight.w300,
        ),),
        Expanded(
          child: Text(value,style: TextStyle(
            color: Colors.black,
            fontSize: 12,fontWeight: FontWeight.w300,
          ),),
        ),

      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPosters({Key? key,required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("More Movie Posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black26,
            ),
          ),
          Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index) =>SizedBox(width: 8,),
              itemCount: posters.length,
              itemBuilder: (context,index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                        fit: BoxFit.cover),

                  ),
                ),
              ),),
          )
        ],
      ),
    );
  }
}