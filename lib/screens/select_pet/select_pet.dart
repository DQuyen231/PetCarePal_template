import 'package:flutter/material.dart';
import 'package:petcarepal/screens/select_pet/components/pet_card.dart';
import 'pet_data.dart';

class SelectPet extends StatefulWidget {
  const SelectPet({Key? key}) : super(key: key);

  @override
  _SelectPetState createState() => _SelectPetState();
}

class _SelectPetState extends State<SelectPet> {
  int? selectedPetIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 247, 251, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(248, 247, 251, 255),
        title: Text(
          'Chọn thú cưng',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Xử lý khi thú cưng được chọn
                    print('Selected pet: ${pets[index].name}');
                  },
                  child: PetCard(
                    pet: pets[index],
                    isSelected: selectedPetIndex == index,
                    onSelected: (isSelected) {
                      setState(
                        () {
                          selectedPetIndex = isSelected ? index : null;
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 335,
            height: 46,
            child: ElevatedButton(
              onPressed: () {
                // Xử lý khi nút được nhấp vào
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4552CB),
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Xác nhận',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // In đậm chữ
                  fontSize: 16, // Phóng to kích thước chữ
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
