import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/components/custom_date_picker.dart';
import 'package:flutter_clinic_renald/core/core.dart';
import 'package:flutter_clinic_renald/data/models/request/create_medical_records_request_model.dart';

import 'package:flutter_clinic_renald/data/models/response/master_doctor_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/master_patient_response.dart';
import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/service_medicines_response_model.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/service_medicines/service_medicines_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/dialog/create_rm_success_dialog.dart';
import 'package:flutter_clinic_renald/presentation/master/widgets/medicine_card.dart';
import 'package:flutter_clinic_renald/presentation/master/widgets/medicine_dropdown.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/create_medical_record/create_medical_record_bloc.dart';

import '../../../core/components/components.dart';
import '../../../core/components/custom_dropdown.dart';

class CreateMedicalRecordDialog extends StatefulWidget {
  final int doctorId;
  final Patient patient;
  final int patientScheduleId;
  final DateTime scheduleTime;
  final String complaint;
  const CreateMedicalRecordDialog({
    super.key,
    required this.doctorId,
    required this.patient,
    required this.patientScheduleId,
    required this.scheduleTime,
    required this.complaint,
  });

  @override
  State<CreateMedicalRecordDialog> createState() =>
      _CreateMedicalRecordDialogState();
}

class _CreateMedicalRecordDialogState extends State<CreateMedicalRecordDialog> {
  final statuses = ['Dewasa', 'Anak - anak'];
  List<ServiceMedicines> medicineSelected = [];

  ServiceMedicines? selectedService;

  late final ValueNotifier<String?> statusNotifier;
  late final TextEditingController patientNameController;
  // late final TextEditingController doctorNameController;
  late final TextEditingController nikController;
  late final TextEditingController complaintController;
  late final TextEditingController diagnosisController;
  late final TextEditingController medicalTreatmentController;
  late final TextEditingController doctorNoteController;
  late DateTime? handlingTime;
  int totalPrice = 0;

  late final List<ValueNotifier<int>> quantityNotifiers;

  @override
  void initState() {
    statusNotifier = ValueNotifier(statuses.first);
    patientNameController = TextEditingController(text: widget.patient.name);
    // doctorNameController =
    //     TextEditingController(text: widget.doctor.doctorName);
    nikController = TextEditingController(text: widget.patient.nik);
    complaintController = TextEditingController(text: widget.complaint);

    diagnosisController = TextEditingController(text: '');
    medicalTreatmentController = TextEditingController(text: '');
    doctorNoteController = TextEditingController(text: '');
    handlingTime = widget.scheduleTime;

    quantityNotifiers = [];

    context
        .read<ServiceMedicinesBloc>()
        .add(const ServiceMedicinesEvent.getServiceMedicines());

    super.initState();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    // doctorNameController.dispose();
    statusNotifier.dispose();
    nikController.dispose();
    diagnosisController.dispose();
    medicalTreatmentController.dispose();
    doctorNoteController.dispose();
    super.dispose();
  }

  void calculateTotalPrice() {
    int total = 0;
    for (var i = 0; i < medicineSelected.length; i++) {
      final item = medicineSelected[i];
      final quantity = quantityNotifiers[i].value;
      //string price to double
      double price = double.parse(item.price.toString());

      total += (price * 1).toInt();
    }
    setState(() {
      totalPrice = total;
    });
  }

