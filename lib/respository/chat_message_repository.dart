import 'package:the_good_bot/models/chat_message.dart';
import 'package:the_good_bot/respository/database_helper.dart';



class ChatMessageRepository{

// Instancia do Database Helper
  DatabaseHelper _databaseHelper;


  //Construtor
  ChatMessageRepository(){
    _databaseHelper = new DatabaseHelper();
  }
  

  Future<List<ChatMessage>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "ChatMessage",
      columns: [
        "name",
        "text",
        "type"
      ],
    );

    // Converte a lista de Maps para Lista de Cursos
    List<ChatMessage> listaCursos = new List<ChatMessage>();
    for (Map i in result) {
      listaCursos.add(ChatMessage.fromMap(i));
    }

    return listaCursos;

  }

}