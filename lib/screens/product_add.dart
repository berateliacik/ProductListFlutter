import 'package:flutter/material.dart';
import 'package:sqlflite_demo/data/dbHelper.dart';

import '../models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State {
  var dbHelper = DbHelper();
  var txtName=TextEditingController();
  var txtDescription=TextEditingController();
  var txtUnitPrice=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            buildNameField(),buildDescriptionField(),buildUnitPriceField(),buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Name"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Description"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Unit Price"),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return FlatButton(
        child: Text("Add Product"),
        onPressed: (){
          addProduct();
        },
        );
  }

  void addProduct() async{
  var result = await dbHelper.insert(Product(name: txtName.text, description: txtDescription.text, unitPrice: double?.tryParse(txtUnitPrice.text)));
  Navigator.pop(context,true);
  }
}