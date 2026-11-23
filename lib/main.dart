import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'album.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlbumPage(),
    );
  }
}

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> futureAlbums;

  // Stores the currently selected album
  Album? selectedAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  Future<List<Album>> fetchAlbums() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Explorer'),
      ),
      body: Column(
        children: [
          // Selected album details
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: selectedAlbum == null
                ? const Text(
                    'No Album Selected',
                    style: TextStyle(fontSize: 18),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected Album',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Album ID: ${selectedAlbum!.id}'),
                      Text('Title: ${selectedAlbum!.title}'),
                    ],
                  ),
          ),

          // Album list
          Expanded(
            child: FutureBuilder<List<Album>>(
              future: futureAlbums,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.hasData) {
                  final albums = snapshot.data!;

                  return ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      final album = albums[index];

                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${album.id}'),
                        ),
                        title: Text(album.title),

                        // Select an album when tapped
                        onTap: () {
                          setState(() {
                            selectedAlbum = album;
                          });
                        },
                      );
                    },
                  );
                }

                return const Center(
                  child: Text('No albums found'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
