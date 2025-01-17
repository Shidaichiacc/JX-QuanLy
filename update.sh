#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
APPPATH="$(cd -P "$(dirname "$SOURCE")" && pwd)"
cd $APPPATH
echo "Dang chuan bi cap nhat...."

# Reset cục bộ
git reset --hard || { echo "Loi khi reset ma nguon!"; exit 1; }

# Pull mã từ nhánh JX-QuanLyOne
git pull origin JX-QuanLyOne || { echo "Loi khi cap nhat ma nguon!"; exit 1; }

echo "Da cap nhat xong app QuanLyServer den phien ban moi nhat."

# Cấp quyền thực thi cho start.sh
chmod +x start.sh || { echo "Loi khi cap quyen cho start.sh!"; exit 1; }

# Khởi động lại ứng dụng
$APPPATH/start.sh || { echo "Loi khi chay start.sh!"; exit 1; }
