#!/usr/bin/env bash
cd "$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

git clone https://github.com/RaymondCM/cocoapi tmp_cocoapi
cd tmp_cocoapi
git checkout --orphan python-api
find . -maxdepth 1 \! -regex  '.*\(PythonAPI\|common\|\.\|\.\.\|\.git\)$' | xargs rm -r
mv PythonAPI/* .
rm -r PythonAPI
sed -i 's/..\/common/common/g' setup.py
# also in rays_pycocotools/_mask.pyx
sed -i 's/..\/common/common/g' rays_pycocotools/_mask.pyx
git add .
git commit -m "Cleaned master and pushed python-api branch"
git push origin python-api -f
bash push_to_pypi.sh
cd ..
rm -rf tmp_cocoapi
