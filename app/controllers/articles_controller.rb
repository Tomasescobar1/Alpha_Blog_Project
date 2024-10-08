class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show

    end

    def index

        @articleIndex = Article.all

    end 

    def new

        @article = Article.new

    end

    def create

        @article = Article.new(article_params)
        
        if @article.save

            flash[:notice] = "Article successfully created!!"

            redirect_to article_path(@article)

        else

            flash[:notice] = "Article information insufficient."

            render 'new'

        end

    end

    def edit

        set_article

    end

    def update

        if @article.update(article_params)

            flash[:notice] = "Article successfully updated!!"
            
            redirect_to article_path(@article) 

        else

            flash[:notice] = "Article information insufficient."
            
            render 'edit'
            
        end

    end 

    def destroy

        @article.destroy

        redirect_to articles_path

    end

    private

    def set_article

        @article = Article.find(params[:id])

    end

    def article_params

        params.require(:article).permit(:title, :description)

    end

end