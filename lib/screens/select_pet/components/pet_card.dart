import 'package:flutter/material.dart';
import 'package:petcarepal/screens/select_pet/pet_data.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  PetCard({
    required this.pet,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Xử lý khi thú cưng được chọn
        onSelected(!isSelected);
      },
      child: Container(
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        width: 335,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4552CB) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(pet.imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFF070821),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${pet.breed}',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Color(0xFFBBC3CE),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
