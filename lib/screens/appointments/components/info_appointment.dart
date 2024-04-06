import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petcarepal/screens/appointments/components/appointment_type.dart';
import 'package:petcarepal/screens/appointments/components/edit_meal.dart';
import 'package:petcarepal/screens/appointments/components/edit_size.dart';
import 'package:petcarepal/screens/appointments/components/edit_vaccination.dart';
import 'circle_avatar_widget.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';
import 'package:petcarepal/screens/appointments/components/edit_medication.dart';

class InfoAppointment extends StatefulWidget {
  const InfoAppointment({super.key});

  @override
  State<InfoAppointment> createState() => _InfoAppointmentState();
}

class _InfoAppointmentState extends State<InfoAppointment> {
  Future<List<Appointments>>? futureAppointments;

  @override
  void initState() {
    super.initState();
    _initializeAppointments();
  }

  Future<void> _initializeAppointments() async {
    try {
      final userId = await getUserIDFromLocalStorage();
      setState(() {
        futureAppointments = fetchUncompletedAppointments(userId);
      });
    } catch (error) {
      print('Error initializing appointments: $error');
      setState(() {
        futureAppointments = Future.error(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Appointments>>(
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
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[700],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChooseAppointmentTypeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Tạo lịch mới',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildListItem(
      BuildContext context, dynamic appointment, String type) {
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
                  Text(thuoc.ten,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Loại lịch: Thuốc',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Bo góc
                    child: Container(
                      color: Colors.grey.shade200, // Màu xám nhạt
                      padding: EdgeInsets.all(8), // Khoảng cách nội dung
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Số lần uống trong ngày: ${thuoc.soLanUongTrongNgay}'),
                          Text('Số viên uống: ${thuoc.soVienUong}'),
                          Text('Thời gian sử dụng: ${thuoc.thoiGianSuDung}'),
                          Text(
                              'Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayBatDau)}'),
                          Text(
                              'Ngày kết thúc: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayKetThuc)}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await deleteMedicationAppointment(thuoc.id);
                      final userId = await getUserIDFromLocalStorage();
                      setState(() {
                        futureAppointments =
                            fetchUncompletedAppointments(userId);
                      });
                    } catch (e) {
                      print('Error deleting appointment: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditMedicationScreen(context, thuoc);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinationAppointment(
      BuildContext context, TiemChung tiemChung) {
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
                  Text(tiemChung.mucDich,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Loại lịch: Tiêm chủng',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Bo góc
                    child: Container(
                      color: Colors.grey.shade200, // Màu xám nhạt
                      padding: EdgeInsets.all(8), // Khoảng cách nội dung
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phòng khám: ${tiemChung.phongKham}'),
                          Text(
                            'Ngày khám: ${DateFormat('dd/MM/yyyy').format(tiemChung.ngayKham)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await deleteVaccinationAppointment(tiemChung.id);
                      final userId = await getUserIDFromLocalStorage();
                      setState(() {
                        futureAppointments =
                            fetchUncompletedAppointments(userId);
                      });
                    } catch (e) {
                      print('Error deleting appointment: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditVaccinationScreen(context, tiemChung);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
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
                  Text(buaAn.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Loại lịch: Bữa ăn',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Bo góc
                    child: Container(
                      color: Colors.grey.shade200, // Màu xám nhạt
                      padding: EdgeInsets.all(8), // Khoảng cách nội dung
                      child: Column(
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
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await deleteMealAppointment(buaAn.id);
                      final userId = await getUserIDFromLocalStorage();
                      setState(() {
                        futureAppointments =
                            fetchUncompletedAppointments(userId);
                      });
                    } catch (e) {
                      print('Error deleting appointment: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditMealScreen(context, buaAn);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
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
                  Text('Đo kích thước',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Loại lịch: Đo kích thước',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Bo góc
                    child: Container(
                      color: Colors.grey.shade200, // Màu xám nhạt
                      padding: EdgeInsets.all(8), // Khoảng cách nội dung
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chiều cao: ${doKichThuoc.chieuCao}'),
                          Text('Cân nặng: ${doKichThuoc.canNang}'),
                          Text(
                              'Thời gian đo: ${DateFormat('dd/MM/yyyy').format(doKichThuoc.thoiGianDo)}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await deleteSizeAppointment(doKichThuoc.id);
                      final userId = await getUserIDFromLocalStorage();
                      setState(() {
                        futureAppointments =
                            fetchUncompletedAppointments(userId);
                      });
                    } catch (e) {
                      print('Error deleting appointment: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditSizeScreen(context, doKichThuoc);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToEditMedicationScreen(
      BuildContext context, Thuoc thuoc) async {
    final updatedMedication = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMedicationScreen(thuoc: thuoc),
      ),
    );

    if (updatedMedication != null) {
      try {
        await updateMedication(
          thuoc.id,
          updatedMedication['ten'],
          updatedMedication['soLan'],
          updatedMedication['soVien'],
          updatedMedication['thoiGian'],
          updatedMedication['ngayBatDau'],
          updatedMedication['ngayKetThuc'],
        );
        final userId = await getUserIDFromLocalStorage();
        setState(() {
          futureAppointments = fetchUncompletedAppointments(userId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thông tin thuốc đã được cập nhật thành công'),
          ),
        );
      } catch (e) {
        print('Error updating medication: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xảy ra lỗi khi cập nhật thông tin thuốc'),
          ),
        );
      }
    }
  }

  void _navigateToEditVaccinationScreen(
      BuildContext context, TiemChung tiemChung) async {
    final updatedVaccination = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditVaccinationScreen(tiemChung: tiemChung),
      ),
    );

    if (updatedVaccination != null) {
      try {
        await updateVaccination(
          tiemChung.id,
          updatedVaccination['mucDich'],
          updatedVaccination['phongKham'],
          updatedVaccination['ngayKham'],
        );
        final userId = await getUserIDFromLocalStorage();
        setState(() {
          futureAppointments = fetchUncompletedAppointments(userId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thông tin tiêm chủng đã được cập nhật thành công'),
          ),
        );
      } catch (e) {
        print('Error updating vaccination: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xảy ra lỗi khi cập nhật thông tin tiêm chủng'),
          ),
        );
      }
    }
  }

  void _navigateToEditMealScreen(BuildContext context, BuaAn buaAn) async {
    final updatedMeal = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMealScreen(buaAn: buaAn),
      ),
    );

    if (updatedMeal != null) {
      try {
        await updateMeal(
          buaAn.id,
          updatedMeal['name'],
          updatedMeal['loai'],
          updatedMeal['cachDung'],
          updatedMeal['ngayBatDau'],
          updatedMeal['ngayKetThuc'],
        );
        final userId = await getUserIDFromLocalStorage();
        setState(() {
          futureAppointments = fetchUncompletedAppointments(userId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thông tin bữa ăn đã được cập nhật thành công'),
          ),
        );
      } catch (e) {
        print('Error updating meal: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xảy ra lỗi khi cập nhật thông tin bữa ăn'),
          ),
        );
      }
    }
  }

  void _navigateToEditSizeScreen(
      BuildContext context, DoKichThuoc doKichThuoc) async {
    final updatedSize = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditSizeScreen(doKichThuoc: doKichThuoc),
      ),
    );

    if (updatedSize != null) {
      try {
        await updateSize(
          doKichThuoc.id,
          updatedSize['chieuCao'],
          updatedSize['canNang'],
          updatedSize['thoiGianDo'],
        );
        final userId = await getUserIDFromLocalStorage();
        setState(() {
          futureAppointments = fetchUncompletedAppointments(userId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Thông tin đo kích thước đã được cập nhật thành công'),
          ),
        );
      } catch (e) {
        print('Error updating size: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xảy ra lỗi khi cập nhật thông tin đo kích thước'),
          ),
        );
      }
    }
  }
}

void checkAndUpdateStatus(List<Appointments> appointments) {
  final DateTime today = DateTime.now();
  for (var appointment in appointments) {
    if (appointment.thuoc != null) {
      final Thuoc thuoc = appointment.thuoc!;
      if (today.isAfter(thuoc.ngayKetThuc)) {
        appointment.isCompleted = true;
        updateAppointmentStatus(appointment.id, true);
      }
    }
    if (appointment.tiemChung != null) {
      final TiemChung tiemChung = appointment.tiemChung!;
      if (today.isAfter(tiemChung.ngayKham)) {
        appointment.isCompleted = true;
        updateAppointmentStatus(appointment.id, true);
      }
    }
    if (appointment.buaAn != null) {
      final BuaAn buaAn = appointment.buaAn!;
      if (today.isAfter(buaAn.ngayKetThuc)) {
        appointment.isCompleted = true;
        updateAppointmentStatus(appointment.id, true);
      }
    }
    if (appointment.doKichThuoc != null) {
      final DoKichThuoc doKichThuoc = appointment.doKichThuoc!;
      if (today.isAfter(doKichThuoc.thoiGianDo)) {
        appointment.isCompleted = true;
        updateAppointmentStatus(appointment.id, true);
      }
    }
  }
}
