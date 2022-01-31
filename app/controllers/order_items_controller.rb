class OrderItemsController < ApplicationController
    
    def index
      @items = current_cart.order.items

      response = { :items => @items }
        
        respond_to do |format|
            format.html
            format.json { render json: response}
        end
    end
  
    def create
      current_cart.add_item(
        product_id: params[:product_id],
        quantity: params[:quantity]
      )
  
      redirect_to cart_path
    end
  
    def destroy
      current_cart.remove_item(id: params[:id])
      redirect_to cart_path
    end
  
  end