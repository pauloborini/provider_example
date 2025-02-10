import 'package:motels/app_exports.dart';
import 'package:motels/models/internal/status_result.dart';

class MotelService extends ChangeNotifier {
  final MotelRepository _motelRepo;

  MotelService({required MotelRepository motelRepo}) : _motelRepo = motelRepo;

  List<MotelModel> _motels = [];

  List<MotelModel> get motels => _motels;

  Future<StatusResult> fetchMotels() async {
    try {
      _motels = await _motelRepo.fetchMotels();
      notifyListeners();
      return StatusResult.success('');
    } catch (e) {
      return StatusResult.failure('Erro ao buscar motéis');
    }
  }
}
