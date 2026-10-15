# 开拓者双面名片

黑金配色，90 × 54 mm；PDF 第 1 页正面，第 2 页背面。保留原名片版式、照片、车票装饰及空白 UID 栏。

## 编辑

修改 `main.typ` 开头的 `#let uid = ""` 填写 UID。文字、颜色及排版均在此文件中；素材使用 `assets/` 下的相对路径。

为在不同电脑及 Typst 网站上编译一致，仓库随附 Noto Sans SC、Noto Serif CJK SC 字体。正文采用 Noto Sans SC，姓名和背面结语采用 Noto Serif CJK SC；原本依赖 macOS 的苹方和宋体备用字体不再需要。

```sh
# 在仓库根目录安装 Python 依赖
python3 -m pip install -r requirements.txt
# 另需安装 Poppler（pdftoppm）用于高清图片导出
python3 trailblazer/scripts/build.py
```

也可在当前角色目录运行 Typst CLI：

```sh
typst compile --font-path assets/fonts main.typ output/pdf/trailblazer-card.pdf
```

将 `main.typ` 和整个 `assets/` 文件夹上传到 Typst 即可编译；若整体导入到子目录，可在根入口写 `#include "trailblazer/main.typ"`。

## 输出

- [正反面 PDF](output/pdf/trailblazer-card.pdf)
- [正面 600 dpi PNG](output/images/trailblazer-card-front-600dpi.png)
- [背面 600 dpi PNG](output/images/trailblazer-card-back-600dpi.png)

PDF 为净尺寸设计稿，无出血和裁切标记；打印选实际尺寸。游戏角色和素材归原权利人所有，本项目为非官方同人创作。字体随附 SIL OFL 许可。

在线编辑：[开拓者双面名片](https://typst.app/project/pYlUXr2Nfw6kLYnRrLrAPo)。
