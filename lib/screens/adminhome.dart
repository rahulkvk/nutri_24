import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Nutrihom2 extends StatelessWidget {
  @override

  final CollectionReference login =
      FirebaseFirestore.instance.collection('nutri');

  void deleteuser(docid) {
    login.doc(docid).delete();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nutri",
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder(
          stream: login.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final DocumentSnapshot nutrisnap = snapshot.data!.docs[index];
                  return Card(
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              //Image(image: donersnap[0]["source"]),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  nutrisnap['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                nutrisnap["age"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                nutrisnap["choice"],
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                nutrisnap["calorie"],
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/update',
                                    arguments: {
                                      'name': nutrisnap['name'],
                                      'name': nutrisnap['age'],
                                      'choice':nutrisnap['choice'],
                                      'calorie':nutrisnap['calorie'],
                                      'id': nutrisnap.id
                                    });
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                deleteuser(nutrisnap.id);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        )
                      ],
                    )),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            }
            // snapshot.data is QuerySnapshot than I access .docs to get List<QueryDocumentSnapshot>
            return Container(
              child: Text(""),
            );
          }),
    );
  }
}
