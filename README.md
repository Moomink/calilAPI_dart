# Calil APi with Dart
## Warning
このライブラリは開発中です。現在、図書館検索のみ対応しています。

This library is under development.
Currently, only library search is supported.
Calil APIをDartで扱えるようにしたやつ



## How to use

```Dart
import 'package:calil_api/calil_api.dart';

void main() async {
  var key = "<<CALIL API KEY>>";
  var libraryList = await searchLibrary(appkey: key, systemid: "Univ_Kisaraze_Ct");

  libraryList.forEach((v) {
    print(v.systemname);
  });
}
```

## Requirement
* Calil APi Key


Calil([https://calil.jp](https://calil.jp))
