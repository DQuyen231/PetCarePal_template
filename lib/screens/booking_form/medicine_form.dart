import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_form/components/button.dart';
import 'package:petcarepal/screens/booking_form/components/custom_appbar.dart';
import 'package:petcarepal/screens/booking_form/components/custom_textfield.dart';

class MedicineForm extends StatefulWidget {
  @override
  State<MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  TextEditingController medicineController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController petController = TextEditingController();
  TextEditingController breedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 247, 251, 1),
      appBar: CustomAppBar(title: 'Thuốc'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: medicineController,
                onChanged: (value) {
                  // Xử lý giá trị từ UserInput
                  print('New value: $value');
                },
                label: 'Tên thuốc',
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Số lượng',
                controller: quantityController,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                onChanged: (value) {
                  // Xử lý giá trị của UserInput
                  print('New value: $value');
                },
                label: 'Thời gian sử dụng',
                controller: periodController,
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
