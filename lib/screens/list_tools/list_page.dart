import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progetto_309131/models/tool.dart';
import 'package:progetto_309131/screens/edit_tool/edit_tool.dart';
import 'package:provider/provider.dart';

import 'package:progetto_309131/models/tools_enum.dart';
import 'package:progetto_309131/providers/service_tool.dart';

class ListTools extends StatelessWidget {
  //List<String> lista = ['ciao', 'ciao2', 'ciao3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(122, 151, 185, 1.0),
        title: Text('List of Tools'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Consumer<ServiceTool>(
              builder: (BuildContext context, value, Widget child) {
                final toolsNotifier = context.watch<ServiceTool>();
                final tools = toolsNotifier.tools;
                final status = toolsNotifier.status;

                if (status == ServiceToolsStatus.loading) {
                  return CircularProgressIndicator();
                } else if (status == ServiceToolsStatus.error) {
                  return Text('C\'è un errore!');
                }

                if (tools.isEmpty) {
                  return Text('Non ci sono strumenti');
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: tools.length,
                    itemBuilder: (context, index) {
                      final tool = tools[index];
                      final isSelected =
                          context.read<ServiceTool>().selectedTool == tool;
                      return GestureDetector(
                        onTap: () {
                          context.read<ServiceTool>().setSelectedTool(index);
                        },
                        child: Card(
                          color: isSelected ? Colors.white70 : null,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    new Center(
                                      child: tool.cool
                                          ? new Container(
                                              child: Image.asset(
                                                'assets/images/coll.png',
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.centerLeft,
                                                width: 20,
                                              ),
                                            )
                                          : new Container(
                                              width: 20,
                                            ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'assets/images/${tool.material.image}',
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerLeft,
                                        height: 120,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Name:',
                                              ),
                                              Text(
                                                'id: ',
                                              ),
                                              Text(
                                                'Diameter: ',
                                              ),
                                              Text(
                                                'Length: ',
                                              ),
                                              Text(
                                                'Sharp: ',
                                              ),
                                              Text(
                                                'Material: ',
                                              ),
                                              Text(
                                                'Teeth: ',
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tool.name,
                                              ),
                                              Text(
                                                tool.id.toString(),
                                              ),
                                              // campo da eliminate
                                              Text(
                                                tool.diameter.toString(),
                                              ),
                                              Text(
                                                tool.length.toString(),
                                              ),
                                              Text(
                                                tool.sharp.toString(),
                                              ),
                                              Text(tool.material.text),
                                              Text(
                                                tool.teeth.toString(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => EditTool(
                                                      tool: tools[index],
                                                    )));
                                      }),
                                  /*
                                  IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        context
                                            .read<ServiceTool>()
                                            .delete(tool.id);
                                      }),
                                  */
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      // Apertura asincrona di dialogo
                                      //var mustClose =
                                      await showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Conferm the delete'),
                                            content: Text(
                                                'The process is not reverse'),
                                            actions: [
                                              TextButton(
                                                  child: Text('Ok!'),
                                                  onPressed: () {
                                                    // Chiusura del dialogo con valore di ritorno true

                                                    context
                                                        .read<ServiceTool>()
                                                        .delete(tool.id);
                                                    Navigator.of(context)
                                                        .pop(); //(false);
                                                  },
                                                  style: ButtonStyle(
                                                      textStyle:
                                                          MaterialStateProperty
                                                              .all(TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))),
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  // Chiusura del dialogo con valore di ritorno false
                                                  Navigator.of(context)
                                                      .pop(); //(false);
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {
                context
                    .read<ServiceTool>()
                    .insert(); // .update(121) .delete(122);

                print('insered tool new');
                //Navigator.of(context).pushNamed('/editTool');
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
