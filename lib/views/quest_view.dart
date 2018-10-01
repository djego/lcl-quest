import 'package:flutter/material.dart';

import './result_view.dart';

class QuestView extends StatefulWidget {
  @override
  State createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String buttonText = "LO TENGO";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void getButtonText(){
    setState(() {
      buttonText = "BIENVENIDO :D !!!!!";
    });
  }
  void getTraining(){
    setState(() {
      buttonText = "LO TENGO";
    });
  }
  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[400],
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LA CAFETA LAB', style: TextStyle(color: Colors.white)),
          // leading: IconButton(
          //   tooltip: 'Previous choice',
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     _nextPage(-1);
          //   },
          // ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.arrow_forward),
          //     tooltip: 'Next choice',
          //     onPressed: () {
          //       _nextPage(1);
          //     },
          //   ),
          // ],
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(48.0),
          //   child: Theme(
          //     data: Theme.of(context).copyWith(accentColor: Colors.white),
          //     child: Container(
          //       height: 48.0,
          //       alignment: Alignment.center,
          //       child: TabPageSelector(controller: _tabController),
          //     ),
          //   ),
          // ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
          child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new RaisedButton(
                color: Colors.green[400],
                textColor: Colors.white,
                child: Text( 
                  "$buttonText"
                  ),
                onPressed: () {
                  if (_tabController.index + 1 < _tabController.length){
                     _nextPage(1);
                     getTraining();                    
                   }else{
                    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ResultView(34, "Bienvenido :D")), (Route route) => route == null);
                   }
                },
              ), 
            ],
          ),])

        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon, this.description, this.mision, this.points });

  final String title;
  final IconData icon;
  final String description;
  final String mision;
  final String points;
}

const List<Choice> choices = const <Choice> [

  const Choice(
    title: 'LA CAFETA', 
    icon: Icons.favorite,  
    description:"Es el laboratorio de innovación de UTP, IDAT y ZEGEL IPAE esta en el piso 7 del edificio Washintong.",
    mision: "Preguntale a Fer sobre el propósito de la cafeta, y que es el team espresso, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'RESEARCH', 
    icon: Icons.search, 
    description: "El equipo de investigación es crucial para detectar las problematicas de los estudiantes y plasmar hipotesis que podrian solucionarlas.",
    mision: "Preguntale a Nadia sobre la prueba que esta corriendo en los salones de clase, si no lo encuentras preguntale a Diego.",
    points: "4 puntos",
  ),
  const Choice(
    title: 'ID', 
    icon: Icons.developer_mode, 
    description:"Interaction Design es un campo muy importante en el diseño de una solución.",
    mision: "Preguntale a Fuku que es EVA, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'Visual Design', 
    icon: Icons.insert_photo, 
    description:"Visual Design es la parte más cool! en el proceso de diseñar un solución innovadora.",
    mision: "Preguntale a Pri sobre Inlearning, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'DEV', 
    icon: Icons.developer_board, 
    description:"Developer son los creadores de la solución supongo que el resto ya lo conoces...",
    mision: "Conoce a cualquier chico Dev y preguntale que esta viendo en este Sprint, si no lo encuentras preguntale a Diego.",
    points: "4 puntos",
  ),
  const Choice(
    title: 'QA', 
    icon: Icons.bug_report, 
    description:"La tarea de un QA es muy importante nos asegura lanzar un producto estable y de calidad.",
    mision: "Encuentra la persona que ve QA dinos su nombre y cuantos bugs detecto en el sprint pasado, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'AGILE', 
    icon: Icons.feedback, 
    description:"Seguimos las ceremonias del marco de trabajo agil SCRUM en todos los proyectos",
    mision: "Preguntale a Kati que es Tunking, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'BUSINESS', 
    icon: Icons.business, 
    description:"El enfoque económico y de negocio es muy importante para cada proyecto guiandonos de indicadores y KPIs podemos medir el comportamiento e impacto que generan cada uno",
    mision: "Preguntale a Jorge sobre CRM, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'PRODUCT OWNER', 
    icon: Icons.business, 
    description:"En cada proyecto tenemos un dueño amo y señor que decide el rumbo y el futuro de un proyecto lo llamamos Product Owner",
    mision: "Busca a Mauro y preguntale sobre PEPE, si no lo encuentras preguntale a Diego.",
    points: "3 puntos",
  ),
  const Choice(
    title: 'ZEGEL', 
    icon: Icons.grade, 
    description:"En la cafeta hay 2 grandes teams el Team Espresso (Nosotros) y el Team Amaretto (Zegel IPAE)",
    mision: "Busca a Diego y dile que te presente al Grupo Amaretto.",
    points: "5 puntos",
  )
];


class ChoiceCard extends StatelessWidget {

  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {


    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return 
    Card(
      elevation: 5.0,
      color: Colors.white,
      child: Center(
        child: Container(
          // decoration: const BoxDecoration(
          //   border: const Border(
          //     top: const BorderSide(width: 2.0, color: const Color(0xFFFFFFFFFF)),
          //     left: const BorderSide(width: 2.0, color: const Color(0xFFFFFF9FF)),
          //     right: const BorderSide(width: 2.0, color: const Color(0xFFFFFFFFFF)),
          //     bottom: const BorderSide(width: 2.0, color: const Color(0xFFFFFFFFFF)),
          //   ),
          // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
            Container( 
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  choice.description, 
                  softWrap: true, 
                  textAlign: TextAlign.left, 
                  style: new TextStyle(fontSize: 19.0, color: Theme.of(context).textTheme.display1.color),
                  // style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.4,),
                  
              ),
            ),
            Container( 
              padding: const EdgeInsets.fromLTRB(20.0, 10.0,20.0,10.0),
              child: Text(
                  "Mision: " + choice.mision,
                  softWrap: true, 
                  textAlign: TextAlign.left, 
                  style: new TextStyle(color: Theme.of(context).primaryColor, fontSize: 15.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  
                  ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: Text(
                choice.points,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).textTheme.display1.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          
          ],
        )),
      ),
    );
  }
}
