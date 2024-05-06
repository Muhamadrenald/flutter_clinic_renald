import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/components/custom_date_picker.dart';
import 'package:flutter_clinic_renald/core/components/custom_dropdown.dart';
import 'package:flutter_clinic_renald/data/models/request/add_patient_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/city_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/province_response_model.dart';
import 'package:flutter_clinic_renald/data/models/response/wilayah_response_model.dart';
import 'package:flutter_clinic_renald/presentation/home/pages/dashboard.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/add_patient/add_patient_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/city/city_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/province/province_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/village/village_bloc.dart';

import 'package:intl/intl.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';
import '../bloc/district/district_bloc.dart';
import '../pages/data_patient_page.dart';

class CreatePatientDialog extends StatefulWidget {
  const CreatePatientDialog({
    super.key,
  });

  @override
  State<CreatePatientDialog> createState() => _CreatePatientDialogState();
}

class _CreatePatientDialogState extends State<CreatePatientDialog> {
  final genders = ['Laki-laki', 'Perempuan'];
  final cities = ['City 1', 'City 2', 'City 3']; // Contoh data kota/kabupaten
  final provinces = [
    'Province 1',
    'Province 2',
    'Province 3'
  ]; // Contoh data provinsi
  final villages = ['Village 1', 'Village 2', 'Village 3']; // Contoh data desa
  final districts = ['District 1', 'District 2', 'District 3'];
  final marital_status = ['Menikah', 'Lajang', 'Cerai'];

  String? selectedGender;
  City? selectCity;
  Province? selectProvince;
  Wilayah? selectVillage;
  Wilayah? selectDistrict;
  String? selectMaritalStatus;
  int? isDeceased = 0;
  DateTime? birthDate;

  late TextEditingController patientNameController;
  late TextEditingController nikController;
  late TextEditingController kkController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController birthPlaceController;
  late TextEditingController addressController;
  late TextEditingController cityCodeController;
  late TextEditingController provinceCodeController;
  late TextEditingController districtCodeController;
  late TextEditingController villageCodeController;
  late TextEditingController rtController;
  late TextEditingController rwController;
  late TextEditingController postalCodeController;
  late TextEditingController relationshipNameController;
  late TextEditingController relationshipPhoneController;

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final String formattedDate = formatter.format(date);

