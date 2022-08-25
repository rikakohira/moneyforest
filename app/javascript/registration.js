// 追加
$('#demo-plus').on('click', function(){　　//ボタンのidを取得
  var inputCount = $('#demo-area .unit').length;　　//フォームエリアのidを取得
  if (inputCount < maxCount){　　//テキストフィールドのmaxまで
    var element = $('#demo-area .unit:last-child').clone(true);// 末尾をイベントごと複製、フォームエリアのidを指定
    
		// 複製したinputのクリア（タグ名, type属性,?）
    var inputList = element[0].querySelectorAll('input[type="text"], textarea');
    for (var i = 0; i < inputList.length; i++) {
      inputList[i].value = "";
    }
    $('#demo-area .unit').parent().append(element);// 末尾追加、フォームエリアのidを指定
  }
});


// 削除
$('.demo-minus').on('click', function(){// イベントごと複製しているのでonのselectorは未設定
  var inputCount = $('#demo-area .unit').length;
  if (inputCount > minCount){
    $(this).closest('.unit').remove();
  }
});