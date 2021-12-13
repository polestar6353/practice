
let index = {
  init: function () {
    $("#aaabtn-start").on("click", () => {
      
      this.start();
    });
  },
  start: function () {
    
    let data = {
      arr: $("#selectedValue").val()
    };
    console.log(data.arr);
	alert(JSON.stringify(data));

    $.ajax({
      type: "POST",
      url: "/newmap-result",
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      dataType: "text"

    }).done(function (data) {
      alert('결과를띄웁니다');
      //location.href="/newmap-result";
    }).fail(function (error) {
      alert(JSON.stringify(error));
    });
  },
}

index.init();
