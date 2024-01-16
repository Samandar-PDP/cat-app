import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/cat_response.dart';
import '../bloc/cat_bloc.dart';
import '../bloc/cat_event.dart';
import '../bloc/cat_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<CatBloc>(context).add(OnGetCats());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocConsumer<CatBloc, CatState>(builder: (context, state) {
      if (state is Success) {
        return size.width > 500 ? _largeScreen(state.cats) : _smallScreen(
            state.cats);
      }
      return const Center(child: CircularProgressIndicator(),);
    }, listener: (context, state) {});
  }

  Widget _largeScreen(List<CatResponse> cats) {
    return Scaffold(
      appBar: AppBar(title: Text("Cat App")),
      body: Row(
        children: [
          Expanded(child: Image.network(
              'https://cdn.theatlantic.com/thumbor/vDZCdxF7pRXmZIc5vpB4pFrWHKs=/559x0:2259x1700/1080x1080/media/img/mt/2017/06/shutterstock_319985324/original.jpg',
              fit: BoxFit.cover)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  final cat = cats[index];
                  return Row(
                    children: [
                      Padding(padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 300,
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                                cat.url ?? "", fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text("${cat.width} x ${cat.height}")
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _smallScreen(List<CatResponse> cats) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: TextButton(
              onPressed: () {},
              child: const Text(
                "Back", style: TextStyle(color: Colors.blue),),
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
                background: Image.network(
                    'https://cdn.theatlantic.com/thumbor/vDZCdxF7pRXmZIc5vpB4pFrWHKs=/559x0:2259x1700/1080x1080/media/img/mt/2017/06/shutterstock_319985324/original.jpg',
                    fit: BoxFit.cover)
            ),
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              final cat = cats[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  foregroundImage: NetworkImage(cat.url ?? ""),
                ),
                title:     Text("${cat.width} x ${cat.height}"),
              );
            },
          )
        ],
      ),
    );
  }
}
