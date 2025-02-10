import 'package:motels/app_exports.dart';

class MotelService extends ChangeNotifier {
  final MotelRepository _motelRepo;

  MotelService({required MotelRepository motelRepo}) : _motelRepo = motelRepo;

  List<MotelModel> _motelList = [];

  List<MotelModel> get motelList => _motelList;

  Future<StatusResult> fetchMotels() async {
    try {
      _motelList = await _motelRepo.fetchMotels();
      notifyListeners();
      return StatusResult.success('');
    } catch (e) {
      return StatusResult.failure('Erro ao buscar motéis');
    }
  }
}
