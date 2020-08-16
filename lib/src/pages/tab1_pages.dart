import 'package:flutter/material.dart';
import 'package:noticias_app/src/services/news_service.dart';
import 'package:noticias_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key key}) : super(key: key);

  @override
  _Tab1PageState createState() => _Tab1PageState();
}

//EL AutomaticKeepAliveClientMixin ES PARA MANTENER EL ESTADO DEL WIDGET Y EVITAR QUE ESTE SE DESTRUYA
class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsService = Provider.of<NewsServive>(context);

    return Scaffold(
        body: (newsService.headLine.length == 0)
            ? Center(child: CircularProgressIndicator())
            : ListaNoticias(articulos: newsService.headLine));
  }

  @override
  // CON ESTO CONSEGUIMOS QUE SE MANTENGAEL ESTADO DE  LA APLICACION
  bool get wantKeepAlive => true;
}
