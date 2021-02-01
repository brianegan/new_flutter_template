import 'dart:io';

class Sample {
  final String name;
  final String path;

  Sample(String path)
      : name = path.split('/').last,
        path = '$path/lib';
}

class Output {
  final String name;
  final int lineCount;

  Output(this.name, this.lineCount);

  @override
  String toString() {
    return 'Output{name: $name, lineCount: $lineCount}';
  }
}

void main(List<String> args) {
  final samples = [
    for (final entity in Directory(args.first).listSync())
      if (entity is Directory) Sample(entity.path)
  ];
  final outputs = samples.map<Output>((sample) {
    return Output(
      sample.name,
      _countLines(sample.path),
    );
  }).toList(growable: false)
    ..sort((a, b) => a.lineCount - b.lineCount);

  final strings = outputs
      .map<String>((output) => '| ${output.name} | ${output.lineCount} |')
      .join('\n');

  print('''
# Line Counts for ${args.first[0].toUpperCase() + args.first.substring(1)}

Though not the only factor or even most important factor, can help us see which
samples add a lot of code. Please note: This is not an exercise in code golf.
The line counts are meant to be direct apples-to-apples comparisons.
  
| *Sample* | *LOC (no comments)* |
|--------|-------------------|
$strings
''');
}

int _countLines(String path) {
  final dartFiles = _findDartFiles(path);

  return dartFiles.fold(0, (count, file) {
    final nonCommentsLineCount = file
        .readAsLinesSync()
        .where((line) => !line.startsWith('//') && line.trim().isNotEmpty)
        .length;

    return count + nonCommentsLineCount;
  });
}

List<File> _findDartFiles(String path) {
  final paths = Directory(path)
      .listSync(recursive: true)
      .whereType<File>()
      .map((file) => file.path)
      .where((path) =>
          path.endsWith('.dart') &&
          !path.endsWith('.g.dart') &&
          !path.contains('todos_repository') &&
          !path.contains('file_storage') &&
          !path.contains('web_client') &&
          !path.contains('main_'))
      .toSet();

  return List.unmodifiable(paths.map<File>((path) => File(path)));
}
