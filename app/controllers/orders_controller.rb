class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @orders = Order.new
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was created!' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was updated!' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was destroyed!' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @product = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :product_id, :total)
    end

end