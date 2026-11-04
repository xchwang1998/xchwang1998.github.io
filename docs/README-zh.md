# 王晓晨 · 个人学术主页

网站：[xchwang1998.github.io](https://xchwang1998.github.io/)

当前网站使用 Jekyll 构建，内容集中在两个数据文件中。日常更新请参阅[学术主页维护指南](MAINTENANCE.md)。

## 更新内容

- [个人信息与经历](../_data/homepage.yml)：简介、联系方式、研究方向、动态、教育、奖励和学术服务。
- [论文列表](../_data/publications.yml)：标题、作者、年份、期刊或会议，以及可选的出版社、PDF、代码和数据链接。

编辑时保留 YAML 缩进，日期如 `"2026.10"` 使用引号。新增论文会按年份倒序显示；站内 PDF 放在 `docs/`，链接使用 `/docs/文件名.pdf`。字段说明与完整示例见[维护指南](MAINTENANCE.md)。

## 检查与发布

在 GitHub 编辑后，提交到分支并创建 Pull Request。确认 “Validate academic homepage” 检查通过，再合并到 `main`。GitHub Pages 按仓库现有设置发布。

本地预览需要 Ruby 和 Bundler，在仓库根目录运行：

```sh
bundle install
ruby scripts/validate_content.rb
bundle exec jekyll serve --livereload
```

打开 <http://127.0.0.1:4000>，检查页面、论文搜索与文件链接。修改 `_config.yml` 后需要重启服务。

## 页面与功能

首页框架在 `_layouts/academic.html`，栏目结构在 `_pages/about.md`，样式和搜索分别在 `assets/css/academic.css`、`assets/js/academic.js`。通常只需修改数据文件。

当前首页不依赖引用数爬虫，旧抓取工作流已移除。不要按原模板教程配置 `GOOGLE_SCHOLAR_ID` 或恢复旧工作流；如需重新加入引用数功能，请先阅读[维护指南中的引用数爬虫说明](MAINTENANCE.md#7-引用数爬虫)。

## 模板来源与致谢

本网站基于 [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io)，沿用仓库原有[许可证](../LICENSE)，并保留部分旧主题文件。

- AcadHomepage 使用 Font Awesome，其字体和代码分别遵循 SIL OFL 1.1 与 MIT 许可证。
- 模板设计参考了 [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) 和 [Academic Pages](https://github.com/academicpages/academicpages.github.io)，两者均采用 MIT 许可证。
