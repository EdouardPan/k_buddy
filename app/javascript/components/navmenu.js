/* Open the sidenav */
function openMenu() {
  const opennm = document.getElementById("opennavmenu");
  if (opennm) {
    opennm.addEventListener("click", (e) => {
      const myNavMenu = document.getElementById("myNavMenu")
      if (myNavMenu.style.height === "100%") {
        myNavMenu.style.height = "0";
      }else{
        myNavMenu.style.height = "100%";
      }
    });
  }
}

/* Close/hide the sidenav */
function closeMenu() {
  const closenm = document.querySelector(".closemenu");
  if (closenm) {
    closenm.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("myNavMenu").style.height = "0";
    });
  }
}




export { openMenu, closeMenu };



