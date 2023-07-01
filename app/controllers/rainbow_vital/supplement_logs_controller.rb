module RainbowVital
  class SupplementLogsController < ApplicationController
    ### only 2 action create and destroy
    before_action :set_supplement_plan_item, only: [:create, :destroy]

    def create
      @supplement_log = @supplement_plan_item.supplement_logs.new(supplement_log_params)
      respond_to do |format|
        if @supplement_log.save
          format.html { redirect_to ten_day_list_supplement_plans_path, notice: 'Supplement Log was successfully created.' }
          format.json { render :show, status: :created, location: ten_day_list_supplement_plans_path }
        else
          format.html { render :new }
          format.json { render json: @supplement_log.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @supplement_log = @supplement_plan_item.supplement_logs.find(params[:id])
      @supplement_log.destroy
      respond_to do |format|
        format.html { redirect_to ten_day_list_supplement_plans_path, notice: 'Supplement Log was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_supplement_plan_item
      @supplement_plan_item = SupplementPlanItem.find(params[:supplement_plan_item_id])
    end

    def supplement_log_params
      params.permit(:taken_at)
    end
  end
end
