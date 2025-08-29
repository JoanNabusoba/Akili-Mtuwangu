import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/ui/add_edititems.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<ParseObject>> _allQuotes;

  Future<List<ParseObject>> _getQuotes() async =>
      QueryBuilder<ParseObject>(ParseObject("Quotes")).find();

  @override
  void initState() {
    _allQuotes = _getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Items",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _allQuotes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      var title = item.get<String>("title") ?? "";
                      var description = item.get<String>("description") ?? "";
                      var img = item.get<ParseFileBase>("image");

                      return Card(
                        margin: EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Image(
                            image: (img != null && img.url != null)
                                ? NetworkImage(img.url!)
                                : AssetImage(
                                    'img/mental1.jpg',
                                  ), // Replace with your dummy image path
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(title!),
                          subtitle: Text(description!),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(() => AddEditItems());
          setState(() {
            _allQuotes = _getQuotes();
          });
        },
        backgroundColor: Color.fromRGBO(253, 94, 0, 1),
        child: Icon(Icons.add),
      ),
    );
  }
}
