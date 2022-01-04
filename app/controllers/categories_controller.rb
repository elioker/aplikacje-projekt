class CategoriesController < ApplicationController 
    def index
        @categories = Category.order(:title)

        response = { :categories => @categories }
        
        respond_to do |format|
            format.html
            format.json { render json: response}
        end
    end
end