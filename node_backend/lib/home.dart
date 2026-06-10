import 'package:flutter/material.dart';
import 'package:node_backend/create.dart';
import 'package:node_backend/delete.dart';
import 'package:node_backend/fetch.dart';
import 'package:node_backend/updated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD APP")),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
         
        children: [
          
          SizedBox(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateData()),
              );
            },
            child: const Text(
              "CREATE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            
          ),
          ),

          
        const SizedBox(height: 20),

        SizedBox(
          width: 220,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FetchData()),
              );
            },
            child: const Text("READ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
          
          const SizedBox(height: 20),
          SizedBox(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdatedScreen()),
              );
            },
            child: const Text("UPDATE",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          ),
          
          const SizedBox(height: 20),

          SizedBox(
            width: 220,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent
              ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeleteScreen()),
              );
            },
            child: const Text("DELETE",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          ),
          
        ],
      ),

      ),
      
    );
  }
}
