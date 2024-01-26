import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_form/components/button.dart';
import 'package:petcarepal/screens/booking_form/components/custom_appbar.dart';
import 'package:petcarepal/screens/booking_form/components/custom_textfield.dart';

class NeutriForm extends StatefulWidget {
  @override
  State<NeutriForm> createState() => _NeutriFormState();
}

class _NeutriFormState extends State<NeutriForm> {
  TextEditingController supplierController = TextEditingController();
  TextEditingController nutritionController = TextEditingController();
  TextEditingController rationController = TextEditingController();
  TextEditingController petController = TextEditingController();
  TextEditingController breedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 247, 251, 1),
      appBar: CustomAppBar(title: 'Dinh dưỡng'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: supplierController,
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Hãng cung cấp',
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Loại dinh dưỡng',
                controller: nutritionController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Khẩu phần',
                controller: rationController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Thú cưng',
                controller: petController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Giống loại',
                controller: breedController,
              ),
              SizedBox(height: 20.0),
              CustomButton(),
            ],
          ),
        ),
      ),
    );
  }
}
