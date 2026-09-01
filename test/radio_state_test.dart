import 'package:flutter_test/flutter_test.dart';
import 'package:islamyapp/Features/presentation/view/Raduio/cubit/cubit_radio/fetch_redios_cubit.dart';

void main() {
  test('FetchRediosSucess should update when playing state changes', () {
    expect(
      const FetchRediosSucess(radiolist: [], isPlaying: false),
      isNot(const FetchRediosSucess(radiolist: [], isPlaying: true)),
    );
  });
}
