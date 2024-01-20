import 'package:flutter/material.dart';

class RadioListWidget extends StatelessWidget {
  final String selectedPaymentMethod;
  final Function onChanged;

  RadioListWidget({
    required this.selectedPaymentMethod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> paymentMethods = {
      'Thanh toán trực tiếp': 'assets/icons/money.png',
      'Ví Vnpay': 'assets/icons/vnpay.png',
      'Ví Momo': 'assets/icons/momo.png',
      'Ví Zalopay': 'assets/icons/zalopay.png',
    };

    return Container(
      width: 385, // Đặt độ rộng mong muốn
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          String value = paymentMethods.keys.elementAt(index);
          String iconPath =
              paymentMethods[value]!; // Trích xuất đường dẫn của icon

          return Column(
            children: [
              buildRadioTile(value, iconPath),
              Divider(color: Colors.black), // Đường viền đen
            ],
          );
        },
      ),
    );
  }

  Widget buildRadioTile(String value, String iconPath) {
    return RadioListTile(
      title: Row(
        children: [
          Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 16), // Khoảng cách giữa icon và tiêu đề
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      value: value,
      groupValue: selectedPaymentMethod,
      onChanged: onChanged as void Function(String?)?,
      activeColor: Colors.white,
      tileColor: Color(0xFF1E1E3D),
      controlAffinity: ListTileControlAffinity.trailing,
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.white),
      ),
    );
  }
}
