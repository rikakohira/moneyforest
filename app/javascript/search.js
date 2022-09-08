$(function () {
  $('select').on('change', function() {
    var selectYear = $('#q_date_during_month_1i').val();
    var selectMonth = $('#q_date_during_month_2i').val();

    $.ajax({
      type: 'GET',
      url: '/books/searches', // リクエストを送信するURLを変更
      data: {date_during_month: selectYear, date_during_month: selectMonth},
      dataType: 'json' 
    }).done(function(data){ 
      $(data).each(function (i, debit) {
        $('.js-debit-lists').append(
          `<tr>
          <td>${debit.list.code_name}</td>
          <td>${debit.debit_amount}</td>
          <td>${debit.credit.list.code_name}</td>
          <td>${debit.credit.credit_amount}</td>
          <td>${debit.memo}</td>
          <td><%= link_to '修正', edit_book_path(debit) %></td>
          <td><%= link_to '削除', book_path(debit), method: :delete, data: { confirm: 'Are you sure?' } %></td>
          </tr>`
        );
      });
    })

  })
})
