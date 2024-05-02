import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData); // menambahkan default parameter

  int initialData;

  void tambahData() {
    emit(state + 1);
  }

  void kurangiData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {

  CounterCubit myCounter = CounterCubit(initialData: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Apps"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Center(
                child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(
                      fontSize: 50
                  ),
                ),
              );
            }
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.kurangiData();
                  },
                  icon: const Icon(Icons.remove)
              ),
              IconButton(
                  onPressed: () {
                    myCounter.tambahData();
                  },
                  icon: const Icon(Icons.add)
              ),
            ],
          )
        ],
      ),
    );
  }
}
