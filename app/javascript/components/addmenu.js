
const addMenu = document.getElementById("menu-box");
const addButton = document.getElementById("navbar-plus-icon");


function menuVisible() {
  addButton.addEventListener("click", function() {
    addMenu.className = "menu menu-appear";
  });
}

export { menuVisible };
