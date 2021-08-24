import 'dart:io';

import 'package:bronco_trucking/di/api/api_provider.dart';
import 'package:bronco_trucking/di/api/base_api_provider.dart';
import 'package:bronco_trucking/models/post.dart';
import 'package:bronco_trucking/di/api/api_client.dart';

export 'base_api_provider.dart' hide ProtectedBase;

abstract class APIInterface {
  Future<Response<List<Post>>> getPosts();

  Future<Response<Object>> uploadFile(String path, File file);
}

class APIProvider extends APIMethodProvider implements APIInterface {
  @override
  Future<Response<List<Post>>> getPosts() =>
      getMethod(ApiClient.post, decoder: (date) {
        List<Post> list = [];
        if (date != null && date is List && date.isNotEmpty) {
          for (int i = 0; i < date.length; i++) {
            list.add(Post.fromJson(date[i] as Map<String, dynamic>));
          }
          return list;
        } else {
          return [];
        }
      });

  @override
  Future<Response<Object>> uploadFile(String path, File file) {
    final form = FormData({
      'file': MultipartFile(file, filename: 'avatar.png'),
    });
    return postMethod(path, form);
  }
}
