
class Film {
  String personneId;
  String nom;
  String? metaphone;
  String? naissance;
  int? age;
  String? deces;
  String? nationalite;
  String? drapeauUnicode;
  int? nbFilm;
  double? popularite;

  //Constructeur
  Film(
      { required this.personneId,
      required this.nom,
      this.metaphone,
      this.naissance,
      this.age,
      this.deces,
      this.nationalite,
      this.drapeauUnicode,
      this.nbFilm,
      this.popularite}
  );

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      personneId : json['personne_id'],
      nom : json['nom'],
      metaphone : json['metaphone'],
      naissance : json['naissance'],
      age : json['age'],
      deces : json['deces'],
      nationalite : json['nationalite'],
      drapeauUnicode : json['drapeau_unicode'],
      nbFilm : json['nb_film'],
      popularite : json['popularite'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['personne_id'] = personneId;
    data['nom'] = nom;
    data['metaphone'] = metaphone;
    data['naissance'] = naissance;
    data['age'] = age;
    data['deces'] = deces;
    data['nationalite'] = nationalite;
    data['drapeau_unicode'] = drapeauUnicode;
    data['nb_film'] = nbFilm;
    data['popularite'] = popularite;
    return data;
  }
}
