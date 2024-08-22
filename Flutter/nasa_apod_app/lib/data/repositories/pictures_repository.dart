import 'dart:convert';

import 'package:nasa_apod_app/data/http/exceptions.dart';
import 'package:nasa_apod_app/data/http/http_client.dart';
import 'package:nasa_apod_app/data/models/pictures_model.dart';
import 'package:nasa_apod_app/key.dart';

abstract class INasaImagesRepository {
  Future<List<NasaImages>> getNasaImages();
}

class NasaImagesRepository implements INasaImagesRepository {
  final IHttpClient client;

  NasaImagesRepository({required this.client});

  @override
  Future<List<NasaImages>> getNasaImages() async {
    final response = await client.get(url: request);

    if (response.statusCode == 200) {
      final List<NasaImages> images = [];

      final List<dynamic> body = jsonDecode(response.body);

      for (var element in body) {
        final NasaImages nasaimg = NasaImages.fromJson(element as String);
        images.add(nasaimg);
      }

      return images;
    } else if (response.statusCode == 404) {
      throw NotFoundException('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar as imagens');
    }
  }
}
