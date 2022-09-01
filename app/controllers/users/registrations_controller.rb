class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    # user情報をセッションに保持
    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]

    @assettable = Form::AssetCollection.new
    render :new_assettable
  end

  # assettable情報をセッションに保存
  def new_assettable
    @user = User.new(session['devise.regist_data']['user'])

    session['devise.regist_data']['assettable'] = { assettable: assettables_params }
    @debttable = Form::DebttableCollection.new
    render :new_debttable
  end

  # 保存処理を走らせる
  def create_assettable_and_debttable
    user = User.new(session['devise.regist_data']['user'])
    session_assettable = session['devise.regist_data']['assettable']
    session_assettable = session_assettable['assettable']

    user.save
    assettables = Form::AssetCollection.new(user, session_assettable)
    debttables = Form::DebttableCollection.new(user, debttables_params)

    # Form::AssetCollectionのsaveメソッドを呼び出す（assettables_attributesで値を格納したオブジェクトをDBに保存する）
    assettables.save
    # Form::DebttableCollectionのsaveメソッドを呼び出す（assettables_attributesで値を格納したオブジェクトをDBに保存する）
    debttables.save
    session['devise.regist_data'].clear
    sign_in user
    # 新規登録完了画面へ遷移
    redirect_to users_sign_up_complete_path
  end

  private

  def assettables_params
    params.require(:form_asset_collection).permit(assettables_attributes: [:list_id, :balance])
  end

  def debttables_params
    params.require(:form_debttable_collection).permit(debttables_attributes: [:list_id, :balance])
  end
end
