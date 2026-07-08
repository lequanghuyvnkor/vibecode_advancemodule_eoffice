#!/bin/bash
set -e

echo "=== VinaSciTech E-office — Harness Initialization ==="

if [ -f package.json ]; then
  if [ -f pnpm-lock.yaml ]; then
    PM="pnpm"
  elif [ -f yarn.lock ]; then
    PM="yarn"
  elif [ -f bun.lock ] || [ -f bun.lockb ]; then
    PM="bun"
  else
    PM="npm"
  fi

  echo "=== Cài dependency bằng $PM ==="
  if [ "$PM" = "npm" ]; then
    npm install
  else
    "$PM" install
  fi

  echo "=== Type-check ==="
  if node -e "const s=require('./package.json').scripts||{}; process.exit(s['type-check']?0:1)"; then
    [ "$PM" = "npm" ] && npm run type-check || "$PM" run type-check
  elif node -e "const s=require('./package.json').scripts||{}; process.exit(s.typecheck?0:1)"; then
    [ "$PM" = "npm" ] && npm run typecheck || "$PM" run typecheck
  else
    echo "⚠️  Chưa có script type-check/typecheck trong package.json — cần bổ sung (thuộc feat-001)."
  fi

  echo "=== Lint ==="
  if node -e "const s=require('./package.json').scripts||{}; process.exit(s.lint?0:1)"; then
    [ "$PM" = "npm" ] && npm run lint || "$PM" run lint
  else
    echo "⚠️  Chưa có script lint trong package.json — cần bổ sung (thuộc feat-001)."
  fi

  echo "=== Test ==="
  if node -e "const s=require('./package.json').scripts||{}; process.exit(s.test?0:1)"; then
    [ "$PM" = "npm" ] && npm test || "$PM" test
  else
    echo "⚠️  Chưa có script test trong package.json — cần bổ sung (thuộc feat-001)."
  fi

  echo "=== Build ==="
  if node -e "const s=require('./package.json').scripts||{}; process.exit(s.build?0:1)"; then
    [ "$PM" = "npm" ] && npm run build || "$PM" run build
  else
    echo "⚠️  Chưa có script build trong package.json — cần bổ sung (thuộc feat-001)."
  fi
else
  echo "❌ Không tìm thấy package.json ở thư mục hiện tại."
  echo "   Kiểm tra lại đang đứng đúng thư mục gốc của repo Next.js/React chưa."
  exit 1
fi

echo ""
echo "=== Verification Complete ==="
echo ""
echo "Bước tiếp theo:"
echo "1. Đọc feature_list.json để biết feature nào đang active"
echo "2. Chọn ĐÚNG 1 feature chưa xong để làm"
echo "3. Chỉ implement trong phạm vi feature đó — không lan sang module khác"
echo "4. Chạy lại verification (lint/type-check/test/build) trước khi báo 'done'"
echo "5. Đối chiếu ràng buộc nghiệp vụ trong AGENTS.md mục 3 nếu đụng module tài chính chuyến"
