import 'package:flutter/material.dart';
import 'package:flutter_clinic_renald/data/models/response/service_order_response_model.dart';

import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../core/components/components.dart';

class OrderMenu extends StatelessWidget {
  final ServiceOrder data;
  const OrderMenu({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final qtyController = TextEditingController(text: '${data.quantity}');
    var formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: Image.asset(
                    Assets.images.medicine.path,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  data.name!,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(data.price.toString()),
              ),
            ),
            const SpaceWidth(8),
            SizedBox(
              width: 125.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatter.format((double.parse(data.price!).toInt() * 1)),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
