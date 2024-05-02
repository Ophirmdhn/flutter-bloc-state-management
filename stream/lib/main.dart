import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Stream<int> countStream() async* {
    for(int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1)); // menambahkan waktu tunggu / delay 1 detik
      yield i; // melempar data ke dalam stream
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Apps"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder(
        stream: countStream(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                "Loading...",
                style: TextStyle(
                    fontSize: 32
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "${snapshot.data}",
                style: const TextStyle(
                    fontSize: 32
                ),
              ),
            );
          }
        },
      ),
    );
  }
}