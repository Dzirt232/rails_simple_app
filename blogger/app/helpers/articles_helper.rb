module ArticlesHelper
	def article_params
		params.require(:article).permit(:title,:body, :tag_list, :image, :views_counter)
	end

	def article_views
		params.permit(:views_counter)
	end
end
