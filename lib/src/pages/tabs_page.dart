import 'package:flutter/material.dart';
import 'package:noticias_app/src/pages/navegacion_page.dart';
import 'package:noticias_app/src/pages/tab1_pages.dart';
import 'package:noticias_app/src/pages/tab2_pages.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      ///ESSTO CREA UNA INSTANCIA GLOBAL DEL MODELO
      create: (BuildContext context) => NavegacionModel(),
      child: Scaffold(
        body: Paginas(),
        bottomNavigationBar: Navegacion(),
      ),
    );
  }
}

class Paginas extends StatelessWidget {
  const Paginas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //RECUPERANDO LA INSTANCIA DEL PROVIDER
    final navegacionModel = Provider.of<NavegacionModel>(context);
    return PageView(
      //este es para evitar que en el android se vea  La curvatura y muestr un fondo negro
      //physics: BouncingScrollPhysics(),
      //para evitar que el usuario pueda mover el pageview
      physics: NeverScrollableScrollPhysics(),
      //ESTE CONTROLER SE ACTIVARA CADA VEZ QUE SE REALICE UN CAMBIO
      controller: navegacionModel.pageSeleccionada,
      children: <Widget>[Tab1Page(), Tab2Page()],
    );
  }
}

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  //CREANDO EL GET DE LA PAGINA
  int get paginaActual => this._paginaActual;

  //CREANDO EL SET DE LA PAGINA
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOutQuad);

    //aca notificanos a los widgwts algun cambio prro
    notifyListeners();
  }

  //CREANDO EL GET DE pageSeleccionada
  PageController get pageSeleccionada => this._pageController;
}
