import 'dart:ffi';
import 'dart:html';

enum TypeRessource { TD, Cours, Examens, Enregistrement }

enum TypeSeance { TD, Cours, TP, Examen, Intero, SeanceEnLigne }

//message
class message {
  String recepteur;
  String messageValue;
  message(this.recepteur, this.messageValue);
  Map<String, dynamic> toMap() {
    return {'recepteur': recepteur, 'messageValue': messageValue};
  }
}

//etudiant
class Etudiant {
//info inscr
  String nom;
  String prenom;
  String dateDeNaissance;
  String lieuDeNaissance;
  String wilaya;
  String adresse;
  String nationalite;
  String ville;
  int numero;
  String email;
  int anneeDeBac;
  String filiere;
  double? moyenneGeneral;
  Char section;
  int groupe;
  double matricule;
  List<Annoncement>? annoncements;
  List<Note>? notes;
  Etudiant(
      this.nom,
      this.prenom,
      this.dateDeNaissance,
      this.lieuDeNaissance,
      this.wilaya,
      this.adresse,
      this.nationalite,
      this.ville,
      this.numero,
      this.email,
      this.anneeDeBac,
      this.filiere,
      this.moyenneGeneral,
      this.section,
      this.groupe,
      this.matricule,
      this.annoncements,
      this.notes
      );

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'dateDeNaissance': dateDeNaissance,
      'lieuDeNaissance': lieuDeNaissance,
      'wilaya': wilaya,
      'adresse': adresse,
      'nationalite': nationalite,
      'ville': ville,
      'numero': numero,
      'email': email,
      'anneeDeBac': anneeDeBac,
      'filiere': filiere,
      'moyenneGeneral': moyenneGeneral,
      'section': section,
      'groupe': groupe,
      'matricule': matricule,
      'annoncements': annoncements
    };
  }
}

//parent
class Parent {
  String nom;
  String prenom;
  String email;
  double numero;
  Etudiant fils;

  Parent(this.nom, this.prenom, this.email, this.numero, this.fils);
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'numero': numero,
      'fils': fils
    };
  }
}

//teacher
class Teacher {
  String nom;
  String prenom;
  String email;
  String numero;
  String? module;
  List<Char>? sections;
  List<classeEnseigne> classesEnseignees;
  File CV;
  File diplome;
  Teacher(this.nom, this.prenom, this.email, this.numero, this.module,
      this.classesEnseignees, this.sections, this.CV, this.diplome);
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'numero': numero,
      'module': module,
      'section': sections
    };
  }
}

//commentaire
class Commentaire {
  String commentateur;
  String contenu;
  DateTime temps;
  Commentaire(this.commentateur, this.contenu, this.temps);
}

//annoncement
class Annoncement {
  String? auteur; // utilise comme cle de recherche lors de la recherche
  String contenu;
  DateTime temps;
  List<Commentaire>? commentaires;
  int? jaimes;
  // les cles de filtre
  Char? section;
  int? groupe;

  Annoncement(this.auteur, this.contenu, this.temps, this.commentaires,
      this.jaimes, this.section, this.groupe);
}

//resssource
class Ressource {
  String module;
  TypeRessource type;
  File fichier;
  Ressource(this.module, this.type, this.fichier);
}

//module
class Module {
  String nom;
  int coefficient;
  int semestre;
  List<Seance> seances;
  Module(this.nom, this.coefficient, this.semestre, this.seances);
}

//cours
class Seance {
  String jour;
  String heurDebut;
  String heureFin;
  String prof;
  Char section;
  int groupe;
  TypeSeance type;
  Seance(this.jour, this.heurDebut, this.heureFin, this.prof, this.section,
      this.groupe, this.type);
}

//liste des modules informatique
Map<int, List<String>> modulesInfo = {
  1: ['Algebre-1', 'Analyse1', 'Algo-1', 'STRM-1', 'MP', 'Bureautique'],
  2: [
    'Algebre-2',
    'Analyse-2',
    'Algo-2',
    'STRM-2',
    'Electricite',
    'TIC',
    'ProbaStat-1'
  ],
  3: [
    'Analyse Numerique',
    'Logique Mathematique',
    'ProbaStat-2',
    'Algo-3',
    'Archi-1',
    'SI'
  ],
  4: ['Archi-2', "Systeme d'Exploitation-1", 'POO', 'THL', 'Base de Donnees'],
  5: [
    'Compilation',
    'Reseaux',
    "Systeme d'Exploitation-2",
    'THG',
    'Genie Logiciel'
  ],
  6: ['Developpement Web', 'PFE'],
};

//la classe etudie
class classeEnseigne {
  Char section;
  int groupe;
  classeEnseigne(this.section, this.groupe);
}

//Notes
class Note {
  String module;
  double note;
  Note(this.module, this.note);
}
