import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mjeetrn33/models/productmodel.dart';
import 'package:mjeetrn33/utilitys/sqllite.dart';
import 'package:path/path.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductModel> productModels = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readSQL();
  }

  Future<Null> readSQL() async {
    var object = await SQLHelper().readDB();
    productModels = object;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text('Prodict List'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: productModels.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.only(top: 20.0, left: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 80.0,
                      child: Text(
                        '${productModels[index].productID}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      width: 100.0,
                      child: Text('${productModels[index].productDS}'),
                    ),
                    Container(
                      width: 50.0,
                      alignment: Alignment.centerRight,
                      child: Text(NumberFormat('##,###').format(
                          int.parse('${productModels[index].productPR}'))),
                    ),
                    Container(
                      width: 80.0,
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.yellowAccent.shade700,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
