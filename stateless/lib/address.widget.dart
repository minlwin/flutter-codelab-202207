import 'package:flutter/material.dart';
import 'package:stateless/model.dart';
import 'package:stateless/user.widget.dart';

class AddressWidget extends StatelessWidget {
  final Address address;
  const AddressWidget(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.pin_drop_outlined,
                  size: 36,
                ),
              ),
              Text(
                "Address",
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          const SizedBox(height: 16),
          NamedLabel(title: "Building", value: address.address),
          NamedLabel(title: "Street", value: address.street),
          NamedLabel(title: "Township", value: address.township),
        ],
      ),
    );
  }
}
