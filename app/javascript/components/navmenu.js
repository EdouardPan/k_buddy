/* Open the sidenav */
function openMenu() {
  const opennm = document.getElementById("opennavmenu");
  if (opennm) {
    opennm.addEventListener("click", (e) => {
      document.getElementById("myNavMenu").style.height = "100%";
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


/* Toggle */
function navButton(x) {
  const togglenm = document.getElementById("opennavmenu");
  if(togglenm.classList.contains("change")){
     closeMenu();
     togglenm.classList.remove("change");
  }else{
     openMenu();
     togglenm.classList.add("change");
  }
}


export { openMenu, closeMenu, navButton };



