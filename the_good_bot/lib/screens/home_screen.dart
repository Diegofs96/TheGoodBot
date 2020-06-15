import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

import 'package:the_good_bot/shared/globals.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/good-bot-tdiavi-bf5f6a4195cb.json")
            .build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.portuguese);

    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });

    //print(aiResponse.getListMessage()[0]["text"]["text"][0]);
  }

  final messageInsert = TextEditingController();
  List<Map> messages = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.blueBrand,
      appBar: AppBar(
        title: Text(
          "The Good Bot",
        ),
      ),
      body: Container(
        
        child: Center(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
          Flexible(
            
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20.0),
              itemCount: messages.length,
              itemBuilder: (context, index) => messages[index]["data"] == 0
                  ? Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        messages[index]["message"].toString(),
                        style: TextStyle(
                            color: Global.blueBrand,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0),
                      ),
                    )
                  : Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(),
                      child: Text(
                        messages[index]["message"].toString(),
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Global.blueBrand,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
            ),
          ),
          Divider(
            height: 3.9,
          ),
          Container(
              padding: EdgeInsets.only(bottom: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                        controller: messageInsert,
                        decoration: InputDecoration.collapsed(
                            hintText: "Envie sua mensagem")),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (messageInsert.text.isEmpty) {
                          print("Vazio!");
                        } else {
                          setState(() {
                            messages.insert(
                                0, {"data": 1, "message": messageInsert.text});
                          });
                          response(messageInsert.text);
                          messageInsert.clear();
                        }
                      },
                    ),
                  ),
                ],
              ))
        ])),
      ),
    );
  }
}
