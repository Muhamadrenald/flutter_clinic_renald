import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/components/custom_date_picker.dart';
import 'package:flutter_clinic_renald/data/models/request/add_reservation_request_model.dart';
import 'package:flutter_clinic_renald/presentation/home/pages/dashboard.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/add_reservation/add_reservation_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../../../data/models/response/master_doctor_response_model.dart';
import '../../../data/models/response/master_patient_response.dart';
import '../bloc/data_doctor/data_doctor_bloc.dart';
import '../widgets/doctor_dropdown.dart';

class CreateReservePatientDialog extends StatefulWidget {
  final MasterPatient? patient;
  const CreateReservePatientDialog({super.key, this.patient});

  @override
  State<CreateReservePatientDialog> createState() =>
      _CreateReservePatientDialogState();
}

class _CreateReservePatientDialogState
    extends State<CreateReservePatientDialog> {
  //final genders = ['Laki-laki', 'Perempuan'];

  MasterDoctor? selectedDoctor;

  // late final ValueNotifier<bool> switchNotifier;
  // late final ValueNotifier<String?> genderNotifier;
  late final TextEditingController patientNameController;
  late final TextEditingController nikController;
  late final TextEditingController complaintController;
  late final TextEditingController birthDateController;
  late final TextEditingController genderController;
  late DateTime? scheduleTime;
  late DateTime? birthDate;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  void initState() {
    // switchNotifier = ValueNotifier(widget.patient == null);
    // genderNotifier = ValueNotifier(widget.patient?.gender);
    patientNameController = TextEditingController(text: widget.patient?.name);
    nikController = TextEditingController(text: widget.patient?.nik);
    complaintController = TextEditingController();
    scheduleTime = DateTime.now();
    birthDate = widget.patient?.birthDate;
    birthDateController = TextEditingController();
    // genderController = TextEditingController();

    context.read<DataDoctorBloc>().add(const DataDoctorEvent.getDoctors());
    super.initState();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    nikController.dispose();
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: context.deviceWidth / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Detail Pasien',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(24.0),
                    const Row(
                      children: [
                        Text(
                          'Nama Pasien',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8.0),
                    CustomTextField(
                      controller: patientNameController,
                      label: 'Nama Pasien',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    const Row(
                      children: [
                        Text(
                          'Tanggal Lahir',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8.0),
                    CustomDatePicker(
                      initialDate: birthDate,
                      label: 'Tanggal Lahir',
                      showLabel: false,
                      isDisabled: true,
                    ),
                    const SpaceHeight(24.0),
                    const Row(
                      children: [
                        Text(
                          'Tanggal Pemeriksaan',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8.0),
                    CustomDatePicker(
                      initialDate: scheduleTime,
                      label: 'Schedule',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          scheduleTime = selectedDate,
                    ),
                    const SpaceHeight(24.0),
                    const Row(
                      children: [
                        Text(
                          'Catatan',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8.0),
                    CustomTextField(
                      controller: complaintController,
                      label: 'Keluhan',
                      showLabel: false,
                      isDescription: true,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceWidth(50.0),
            SingleChildScrollView(
              child: SizedBox(
                width: context.deviceWidth / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Pilih Doctor',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(24.0),
                    BlocBuilder<DataDoctorBloc, DataDoctorState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          loaded: (doctors) {
                            return DoctorDropdown(
                              value: selectedDoctor,
                              items: doctors,
                              label: 'Pilih Dokter',
                              onChanged: (value) {
                                setState(() {
                                  selectedDoctor = value;
                                });
                              },
                            );
                          },
                          orElse: () {
                            return DoctorDropdown(
                              value: selectedDoctor,
                              items: const [],
                              label: 'Pilih Dokter',
                              onChanged: (value) {
                                setState(() {
                                  selectedDoctor = value;
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 305.0,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.images.doctorPlaceholder.image(width: 140.0),
                            const SpaceHeight(20.0),
                            const Text(
                              'Add Doctor to Patient',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                            const SpaceHeight(10.0),
                            const Text(
                              'Search and add doctor to this patient.',
                              style: TextStyle(color: AppColors.darkGrey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(10.0),
                    Row(
                      children: [
                        Flexible(
                          child: Button.outlined(
                            onPressed: () => context.pop(),
                            label: 'Cancel',
                          ),
                        ),
                        const SpaceWidth(10.0),
                        Flexible(
                            child: BlocConsumer<AddReservationBloc,
                                AddReservationState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              orElse: () {},
                              loaded: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Reservation created'),
                                  ),
                                );
                                context.pushReplacement(const DashboardPage());
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                  ),
                                );
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final requestData =
                                      AddReservationRequestModel(
                                    patientId: widget.patient?.id,
                                    doctorId: selectedDoctor?.id,
                                    scheduleTime: scheduleTime,
                                    complaint: complaintController.text,
                                  );
                                  context.read<AddReservationBloc>().add(
                                      AddReservationEvent.addReservation(
                                          data: requestData));
                                },
                                label: 'Create',
                              );
                            }, loading: () {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                          },
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
