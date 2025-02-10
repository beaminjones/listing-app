import 'package:flutter/material.dart';
import '../models/motel.dart';
import '../services/api_service.dart';

class MotelProvider with ChangeNotifier {
  final ApiService _apiService;

  MotelProvider(this._apiService);

  List<Motel> _motels = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Motel> get motels => _motels;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchMotels() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _motels = await _apiService.fetchMotels();
    } catch (e) {
      _errorMessage = "Erro ao carregar motéis. Tente novamente mais tarde.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
