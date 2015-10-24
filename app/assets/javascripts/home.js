$(function () {
  // initialize skrollr if the window width is large enough
  if ($(window).width() > 768) {
    skrollr.init();
  }
  // disable skrollr if the window is resized below 768px wide
  $(window).on('resize', function () {
    if ($(window).width() <= 768) {
      skrollr.init().destroy(); // skrollr.init() returns the singleton created above
    }
  });
});