import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progetto_309131/models/tool.dart';
import 'package:progetto_309131/screens/edit_tool/edit_tool.dart';
import 'package:provider/provider.dart';

import 'package:progetto_309131/providers/service_tool.dart';

class ListTools extends StatelessWidget {
  List<String> lista = ['ciao', 'ciao2', 'ciao3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                                    Container(
                                      child: Image.asset(
                                        'assets/images/coll.png',
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment.centerLeft,
                                        width: 20,
                                      ),
                                    ),
                                    Container(
                                      child: Image.asset(
                                        'assets/images/${Tool.materialTools[tool.material]}.png',
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
                                              Text(tool.diameter.toString()),
                                              Text(tool.length.toString()),
                                              Text(tool.sharp.toString()),
                                              Text(tool.material.toString()),
                                              Text(tool.teeth.toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    //Spacer(),
                                    /*
                                    FloatingActionButton(
                                      onPressed: () {
                                        context.read<ServiceTool>().insert();
                                      },
                                      child: Icon(Icons.edit),
                                      backgroundColor: Colors.blue,
                                    ),
                                    */
                                  ],
                                ),
                              ),
                              Row(children: [
                                IconButton(icon: Icon(Icons.edit), onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>EditTool(tool: tools[index],)));
                                }),
                                IconButton(icon: Icon(Icons.delete), onPressed: (){

                                }),
                              ],),
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
                context.read<ServiceTool>().insert(); // .update(121) .delete(122);

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
