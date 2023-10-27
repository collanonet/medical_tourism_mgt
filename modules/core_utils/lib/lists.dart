class Lists {
  Lists._();

  static List<E> separated<E>(
    int length,
    E Function(int index) generator,
    E Function(int index) separator, {
    bool growable = true,
  }) {
    return List.generate((length * 2) - 1, (index) {
      final itemIndex = index ~/ 2;
      if (index.isEven) {
        return generator(itemIndex);
      } else {
        return separator(itemIndex);
      }
    }, growable: growable);
  }
}
