import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias_app/src/models/news_models.dart';

final _URL_NEWS = "https://newsapi.org/v2";
final _API_KEY = "97220c1ca76241fdad11d622e569383a";

class NewsServive with ChangeNotifier {
  //CREAMOS LA LISTA DE ARTICULOS
  List<Article> headLine = [];
  NewsServive() {
    ///EL EL CONSTRUCTOR SE LLAMA LA SIGUIETE FUNCION
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = "$_URL_NEWS/top-headlines?country=mx&apiKey=$_API_KEY";
    final respuesta = await http.get(url);
    final newsResponse = newsResponseFromJson(respuesta.body);
    this.headLine.addAll(newsResponse.articles);
    notifyListeners();
  }
}
