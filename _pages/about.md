---
layout: academic
permalink: /
title: Academic Homepage
redirect_from:
  - /about/
  - /about.html
---
{% assign profile = site.data.homepage %}
<section id="about-me" class="intro section">
  <p class="eyebrow">Photogrammetry &amp; Remote Sensing</p>
  <h1>LiDAR SLAM &amp;<br><span>3D Remote Sensing.</span></h1>
  <p class="lead">{{ profile.intro | escape }}</p>
  {% if site.data.publications.size > 0 %}<a class="text-link" href="#publications">View publications <span aria-hidden="true">↓</span></a>{% endif %}
</section>
{% if profile.research.size > 0 %}
<section id="research" class="section">
  <span id="-researches" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>Research Interests</h2><span class="section-number">01</span></div>
  <div class="research-grid">{% for item in profile.research %}<article class="research-item"><h3>{{ item.title | escape }}</h3><p>{{ item.description | escape }}</p></article>{% endfor %}</div>
</section>
{% endif %}
{% if profile.news.size > 0 %}
<section id="news" class="section">
  <span id="-news" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>News</h2></div>
  <ul class="dated-list">{% for item in profile.news limit:3 %}<li><span class="date">{{ item.date | escape }}</span><span>{{ item.text | escape }}</span></li>{% endfor %}</ul>
  {% if profile.news.size > 3 %}<details><summary>Earlier news</summary><ul class="dated-list">{% for item in profile.news offset:3 %}<li><span class="date">{{ item.date | escape }}</span><span>{{ item.text | escape }}</span></li>{% endfor %}</ul></details>{% endif %}
</section>
{% endif %}
{% if site.data.publications.size > 0 %}
<section id="publications" class="section">
  <span id="-publications" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>Publications</h2><span class="section-number">02</span></div>
  <div class="publication-search" hidden><label for="publication-query">Find a publication</label><input id="publication-query" type="search" placeholder="Search title, author, venue or year" aria-controls="publication-list"><p id="publication-status" class="muted" role="status" aria-live="polite"></p></div>
  {% assign publications = site.data.publications | sort: 'year' | reverse %}
  <ol id="publication-list" class="publications">
    {% for pub in publications %}
    <li class="publication">
      <span class="publication-year">{{ pub.year }}</span>
      <div><h3>{% if pub.url and pub.url != '' %}<a href="{{ pub.url | escape }}">{{ pub.title | escape }}</a>{% else %}{{ pub.title | escape }}{% endif %}</h3>
      <p class="authors">{{ pub.authors | escape }}</p><p class="venue">{{ pub.venue | escape }}</p>
      <div class="paper-links">{% if pub.url and pub.url != '' %}<a href="{{ pub.url | escape }}" aria-label="Publisher page for {{ pub.title | escape }}">Publisher ↗</a>{% endif %}{% if pub.pdf and pub.pdf != '' %}<a href="{{ pub.pdf | relative_url }}" aria-label="PDF of {{ pub.title | escape }}">PDF ↗</a>{% endif %}{% if pub.code and pub.code != '' %}<a href="{{ pub.code | escape }}">Code ↗</a>{% endif %}{% if pub.data and pub.data != '' %}<a href="{{ pub.data | escape }}">Data ↗</a>{% endif %}</div></div>
    </li>
    {% endfor %}
  </ol>
</section>
{% endif %}
{% if profile.education.size > 0 %}
<section id="education" class="section">
  <span id="-educations" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>Education</h2><span class="section-number">03</span></div>
  <ul class="education-list">{% for item in profile.education %}<li><p class="date">{{ item.period | escape }}</p><div><h3>{{ item.institution | escape }}</h3>{% if item.degree and item.degree != '' %}<p>{{ item.degree | escape }}</p>{% endif %}<p>{{ item.department | escape }}</p><p class="muted">{{ item.location | escape }}</p></div></li>{% endfor %}</ul>
</section>
{% endif %}
{% if profile.awards.size > 0 %}
<section id="awards" class="section">
  <span id="-honors-and-awards" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>Honors &amp; Awards</h2></div>
  <ul class="dated-list">{% for item in profile.awards %}<li><span class="date">{{ item.date | escape }}</span><span>{{ item.text | escape }}</span></li>{% endfor %}</ul>
</section>
{% endif %}
{% if profile.talks.size > 0 %}
<section id="talks" class="section">
  <span id="-invited-talks" class="legacy-anchor" aria-hidden="true"></span>
  <div class="section-heading"><h2>Invited Talks</h2></div>
  <ul class="dated-list">{% for item in profile.talks %}<li><span class="date">{{ item.date | escape }}</span><span>{{ item.text | escape }}</span></li>{% endfor %}</ul>
</section>
{% endif %}
<section id="contact" class="section contact"><h2>Contact</h2><p>For research correspondence, please contact me by email.</p><a href="mailto:{{ profile.email | escape }}">{{ profile.email | escape }} <span aria-hidden="true">↗</span></a>{% if profile.alternate_email and profile.alternate_email != '' %}<p class="alternate-contact">Additional email: <a href="mailto:{{ profile.alternate_email | escape }}">{{ profile.alternate_email | escape }}</a></p>{% endif %}</section>
