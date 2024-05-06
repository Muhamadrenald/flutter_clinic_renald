// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/data/models/request/create_payment_detail_request_model.dart';
import 'package:flutter_clinic_renald/data/models/response/get_medical_records_response_model.dart';

import 'package:flutter_clinic_renald/data/models/response/patient_schedule_response_model.dart';
import 'package:flutter_clinic_renald/presentation/home/pages/dashboard.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/check_status/check_status_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/create_payment_detail/create_payment_detail_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/get_service_order/get_service_order_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/bloc/qris/qris_bloc.dart';
import 'package:flutter_clinic_renald/presentation/patient_schedule/widgets/order_menu.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';

enum PaymentType { qris, cash }

class ConfirmPaymentPage extends StatefulWidget {
  //final int patientId;
  final PatientSchedule schedulePatient;
  final int totalPrice;
  const ConfirmPaymentPage({
    super.key,
    //required this.patientId,
    required this.schedulePatient,
    required this.totalPrice,
  });

  @override
  State<ConfirmPaymentPage> createState() => _ConfirmPaymentPageState();
}

class _ConfirmPaymentPageState extends State<ConfirmPaymentPage> {
  final noteController = TextEditingController();
  late final TextEditingController nominalPaymentController;
  PaymentType paymentType = PaymentType.qris;

  String orderId = '';
  Timer? timer;

  int totalPrice = 0;

