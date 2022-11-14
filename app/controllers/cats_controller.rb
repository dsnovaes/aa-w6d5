class CatsController < ApplicationController
    

#index
    def index
        @cats = Cat.all
    end

#new
    def new
        @cat = Cat.new
    end

#edit
    def edit
        @cat = Cat.find_by(id: params[:id])
    end

#update
    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

#create
    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat) # , status: 201
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

#show
    def show
        @cat = Cat.find_by(id: params[:id])
    end

private
    def cat_params
        params.require(:cat).permit(:description, :name, :birth_date, :sex, :color)
    end


end