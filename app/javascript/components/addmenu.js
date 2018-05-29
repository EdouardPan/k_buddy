
const addMenu = document.getElementById("menu-box");
const addButton = document.getElementById("navbar-plus-icon");

function menuVisible() {
  console.log("In the function");
  addButton.addEventListener("click", function() {
    addMenu.style.visibility = "visible";
  });
}

export { menuVisible };
