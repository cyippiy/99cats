class CatsController < ApplicationController

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            flash.now[:errors] = @cat.errors.full_messages
        render :new
        end
    end

    def index
        @cats = Cat.all
        render :index
    end

    def new
        @cat = Cat.new
        render :new
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def cat_params
        params.require(:cat).permit(:id, :name, :color, :sex, :birth_date, :description)
    end
end
