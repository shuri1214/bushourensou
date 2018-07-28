class SearchController < ApplicationController
	def index
		@search = params[:q]
		@results
		if @search.present?
			@results = Impression.joins(:bushou).where( 'keyword like ?', "%#{@search}%" )
				.select("impressions.id, impressions.keyword,bushous.id as bushouid,bushous.name").all
		end
		render :index
	end
end
