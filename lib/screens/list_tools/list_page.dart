
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:progetto_309131/providers/status.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'
    '';
import 'package:progetto_309131/providers/service_tool.dart';
import 'package:progetto_309131/screens/edit_tool/edit_tool.dart';
import 'package:progetto_309131/models/tools_enum.dart';

class ListTools extends StatelessWidget {
  final List<String> lista = ['cane', 'gatto', 'cavallo'];
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
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: tools.length,
                      itemBuilder: (context, index) {
                        final tool = tools[index];

                        final isSelected = context.read<ServiceTool>().selectedTool.id == tool.id;
                        context.read<ServiceTool>().selectTool(isSelected, tool);

                        return GestureDetector(
                          onTap: () {
                            context.read<ServiceTool>().setSelectedTool(index);
                            //context.read<Status>().setId(tool.id);
                            context.read<Status>().setCalculate(false);
                          },
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
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
                                                    alignment:
                                                        Alignment.centerLeft,
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
                                                    'Name: ',
                                                  ),
                                                  //Text('id: ',),
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
                                                  //Text(tool.id.toString(),),

                                                  Text(
                                                    tool.diameter.toString(),
                                                  ),
                                                  Text(
                                                    tool.length.toString(),
                                                  ),
                                                  Text(
                                                    tool.sharp.toString(),
                                                  ),
                                                  Text(
                                                    tool.material.text,
                                                  ),
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Edit',
                                color: Colors.blue,
                                icon: Icons.edit,
                                onTap: () {
                                  //print('Edit');

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => EditTool(
                                            tool: tools[index],
                                          )));
                                },
                              ),
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () async {
                                  //print('Delete');

                                  //context.read<ServiceTool>().delete(tool.id);

                                  var mustClose = await showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return AlertDialog(
                                            title: Text("Delete"),
                                            content:
                                                Text("Irreversible action"),
                                            actions: [
                                              TextButton(
                                                child: Text("ok"),
                                                onPressed: () {
                                                  context.read<ServiceTool>().delete(tool.id);
                                                  // per impost

                                                  context.read<ServiceTool>().selectedTool = context.read<ServiceTool>().tools[0];
                                                  Navigator.of(context).pop(false);
                                                  //print('Cancella');
                                                },
                                              ),
                                              TextButton(
                                                child: Text("Annulla"),
                                                onPressed: () {
                                                  Navigator.of(context).pop(false);
                                                  //print("Annulla");
                                                },
                                              ),
                                            ]);
                                      });
                                  if (mustClose != null && mustClose)
                                    Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {
                context
                    .read<ServiceTool>()
                    .insert(); // .update(121) .delete(122);

                //print('insered tool new');
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
