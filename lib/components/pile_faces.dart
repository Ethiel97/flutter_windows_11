import 'package:flutter/material.dart';
import 'package:flutter_windows_11/constants.dart';

List faces = ["me.jpg", "51.jpg", "54.jpg", "31.jpg", "11.jpg", "98.jpg"];

class PileFaces extends StatelessWidget {
  const PileFaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: faces
            .asMap()
            .entries
            .map(
              (entry) => Positioned(
                left: (20 * entry.key).toDouble(),
                child: entry.key + 1 == faces.length
                    ? viewMoreItem()
                    : Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: backgroundColor,
                            width: 1.4,
                          ),
                          borderRadius: BorderRadius.circular(200),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/${entry.value}",
                            ),
                          ),
                        ),
                      ),
              ),
            )
            .toList());
  }
}

Widget viewMoreItem() => Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.8),
        border: Border.all(
          color: backgroundColor,
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(200),
      ),
      child: const Text(
        "+3",
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
