

export function sliderSymptoms(){
  var slider = document.getElementById("intensityRange");
  var output = document.getElementById("intensityDemo");
  output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
  slider.oninput =  function prettySlider() {
    output.innerHTML = this.value;
  }
}
