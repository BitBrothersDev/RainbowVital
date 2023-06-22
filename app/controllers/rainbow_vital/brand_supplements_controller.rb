module RainbowVital
  class BrandSupplementsController < ApplicationController
    before_action :set_brand_supplement, only: %i[ show edit update destroy ]

    def create
      @brand_supplement = BrandSupplement.new(brand_supplement_params)
      if @brand_supplement.save
        redirect_to @brand_supplement, notice: "Brand Supplement was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def set_brand_supplement
      @brand_supplement = BrandSupplement.find(params[:id])
    end

    def brand_supplement_params
      params.require(:brand_supplement).permit(:brand_id, :supplement_id, :unit_id)
    end
  end
end