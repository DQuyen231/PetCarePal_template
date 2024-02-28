import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/components/circle_avatar_widget.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';

// Define a model class for completed appointments

class DoneTab extends StatefulWidget {
  const DoneTab({Key? key}) : super(key: key);

  @override
  _DoneTabState createState() => _DoneTabState();
}

class _DoneTabState extends State<DoneTab> {
  late Future<List<Appointments>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = fetchCompletedAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 227, 243, 1),
      child: FutureBuilder<List<Appointments>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            checkAndUpdateStatus(snapshot.data!);
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final appointment = snapshot.data![index];
                      if (appointment.thuoc != null) {
                        return _buildListItem(
                          context,
                          appointment.thuoc!,
                          'Thuốc',
                        );
                      } else if (appointment.tiemChung != null) {
                        return _buildListItem(
                          context,
                          appointment.tiemChung!,
                          'Tiêm chủng',
                        );
                      } else if (appointment.buaAn != null) {
                        return _buildListItem(
                          context,
                          appointment.buaAn!,
                          'Bữa ăn',
                        );
                      } else if (appointment.doKichThuoc != null) {
                        return _buildListItem(
                          context,
                          appointment.doKichThuoc!,
                          'Kích thước',
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget _buildListItem(BuildContext context, dynamic appointment, String type) {
  if (type == 'Thuốc') {
    final thuoc = appointment as Thuoc;
    return _buildMedicationAppointment(context, thuoc);
  } else if (type == 'Tiêm chủng') {
    final tiemChung = appointment as TiemChung;
    return _buildVaccinationAppointment(context, tiemChung);
  } else if (type == 'Bữa ăn') {
    final buaAn = appointment as BuaAn;
    return _buildMealAppointment(context, buaAn);
  } else if (type == 'Kích thước') {
    final doKichThuoc = appointment as DoKichThuoc;
    return _buildSizeAppointment(context, doKichThuoc);
  }
  return SizedBox();
}

Widget _buildMedicationAppointment(BuildContext context, Thuoc thuoc) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(thuoc.ten),
                Text('Loại lịch: Thuốc'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Số lần uống trong ngày: ${thuoc.soLanUongTrongNgay}'),
                    Text('Số viên uống: ${thuoc.soVienUong}'),
                    Text('Thời gian sử dụng: ${thuoc.thoiGianSuDung}'),
                    Text(
                        'Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayBatDau)}'),
                    Text(
                        'Ngày kết thúc: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayKetThuc)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildVaccinationAppointment(BuildContext context, TiemChung tiemChung) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tiemChung.mucDich),
                Text('Loại lịch: Tiêm chủng'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phòng khám: ${tiemChung.phongKham}'),
                    Text(
                        'Ngày khám: ${DateFormat('dd/MM/yyyy').format(tiemChung.ngayKham)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMealAppointment(BuildContext context, BuaAn buaAn) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(buaAn.name),
                Text('Loại lịch: Bữa ăn'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Loại thức ăn: ${buaAn.loai}'),
                    Text('Cách dùng: ${buaAn.cachDung}'),
                    Text(
                        'Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(buaAn.ngayBatDau)}'),
                    Text(
                        'Ngày kết thúc: ${DateFormat('dd/MM/yyyy').format(buaAn.ngayKetThuc)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSizeAppointment(BuildContext context, DoKichThuoc doKichThuoc) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Loại lịch: Đo kích thước'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chiều cao: ${doKichThuoc.chieuCao}'),
                    Text('Cân nặng: ${doKichThuoc.canNang}'),
                    Text(
                        'Thời gian đo: ${DateFormat('dd/MM/yyyy').format(doKichThuoc.thoiGianDo)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
