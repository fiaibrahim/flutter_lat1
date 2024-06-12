import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  const Text ('Flutter Basic', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          elevation: 3,
          backgroundColor: Color.fromARGB(255, 1, 118, 5),
          actions: const[
            Icon(Icons.person, color: Colors.white,),
            SizedBox(width: 10,),
            Icon(Icons.settings, color: Colors.white,),
            SizedBox(width: 10,),
          ],
          leading: const Icon(Icons.menu, color: Colors.white,),
        ),
        body:Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(16),
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 123, 189, 150),
                  borderRadius: BorderRadius.circular(20),
                ),
                  child: Image.network('https://img.freepik.com/free-photo/pork-meatballs-dark-surface_1150-43612.jpg?t=st=1717473329~exp=1717476929~hmac=f440c4bcc6aae9ca7ef5dc685f45667e33f29c8af5f91ad7dd9b0731adb0636c&w=996'),
                ),
            ),
                  Image.asset('assets/images/img1.jpg'),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/img2.jpg'),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}