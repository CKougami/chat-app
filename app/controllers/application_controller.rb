class ApplicationController < ActionController::Base
  # ログインしていないユーザーをログインページの画面に促す
  before_action :authenticate_user!
  # deviseのcontrollerから呼び出された場合はconfigure_permitted_parametersメソッドを呼び出す
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # 「name」キーの内容の保存を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
