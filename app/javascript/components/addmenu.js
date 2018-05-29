
const addMenu = document.getElementById("menu-box");
const addButton = document.getElementById("navbar-plus-icon");


function menuVisible() {
  addButton.click(function() {
    console.log("Hello");
    addMenu.slideUp(1500);
  });
  //addButton.addEventListener("click", function() {
  //  addMenu.style.visibility = "visible";
  //addMenu.slideToggle(1500);
  //});
  }


export { menuVisible };
