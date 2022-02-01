class OrdersController < ApplicationController
    swagger_controller :order, 'Order'
    skip_before_action :verify_authenticity_token
  
    swagger_api :new do
    summary 'Returns orders'
    param :form, 'first_name', :string, :required, 'user first name'
    param :form, 'last_name', :string, :required, 'user last name'
  
    end
  
      def new
        respond_to do |format|
          @order = current_cart.order
          response = { :order => @order}
              format.html
              format.json { render json: response}
          end
      end
  
      def create
          @order = current_cart.order
  
          if @order.update(order_params.merge(status: 'open'))
              session[:cart_token] = nil
              redirect_to '/cart'
          else
              render :new
          end
      end
  
      private
  
      def order_params
          params.require(:order).permit(:first_name, :last_name)
      end
  
  
  end