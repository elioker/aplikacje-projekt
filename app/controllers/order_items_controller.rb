class OrderItemsController < ApplicationController
  swagger_controller :orderItem, 'OrderItem'
  skip_before_action :verify_authenticity_token

  swagger_api :index do
  summary 'Returns order item'
  notes 'Notes...'
  end
  swagger_api :create do
  summary 'Returns order item'
  notes 'Notes...'
  param :form, 'product_id', :int, :required, 'product_id'
  param :form, 'quantity', :int, :required, 'quantity'
  end
  swagger_api :destroy do
  summary 'Returns order item'
  notes 'Notes...'
  param :form, :id, :int, :required, "product_id"
  end

  def index
    @items = current_cart.order.items

    response = { :items => @items }

      respond_to do |format|
          format.html
          format.json { render json: response}
      end
  end

  def create
    result = current_cart.add_item(
        product_id: params[:product_id],
        quantity: params[:quantity]
    )
    respond_to do |format|
        if result
            format.html { redirect_to cart_path }
            format.json { render json: { :location => cart_path }, status: 201 }
        else
            format.html { redirect_to cart_path }
            format.json { render json: { :errors => @role.errors }, status: 422 }
        end
    end
end

  def destroy
  result =  current_cart.remove_item(id: params[:id])
    respond_to do |format|
        if result
            format.html { redirect_to cart_path }
            format.json { render json: { :location => cart_path }, status: 201 }
        end
    end
  end
end