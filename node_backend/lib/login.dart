import 'package:flutter/material.dart';
import 'package:node_backend/home.dart';
import 'package:node_backend/services/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pwd = TextEditingController();
  bool hidepassword = true;

  Future<void> login() async {
    String username = user.text.trim(); //used to remove extra spaces
    String password = pwd.text;

    var data = {"username": username, "password": password};

    var result = await Api.login(data);

    if (!mounted) return;
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Scuessfully"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid UserName or Password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        title: const Text(
          "Login Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 400,
            width: 350,

            child: Card(
              color: Colors.white,
              elevation: 10,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Image.asset("assets/logo.png",
                    width: 60,
                    height: 60),
                    const SizedBox(height: 20),
                    // const Icon(Icons.lock, size: 60, color: Colors.blue),

                    const Text(
                      "Welcome User",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: "Enter UserName",
                        prefixIcon: Icon(Icons.person),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextField(
                      controller: pwd,
                      obscureText: hidepassword,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(hidepassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                              onPressed: () {
                          setState(() {
                            hidepassword = !hidepassword;
                          });
                        },
                        ),
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      // width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: login,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            246,
                            247,
                            245,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        child: const Text(
                          "Login",

                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.blue,
        child: const Center(
          child: Text("Connect Lap & mobile in same network\n"
           "      User name: san, Pwd: san@123",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
