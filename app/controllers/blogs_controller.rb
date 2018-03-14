class BlogsController < ApplicationController
	def index
	end

	def new
		@blog = Blog.new
		# ブログモデルと紐付いた（データを入れるための）空の箱を定義
		# インスタンスという。
	end

	def create
		blog = Blog.new(blog_params)
		# ビューから送られてきたデータをblogという空き箱に入れてる
		blog.save
		redirect_to "/blogs"
	end

	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		# findメソッドはidを使ってモデルからレコードを探す
	end

	private
	 def blog_params
	   params.require(:blog).permit(:title, :body, :category)
	   # ビューから送信されたデータはparamsというメソッドの中に入っている。
	   # ストロングパラメータはセキュリティを強固にしてるもの。
	 end
end
