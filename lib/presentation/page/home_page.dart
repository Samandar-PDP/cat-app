import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: TextButton(
              onPressed: () {},
              child: const Text("Back",style: TextStyle(color: Colors.blue),),
            ),
            backgroundColor: Colors.black,
            expandedHeight: 280.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Cat Name"),
              expandedTitleScale: 1.1,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 72, vertical: 16),
              background: Image.network('https://cdn.theatlantic.com/thumbor/vDZCdxF7pRXmZIc5vpB4pFrWHKs=/559x0:2259x1700/1080x1080/media/img/mt/2017/06/shutterstock_319985324/original.jpg',fit: BoxFit.cover,)
            ),
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context ,index) {
              return Text(index.toString());
            },
          )
        ],
      ),
    );
  }
}
