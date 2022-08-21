# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
     unless @user.valid?
       render :new and return
     end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @assettable = @user.build_assettable
    render :new_assettable
  end
 
  def create_assettable
    @user = User.new(session["devise.regist_data"]["user"])
    @assettable = Assettable.new(assettable_params)
     unless @assettable.valid?
       render :new_assettable and return
     end
     session["devise.regist_data"]["assettable"] = {assettable: @assettable.attributes}
     @debttable = @user.build_debttable
     render :new_debttable
  end

  def create_debttable
    @user = User.new(session["devise.regist_data"]["user"])
    @assettable = Assettable.new(session["devise.regist_data"]["assettable"]["assettable"])
    @user.build_assettable(@assettable.attributes)
    @user.save
    @debttable = Debttable.new(debttable_params)
     unless @debttable.valid?
       render :new_debttable and return
     end
    @user.build_debttable(@debttable.attributes)
    @user.save
    
    session["devise.regist_data"].clear
    sign_in(:user, @user)
  end
 
 
  private
 
  def assettable_params
    params.require(:assettable).permit(:balance)
  end

  def debttable_params
    params.require(:debttable).permit(:balance)
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
