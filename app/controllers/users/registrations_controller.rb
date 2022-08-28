# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  #1ページ目の情報をsessionに保持
  def create
    @user = User.new(sign_up_params)
    render :new and return unless @user.valid?

    session['devise.regist_data'] = { user: @user.attributes }
    session['devise.regist_data'][:user]['password'] = params[:user][:password]
    @assettable = @user.build_assettable
    render :new_assettable
  end

  #1, 2ページ目の情報をsessionに保持
  def create_assettable
    @user = User.new(session['devise.regist_data']['user'])
    @assettable = Assettable.new(assettable_params)
    render :new_assettable and return unless @assettable.valid?

    session['devise.regist_data']['assettable'] = { assettable: @assettable.attributes }
    @debttable = @user.build_debttable
    render :new_debttable
  end

  #1〜3ページの情報を保存
  def create_debttable
    @user = User.new(session['devise.regist_data']['user'])
    @assettable = Assettable.new(session['devise.regist_data']['assettable']['assettable'])
    @user.build_assettable(@assettable.attributes)
    @user.save
    @debttable = Debttable.new(debttable_params)
    render :new_debttable and return unless @debttable.valid?

    @user.build_debttable(@debttable.attributes)
    @user.save

    session['devise.regist_data'].clear
    sign_in(:user, @user)
  end

  private

  def assettable_params
    params.permit(:selectbox_1, :selectbox_2, :selectbox_3, :selectbox_4, :selectbox_5, assettable: [:balance, :list_id])
  end

  def debttable_params
    params.permit(:selectbox_1, :selectbox_2, :selectbox_3, :selectbox_4, :selectbox_5, debttable: [:balance, :list_id])
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
