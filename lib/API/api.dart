
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_practise_1/Models/Movie.dart';
import 'package:flutter_practise_1/constants.dart';

class Api {
  static const _popularUrl = 
            'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';
  static const _topratedUrl = 
            'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _trendingnowUrl = 
            'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apiKey}';
  static const _trendingweekUrl = 
            'https://api.themoviedb.org/3/trending/all/week?api_key=${Constants.apiKey}';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      
    }else{
      throw Exception('Something Error Happened');
    }
  }
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topratedUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      
    }else{
      throw Exception('Something Error Happened');
    }
  }
  Future<List<Movie>> getTrendingTodayMovies() async {
    final response = await http.get(Uri.parse(_trendingnowUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      
    }else{
      throw Exception('Something Error Happened');
    }
  }
  Future<List<Movie>> getTrendingWeekMovies() async {
    final response = await http.get(Uri.parse(_trendingweekUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      
    }else{
      throw Exception('Something Error Happened');
    }
  }
}