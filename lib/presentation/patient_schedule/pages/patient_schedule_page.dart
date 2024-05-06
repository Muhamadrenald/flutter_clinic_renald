import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/core.dart';
import 'package:flutter_clinic_renald/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';
import 'package:flutter_clinic_renald/presentation/master/dialog/create_medical_record_dialog.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/patient_schedule/patient_schedule_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/pages/confirm_payment_page.dart';

import '../../../core/components/components.dart';
import '../../home/widgets/build_app_bar.dart';
import '../../master/dialog/create_patient_dialog.dart';
import '../../master/models/pasient_model.dart';
import '../../master/models/pasient_status.dart';

class PatientSchedulePage extends StatefulWidget {
  const PatientSchedulePage({super.key});

  @override
  State<PatientSchedulePage> createState() => _PatientSchedulePageState();
}

class _PatientSchedulePageState extends State<PatientSchedulePage> {
  final searchController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final patients = [
    PasientModel(
      nama: 'John Doe',
      keluhan: 'Flu',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1990, 5, 15),
      nik: '1234567890',
      status: PasientStatus.waiting,
    ),
    PasientModel(
      nama: 'Jane Smith',
      keluhan: 'Headache',
      jenisKelamin: 'Perempuan',
      tanggalLahir: DateTime(1985, 8, 21),
      nik: '0987654321',
      status: PasientStatus.processing,
    ),
    PasientModel(
      nama: 'Michael Johnson',
      keluhan: 'Stomachache',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1978, 3, 10),
      nik: '5432167890',
      status: PasientStatus.rejected,
    ),
    PasientModel(
      nama: 'Emily Williams',
      keluhan: 'Fever',
      jenisKelamin: 'Perempuan',
      tanggalLahir: DateTime(1992, 11, 30),
      nik: '0987123456',
      status: PasientStatus.completed,
    ),
    PasientModel(
      nama: 'David Brown',
      keluhan: 'Cough',
      jenisKelamin: 'Laki-laki',
      tanggalLahir: DateTime(1980, 7, 5),
      nik: '6789012345',
      status: PasientStatus.confirmed,
    ),
  ];
  late List<PasientModel> searchResult;

  @override
  void initState() {
    context
        .read<PatientScheduleBloc>()
        .add(const PatientScheduleEvent.getPatientSchedule());
    super.initState();
  }

  void createRmPatientTap(int patientScheduleId, DateTime scheduleTime,
      String complaint, int doctorId, Patient patient) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CreateMedicalRecordDialog(
        doctorId: doctorId,
        patient: patient,
        patientScheduleId: patientScheduleId,
        scheduleTime: scheduleTime,
        complaint: complaint,
      ),
    );
  }

  void createPayment(
    PatientSchedule schedulePatient,
    //int patientScheduleId,
    int totalPrice,
    //int patientId,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ConfirmPaymentPage(
        //patientId: patientId,
        //schedulePatientId: patientScheduleId,
        schedulePatient: schedulePatient,
        totalPrice: totalPrice,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Jadwal Pasien',
          withSearchInput: true,
          searchController: searchController,
          searchChanged: (value) {
            searchResult = patients
                .where((element) => element.nama
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()))
                .toList();
            setState(() {});
          },
          searchHint: 'Cari Pasien',
        ),
      ),
      endDrawer: Drawer(
        width: context.deviceWidth / 1.25,
        child: const SizedBox(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Row(
            children: [
              Badge(
                backgroundColor: PasientStatus.waiting.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.waiting.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.processing.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.processing.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.onHold.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.onHold.value),
              const SpaceWidth(40.0),
              Badge(
                backgroundColor: PasientStatus.completed.color,
                smallSize: 18.0,
              ),
              const SpaceWidth(4.0),
              Text(PasientStatus.completed.value),
            ],
          ),
          const SpaceHeight(40.0),
          BlocBuilder<PatientScheduleBloc, PatientScheduleState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (patients) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.stroke),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Nama Pasien',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Keluhan',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Jenis Kelamin',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Tanggal Lahir',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'NIK',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Status',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Action',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                        rows: patients
                            .map(
                              (patient) => DataRow(cells: [
                                DataCell(Text(patient.patient!.name ?? '')),
                                DataCell(Text(
                                    '${patient.complaint!.length > 10 ? patient.complaint!.substring(0, 10) : patient.complaint}...')),
                                DataCell(Text(patient.patient!.gender ?? '')),
                                DataCell(Text(patient.patient!.birthDate!
                                    .toFormattedDate())),
                                DataCell(Text(patient.patient!.nik ?? '')),
                                DataCell(ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: ColoredBox(
                                    color: Colors.grey.withOpacity(0.2),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                      child: Text(
                                        patient.status ?? '',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                DataCell(
                                  PopupMenuButton<PasientStatus>(
                                    offset: const Offset(0, 50),
                                    icon: const Icon(Icons.more_horiz),
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<PasientStatus>>[
                                      const PopupMenuItem<PasientStatus>(
                                        value: PasientStatus.processing,
                                        child: _PopupMenuItemValue(
                                            PasientStatus.processing),
                                      ),
                                      const PopupMenuItem<PasientStatus>(
                                        value: PasientStatus.onHold,
                                        child: _PopupMenuItemValue(
                                            PasientStatus.onHold),
                                      ),
                                      const PopupMenuItem<PasientStatus>(
                                        value: PasientStatus.waiting,
                                        child: _PopupMenuItemValue(
                                            PasientStatus.waiting),
                                      ),
                                      const PopupMenuItem<PasientStatus>(
                                        value: PasientStatus.completed,
                                        child: _PopupMenuItemValue(
                                            PasientStatus.completed),
                                      ),
                                      const PopupMenuItem<PasientStatus>(
                                        value: PasientStatus.rejected,
                                        child: _PopupMenuItemValue(
                                            PasientStatus.rejected),
                                      ),
                                    ],
                                    onSelected: (PasientStatus value) {
                                      if (value == PasientStatus.processing) {
                                        createRmPatientTap(
                                            patient.id!,
                                            patient.scheduleTime!,
                                            patient.complaint!,
                                            patient.doctorId!,
                                            patient.patient!);
                                      } else if (value ==
                                          PasientStatus.completed) {
                                        createPayment(
                                          patient,
                                          patient.totalPrice ?? 0,
                                        );
                                      } else {
                                        scaffoldkey.currentState!
                                            .openEndDrawer();
                                      }
                                    },
                                  ),
                                )
                              ]),
                            )
                            .toList(),
                      ),
                    ),
                  );
                },
                orElse: () => const SizedBox(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PopupMenuItemValue extends StatelessWidget {
  final PasientStatus item;
  const _PopupMenuItemValue(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 18.0,
          height: 18.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: item.color,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SpaceWidth(4.0),
        Text(item.value),
      ],
    );
  }
}
