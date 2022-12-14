$(function () {
  $('#q_date_during_month_1i, #q_date_during_month_2i').on('change', function() {
    var selectYear = $('#q_date_during_month_1i').val();
    var selectMonth = $('#q_date_during_month_2i').val();

    $.ajax({
      type: 'GET',
      url: '/books/searches', 
      data: {selectYear: selectYear, selectMonth: selectMonth},
      dataType: 'json' 
    })
    .done(function (data) {
      $('.js-debit-lists tr').remove(); 
      
      $(data).each(function(index,debit) {
        $('.js-debit-lists').append(
          `<tr>
          <td>${debit.code_name}</td>
          <td>${debit.debit_amount}</td>
          <td>${debit.code_name}</td>
          <td>${debit.credit_amount}</td>
          <td>${debit.memo}</td>
          <td><a href="/books/${debit.id}/edit" class="btn btn-outline-success btn-sm">編集</a></td>
          <td><a data-confirm="削除しますか?" href="/books/${debit.id}" class="btn btn-outline-dark btn-sm" rel="nofollow" data-method="delete">削除</a></td>
          <tr>`
        );
      });
    })
  });
});
