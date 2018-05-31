
function menuVisible() {
  const addMenu = document.getElementById("menu-box");
  const addButton = document.getElementById("navbar-plus-icon");
  if (addButton) {
    addButton.addEventListener("click", function() {
      addMenu.className = "menu menu-appear";
    });
  }
}

export { menuVisible };
