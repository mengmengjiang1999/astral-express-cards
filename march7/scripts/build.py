#!/usr/bin/env python3
"""Build the card and validate physical dimensions and required content."""
import io
import json
import re
import subprocess
from pathlib import Path
import typst
from pypdf import PdfReader
ROOT = Path(__file__).resolve().parents[1]
pdf = typst.compile(str(ROOT / 'main.typ'), root=str(ROOT),
                    font_paths=[str(ROOT / 'assets/fonts')], ignore_system_fonts=True)
reader = PdfReader(io.BytesIO(pdf))
assert len(reader.pages) == 2, '名片应为正反两页；请检查新增内容的长度。'
page = reader.pages[0]
for side in reader.pages:
    assert abs(float(side.mediabox.width) * 25.4 / 72 - 90) < 0.1
    assert abs(float(side.mediabox.height) * 25.4 / 72 - 54) < 0.1
normalize = lambda s: re.sub(r'\s+', '', s)
text = normalize(page.extract_text())
c = json.loads((ROOT / 'config/character.json').read_text())
for key in ('name', 'roman_name', 'affiliation', 'role', 'specialty'):
    assert normalize(c[key]) in text, f'缺少文本: {key}'
back_text = normalize(reader.pages[1].extract_text())
for required in [c['closing'], c['back_affiliation'], *c['back_paths']]:
    assert normalize(required) in back_text, f'背面缺少文本: {required}'
target = ROOT / 'output/pdf/march7-business-card.pdf'
target.parent.mkdir(parents=True, exist_ok=True)
target.write_bytes(pdf)
images = ROOT / 'output/images'
images.mkdir(parents=True, exist_ok=True)
for number, side in enumerate(('front', 'back'), 1):
    subprocess.run(['pdftoppm', '-f', str(number), '-l', str(number), '-r', '600',
                    '-png', '-singlefile', str(target),
                    str(images / f'march7-business-card-{side}-600dpi')], check=True)
print('PASS: 90 × 54 mm / 2 pages / all front and back text present / 600 dpi PNGs')