  @override
  void initState() {
    nominalPaymentController = TextEditingController();
    context.read<GetServiceOrderBloc>().add(
          GetServiceOrderEvent.getServiceOrder(widget.schedulePatient.id!),
        );

    orderId = DateTime.now().millisecondsSinceEpoch.toString();
    context.read<QrisBloc>().add(QrisEvent.generateQRCode(
          orderId,
          widget.totalPrice,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            // LEFT CONTENT
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konfirmasi',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Orders #1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8.0),
                      const Divider(),
                      const SpaceHeight(24.0),
                      const Row(
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 80.0,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      BlocBuilder<GetServiceOrderBloc, GetServiceOrderState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return const SizedBox();
                            },
                            error: (message) {
                              return Center(
                                child: Text(message),
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: (data) {
                              totalPrice = data.data!
                                  .map((e) => double.parse(e.price!).toInt())
                                  .reduce((value, element) => value + element);

                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    OrderMenu(data: data.data![index]),
                                separatorBuilder: (context, index) =>
                                    const SpaceHeight(16.0),
                                itemCount: data.data!.length,
                              );
                            },
                          );
                        },
                      ),
                      const SpaceHeight(8),
                      const Divider(),
                      const SpaceHeight(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(color: AppColors.subtitle),
                          ),
                          Text(
                            totalPrice.currencyFormatRp,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SpaceHeight(24),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: noteController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Catatan pesanan',
                              ),
                            ),
                          ),
                          const SpaceWidth(12),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              child: Assets.icons.delete.svg(
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SpaceHeight(20.0),
                      // Button.filled(
                      //   onPressed: () {},
                      //   label: 'Lanjutkan Pembayaran',
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            // RIGHT CONTENT
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pembayaran',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            '2 opsi pembayaran tersedia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          const Text(
                            'Metode Bayar',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SpaceHeight(12.0),
                          Row(
                            children: [
                              paymentType == PaymentType.qris
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.qris),
                                      label: 'QRIS',
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(() {
                                        paymentType = PaymentType.qris;
                                      }),
                                      label: 'QRIS',
                                    ),
                              const SpaceWidth(16.0),
                              paymentType == PaymentType.cash
                                  ? Button.filled(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    )
                                  : Button.outlined(
                                      width: null,
                                      height: 64.0,
                                      onPressed: () => setState(
                                          () => paymentType = PaymentType.cash),
                                      label: 'Cash',
                                      style: paymentType == PaymentType.cash
                                          ? ButtonStyleType.filled
                                          : ButtonStyleType.outlined,
                                    ),
                            ],
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          if (paymentType == PaymentType.qris) ...[
                            BlocListener<CheckStatusBloc, CheckStatusState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  orElse: () {
                                    return;
                                  },
                                  loaded: (data) {
                                    print(data.transactionStatus);
                                    if (data.transactionStatus ==
                                        'settlement') {
                                      final requestModel =
                                          CreatePaymentDetailRequestModel(
                                              patientId: widget
                                                  .schedulePatient.patientId,
                                              patientScheduleId: widget
                                                  .schedulePatient.id!
                                                  .toString(),
                                              transactionTime: DateTime.now(),
                                              totalPrice: totalPrice,
                                              paymentMethod: 'QRIS');
                                      context
                                          .read<CreatePaymentDetailBloc>()
                                          .add(
                                            CreatePaymentDetailEvent.create(
                                                requestModel),
                                          );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Pembayaran berhasil'),
                                          backgroundColor: AppColors.green,
                                        ),
                                      );
                                      timer!.cancel();
                                      context.pushReplacement(DashboardPage());
                                    }
                                  },
                                );
                              },
                              child: BlocListener<QrisBloc, QrisState>(
                                listener: (context, state) {
                                  state.maybeWhen(
                                    orElse: () {
                                      return;
                                    },
                                    qrisResponse: (data) {
                                      //cek status secara berkala
                                      const onSec = Duration(seconds: 5);
                                      timer = Timer.periodic(onSec, (timer) {
                                        context.read<CheckStatusBloc>().add(
                                            CheckStatusEvent.checkPaymentStatus(
                                                orderId));
                                      });
                                    },
                                  );
                                },
                                child: BlocBuilder<QrisBloc, QrisState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return const SizedBox();
                                      },
                                      qrisResponse: (data) {
                                        print(data.actions!.first.url!);
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 300.0,
                                              height: 300.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                // color: AppColors.white,
                                              ),
                                              child: Center(
                                                child: Image.network(
                                                  data.actions!.first.url!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      loading: () {
                                        return Container(
                                          width: 300.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: AppColors.white,
                                          ),
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            // QrImageView(
                            //   data: '1234567890',
                            //   version: QrVersions.auto,
                            //   size: 300.0,
                            // ),
                          ] else if (paymentType == PaymentType.cash) ...[
                            const Text(
                              'Total Bayar',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SpaceHeight(12.0),
                            TextFormField(
                              controller: nominalPaymentController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                hintText: 'Total harga',
                              ),
                            ),
                          ],
                          const SpaceHeight(100.0),
                        ],
                      ),
                    ),
                    paymentType == PaymentType.cash
                        ? Align(
                            alignment: Alignment.bottomCenter,
                            child: ColoredBox(
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 16.0),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Button.outlined(
                                        onPressed: () => context.pop(),
                                        label: 'Batalkan',
                                      ),
                                    ),
                                    const SpaceWidth(8.0),
                                    Flexible(
                                      child: BlocConsumer<
                                          CreatePaymentDetailBloc,
                                          CreatePaymentDetailState>(
                                        listener: (context, state) {
                                          state.maybeWhen(
                                            orElse: () {},
                                            error: (message) {
                                              return ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Pembayaran gagal'),
                                                backgroundColor: AppColors.red,
                                              ));
                                            },
                                            loaded: (responseModel) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Pembayaran berhasil'),
                                                backgroundColor:
                                                    AppColors.green,
                                              ));
                                              context.pushReplacement(
                                                DashboardPage(),
                                              );
                                            },
                                          );
                                        },
                                        builder: (context, state) {
                                          return state.maybeWhen(
                                            orElse: () {
                                              return Button.filled(
                                                onPressed: () async {
                                                  final requestModel =
                                                      CreatePaymentDetailRequestModel(
                                                          patientId: widget
                                                              .schedulePatient
                                                              .patientId,
                                                          patientScheduleId:
                                                              widget
                                                                  .schedulePatient
                                                                  .id!
                                                                  .toString(),
                                                          transactionTime:
                                                              DateTime.now(),
                                                          totalPrice:
                                                              totalPrice,
                                                          paymentMethod:
                                                              'Cash');
                                                  context
                                                      .read<
                                                          CreatePaymentDetailBloc>()
                                                      .add(
                                                        CreatePaymentDetailEvent
                                                            .create(
                                                                requestModel),
                                                      );
                                                },
                                                label: 'Bayar',
                                              );
                                            },
                                            loading: () => const Align(
                                              alignment: Alignment.center,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
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
