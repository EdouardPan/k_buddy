function menuInvisible() {
  const quit = document.querySelector(".quiting-x");
  const addMenu = document.getElementById("menu-box");
  if (quit) {
    quit.addEventListener("click", function() {
      addMenu.className = "menu";
    });
  }
}

export { menuInvisible };
