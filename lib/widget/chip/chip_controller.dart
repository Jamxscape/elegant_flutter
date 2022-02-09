import 'package:get/get.dart';

class ChipController extends GetxController {
  final RxBool isSelected = false.obs;
  final RxInt radioSelected = 0.obs;
  final RxList<String> filters = <String>[].obs;
  final RxList<String> filtersGroup = <String>[].obs;
  @override
  Future<void> initData() async {}
}
