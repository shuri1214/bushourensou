class ImpressionsController < ApplicationController

	before_action :impression_params

	def create
    @impression = Impression.new( impression_params )
    if @impression.save
      flash[:success] = 'そのような印象を持たれておられましたか'
    else
      #flash.now[:danger] = 'すまぬが登録できなんだ・・・' # 今回は今のところrender使用しないつもりので、nowやめる
      flash[:danger] = 'すまぬが登録できなんだ・・・'
    end
		redirect_to bushou_url(set_bushou)
	end

	def destroy
		@impression = Impression.find(params[:impression][:id]).destroy
		flash[:success] = '印象削除したでござる'
		redirect_to bushou_url(set_bushou)
	end

	private

	def set_bushou
		@bushou = Bushou.new(id: @impression.bushou_id)
	end

	def impression_params
		params.require(:impression).permit(:id, :bushou_id, :keyword)
	end

end
