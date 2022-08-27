var i = 1 ;
var minCount = 0;
var maxCount = 5;

document.getElementById('add-btn').addEventListener('click', function addForm() {
//フォーム生成
var select = document.getElementById("assettable-list_0");
var select_copy = select.cloneNode(true);
select_copy.class = 'assettable-list_' + i;
var input = document.getElementById("assettable-balance_0");
var input_copy = input.cloneNode(true);
input_copy.id = 'assettable-balance_' + i;
input_copy.value = ''

  //フォーム追加
  if (i < maxCount) { 
  var parent = document.getElementById('form-field');
  parent.appendChild(select_copy);
  parent.appendChild(input_copy);
  }

//削除ボタン生成  
var button_data = document.createElement('button');
button_data.id = i;
button_data.onclick = function(){deleteBtn(this);}
button_data.innerHTML = '削除';
  
  //削除ボタン追加
  var input_area = document.getElementById(select.id);
  parent.appendChild(button_data);
  
  i++ ;
}, false);

function deleteBtn(target) {
  //識別番号
  var target_id = target.id;
  var parent = document.getElementById('form-field');
  var select_id = document.getElementById('assettable-list_' + target_id);
  var input_id = document.getElementById('assettable-balance_' + target_id);
  var deleteBtn_id = document.getElementById(target_id);
    
    //フォーム削除
    if (target_id > minCount){
    parent.removeChild(select_id);
    parent.removeChild(input_id);
    parent.removeChild(deleteBtn_id);	
    }  
}
  