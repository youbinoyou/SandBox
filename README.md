# SandBox
砂場

コーディング規約
---

[Apple](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html) と [NYTimes](https://github.com/NYTimes/objective-c-style-guide) あたりに目を通しておきましょう。

---
ディレクトリ構造
---

模索中。確定しているものについては先頭に◯がついています。
<pre>
sandbox-iOS
├── ◯Controllers
├── ?Logic（APIへのアクセスとか）
├── ◯Models
├── ?Utils（悩んでる）
├── ◯Resources（plist等）
├── ◯StoryBoards
└── ◯Views
      ├── ◯Common (UIButton 等、共通で使うものを格納)  
      └── UIView（他、UIAlertView やら TableView やらなんやら）
</pre>
