import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:test_demo/Models/movie_details_model.dart';
import 'package:test_demo/Models/moviesListingModel.dart';
import 'package:test_demo/Widgets/api_configration.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var moviesResultList = <ResultsList>[].obs;
  // var productionCompaniesList = <ProductionCompaniesList>[].obs;
  var generesList = <GenresDetailsList>[].obs;
  var detailsModelObject = MoviesDetailsModel().obs;
  Future<bool> movieListingMethod() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse('$movieListingUrl$apiKey'));
      var data = response.body;
      log('Get Response is $data');
      if (response.statusCode == 200) {
        MovieListingModel model =
            MovieListingModel.fromJson(jsonDecode(response.body));
        moviesResultList.value = model.results!;
        print('productionCompaniesList $moviesResultList');
        log('Response status is ${response.statusCode}');
        isLoading.value = false;
        return true;
      }
      return false;
    } catch (e) {
      isLoading.value = false;
      print('catch error ${e.toString()}');
      return false;
    }
  }
  //.................Movies Listing Details Method............................//

  Future<bool> movieListingDetailsMethod({required int movieId}) async {
    try {
      isLoading.value = true;
      var response =
          await http.get(Uri.parse('$movieDetailsUrl$movieId?$apiKey'));
      var data = response.body;
      log('Get Movie Details Response is $data');
      if (response.statusCode == 200) {
        MoviesDetailsModel model =
            MoviesDetailsModel.fromJson(jsonDecode(response.body));
        detailsModelObject.value = model;
        generesList.value = model.genres!;
        print('Generes etails List is getting >>$generesList');

        log('Movies details Response status is ${response.statusCode}');
        isLoading.value = false;
        return true;
      }
      return false;
    } catch (e) {
      isLoading.value = false;
      print('catch error ${e.toString()}');
      return false;
    }
  }
}
