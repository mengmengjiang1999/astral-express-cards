#!/usr/bin/env python3
"""Compile the two-sided 90 × 54 mm card with bundled open fonts."""
import io
import re
import subprocess
from pathlib import Path
import typst
from pypdf import PdfReader
ROOT = Path(__file__).resolve().parents[1]
pdf = typst.compile(str(ROOT/'main.typ'), root=str(ROOT),
    font_paths=[str(ROOT/'assets/fonts')], ignore_system_fonts=True)
r = PdfReader(io.BytesIO(pdf))
assert len(r.pages) == 2, 'Expected front and back pages'
for p in r.pages:
    assert abs(float(p.mediabox.width)*25.4/72-90) < .1
    assert abs(float(p.mediabox.height)*25.4/72-54) < .1
for p, required in zip(r.pages, [('开拓者', 'UID', '星穹列车', '无名客', '项目执行', '危机应对'), ('愿此行，终抵群星', '毁灭', '存护', '同谐', '记忆', '欢愉')]):
    text = re.sub(r'\s+', '', p.extract_text())
    assert all(x in text for x in required)
out = ROOT/'output/pdf/trailblazer-card.pdf';out.parent.mkdir(parents=True,exist_ok=True);out.write_bytes(pdf)
images = ROOT/'output/images'; images.mkdir(parents=True,exist_ok=True)
for n, side in enumerate(('front','back'), 1):
    subprocess.run(['pdftoppm','-f',str(n),'-l',str(n),'-r','600','-png','-singlefile',str(out),str(images/f'trailblazer-card-{side}-600dpi')],check=True)
print('PASS: two pages, 90 × 54 mm, required text, 600 dpi previews')
