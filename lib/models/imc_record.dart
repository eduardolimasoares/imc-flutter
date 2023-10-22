import 'package:hive/hive.dart';

part 'imc_record.g.dart';

@HiveType(typeId: 0)
class IMCRecord extends HiveObject {
  @HiveField(0)
  final double weight;

  @HiveField(1)
  final double imc;

  IMCRecord({required this.weight, required this.imc});
}