    return formattedDate;
  }

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvinces());
    super.initState();
    selectedGender = null;
    patientNameController = TextEditingController();
    nikController = TextEditingController();
    kkController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    birthPlaceController = TextEditingController();
    addressController = TextEditingController();
    cityCodeController = TextEditingController();
    provinceCodeController = TextEditingController();
    districtCodeController = TextEditingController();
    villageCodeController = TextEditingController();
    rtController = TextEditingController();
    rwController = TextEditingController();
    postalCodeController = TextEditingController();
    relationshipNameController = TextEditingController();
    relationshipPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    patientNameController.dispose();
    nikController.dispose();
    kkController.dispose();
    phoneController.dispose();
    emailController.dispose();
    birthPlaceController.dispose();
    addressController.dispose();
    cityCodeController.dispose();
    provinceCodeController.dispose();
    districtCodeController.dispose();
    villageCodeController.dispose();
    rtController.dispose();
    rwController.dispose();
    postalCodeController.dispose();
    relationshipNameController.dispose();
    relationshipPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.deviceWidth / 2,
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
                  controller: kkController,
                  label: 'KK',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: patientNameController,
                  label: 'Nama Pasien',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: phoneController,
                  label: 'Nomor Handphone',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDropdown(
                  value: selectedGender,
                  items: genders,
                  label: 'Jenis Kelamin',
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: birthPlaceController,
                  label: 'Tempat Lahir',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDatePicker(
                  initialDate: birthDate,
                  label: 'Tanggal Lahir',
                  showLabel: false,
                  onDateSelected: (selectedDate) {
                    setState(() {
                      birthDate = selectedDate;
                    });
                  },
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    const Text('Status Kematian'),
                    const Spacer(),
                    Switch(
                      value: isDeceased == 1,
                      onChanged: (value) {
                        setState(() {
                          isDeceased = value ? 1 : 0;
                        });
                      },
                    ),
                  ],
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: addressController,
                  label: 'Alamat Lengkap',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                BlocBuilder<ProvinceBloc, ProvinceState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (data) {
                        return CustomDropdown(
                          value: selectProvince,
                          items: data,
                          label: 'Provinsi',
                          onChanged: (value) {
                            context.read<CityBloc>().add(
                                  CityEvent.getCity(
                                      int.parse(value!.code ?? '0')),
                                );
                            setState(() {
                              selectProvince = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                BlocBuilder<CityBloc, CityState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectCity,
                          items: const [],
                          label: 'Kota/Kabupaten',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (data) {
                        return CustomDropdown(
                          value: selectCity,
                          items: data,
                          label: 'Kota/Kabupaten',
                          onChanged: (value) {
                            context.read<DistrictBloc>().add(
                                  DistrictEvent.getDistrict(
                                      int.parse(value!.code ?? '0')),
                                );
                            setState(() {
                              selectCity = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                BlocBuilder<DistrictBloc, DistrictState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectDistrict,
                          items: const [],
                          label: 'Kecamatan',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (data) {
                        return CustomDropdown(
                          value: selectDistrict,
                          items: data,
                          label: 'Kecamatan',
                          onChanged: (value) {
                            context.read<VillageBloc>().add(
                                  VillageEvent.getVillage(
                                      int.parse(value!.code ?? '0')),
                                );
                            setState(() {
                              selectDistrict = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                BlocBuilder<VillageBloc, VillageState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return CustomDropdown(
                          value: selectVillage,
                          items: const [],
                          label: 'Desa/Kelurahan',
                          onChanged: (value) {},
                          showLabel: false,
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (data) {
                        return CustomDropdown(
                          value: selectVillage,
                          items: data,
                          label: 'Desa/Kelurahan',
                          onChanged: (value) {
                            setState(() {
                              selectVillage = value;
                            });
                          },
                          showLabel: false,
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: rtController,
                  label: 'RT',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: rwController,
                  label: 'RW',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: postalCodeController,
                  label: 'Kode Pos',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomDropdown(
                  value: selectMaritalStatus,
                  items: marital_status,
                  label: 'Status Pernikahan',
                  onChanged: (value) {
                    selectMaritalStatus = value;
                  },
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: relationshipNameController,
                  label: 'Nama Pasangan',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: relationshipPhoneController,
                  label: 'Nomor Handphone Pasangan',
                  showLabel: false,
                ),
                const SpaceHeight(24.0),
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
                        child: BlocListener<AddPatientBloc, AddPatientState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: () {
                            //snackbar success
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pasien berhasil ditambahkan'),
                              ),
                            );
                            context.pushReplacement(const DashboardPage());
                          },
                        );
                      },
                      child: BlocBuilder<AddPatientBloc, AddPatientState>(
                        builder: (context, state) {
                          return state.maybeWhen(orElse: () {
                            return Button.filled(
                              onPressed: () {
                                final addPatientRequetData =
                                    AddPatientRequestModel(
                                        nik: nikController.text,
                                        kk: kkController.text,
                                        name: patientNameController.text,
                                        phone: phoneController.text,
                                        email: emailController.text,
                                        gender: selectedGender,
                                        birthPlace: birthPlaceController.text,
                                        birthDate: formatDate(birthDate!),
                                        addressLine: addressController.text,
                                        city: selectCity?.name,
                                        cityCode: selectCity?.code,
                                        province: selectProvince?.name,
                                        provinceCode: selectProvince?.code,
                                        district: selectDistrict?.name,
                                        districtCode: selectDistrict?.code,
                                        village: selectVillage?.name,
                                        villageCode: selectVillage?.code,
                                        rt: rtController.text,
                                        rw: rwController.text,
                                        postalCode: postalCodeController.text,
                                        maritalStatus: selectMaritalStatus,
                                        relationshipName:
                                            relationshipNameController.text,
                                        relationshipPhone:
                                            relationshipPhoneController.text,
                                        isDeceased: isDeceased);
                                context.read<AddPatientBloc>().add(
                                      AddPatientEvent.addPatient(
                                          addPatientRequetData),
                                    );
                              },
                              label: 'Create Patient',
                            );
                          }, loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                        },
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
