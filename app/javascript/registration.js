const i = 1 ;
const minCount = 0;
const maxCount = 5;

//追加ボタン
function addForm() {
  const add = document.getElementById("add-btn");
  add.addEventListener("click", () => {
    //フォーム生成
    const select = document.getElementById("selectbox_0");
    const select_copy = select.cloneNode(true);
    select_copy.id = 'selectbox_' + i;
    select_copy.name = 'selectbox_' + i;
    const input = document.getElementById("input-balance_0");
    const input_copy = input.cloneNode(true);
    input_copy.id = 'input-balance_' + i;
    input_copy.name = 'input-balance_' + i;
    input_copy.value = ''
    if (i < maxCount) { 
    const parent = document.getElementById('form-field');
    parent.appendChild(select_copy);
    parent.appendChild(input_copy);
    }
    
    //削除ボタン生成
    const button_data = document.createElement('button');
    button_data.id = i;
    button_data.className = 'btn btn-secondary btn-sm';
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


//削除ボタン
window.deleteBtn = function(target){
  const target_id = target.id;
  const parent = document.getElementById('form-field');
  const slt_id = document.getElementById('selectbox_' + target_id);
  const ipt_id = document.getElementById('input-balance_' + target_id);
  const tgt_id = document.getElementById(target_id);
   if (target_id > minCount){
  parent.removeChild(slt_id);
  parent.removeChild(ipt_id);
  parent.removeChild(tgt_id);	
  }  
}

    




  