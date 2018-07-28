class BushousController < ApplicationController

  before_action :set_bushou, only: [:show, :edit, :update, :destroy, :keywords]
	before_action :require_logged_in, only:[:new, :edit, :destroy]

  def index
    @bushous = Bushou.all
  end

  def show
		# 一覧表示用
		@impressions = Impression.where(bushou_id: params[:id] ).order('updated_at DESC')
		# 入力用
		@impression = Impression.new(bushou_id: params[:id])
  end

	def new
		@bushou = Bushou.new()
	end

	def create
		@bushou = Bushou.new(bushou_params)
		if @bushou.save
			# success case
			flash[:success] = '武将登録できましたぞ！'
			# Twitter投稿
			tweetmessage = @bushou.name + 'を新規に登録しました.：' + bushou_url( @bushou.id )
			tweet_post( tweetmessage )

			redirect_to @bushou
		else
			flash.now[:danger] = '殿オオォォォオ!?申し訳ござらんッ!!'
			render :new
		end
	end

	def edit
		# only before action
	end

	def update
		if @bushou.update(bushou_params)
      flash[:success] = '武将更新しましたぞ！'
      redirect_to @bushou
		else
      flash.now[:danger] = '更新できなんだ・・・かたじけない・・・'
      render :edit
		end
	end

	def destroy
		if @bushou.destroy
			flash[:success] = '消しましたぞ・・・'
			redirect_to bushous_url
		else
			# ToDo test 依存関係が出た時とか、複数名が削除したいとか、DBが落ちた時とか?
			flash[:danger] = '消えぬか。何事ぞ。'
			redirect_to @bushou
		end
	end

	private

	def keywords
		@impressions = Impression.where(bushou_id: params[:id] ).order('updated_at DESC')
	end

	def set_bushou
		@bushou = Bushou.find(params[:id])
	end

	def bushou_params
		params.require(:bushou).permit(:name)
	end

	def require_logged_in
		unless twitterer_logged_in?
			redirect_to bushous_url
		end
	end

end
