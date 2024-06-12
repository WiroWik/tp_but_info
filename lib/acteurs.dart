import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp_but_info/films.dart';
import 'models/acteur.dart';

class Acteurs extends StatefulWidget {
  const Acteurs({super.key});
  
  @override
  State<StatefulWidget> createState() => ActeursState();
}

class ActeursState extends State<Acteurs> {

  List<Acteur> listeComplete = [];
  List<Acteur> listeFiltree = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchActeurs();
    textController.addListener(fonctionRecherche);
  }

  void fonctionRecherche() {
    String texteEntree = textController.text.toLowerCase();
    setState(() {
      listeFiltree = listeComplete.where((elt) => elt.nom.toLowerCase().contains(texteEntree)).toList();
    });
  }
  
  //"https://morseweiswlpykaugwtd.supabase.co/rest/v1/acteurs?select=*"
  Future fetchActeurs() async {
    final response = await http.get(
      Uri.parse("https://morseweiswlpykaugwtd.supabase.co/rest/v1/acteurs?select=*"),
      headers: {
        "Content-type": "application/json",
        "apikey":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1vcnNld2Vpc3dscHlrYXVnd3RkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY5NTcxMjgsImV4cCI6MjAyMjUzMzEyOH0.UV5XCINWe-Jaw6_-787Veh-LxjzUVudArvrgH6Ycf30",
      }
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        listeComplete = data.map((elt) => Acteur.fromJson(elt)).toList();
        listeFiltree = listeComplete;
      });
    } else {
      throw Exception("Erreur du web service");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              child: Text("Acteurs"),
            ),
            Expanded(
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "Recherche",
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                style: const TextStyle(color: Colors.white),
              )
            )
          ]
        ),
      ),
      body: 
        ListView.builder(
          itemCount: listeFiltree.length,
          itemBuilder: (BuildContext contexte, int index) {
            return ListTile(
              title: Text(listeFiltree[index].nom),
              subtitle: Text(listeFiltree[index].age.toString()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Films()));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/_inconnu.jpg'), 
                  image: NetworkImage("https://morseweiswlpykaugwtd.supabase.co/storage/v1/object/public/personnes/${listeFiltree[index].personneId}.jpg"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/_inconnu.jpg');
                  },
                ),
              ) 
            );
          }
        )
    );
  }
  
}