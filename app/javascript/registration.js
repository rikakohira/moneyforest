document.addEventListener('click',(e)=>{
  const t=e.target;
  if(t.matches('#add')){
    const d=document.querySelector('.form-field');
 
//dの親ノードを取得（→親要素）    
//親要素.insertBefore(追加したい要素, 追加したい場所)   
//追加→子要素を含むdのhtml要素、場所→dの次
    d.parentNode.insertBefore(d.cloneNode(true),d.nextElementSibling);
  }
  if(t.matches('.del')){
    t.closest('.form-field')?.remove();
  }
});
