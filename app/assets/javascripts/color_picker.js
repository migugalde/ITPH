var color_picker;
color_picker = function() {
  $('[name="room[color]"]').paletteColorPicker({
    colors: ["#0F8DFC","rgba(135,1,101,1)","#F00285","hsla(190,41%,95%,1)"]
  });
};
$(document).ready(color_picker);
