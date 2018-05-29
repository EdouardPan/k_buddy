const quit = document.querySelector(".quiting-x");
const addMenu = document.getElementById("menu-box");

function menuInvisible() {
  quit.addEventListener("click", function() {
    addMenu.style.visibility = "hidden";
  });
}

export { menuInvisible };
