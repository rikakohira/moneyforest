var i = 1 ;
var minCount = 0;
var maxCount = 5;

function addForm() {
  //追加ボタンクリック時にイベント発火
  const add = document.getElementById("add-btn");
  add.addEventListener("click", () => {
    //フォーム生成
    const select = document.getElementById("selectbox_0");
    const select_copy = select.cloneNode(true);
    select_copy.id = 'selectbox_' + i;　
    const input = document.getElementById("input-balance_0");
    const input_copy = input.cloneNode(true);　　
    input_copy.id = 'input-balance_' + i;　
    input_copy.value = ''
    //フォーム追加
    if (i < maxCount) { 
    const parent = document.getElementById('form-field');　
    parent.appendChild(select_copy);
    parent.appendChild(input_copy);
    }
 
    var button_data = document.createElement('button');
    button_data.id = i;
    button_data.onclick = function(){deleteBtn(this);}
    button_data.innerHTML = '削除';
    
    if (i < maxCount) { 
    const parent = document.getElementById('form-field');　
    var input_area = document.getElementById(select_copy.id);
    parent.appendChild(button_data);
    }
    
    i++ ;
	});
 };


window.addEventListener('load', addForm);


//削除ボタンクリック時に実行される
window.deleteBtn = function(target){
  var target_id = target.id;
  var parent = document.getElementById('form-field');
  var slt_id = document.getElementById('selectbox_' + target_id);
  var ipt_id = document.getElementById('input-balance_' + target_id);
  var tgt_id = document.getElementById(target_id);
   if (target_id > minCount){
  parent.removeChild(slt_id);
  parent.removeChild(ipt_id);
  parent.removeChild(tgt_id);	
  }  
}

    




  