import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_flutter_project/services/service_locator.dart';
import 'package:sample_flutter_project/services/storage/storage_service.dart';

class UserTokenViewModel extends ChangeNotifier {
  final StorageService _storageService = serviceLocator<StorageService>();

  String _token = '';

  String get myToken => _token;

  Future<void> loadData() async {
    final token = await _storageService.getToken();
    _prepareToken(token);
    ChangeNotifier();
  }

  void _prepareToken(String token) {
    _token = token;
  }
}
