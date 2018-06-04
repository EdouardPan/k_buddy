/* Open the sidenav */
function openNav() {
  const open = document.getElementById("opensidenav");
  if (open) {
    open.addEventListener("click", (e) => {
      document.getElementById("mySidenav").style.width = "80%";
    });
  }
}


/* Close/hide the sidenav */
function closeNav() {
  const close = document.querySelector(".closebtn");
  if (close) {
    close.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("mySidenav").style.width = "0";
    });
  }
}


export { openNav, closeNav };
