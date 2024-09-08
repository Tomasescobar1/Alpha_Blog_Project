class ArticlesController < ApplicationController

    def show

        @article = Article.find(params[:id])

    end

    def index

        @articleIndex = Article.all

    end 

    def new

        @article = Article.new

    end

    def create

        @fail = 0

        @article = Article.new(params.require(:article).permit(:title, :description))
        
        if @article.save

            flash[:notice] = "Article successfully created!!"

            redirect_to article_path(@article)

        else

            render 'new'

            @fail = 1

        end

    end


end