class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '20歳未満' },
    { id: 3, name: '21歳~25歳' },
    { id: 4, name: '26歳~30歳' },
    { id: 5, name: '31歳~35歳' },
    { id: 6, name: '36歳~40歳' },
    { id: 7, name: '41歳~45歳' },
    { id: 8, name: '46歳~50歳' },
    { id: 9, name: '51歳~55歳' },
    { id: 10, name: '56歳~60歳' },
    { id: 11, name: '非公開' }
  ]

  include ActiveHash::Associations
  has_many :users

  end