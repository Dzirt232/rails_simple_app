class ArticlesController < ApplicationController
	before_filter :require_login, only: [:create, :new, :edit, :update, :destroy]
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
		@article.views_counter += 1
		@article.update(article_views)
		@views_counter = @article.views_counter
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.views_counter = 0
		@article.save
		flash.notice = "Article #{@article.title} created!"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		flash.notice = "Article #{@article.title} deleted!"
		@article.destroy
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article #{@article.title} updated!"

		redirect_to article_path(@article)
	end
end
