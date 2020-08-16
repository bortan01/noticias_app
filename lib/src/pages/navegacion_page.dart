import 'package:flutter/material.dart';
import 'package:noticias_app/src/pages/tabs_page.dart';
import 'package:provider/provider.dart';

class Navegacion extends StatelessWidget {
  const Navegacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///REECUPRAMOS LA INSTANCIA DE NAVEGACION MODEL HEREDADA DEL PADRE
    final navegacionModel = Provider.of<NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (int indice) {
          navegacionModel.paginaActual = indice;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("para ti")),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), title: Text("Encabezados")),
        ]);
  }
}
