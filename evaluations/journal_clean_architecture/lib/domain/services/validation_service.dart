class ValidationService {
  const ValidationService();

  bool isNotEmpty(String input) {
    return input.trim().isNotEmpty;
  }

  bool isEmpty(String input) {
    return input.trim().isEmpty;
  }
}
