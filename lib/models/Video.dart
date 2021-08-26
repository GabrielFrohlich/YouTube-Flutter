class Video {
  String id;
  String titulo;
  String imagem;
  String canal;
  String descricao;

  //Em vez de colocar os métodos como opcionais, mante-los como obrigatórios
  Video(this.id, this.titulo, this.imagem, this.canal, this.descricao); 

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video( //Passar os atributos sem o nome da propriedade
      json["id"]["videoId"],
      json["snippet"]["title"],
      json["snippet"]["thumbnails"]["high"]["url"],
      json["snippet"]["channelTitle"],
      json["snippet"]["description"],
    );
  }
}
