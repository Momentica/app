import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  /// 텍스트 편집 업데이트를 처리하기 위해 formatEditUpdate 메서드를 재정의
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = _getFormattedPhoneNumber(newValue.text);

    /// 업데이트된 선택과 함께 포맷된 텍스트를 반환
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  /// 전화번호의 길이에 따라 형식을 지정하는 메서드
  String _getFormattedPhoneNumber(String value) {
    value = _cleanPhoneNumber(value);

    if (value.length > 3 && value.length < 8) {
      /// xxxx-xxxx 포멧
      value = '${value.substring(0, 3)}-${value.substring(3, value.length)}';
    } else if (value.length >= 8) {
      /// xxxx-xxxx-xxxx 포멧
      value = '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7, value.length)}';
    }

    return value;
  }

  /// 입력에서 숫자가 아닌 문자를 제거하는 메서드
  String _cleanPhoneNumber(String value) {
    return value.replaceAll(RegExp(r'[^0-9]'), '');
  }
}
