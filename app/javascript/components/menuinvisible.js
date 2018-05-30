const quit = document.querySelector(".quiting-x");
const addMenu = document.getElementById("menu-box");

function menuInvisible() {
  quit.addEventListener("click", function() {
    console.log("click on button")
    addMenu.className = "menu";
  });
}

export { menuInvisible };
