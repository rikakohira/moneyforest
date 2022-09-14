class ListsController < ApplicationController

  def index
    @asset = List.where(code: 100...200)
    @debt = List.where(code: 200...300)
    @net_asset = List.where(code: 300)
    @income = List.where(code: 400...500)
    @expence = List.where(code: 500...600)
    @profit = List.where(code: 600)
  end

end
