import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
final counterStateProvider = StateProvider<int>((ref) => 0 ??  0);

class MyHomePage extends ConsumerWidget{
  const MyHomePage({super.key});

  @override
  Widget build (BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "Value: $value",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(onPressed: () =>
              ref.read(counterStateProvider.state).state++,
            child: const Icon(Icons.add, color: Colors.black87,),
            ),
            // Expanded(child: Container()),
            FloatingActionButton(onPressed: () =>
            ref.read(counterStateProvider.state).state--,
              child: const Icon(Icons.remove, color: Colors.black87,),
            ),
          ],
        ),
      ),
    );
  }
}
