import 'package:flutter/material.dart';
import './transaction.dart';
import './transaction_list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Expense Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    Transaction(id: 1, title: 'The Place', amount: 1520.75, date: DateTime.now(),),
    Transaction(id: 2, title: 'Bolt', amount: 1250.25, date: DateTime.now(),),
    Transaction(id: 3, title: 'Bolt', amount: 1150.25, date: DateTime.now(),),
    Transaction(id: 4, title: 'Bolt', amount: 1350.25, date: DateTime.now(),),
    Transaction(id: 5, title: 'Bolt', amount: 1050.25, date: DateTime.now(),),
    Transaction(id: 6, title: 'Bolt', amount: 2250.25, date: DateTime.now(),),
    Transaction(id: 7, title: 'Bolt', amount: 4250.25, date: DateTime.now(),),
    Transaction(id: 8, title: 'Bolt', amount: 7250.25, date: DateTime.now(),),
  ];

  var titleController = TextEditingController() ;
  var amountController = TextEditingController();

  void addTransaction() {
    if (this.titleController.text == null || this.amountController.text == null || this.titleController.text == "" || this.amountController.text == "") {
      return;
    }
    var newTransaction = Transaction(id: this.transactions.length + 1, title: this.titleController.text, amount: double.parse(this.amountController.text), date: DateTime.now(),);
    //reset data
    this.setState(() {
      this.transactions.add(newTransaction);
      this.titleController.clear();
      this.amountController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Color(0xFFFFC0CB),
                child: Text("Chart!"),
                elevation: 4,
              ),
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller: titleController, 
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      controller: amountController
                    ),
                    FlatButton(child: Text("Add Expense", style: TextStyle(color: Colors.white)), onPressed: addTransaction, padding: EdgeInsets.all(10),splashColor: Colors.pink,color: Colors.blue,),
                  ]
                )
              ),
            ),
           Container(
             height: MediaQuery.of(context).size.height * 0.5,
             child:  ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ...this.transactions.map((tx){
                  return TransactionListItem(
                    transaction: tx,
                  );
                })
              ],
            ),
           )
          ],
        ),
      ),
    );
  }
}
