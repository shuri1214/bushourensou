class ImpressionsController < ApplicationController

	before_action :impression_params

	def create
    @impression = Impression.new( impression_params )
    if @impression.save
      flash[:success] = 'そのような印象を持たれておられましたか'
      # Twitter投稿
			set_bushou
      tweetmessage = @bushou.name  + 'への印象は【' + @impression.keyword + '】です.' + bushou_url(@bushou.id)
p '-----tweetmessage debug-------'
p tweetmessage
p '-----tweetmessage debug-------'
      # tweet_post( tweetmessage )
    else
      flash[:danger] = 'すまぬが登録できなんだ・・・'
    end
		redirect_to bushou_url(set_bushou)
	end

	def destroy
		@impression = Impression.find(params[:impression][:id]).destroy
		if @impression.destroy
			flash[:success] = '印象削除したでござる'
		else
			flash[:danger] = 'すでに消えているでござる'
		end
		redirect_to bushou_url(set_bushou)
	end

	private

	def set_bushou
		@bushou = Bushou.find_by(id: @impression.bushou_id)
	end

	def impression_params
		params.require(:impression).permit(:id, :bushou_id, :keyword)
	end

end
