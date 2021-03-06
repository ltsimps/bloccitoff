class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
   @list = List.find(params[:list_id])
    @items = @list.items

  end

  # GET /items/1
  # GET /items/1.json
  def show
        @list = List.find(params[:list_id])
        @item = Item.find(params[:id])

  end

  # GET /items/new
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
            @list = List.find(params[:list_id])

  end

  # POST /items
  # POST /items.json
  def create
    @list = List.find(params[:list_id])

     @item = Item.new(item_params)
    #@item =  current_user.item.build(params[:item])
    @item = current_user.items.build(item_params)
     #@item = current_user.items.build(params[:item])
    #@item.list = @topic
    #binding.pry

    respond_to do |format|
      if @item.save
        format.html { redirect_to [@list, @item], notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:completed, :description, :list, :user, :item)
    end

    #def more_than_seven_days_old
    #    current_time = Time.new
    #    if @item.created_at 
    # end

end
