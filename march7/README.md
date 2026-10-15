# 三月七 · 星穹列车名片

参照用户提供的开拓者名片布局，采用三月七蓝粉配色，横版双面，成品尺寸 90 × 54 mm。

## 编辑

- `config/character.json`：姓名、英文名、身份、岗位、专长、结语、背面命途标签及照片路径。
- `config/theme.typ`：配色、字体、字号、尺寸、品牌和装饰素材路径。
- `components/card.typ`：正面正文网格、身份组件和边框装饰。
- `components/back.typ`：背面结语、命途与四瓣花分隔线。
- `components/frame.typ`：正反面共享的切角边框。
- `main.typ`：编译入口；所有资源均用项目内相对路径。
- `assets/fonts`：随包字体及其 OFL 许可。

姓名、身份和专长采用自动排版；更换为较长内容后请检查是否换行或溢出。
证件照直接复用简历已确认的去字素材，并按原始比例完整显示。
花和车票也直接复用简历素材。此处未新增 UID、二维码或虚构联系方式。

## 本地编译

安装 Typst CLI 后，在项目根目录运行：

```sh
typst compile --font-path assets/fonts main.typ output/pdf/march7-business-card.pdf
pdftoppm -f 1 -l 1 -r 600 -png -singlefile output/pdf/march7-business-card.pdf output/images/march7-business-card-front-600dpi
pdftoppm -f 2 -l 2 -r 600 -png -singlefile output/pdf/march7-business-card.pdf output/images/march7-business-card-back-600dpi
```

或安装 Python 的 `typst`、`pypdf` 和 Poppler 后运行：

```sh
python3 scripts/build.py
```

构建脚本检查正反两页、90 × 54 mm 尺寸及正反面正文完整性，并分别导出 600 dpi PNG。

## Typst 网站

新建项目后上传此目录的源文件、config、components 与 assets。
将本项目 `main.typ` 设为预览入口即可。字体已随包，无需改为系统字体。
若文件夹整体上传后生成外层目录，直接预览该目录中的 `main.typ`。

## 输出与打印

- `output/pdf/march7-business-card.pdf`：标准成品尺寸的双页 PDF，第 1 页正面、第 2 页背面。
- `output/images/march7-business-card-front-600dpi.png`：正面 2126 × 1276 高清 PNG。
- `output/images/march7-business-card-back-600dpi.png`：背面 2126 × 1276 高清 PNG。

打印使用 100% 实际尺寸，正反面均保持相同阅读方向；正式印刷前请先做双面套准小样。本稿为成品尺寸版，无出血或裁切标记；交付印厂时应根据其要求制作出血版。

## 素材

角色和相关 IP 属于其原权利方；照片和装饰沿用本次会话中已确认的简历素材。
随包仅便于本项目编辑，不表示素材获得了额外授权。

在线编辑：[三月七双面名片](https://typst.app/project/pp2WfbmXR4VPtex18LQ64C)。
