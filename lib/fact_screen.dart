import 'package:flutter/material.dart';
import 'package:flutter_app/api_call.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<String?>(
            future: ApiCall().getRandomFact(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Text('No fact found');
                }
                return Text(
                  snapshot.data!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                );
              }
              return Container();
            }));
  }
}
