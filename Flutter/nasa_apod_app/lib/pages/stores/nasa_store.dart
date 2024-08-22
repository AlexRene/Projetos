import 'package:flutter/material.dart';
import 'package:nasa_apod_app/data/http/exceptions.dart';
import 'package:nasa_apod_app/data/models/pictures_model.dart';
import 'package:nasa_apod_app/data/repositories/pictures_repository.dart';

class NasaStore {
  final INasaImagesRepository repository;

  NasaStore({required this.repository});

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<NasaImages>> state =
      ValueNotifier<List<NasaImages>>([]);
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Future getNasaImages() async {
    isLoading.value = true;

    try {
      final result = await repository.getNasaImages();
      state.value = result;
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    isLoading.value = false;
  }
}
