import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/components/spaces.dart';
import 'package:flutter_clinic_renald/core/constants/colors.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/data_doctor/data_doctor_bloc.dart';

import '../../../core/components/buttons.dart';
import '../../home/widgets/build_app_bar.dart';
import '../models/doctor_model.dart';

class DataDoctorPage extends StatefulWidget {
  const DataDoctorPage({super.key});

  @override
  State<DataDoctorPage> createState() => _DataDoctorPageState();
}

class _DataDoctorPageState extends State<DataDoctorPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<DataDoctorBloc>().add(const DataDoctorEvent.getDoctors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Dokter',
          withSearchInput: true,
          searchController: searchController,
          searchChanged: (_) {
            if (searchController.text.isNotEmpty &&
                searchController.text.length > 2) {
              context
                  .read<DataDoctorBloc>()
                  .add(DataDoctorEvent.getDoctorByName(searchController.text));
            } else {
              context
                  .read<DataDoctorBloc>()
                  .add(const DataDoctorEvent.getDoctors());
            }
          },
          // searchChanged: (value) {
          //   searchResult = doctors
          //       .where((element) => element.name
          //           .toLowerCase()
          //           .contains(searchController.text.toLowerCase()))
          //       .toList();
          //   setState(() {});
          // },
          searchHint: 'Cari Dokter',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              child: BlocListener<DataDoctorBloc, DataDoctorState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: AppColors.red,
                        ),
                      );
                    },
                  );
                },
                child: BlocBuilder<DataDoctorBloc, DataDoctorState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (doctors) {
                        return DataTable(
                          columns: [
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Button.filled(
                                  onPressed: () {},
                                  label: 'Nama Dokter',
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
                                  label: 'Spesialis',
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
                                  label: 'No REG',
                                  width: null,
                                  color: AppColors.title,
                                  textColor: AppColors.black.withOpacity(0.5),
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ],
                          rows: doctors.isEmpty
                              ? [
                                  const DataRow(
                                    cells: [
                                      DataCell(Row(
                                        children: [
                                          Icon(Icons.highlight_off),
                                          SpaceWidth(4.0),
                                          Text('Data tidak ditemukan..'),
                                        ],
                                      )),
                                      DataCell.empty,
                                      DataCell.empty,
                                    ],
                                  ),
                                ]
                              : doctors
                                  .map(
                                    (doctor) => DataRow(cells: [
                                      DataCell(Text(
                                        doctor.doctorName ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      DataCell(
                                          Text(doctor.doctorSpecialist ?? '')),
                                      DataCell(Text(doctor.sip ?? '')),
                                    ]),
                                  )
                                  .toList(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
