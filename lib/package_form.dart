import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PackageForm extends StatefulWidget {
  const PackageForm({Key? key}); //could be problem later

  @override
  PackageFormState createState() {
    return PackageFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class PackageFormState extends State<PackageForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<PackageFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // apt number field
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.add_box),
              labelText: 'Nhập loại hàng hóa (đồ ăn, quần áo v.v.)',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Thông tin bắt buộc';
              }
              return null;
            },
          ),
          TextFormField(
            // apt number field
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.apartment_rounded),
              labelText: 'Nhập số căn hộ',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Thông tin bắt buộc';
              }
              return null;
            },
          ),
          TextFormField(
            // get current time
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.access_time),
              labelText: 'Thời gian',
            ),
            initialValue: formattedDate,
            enabled: false,
          ),
          TextFormField(
            //shipper phone field
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.bike_scooter),
              labelText: 'Số điện thoại người ship',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Thông tin bắt buộc';
              }
              return null;
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Đang lưu'),
                    ),
                  );
                }
              },
              child: const Text('Hoàn thành'),
            ),
          ),
        ],
      ),
    );
  }
}
