(() => {
  const search = document.querySelector(".publication-search");
  const input = document.querySelector("#publication-query");
  const status = document.querySelector("#publication-status");
  const papers = [...document.querySelectorAll(".publication")];
  if (!search || !input || !status) return;
  search.hidden = false;
  const update = () => {
    const query = input.value.trim().toLocaleLowerCase();
    let visible = 0;
    papers.forEach(paper => {
      const matches = paper.textContent.toLocaleLowerCase().includes(query);
      paper.hidden = !matches;
      if (matches) visible++;
    });
    status.textContent = query ? visible + " of " + papers.length + " publications" : papers.length + " publications";
  };
  input.addEventListener("input", update);
  update();
})();
