import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/film.dart';


class Films extends StatelessWidget {
  const Films({super.key});

  //"https://morseweiswlpykaugwtd.supabase.co/rest/v1/acteurs?select=*"
  Future<List<dynamic>> fetchFilms() async {
    final response = await http.get(
      Uri.parse("https://morseweiswlpykaugwtd.supabase.co/rest/v1/acteurs?select=*"),
      headers: {
        "Content-type": "application/json",
        "apikey":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1vcnNld2Vpc3dscHlrYXVnd3RkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY5NTcxMjgsImV4cCI6MjAyMjUzMzEyOH0.UV5XCINWe-Jaw6_-787Veh-LxjzUVudArvrgH6Ycf30",
      },
      body: {},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      return data.map((elt) => Film.fromJson(elt)).toList();
    } else {
      throw Exception("Erreur du web service");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Films"),
      ),
      body: 
        FutureBuilder(
          future: fetchFilms(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erreur : ${snapshot.error}'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext contexte, int index) {
                  return ListTile(
                    title: Text(snapshot.data![index].nom),
                    subtitle: Text(snapshot.data![index].age.toString()),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: FadeInImage(
                        placeholder: const AssetImage('assets/_inconnu.jpg'), 
                        image: NetworkImage("https://morseweiswlpykaugwtd.supabase.co/storage/v1/object/public/personnes/${snapshot.data![index].personneId}.jpg"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/_inconnu.jpg');
                        },
                      ),
                      
                    ) 
                  );
                }
              );
            }
          }
        ),
    );
  }
  
}