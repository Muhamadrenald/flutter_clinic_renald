import 'package:flutter/material.dart';
import 'package:flutter_clinic_renald/core/constants/colors.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/master_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/medical_records_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/midtrans_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/payment_detail_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/satusehat_master_wilayah_remote_datasource.dart';
import 'package:flutter_clinic_renald/data/datasources/schedule_patient_remote_datasource.dart';
import 'package:flutter_clinic_renald/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_clinic_renald/presentation/auth/pages/login_page.dart';
import 'package:flutter_clinic_renald/presentation/home/pages/dashboard.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/add_patient/add_patient_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/add_reservation/add_reservation_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/city/city_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/data_doctor/data_doctor_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/data_doctor_schedule/data_doctor_schedule_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/data_patients/data_patients_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/district/district_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/province/province_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/service_medicines/service_medicines_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/village/village_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/check_status/check_status_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/create_medical_record/create_medical_record_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/create_payment_detail/create_payment_detail_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/get_service_order/get_service_order_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/patient_schedule/patient_schedule_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/qris/qris_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataDoctorBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataPatientsBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DataDoctorScheduleBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ServiceMedicinesBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              ProvinceBloc(SatusehatMasterWilayahRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              CityBloc(SatusehatMasterWilayahRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              DistrictBloc(SatusehatMasterWilayahRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              VillageBloc(SatusehatMasterWilayahRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => AddPatientBloc(MasterRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              AddReservationBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              PatientScheduleBloc(SchedulePatientRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CreateMedicalRecordBloc(MedicalRecordsRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetServiceOrderBloc(MedicalRecordsRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => QrisBloc(MidtransRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CheckStatusBloc(MidtransRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CreatePaymentDetailBloc(PaymentDetailRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: FutureBuilder(
          future: AuthLocalDataSource().isUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data == true) {
              return const DashboardPage();
            }
            return const LoginPage();
          },
        ),
      ),
    );
  }
}
