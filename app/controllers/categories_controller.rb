class CategoriesController < ApplicationController
    #swagger_controller :category, 'Categories'
    #swagger_api :index do
    #summary 'Returns categories'
    #end    gdy dodajemy swaggera, to wtedy json nam zwraca złe wartości 

    def index
        @categories = Category.order(:title)

        response = { :categories => @categories }
        
        respond_to do |format|
            format.html
            format.json { render json: response}
        end
    end
end