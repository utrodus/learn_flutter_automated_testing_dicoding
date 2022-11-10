import 'package:learn_flutter_automated_testing_dicoding/provider/done_module_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneModuleList extends StatelessWidget {
  const DoneModuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Done Module List'),
        ),
        body: Consumer<DoneModuleProvider>(builder: (context, data, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data.doneModuleList[index]),
                trailing: ElevatedButton(
                  key: Key(data.doneModuleList[index]),
                  onPressed: () {
                    data.deleteModule(data.doneModuleList[index]);
                  },
                  child: const Text('Remove'),
                ),
              );
            },
            itemCount: data.doneModuleList.length,
          );
        }));
  }
}
