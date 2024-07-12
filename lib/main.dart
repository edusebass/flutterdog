import 'package:flutter/material.dart';
import 'api_service.dart';
import 'breed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breeds App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Breed>> futureBreeds;

  @override
  void initState() {
    super.initState();
    futureBreeds = ApiService().fetchBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breeds App'),
      ),
      body: Center(
        child: FutureBuilder<List<Breed>>(
          future: futureBreeds,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available');
            }

            List<Breed> breeds = snapshot.data!;
            return ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(breeds[index].imageUrl),
                    title: Text(breeds[index].name),
                    subtitle: Text(breeds[index].temperament),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
