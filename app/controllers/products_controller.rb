class ProductsController < ApplicationController

    def index
        @category = Category.find(params[:category_id])
        @products = @category.products.includes(:variants).order(:title)

        response = { :category => @category, :products => @products }
        
        respond_to do |format|
            format.html
            format.json { render json: response}
        end
    end

end