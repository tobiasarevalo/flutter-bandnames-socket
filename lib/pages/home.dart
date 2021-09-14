import 'package:band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
  Band(id: '1', name: 'Metallica', votes: 5),
  Band(id: '1', name: 'La vela puerca', votes: 2),
  Band(id: '1', name: 'Callejeros', votes: 4),
  Band(id: '1', name: 'Intoxicados', votes: 3),
];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(
    Band band,
  ) {
    return Dismissible(
      key: Key(band.id.toString()),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print(direction.toString());
      },
      background: Container(
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text("Eliminar banda",style: TextStyle(color: Colors.white),),
            )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name!.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name.toString()),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20.0),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController= new TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Nombre de banda"),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  addBandToList(textController.text);
                },
                elevation: 5,
                child: Text(
                  "Agregar",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  void addBandToList(String name){
    if(name.length >1){
      this.bands.add(new Band(id:DateTime.now().toString(),name: name,votes: 0));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
