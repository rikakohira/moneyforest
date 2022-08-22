class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '大学生' },
    { id: 3, name: '社会人' },
    { id: 4, name: '一人暮らし' },
    { id: 5, name: '二人暮らし' },
    { id: 6, name: '共働きの夫婦' },
    { id: 7, name: '子供がいる家庭' },
    { id: 8, name: '非公開' }
  ]

  include ActiveHash::Associations
  has_many :users
  end
