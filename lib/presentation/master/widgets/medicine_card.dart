// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_clinic_renald/data/models/response/service_medicines_response_model.dart';

import '../../../core/components/components.dart';
import '../../../core/core.dart';

class MedicineCard extends StatefulWidget {
  final ServiceMedicines item;
  final ValueNotifier<int> quantityNotifier;
  final void Function(int) onQuantityChanged;
  final VoidCallback onRemoveTap;

  const MedicineCard({
    super.key,
    required this.item,
    required this.quantityNotifier,
    required this.onQuantityChanged,
    required this.onRemoveTap,
  });

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  @override
  Widget build(BuildContext context) {
    //final quantityNotifier = ValueNotifier(0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: Image.network(
              //     item.imageUrl,
              //     width: 50.0,
              //     height: 50.0,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // const SpaceWidth(14.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.deviceWidth - 900.0,
                        child: Text(widget.item.name!),
                      ),
                      InkWell(
                        onTap: widget.onRemoveTap,
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: AppColors.red),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.deviceWidth - 900.0,
                    child: Text(widget.item.category!),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.deviceWidth - 700.0,
                        child: Text(
                          '${widget.item.price}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onQuantityChanged(
                              widget.quantityNotifier.value - 1);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove_circle),
                        color: AppColors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ValueListenableBuilder(
                          valueListenable: widget.quantityNotifier,
                          builder: (context, value, _) => Text('$value'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onQuantityChanged(
                              widget.quantityNotifier.value + 1);
                          setState(() {});
                        },
                        icon: const Icon(Icons.add_circle),
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sub-total'),
              ValueListenableBuilder(
                valueListenable: widget.quantityNotifier,
                builder: (context, value, _) => Text(
                  '${(widget.item.price! * value)}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
