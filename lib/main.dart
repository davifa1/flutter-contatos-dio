// importa os pacotes
import 'package:flutter/material.dart';

//serviços noativos do dispositivo
import 'package:flutter/services.dart';

// Start Do App
void main() {
    //iniciar a funçao de stilo status-bar e button navigator
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      //style statusBar(qualquer cor)
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      //style icon(dark/light)
      statusBarIconBrightness: Brightness.dark,

      //navigator-bar(botao de navegaçao) qualquer cor)
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      //style icon navigatorBar(dark/light)
      systemNavigationBarIconBrightness: Brightness.dark
    ),
  );

  //chamar a primeira tela
  runApp(MyApp());
}

//primeira tela criada como uma class
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //titulo do app(mostrado nos apps recentes)
      title: 'Flutter Demo',
      //remover o banner da tela
      debugShowCheckedModeBanner: false,
      //thema do app (pode ser acessado para qualquer componente - Ex. Botao)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //chamando a title passada n\ funçao MyHomePage
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //criar uma variaver contato
  List<Contato> contatos = []; 

  @override
  void initState() {
    //inserir dados na variaver contato
    contatos.add(new Contato(name: "Lucas", telefone: "33826621", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato(name: "Diogo Fernandes", telefone: "33826621", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato(name: "Rocketseat", telefone: "33826621", tipo: ContatoType.TRABALHO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.TRABALHO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.TRABALHO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.FAVORITO));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    contatos.add(new Contato(name: "Davi Henrique Favaro", telefone: "33826621", tipo: ContatoType.CASA));
    
    contatos.sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    //começar a criar os widgets
    //scaffold(usar varios widgets dentro dele)
    return Scaffold(
      //lista com indicador de separaçao
      body: ListView.separated(itemBuilder: (context, index) {
        var contato = contatos[index];
        return ListTile(
        leading: CircleAvatar(
          child: ContatoHelper.GetIconByContatoType(contato.tipo),
          backgroundColor: Colors.blue[500],
        ),
        title: Text(contato.name),
        subtitle: Text(contato.telefone),);
      }, separatorBuilder: (context, index) => Divider(),
       itemCount: contatos.length, )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Contato {
  //tipo de dados na list<Contato>
    final String name;
    final String telefone;
    final ContatoType tipo;

    Contato({@required this.name, @required this.telefone, @required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA}

class ContatoHelper {
  static Icon GetIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
      return Icon(Icons.phone_android, color: Colors.black,);
      case ContatoType.CASA:
      return Icon(Icons.home, color: Colors.black,);
      case ContatoType.TRABALHO:
      return Icon(Icons.work, color: Colors.black,);
      case ContatoType.FAVORITO:
      return Icon(Icons.star, color: Colors.black,);
    }
  }
}