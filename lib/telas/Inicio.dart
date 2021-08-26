import 'package:flutter/material.dart';
import 'package:youtube/engine/API.dart';
import 'package:youtube/models/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {
  final String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String query) {
    API api = API();

    print("query= $query");
    return api.pesquisar(query);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data!;
                    Video video = videos[index];

                    return GestureDetector(
                      child: Column(
                        children: [
                          Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(video.imagem)))),
                          ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal))
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(height: 2, color: Colors.grey),
                  itemCount: snapshot.data!.length);
            } else {
              return Center(child: Text("Nenhum video para exibir"));
            }
        }
      },
    );
  }
}