  void updateQuantity(int index, int value) {
    quantityNotifiers[index].value = value;
    calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
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
                    const Text(
                      'Detail Pasien',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: nikController,
                      label: 'NIK',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: patientNameController,
                      label: 'Nama Pasien',
                      showLabel: false,
                    ),
                    const SpaceHeight(24.0),
                    ValueListenableBuilder(
                      valueListenable: statusNotifier,
                      builder: (context, value, _) => CustomDropdown(
                        value: value,
                        items: statuses,
                        label: 'Status',
                        onChanged: (value) => statusNotifier.value = value!,
                        showLabel: false,
                      ),
                    ),
                    const SpaceHeight(24.0),
                    CustomDatePicker(
                      initialDate: handlingTime,
                      label: 'Waktu Penanganan',
                      showLabel: false,
                      onDateSelected: (selectedDate) =>
                          handlingTime = selectedDate,
                    ),
                    const SpaceHeight(24.0),
                    // CustomTextField(
                    //   controller: doctorNameController,
                    //   label: 'Dokter Pemeriksa',
                    //   showLabel: false,
                    // ),
                    // const SpaceHeight(24.0),
                    CustomTextField(
                      controller: complaintController,
                      label: 'Keluhan',
                      showLabel: false,
                      isDescription: true,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: diagnosisController,
                      label: 'Diagnosa',
                      showLabel: false,
                      isDescription: true,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: medicalTreatmentController,
                      label: 'Tindakan Medis',
                      showLabel: false,
                      isDescription: true,
                    ),
                    const SpaceHeight(24.0),
                    CustomTextField(
                      controller: doctorNoteController,
                      label: 'Catatan Dokter',
                      showLabel: false,
                      isDescription: true,
                    ),
                  ],
                ),
              ),
            ),
            const SpaceWidth(50.0),
            SingleChildScrollView(
              child: BlocBuilder<ServiceMedicinesBloc, ServiceMedicinesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox();
                    },
                    loaded: (serviceMedicine) {
                      return SizedBox(
                        width: context.deviceWidth / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Item',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                                color: AppColors.darkGrey,
                              ),
                            ),
                            const SpaceHeight(20.0),
                            MedicineDropdown(
                              value: null,
                              items: serviceMedicine,
                              label: 'Pilih Item',
                              onChanged: (value) {
                                medicineSelected.add(value!);
                                quantityNotifiers.add(ValueNotifier(0));
                                calculateTotalPrice();
                                setState(() {});
                              },
                            ),
                            const SpaceHeight(20.0),
                            SizedBox(
                              height: 405.0,
                              child: medicineSelected.isEmpty
                                  ? Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Assets.images.medicine
                                              .image(width: 140.0),
                                          const SpaceHeight(40.0),
                                          const Text(
                                            'Add items',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          const SpaceHeight(20.0),
                                          const Text(
                                            'add medications or disposable equipment',
                                            style: TextStyle(
                                                color: AppColors.darkGrey),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...medicineSelected.map((item) =>
                                                MedicineCard(
                                                  quantityNotifier:
                                                      quantityNotifiers[
                                                          medicineSelected
                                                              .indexOf(item)],
                                                  item: item,
                                                  onRemoveTap: () {
                                                    setState(() =>
                                                        medicineSelected
                                                            .remove(item));
                                                    quantityNotifiers.removeAt(
                                                        medicineSelected.indexOf(
                                                            item)); // Remove the associated quantity notifier
                                                    calculateTotalPrice();
                                                  },
                                                  onQuantityChanged: (value) {
                                                    final index =
                                                        medicineSelected
                                                            .indexOf(item);
                                                    updateQuantity(
                                                        index, value);
                                                  },
                                                )),
                                            const Divider(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text('Total'),
                                                ValueListenableBuilder(
                                                  valueListenable:
                                                      ValueNotifier(totalPrice),
                                                  builder:
                                                      (context, value, _) =>
                                                          Text(
                                                    value.currencyFormatRp,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                            ),
                            const SpaceHeight(20.0),
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
                                    child: BlocConsumer<CreateMedicalRecordBloc,
                                        CreateMedicalRecordState>(
                                  listener: (context, state) {
                                    state.maybeWhen(
                                      orElse: () {},
                                      error: (message) {
                                        return ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(message),
                                          backgroundColor: AppColors.red,
                                        ));
                                      },
                                      loaded: (responseModel) {
                                        context.pop(true);
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) =>
                                              const CreateRMSuccessDialog(),
                                        );
                                      },
                                    );
                                  },
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return Button.filled(
                                          onPressed: () {
                                            final String? status =
                                                statusNotifier.value;
                                            final List<Service> services =
                                                medicineSelected.map((item) {
                                              final quantity =
                                                  quantityNotifiers[
                                                          medicineSelected
                                                              .indexOf(item)]
                                                      .value;
                                              return Service(
                                                id: item.id,
                                                quantity: quantity,
                                              );
                                            }).toList();
                                            final CreateMedicalRecordsRequestModel
                                                createMedicalRecord =
                                                CreateMedicalRecordsRequestModel(
                                              patientId: widget.patient.id,
                                              doctorId: widget.doctorId,
                                              status: status,
                                              patientScheduleId:
                                                  widget.patientScheduleId,
                                              services: services,
                                              diagnosis:
                                                  diagnosisController.text,
                                              medicalTreatments:
                                                  medicalTreatmentController
                                                      .text,
                                              doctorNotes:
                                                  doctorNoteController.text,
                                            );

                                            context
                                                .read<CreateMedicalRecordBloc>()
                                                .add(
                                                  CreateMedicalRecordEvent
                                                      .createMedicalRecord(
                                                          createMedicalRecord),
                                                );
                                          },
                                          label: 'Create RM',
                                        );
                                      },
                                      loading: () {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    );
                                  },
                                )),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
