# vscode配置markdown和uml环境
## 1 配置markdown环境
* 安装vscode过程省略 
* 进入vscode后，进入扩展工具（快捷键ctrl+shift+X），搜索markdown，选择markdown All in One并安装
* 安装后新建test.md文件即可开始编写markwdown文件了
* 点击屏幕右上角的‘打开侧边预览’即可进行markdown实时预览，如下图所示

![操作按钮位置示意](res/1.jpg)

<p align='center'> 图1 操作按钮位置示意 </p>

![效果图](res/2.jpg)

<p align='center'>图2 效果图</p>

## 2. 配置uml环境
uml工具常用的有plantUML、

```uml
@startuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response

Alice -> Bob: Another authentication Request
Alice <-- Bob: another authentication Response
@enduml
```