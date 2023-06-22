module RainbowVital
  class SupplementsController < ApplicationController
    before_action :set_supplement, only: [:show, :edit, :update, :destroy]

    # GET /supplements
    def index
      @supplements = RainbowVital::Supplement.all
    end

    # GET /supplements/1
    def show
      @supplement_brands = @supplement.brand_supplements
      @brands = RainbowVital::Brand.all
      @supplements = RainbowVital::Supplement.all
      @units = RainbowVital::Unit.all
    end

    # GET /supplements/new
    def new
      @supplement = RainbowVital::Supplement.new
      @brands = RainbowVital::Brand.all
      @units = RainbowVital::Unit.all
    end

    # GET /supplements/1/edit
    def edit
    end

    # POST /supplements
    def create
      @supplement = RainbowVital::Supplement.new(supplement_params)

      if @supplement.save
        redirect_to @supplement, notice: 'Supplement was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /supplements/1
    def update
      if @supplement.update(supplement_params)
        redirect_to @supplement, notice: 'Supplement was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /supplements/1
    def destroy
      @supplement.destroy
      redirect_to supplements_url, notice: 'Supplement was successfully destroyed.'
    end

    private

    def set_supplement
      @supplement = RainbowVital::Supplement.find(params[:id])
    end

    def supplement_params
      params.require(:supplement).permit(:name, :description, :amount)
    end
  end
end
