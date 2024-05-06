import 'package:flutter/material.dart';
import 'package:flutter_clinic_renald/core/core.dart';

import '../../../../core/components/components.dart';

class CreateRMSuccessDialog extends StatelessWidget {
  const CreateRMSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Align(
        alignment: Alignment.topRight,
        child: CloseButton(),
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 10, 40.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Assets.images.createRmSuccess.image(),
            ),
            const SpaceHeight(20.0),
            Button.filled(
              width: 120.0,
              onPressed: () => context.pop(true),
              label: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
