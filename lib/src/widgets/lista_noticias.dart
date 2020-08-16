import 'package:flutter/material.dart';
import 'package:noticias_app/src/models/news_models.dart';
import 'package:noticias_app/src/themes/thema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> articulos;
  const ListaNoticias({Key key, this.articulos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articulos.length,
        itemBuilder: (BuildContext context, int index) {
          return Noticia(
            articulos: articulos[index],
            index: index,
          );
        });
  }
}

class Noticia extends StatelessWidget {
  const Noticia({
    Key key,
    @required this.articulos,
    @required this.index,
  }) : super(key: key);

  final Article articulos;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _tarjetaTopBar(noticia: articulos, index: index),
        _tarjetaTitulo(noticia: articulos, index: index),
        _noticia(noticia: articulos),
        _tarjetaBody(noticia: articulos),
        Divider(),
        _tarjetaBotnones()
      ],
    );
  }

  Container _tarjetaTopBar({@required Article noticia, @required int index}) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 6.0, left: 2.0),
      child: Row(
        children: <Widget>[
          new Text(
            '${index + 1}',
            style: TextStyle(color: miTema.accentColor),
          ),
          new Text('${noticia.source.name}'),
        ],
      ),
    );
  }

  _tarjetaTitulo({Article noticia, int index}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        noticia.title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _noticia({Article noticia}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage("assets/img/giphy.gif"),
                    image: NetworkImage(noticia.urlToImage))
                : Image(image: AssetImage("assets/img/no-image.png"))),
      ),
    );
  }

  Widget _tarjetaBody({Article noticia}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      child: Text(
        noticia.description ?? "NO HAY DESCRIPCION",
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _tarjetaBotnones() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RawMaterialButton(
              child: Icon(Icons.star_border),
              fillColor: miTema.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {}),
          SizedBox(
            height: 10.0,
            width: 10.0,
          ),
          new RawMaterialButton(
              child: Icon(Icons.more),
              fillColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {})
        ],
      ),
    );
  }
}
