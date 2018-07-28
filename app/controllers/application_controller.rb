class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_twitterer, :twitterer_logged_in?, :admin_user?

  private

  def current_twitterer
    return unless session[:twitter_user_id]
    @current_twitterer ||= Twitterer.find(session[:twitter_user_id])
  end

  def twitterer_logged_in?
    !!session[:twitter_user_id]
  end

	def admin_user?
		twitterer_logged_in? && session[:is_admin]
	end

  def authenticate
    return if twitterer_logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

  # tweet post
  def tweet_post(tweetmessage)
		if twitterer_logged_in?
	    client = Twitter::REST::Client.new do |config|
  	    # applicationの設定
   	   	config.consumer_key    = ENV['TWITTER_APP_ID']
    	  config.consumer_secret = ENV['TWITTER_APP_SECRET']
				# ユーザー情報の設定
      	config.access_token        = session[:twitter_access_token]
     		config.access_token_secret = session[:twitter_access_token_secret]
    	end
    	# Twitter投稿
    	client.update(tweetmessage)
		end
  end

end
