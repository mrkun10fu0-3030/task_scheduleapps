class SchedulesController < ApplicationController
  def index
    @schedules =Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to schedules_path, notice: "成功しました"
    else
      flash.now[:alert] = "失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule), notice: "編集しました"
    else
      flash.now[:alert] = "失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: "削除しました"
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :content)
  end
end
