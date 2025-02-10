// lib/main.dart
import 'package:flutter/material.dart';
import 'package:motel_listing_app/services/api_service.dart';
import 'package:provider/provider.dart';
import 'providers/motel_provider.dart';
import 'screens/motel_list_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ApiService apiService = ApiService(http.Client());
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motel Listing App',
      home: ChangeNotifierProvider(
        create: (ctx) => MotelProvider(apiService)..fetchMotels(),
        child: MotelListScreen(),
      ),
    );
  }
}
