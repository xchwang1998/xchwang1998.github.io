# Xiaochen Wang · Academic Homepage

个人学术主页：[xchwang1998.github.io](https://xchwang1998.github.io/)

## 在线更新（无需安装软件）

1. 打开 [_data/homepage.yml](_data/homepage.yml)，点击铅笔编辑个人信息、研究方向、动态、教育、奖项和报告。
2. 打开 [_data/publications.yml](_data/publications.yml)，复制一个条目即可新增论文。年份自动倒序排列；PDF、Code、Data 链接均可选。
3. 提交到分支并创建 Pull Request，确认 “Validate academic homepage” 构建通过，再合并到 main。GitHub Pages 按仓库现有设置发布。

[详细中文维护指南](docs/MAINTENANCE.md) 包含字段说明、示例、本地预览和回滚方法。

## 本地预览

需要 Ruby 和 Bundler。在仓库根目录运行：

```sh
bundle install
bundle exec jekyll serve --livereload
```

打开 http://127.0.0.1:4000 。修改 _config.yml 后需要重启服务。

## 文件分工

| 文件 | 用途 |
| --- | --- |
| _data/homepage.yml | 日常个人信息与经历 |
| _data/publications.yml | 论文列表 |
| _pages/about.md | 首页栏目结构（通常无需改动） |
| _layouts/academic.html | 页面框架和 SEO |
| assets/css/academic.css | 响应式样式 |
| assets/js/academic.js | 可选的论文搜索；禁用 JavaScript 仍显示全部论文 |
| _config.yml | 域名及 Jekyll 设置 |
| docs/ | PDF 文件与维护说明 |

沿用仓库原有 Jekyll 模板与许可证，保留旧主题文件以方便迁移。首页不依赖远程字体、jQuery、引用数爬虫或第三方统计徽章。
