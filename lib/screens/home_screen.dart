import 'package:flutter/material.dart';
// import 'package:movieapp/locators/locator.dart';
// import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/provider/movielist_provider.dart';
import 'package:provider/provider.dart';
// import 'dart:convert';
// import 'dart:collection';
// import 'package:dio/dio.dart';
// import '../models/movie_model.dart';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// MovieProvider movieProvider = MovieProvider();
  @override
  Widget build(BuildContext context) {
    // Locators().func();
    // return Scaffold(
    //   body: FutureBuilder<List<MovieModel?>>(
    //        future: getIt<MovieProvider>().fetchData(),
    //     builder: (BuildContext, snapshot) {
    //       if (getIt<MovieProvider>().movielist.isEmpty) {
    //         return Center(
    //           child: ElevatedButton(
    //               onPressed: () {
    //                 getIt<MovieProvider>().getmovies();
    //               },
    //               child: Text("Get Movies")),
    //         );
    //       } else {
    //         return Column(
    //           children: [
    //             Expanded(
    //               child: ListView.builder(
    //                 itemBuilder: (context, index) {
    //                   return Card(
    //                     child: Text(getIt<MovieProvider>()
    //                             .movielist[index]
    //                             ?.titleText
    //                             ?.text
    //                             ?.toString() ??
    //                         "Not Available"),
    //                   );
    //                 },
    //                 itemCount: getIt<MovieProvider>().movielist.length,
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       getIt<MovieProvider>().prevpage();
    //                     },
    //                     child: Text("Previous")),
    //                 // SizedBox(width: 20,),
    //                 ElevatedButton(
    //                     onPressed: () {
    //                       getIt<MovieProvider>().nextpage();
    //                     },
    //                     child: Text("Next")),
    //               ],
    //             ),
    //             const Padding(padding: const EdgeInsets.only(bottom: 50)),
    //           ],
    //         );
    //       }
    //     },
    //   ),
    // );

    // final movieProvider = Provider.of<MovieProvider>(context);
    // movieProvider.getmovies();
    return Scaffold(
      appBar: AppBar(
        title:const Text("Movies"),
      ),
      body: Consumer<MovieProvider>(builder: (BuildContext, m, child) {
        if (m.movielist.isEmpty) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  m.getmovies();

                },
                child: const Text("Get movies")),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(m.movielist[index]?.titleText?.text?.toString() ??
                          "Not Available"),
                    );
                  },
                  itemCount: m.movielist.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){m.prevpage();}, child: Text("Previous")),
                  // SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){m.nextpage();}, child: Text("Next")),
                ],
              ),
              const Padding(padding: const EdgeInsets.only(bottom: 50)),
            ],
          );
        }
      }),
    );
  }
}
