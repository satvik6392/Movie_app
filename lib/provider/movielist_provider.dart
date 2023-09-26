import 'dart:convert';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

// import 'package:flutter/material.dart';
// import 'dart:ffi';
// import 'dart:ffi';
import 'package:dio/dio.dart';


class MovieProvider extends ChangeNotifier {
  
  final Dio dio = Dio(BaseOptions(
  headers: {
    "X-RapidAPI-Key": "8bcb4a90ffmsh381eeca3522ca02p1affecjsnf4bfe397410b",
    "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com",
  }
  ));

  List<MovieModel?> movielist = [];
  String baseurl = "https://moviesdatabase.p.rapidapi.com";
  List<String> urls = ["https://moviesdatabase.p.rapidapi.com/titles"];
  int index = 0;


  Future<List<MovieModel?>> fetchData() async {
  // Simulate fetching data
  await Future.delayed(Duration(seconds: 0));
  return movielist; // Assuming movieList is your list of MovieModel objects
}


  Future<void> getmovies() async {
    if (index < 0) {
      index = 0;
    }
    if (index > urls.length) {
      index = movielist.length - 1;
    }
    try {
      final response = await dio.get(
        urls[index],
        // Uri.parse(urls[index]),
        // Urls[index],
        // headers: {
        //   "X-RapidAPI-Key":
        //       "8bcb4a90ffmsh381eeca3522ca02p1affecjsnf4bfe397410b",
        //   "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com",
        // },
      );
      // print("object");
      // print(response.data.toString());
      if (response.statusCode == 200) {
        var gh = jsonEncode(response.data);
        var value = jsonDecode(gh);
        print("success");
        movielist.clear();
        if (value["next"] != null &&
            int.parse(value['page'].toString()) >= urls.length) {
          String url = baseurl + value["next"].toString();
          urls.add(url);
        }
        // Urls[int.parse(data['page'].toString())] = data["next"].toString();
        for (Map i in value['results']) {
          movielist.add(MovieModel.fromJson(i));
        }
      }
    } catch (e,s) {
      print(e.toString());
      print(s.toString());
    }
    // print("coming here");
    notifyListeners();
  }

  Future<void> nextpage() async {
    if (index < urls.length) {
      // print("coming in next function");
      index++;
      await getmovies();
    }
  }

  Future<void> prevpage() async {
    if (index > 0) {
      // print("coming in prev function");
      index--;
      await getmovies();
    }
  }
}
