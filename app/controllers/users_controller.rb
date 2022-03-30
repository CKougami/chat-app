class UsersController < ApplicationController

  def edit
  end

  def update
    # ログインユーザーの（user_paramsで取得した）情報をupdateできたらroot_pathへリダイレクト
    if current_user.update(user_params)
      redirect_to root_path
    else   #updateできなければ:editアクションのビューが表示される
      render :edit     
    end
  end

  

  private     #以下はclass外から呼び出されなたくないアクション
  def user_params
  # usersテーブルの:name,:emailのみ受け取る
  params.require(:user).permit(:name, :email)
  end

end
