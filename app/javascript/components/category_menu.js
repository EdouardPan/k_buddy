

document.querySelectorAll("category").forEach((button) => {
  button.addeventlistener("click", (e) => {
    e.addEventListener('click', hide, false);
  })

});

// $(document).ready(hide(){
//    $("#item").click(function(event){
//      //Your actions here
//    });
//  });


// function buttonclick(){
//   var categoryList = document.getElementById("category-menu");
//   if (categoryList.className == "menuOff")
//   {
//     categoryList.className ="menuOn";
//   } else {
//     categoryList.className = "menuOff";
//   }
// }
