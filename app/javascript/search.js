$(function () {
  $('#search-btn').on('click', function () {
    var selectYear = $('#q_date_during_month_1i').val();
    var selectMonth = $('#q_date_during_month_2i').val();

    $.ajax({
    type: 'GET', // リクエストのタイプ
    url: '/books/search', // リクエストを送信するURL
    data:  { date_during_month: selectYear, date_during_month: selectMonth }, // サーバーに送信するデータ
    dataType: 'json' // サーバーから返却される型
    })
    .done(function (data) {
      console.log(data); // dataを確認する
    })


  });
});

