$(function () {
  $('select').on('change', function() {
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
          <td>${debit.list}</td>
          <td>${debit.debit_amount}</td>
          <td><a href="#">修正</a></td>
          <td>><a href="#">削除</a></td>
          <tr>`
        );
      });
    })
  });
});
