import 'package:flutter/material.dart';
import 'package:noticias_app/src/pages/tabs_page.dart';
import 'package:noticias_app/src/services/news_service.dart';
import 'package:noticias_app/src/themes/thema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //EL MULTI PROVIDER EES POR SI NECESITAMOS MAS DE UN PROVIDER
    return MultiProvider(
      //AHORA PODEMOS OCUAPR NUESTRO PROVIDER
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => new NewsServive(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: TabsPage(),
      ),
    );
  }
}
