#!/bin/bash
# validate-reports.js
# 验证 market-research/docs/products/*.md 的 frontmatter 格式

find docs/products -name "*.md" | while read file; do
  echo "Checking $file..."
  
  # 提取 frontmatter
  FM=$(sed -n '/^---$/,/^---$/p' "$file" | sed '1d;$d')
  
  if [ -z "$FM" ]; then
    echo "⚠️  Warning: No frontmatter found in $file"
    continue
  fi

  # 使用 node 简单验证 yaml 语法 (利用 yaml 库或者简单 json 转换尝试)
  # 这里为了不引入额外依赖，我们用一个简单的 node 脚本尝试解析
  
  node -e "
    const fs = require('fs');
    const yaml = require('js-yaml'); // 需要项目里有 js-yaml，vitepress 应该自带
    try {
      // 模拟 frontmatter 解析
      const content = fs.readFileSync('$file', 'utf8');
      const match = content.match(/^---([\s\S]*?)---/);
      if (match) {
        // 这里暂时假设没有 js-yaml 依赖，用简单正则检查关键字符冲突
        const fm = match[1];
        // 检查 description 字段是否有未转义的引号
        // 这是一个简单的 heuristic，不完美但能抓到这次的错误
        const lines = fm.split('\n');
        lines.forEach(line => {
          if (line.startsWith('description:')) {
            const val = line.replace('description:', '').trim();
            if (val.startsWith('\"') && !val.endsWith('\"')) {
               console.error('❌ Error: Description starts with quote but does not end with one (possible multiline or unescaped quote):', val);
               process.exit(1);
            }
            // 检查中间是否有未转义的双引号 (如果外层没引号)
            if (!val.startsWith('\"') && val.includes('\"') && !val.includes('\\\"')) {
               // 允许简单文本，但如果有 key: \"value\" 这种结构容易出错，这里先警告
               // console.warn('⚠️  Warning: Unescaped quotes in description:', val);
            }
          }
        });
      }
    } catch (e) {
      console.error('❌ Error parsing $file:', e.message);
      process.exit(1);
    }
  "
  
  if [ $? -ne 0 ]; then
    echo "❌ Validation failed for $file"
    exit 1
  fi
done

echo "✅ All reports validated."
