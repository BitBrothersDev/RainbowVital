module RainbowVital
  class SupplementPlansController < ApplicationController
    ### generate for me CRUD actions for SupplementPlan
    before_action :set_supplement_plan, only: [:show, :edit, :update, :destroy]

    def index
      @supplement_plans = SupplementPlan.all
    end

    def show
    end

    def new
      @supplement_plan = SupplementPlan.new
    end

    def edit

    end

    def progress
      total_logs = supplement_logs.count
      total_items = supplement_plan_items.count
      return 0 if total_items.zero?

      (total_logs.to_f / total_items) * 100
    end

    def supplement_logs
      SupplementLog.where(supplement_plan_item_id: supplement_plan_items.pluck(:id))
    end

    def create
      @supplement_plan = current_user.supplement_plans.new(supplement_plan_params)
      @supplement_plan.supplement_plan_items.each { |item| item.times = item.times.split(',') }
      respond_to do |format|
        if @supplement_plan.save
          format.html { redirect_to @supplement_plan, notice: 'Supplement Plan was successfully created.' }
          format.json { render :show, status: :created, location: @supplement_plan }
        else
          format.html { render :new }
          format.json { render json: @supplement_plan.errors, status: :unprocessable_entity }
        end
      end
    end

    def ten_day_list
      @start_date = params[:start_date]&.to_date || Date.today
      @end_date = @start_date + 9.days
      @supplement_plan_items = RainbowVital::SupplementPlanItem.includes(:supplement_plan).where(rainbow_vital_supplement_plans: { user_id: current_user.id }).order(:created_at)
    end

    def update
      respond_to do |format|
        if @supplement_plan.update(supplement_plan_params)
          @supplement_plan.supplement_plan_items.each { |item| item.times = item.times.split(',') }
          format.html { redirect_to @supplement_plan, notice: 'Supplement Plan was successfully updated.' }
          format.json { render :show, status: :ok, location: @supplement_plan }
        else
          format.html { render :edit }
          format.json { render json: @supplement_plan.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @supplement_plan.destroy
      respond_to do |format|
        format.html { redirect_to supplement_plans_url, notice: 'Supplement Plan was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_supplement_plan
      @supplement_plan = SupplementPlan.find(params[:id])
    end

    def supplement_plan_params
      params[:supplement_plan][:supplement_plan_items_attributes].each do |_index, item|
        item[:times] = item[:times].split(',')
      end if params[:supplement_plan][:supplement_plan_items_attributes]

      params.require(:supplement_plan).permit(:user_id, :title, supplement_plan_items_attributes: [:id, :rainbow_vital_unit_id, :rainbow_vital_supplement_id, :dosage, :frequency, :_destroy, times: []])
    end
  end
end
