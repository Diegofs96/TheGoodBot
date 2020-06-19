import 'package:the_good_bot/models/chat_message.dart';
import 'package:the_good_bot/respository/database_helper.dart';



class ChatMessageRepository{

// Instancia do Database Helper
  DatabaseHelper _databaseHelper;


  //Construtor
  ChatMessageRepository(){
    _databaseHelper = new DatabaseHelper();
  }
  
  //Listar todos
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


  //Criar
 Future<int> create(ChatMessage chatMessage) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "ChatMessage",
      chatMessage.toMap(),
    );
    return result;
  }

  //Inserir
  Future<int> createRaw(ChatMessage chatMessage) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO ChatMessage ( " +
        "  name , " +
        "  text , " +
        "  type ) " +
        "VALUES ( " +
        "    '${chatMessage.name}' , " +
        "    '${chatMessage.text}' , " +
        "    '${chatMessage.type}' " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

}