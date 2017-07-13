# SandBox
砂場

コーディング規約
---

・[Apple](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html) 
・[NYTimes](https://github.com/NYTimes/objective-c-style-guide)

---
ディレクトリ構造
---

<pre>
sandbox-iOS
├── ◯Controllers
|     ├── ◯Common 
|     └── UIView
├── ◯Models
|     ├── ◯Common 
|     └── UIView
├── ○Utils
|     ├── ◯Common 
|     └── UIView
├── ◯Resources（plist等）
├── ◯StoryBoards
└── ◯Views
      ├── ◯Common 
      └── UIView
</pre>

GitHubがデフォルトで用意している以下のIssueのLabelの意味

- ラベル 意味
- help wanted 助けを求める場合
- bug バグの場合
- duplicate すでに内容の重複したIssueが存在する場合
- enhancement 機能強化の場合
- invalid 間違い、勘違い、実現不可の場合。対応しない内容を書いてクローズ
- question 疑問がある場合
- wontfix 対応しないバグ等がある場合。対応しない理由を書いてクローズ
