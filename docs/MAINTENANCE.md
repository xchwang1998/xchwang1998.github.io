# 学术主页维护指南

## 1. 最常用的两个文件

- `_data/homepage.yml`：姓名、身份、简介、联系方式、研究方向、动态、教育、获奖和报告。
- `_data/publications.yml`：论文标题、作者、年份、期刊/会议及链接。

只修改冒号后面的内容；保留缩进（空格，不用 Tab）。日期如 `"2024.09"` 要加引号。内容含英文冒号时用引号包裹。不需要 HTML。网页按原样安全显示文字。

## 2. 新增论文

复制下面一项到 publications.yml。页面自动按 year 从新到旧排列，同年条目的先后不作为学术排序依据。请核对作者、年份和正式书目信息。

```yaml
- title: "Your paper title"
  authors: "Wang, X., Other, A."
  year: 2026
  venue: "Journal name, volume, pages"
  url: https://doi.org/YOUR-DOI
  pdf: /docs/your-paper.pdf
  code: https://github.com/YOUR-ACCOUNT/YOUR-REPOSITORY
  data: https://YOUR-DATASET-URL
```

删掉不需要的 pdf/code/data 字段，不要保留示例链接。PDF 上传到 docs/，建议英文文件名、不含空格。站内 PDF 使用 /docs/文件名.pdf；外部 PDF 使用完整 https 链接。请确认你有权公开上传的版本。

## 3. 更新动态和经历

news、education、awards、talks 都按文件中的顺序显示，请将新条目放在前面。首页显示前三条动态，其余在 Earlier news 中展开。

隐藏某个可选栏目时，将对应列表改为 `news: []`、`research: []` 等。清空论文时 publications.yml 填 `[]`。清空后对应导航也会隐藏。

在 homepage.yml 中设置 `cv: /docs/my_cv.pdf` 可显示简历按钮。当前默认不展示：仓库中的历史简历需要本人确认仍然有效。
身份与教育时间已更新至 2026-09-23：空天信息大学讲师，2025 年 12 月获武汉大学博士学位。以后变更任职信息时同步修改 role、department、affiliation、intro、location 和 education。教育条目可用 degree 显示学位。

## 4. 替换头像与学术链接

上传图片到 images/，再改 photo。建议清晰正方形肖像。姓名、邮箱和学术平台地址均在 homepage.yml。email 是主要邮箱；alternate_email 是可选备用邮箱，留空可隐藏。两者均在侧栏和 Contact 栏目中显示。
Google Scholar 地址只保留一个 user 参数；ORCID 使用 https://orcid.org/编号 的公共主页地址。
本次移除了未经验证的引用数、错误示例 Scholar ID 和论文总数声明。不要把模板中的示例数字用作真实学术指标。

## 5. 页面外观和导航

样式在 assets/css/academic.css；配色变量在首行。布局在 _layouts/academic.html，栏目在 _pages/about.md。首页有 About、Research、Publications、Education、Contact 导航。
保留旧版的 /#-news、/#-publications、/#-educations 等锚点，以及 /about/ 和 /about.html 跳转，旧链接仍可使用。

## 6. 检查与发布

在 GitHub 编辑后，建议提交到新分支并创建 Pull Request。
“Validate academic homepage” 会检查 YAML、必填字段、站内资源，并用 GitHub Pages 构建器生成网站。构建产物可在 Actions 页面下载。
首次新增工作流后，GitHub 的仓库策略可能要求管理员启用/批准 Actions。合并前应确认检查通过。

本地需要 Ruby/Bundler：
```sh
bundle install
ruby scripts/validate_content.rb
bundle exec jekyll serve --livereload
```
浏览 http://127.0.0.1:4000，检查手机宽度、邮箱、论文搜索和 PDF。_config.yml 改动后重启服务。
自定义域名改 _config.yml 的 url；项目子路径改 baseurl，模板会正确生成本站资源地址。

GitHub Pages 的发布来源沿用仓库 Settings → Pages 的现有设置。修复分支和 PR 本身不会替代线上主页；合并到发布分支后等待 Pages 构建完成。
需要回滚时，在 GitHub 对已合并的 PR 使用 Revert，或恢复之前版本的数据文件；不要强制覆盖历史。

## 7. 引用数爬虫

旧的 google_scholar_crawler 源码作为历史参考保留，首页已与之解耦。原自动抓取工作流因依赖不兼容而持续失败，且新版首页不使用其输出，现已移除，避免每日或发布时产生无效失败通知。若未来需要引用数功能，应重新验证抓取依赖、学术账号及数据准确性后再启用；不要直接恢复旧工作流。
