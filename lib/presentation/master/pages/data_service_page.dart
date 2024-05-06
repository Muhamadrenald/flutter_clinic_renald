import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clinic_renald/core/components/buttons.dart';
import 'package:flutter_clinic_renald/core/components/search_input.dart';
import 'package:flutter_clinic_renald/core/components/spaces.dart';
import 'package:flutter_clinic_renald/presentation/master/bloc/service_medicines/service_medicines_bloc.dart';
import 'package:flutter_clinic_renald/presentation/master/models/product_model.dart';

import '../../../core/core.dart';
import '../../home/widgets/build_app_bar.dart';

class DataServicePage extends StatefulWidget {
  const DataServicePage({super.key});

  @override
  State<DataServicePage> createState() => _DataServicePageState();
}

class _DataServicePageState extends State<DataServicePage> {
  final searchController = TextEditingController();
  final products = [
    ProductModel(
      image: Assets.images.products.paracetamol.path,
      name: 'Obat Parasetamol',
      category: 'Obat - obatan',
      price: 5000,
      stock: 10,
    ),
    ProductModel(
      image: Assets.images.products.sarungTanganMedis.path,
      name: 'Sarung tangan medis',
      category: 'Alat sekali pakai',
      price: 12000,
      stock: 10,
    ),
  ];
  late List<ProductModel> searchResult;

  @override
  void initState() {
    context.read<ServiceMedicinesBloc>().add(
          const ServiceMedicinesEvent.getServiceMedicines(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: BuildAppBar(
          title: 'Data Master Layanan & Obat',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.deviceWidth / 2),
            child: SearchInput(
              controller: searchController,
              onChanged: (value) {
                searchResult = products
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .toList();
                setState(() {});
              },
              hintText: 'Cari Data Item',
            ),
          ),
          const SpaceHeight(40.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<ServiceMedicinesBloc, ServiceMedicinesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loaded: (data) {
                      return DataTable(
                        dataRowMinHeight: 30.0,
                        dataRowMaxHeight: 60.0,
                        columns: [
                          DataColumn(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button.filled(
                                onPressed: () {},
                                label: 'Nama Item',
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
                                label: 'Kategori',
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
                                label: 'Harga',
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
                                label: 'Qty',
                                width: null,
                                color: AppColors.title,
                                textColor: AppColors.black.withOpacity(0.5),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                        rows: data.isEmpty
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
                                    DataCell.empty,
                                  ],
                                ),
                              ]
                            : data
                                .map(
                                  (product) => DataRow(cells: [
                                    DataCell(Text(
                                      product.name ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    DataCell(Center(
                                        child: Text(product.category ?? ''))),
                                    DataCell(Center(
                                        child: Text(double.parse(product.price!)
                                            .toInt()
                                            .currencyFormatRp))),
                                    DataCell(Center(
                                        child: Text(
                                            '${product.quantity ?? '0'}'))),
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
        ],
      ),
    );
  }
}
