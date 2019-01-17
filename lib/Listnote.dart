import 'package:flutter/material.dart';
import 'package:alex_sandra_app/NotePage.dart';
import 'package:alex_sandra_app/mynote.dart';

class NoteList extends StatefulWidget{
  final List<Mynote> notedata;
  NoteList(this.notedata,{Key key});

  final List<Entry> data = <Entry>[
    Entry(
      "FFf39c12",
      "FFF1DB55",
    ),
    Entry(
      "FF27ae60",
      "FF2EF3A3",
    ),
    Entry(
      "FF8e44ad",
      "FF9b59b6",
    ),
    Entry(
      "FF2980b9",
      "FF3498db",
    ),
    Entry(
      "FFc0392b",
      "FFe74c3c",
    ),
    Entry(
      "FFf39c12",
      "FFF1DB55",
    ),
    Entry(
      "FF27ae60",
      "FF2EF3A3",
    ),
    Entry(
      "FF8e44ad",
      "FF9b59b6",
    ),
    Entry(
      "FF2980b9",
      "FF3498db",
    ),
    Entry(
      "FFc0392b",
      "FFe74c3c",
    ),
  ];

  _NoteListViewState createState() => _NoteListViewState();
}

class Entry {
  Entry(this.left, this.body);
  final String left;
  final String body;
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait?2:3
        ),
        itemCount: widget.notedata.length == null ? 0 : widget.notedata.length,
        itemBuilder: (BuildContext context, int i){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext
              context)=> new NotePage(widget.notedata[i],false)));
            },
            child:  Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: Text(
                      widget.notedata[i].title,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.notedata[i].note, style: TextStyle(fontSize: 16.0),),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Tgl Buat : ${widget.notedata[i].createDate}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Tgl Update : ${widget.notedata[i].updateDate}"),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}



class _NoteListViewState extends State<NoteList> {
  int hexToInt(String hex)
  {
    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("Invalid hexadecimal value");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notedata.length == null ? 0 : widget.notedata.length,
      itemBuilder: (context, int i) => GestureDetector(
        child:  Container(
          height: 120.0,
          width: 1.0,
          color: new Color(hexToInt(widget.data[i].left)),
          child: Container(
            height: 60.0,
            width: 1.0,
            color:  new Color(hexToInt(widget.data[i].body)),
            margin: const EdgeInsets.only(left: 4.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left:10.0,top: 10.0),
                  width: double.infinity,
                  child: Text(
                    widget.notedata[i].title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left:10.0, top:10.0, bottom:7.0),
                  width: double.infinity,
                  child: Text(widget.notedata[i].note, style: TextStyle(fontSize: 16.0),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, bottom:7.0),
                  child: Text("${widget.notedata[i].updateDate}"),
                ),
              ],
            ),
          ),
        ),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext
          context)=> new NotePage(widget.notedata[i],false)));
        },
//        onTap: () => Scaffold
//            .of(context)
//            .showSnackBar(SnackBar(content: Text("HAHA Berhasil"))),
      ),
    );
  }

}