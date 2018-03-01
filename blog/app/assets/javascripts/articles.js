  console.log('test');
  $("tr[data-href]").click(function() {
    console.log('test');
    window.location = $(this).data("href")
  })
