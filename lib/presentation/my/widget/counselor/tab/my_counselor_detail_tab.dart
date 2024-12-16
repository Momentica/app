import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

class MyCounselorDetailTab extends StatelessWidget {
  const MyCounselorDetailTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == 10 - 1 ? 0 : 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: MomenticaColor.systemGray100,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2024. 10. 14",
                        style: MomenticaTextStyle.body2(
                          color: MomenticaColor.main,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "카진호~",
                        style: MomenticaTextStyle.caption3(
                          color: MomenticaColor.systemGray800,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 48,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: MomenticaColor.systemGray300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
