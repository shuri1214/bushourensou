class SessionsController < ApplicationController
  def create
		auth = request.env['omniauth.auth']
    twitterer = Twitterer.find_or_create_from_auth(auth)
		is_admin = AdminUser.exists?(uid: twitterer.uid)
    session[:twitter_user_id] = twitterer.id
		session[:is_admin] = is_admin
    session[:twitter_access_token]        = auth['credentials']['token']
		session[:twitter_access_token_secret] = auth['credentials']['secret']
    flash[:success] = "ユーザー認証が完了しました。"
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:success] = "ログアウトしました。"
    redirect_to root_path
  end
end
