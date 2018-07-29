class ImpressionsController < ApplicationController

	before_action :impression_params, :set_impression_and_bushou

	def create
    if @impression.save
      flash[:success] = 'そのような印象を持たれておられましたか'
			# Twitter投稿
			if params[:is_tweet]
				tweetmessage = @bushou.name  + 'への印象は【' + @impression.keyword + '】です。：' + bushou_url(@bushou.id)
				tweet_post( tweetmessage )
			end
    else
      flash[:danger] = 'すまぬが登録できなんだ・・・'
    end
		redirect_to bushou_url(@bushou)
	end

	def destroy
		if @impression.destroy
			flash[:success] = '印象削除したでござる'
		else
			flash[:danger] = 'すでに消えているでござる'
		end
		redirect_to bushou_url(@bushou)
	end

	private

	def set_impression_and_bushou
		param_impression_id = params[:impression][:id]
		if param_impression_id.nil?
			@impression = Impression.new( impression_params )
		else
			@impression = Impression.find( param_impression_id )
		end
		@bushou = Bushou.find( @impression.bushou_id )
	end

	def impression_params
p '==========='
p params
p '==========='
		params.require(:impression).permit(:id, :bushou_id, :keyword)
	end

end
