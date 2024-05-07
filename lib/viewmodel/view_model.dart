import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_walls/models/api_model.dart';
import 'package:new_walls/viewmodel/constants.dart';

class ViewModel extends ChangeNotifier {
  int _progressStatus = 0;

  int get progressStatus => _progressStatus;

  setProgressStatus(int value) {
    _progressStatus += value;
    notifyListeners();
  }

  List<ApiModel> homeList = [];

  List<ApiModel> architectureList = [];

  List<ApiModel> artList = [];
  List<ApiModel> blackList = [];
  List<ApiModel> cityscapeList = [];
  List<ApiModel> colorsList = [];
  List<ApiModel> mountainList = [];
  List<ApiModel> patternList = [];
  List<ApiModel> skyList = [];
  List<ApiModel> textureList = [];
  List<ApiModel> waterList = [];
  List<ApiModel> premiumList = [];
  Future<void> fetchData() async {
    try {
      await getUrl(url: Constants.premiumUrl, list: premiumList);
      await getUrl(url: Constants.homeUrl, list: homeList);
      setProgressStatus(10);
      await getUrl(url: Constants.architectureUrl, list: architectureList);
      setProgressStatus(10);
      await getUrl(url: Constants.artUrl, list: artList);
      setProgressStatus(10);
      await getUrl(url: Constants.blackUrl, list: blackList);
      setProgressStatus(10);
      await getUrl(url: Constants.cityscapeUrl, list: cityscapeList);
      setProgressStatus(10);
      await getUrl(url: Constants.colorsUrl, list: colorsList);
      setProgressStatus(10);
      await getUrl(url: Constants.mountainUrl, list: mountainList);
      setProgressStatus(10);
      await getUrl(url: Constants.patternUrl, list: patternList);
      setProgressStatus(10);
      await getUrl(url: Constants.skyUrl, list: skyList);
      setProgressStatus(10);
      await getUrl(url: Constants.textureUrl, list: textureList);
      setProgressStatus(10);
      await getUrl(url: Constants.waterUrl, list: waterList);
    } catch (error) {
      debugPrint("Error fetching data: $error");
    }
  }

  Future<List<ApiModel>> getUrl(
      {required String url, required List<ApiModel> list}) async {
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      list.clear();
      for (Map i in data) {
        list.add(ApiModel.fromJson(i));
      }
    }
    return list;
  }

  List<ApiModel> combinedList = [];

  void createCombinedList() {
    combinedList.addAll(architectureList);

    combinedList.addAll(artList);

    combinedList.addAll(blackList);

    combinedList.addAll(cityscapeList);

    combinedList.addAll(colorsList);

    combinedList.addAll(mountainList);

    combinedList.addAll(patternList);

    combinedList.addAll(skyList);

    combinedList.addAll(textureList);

    combinedList.addAll(waterList);
  }

  List<List<ApiModel>> get categoryLists => [
        architectureList,
        artList,
        blackList,
        cityscapeList,
        colorsList,
        mountainList,
        patternList,
        skyList,
        textureList,
        waterList,
      ];
}
