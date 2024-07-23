import 'package:flutter/material.dart';

class Tugas extends StatefulWidget {
  const Tugas({Key? key}) : super(key: key);

  @override
  State<Tugas> createState() => _TugasState();
}

class _TugasState extends State<Tugas> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      title: const Text(
        'selamat datang di website saya',
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 3,
      backgroundColor: const Color.fromARGB(255, 124, 0, 161),
      actions: const [
        Icon(Icons.logout, color: Colors.white),
        SizedBox(width: 10),
        Icon(Icons.person, color: Colors.white),
      ],
      leading: const Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      width: 300,
                      height: 300,
                      color: Color.fromARGB(255, 13, 238, 230),
                      child: Image.asset('assest/images/p1.jpg'),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      width: 300,
                      height: 300,
                      color: Color.fromARGB(255, 13, 238, 230),
                    ),
                  ],
                );
              },
              itemCount: 10,
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 116, 0, 151),
                    ),
                    title: Text('judul'),
                    subtitle: Text('asik'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          color: Color.fromARGB(255, 243, 13, 189),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.stop),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
     ),
);
}
}