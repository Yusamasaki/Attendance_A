class WorkoutsController < ApplicationController
      before_action :set_user, only: [:bodypart_menu, :bodypart_menu_index, :traning_menu, :traning_contents, :index_bodypart, :index_menu_modal, :traning_day_contents]
  before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy, :bodypart_menu, 
                                        :bodypart_menu_index, :traning_menu, :traning_contents, :index_bodypart, :index_menu_modal, :traning_day_contents]
  before_action :work_set, only: [:workout, :new, :show, :index, :create, :edit, :destroy, :update]
  before_action :work_day, only: [:new, :index, :edit]
  before_action :day_id_set, only: [:index, :create, :edit, :update, :destroy]
  
  def index
    @workouts = @day.workouts.where(user_id: params[:user_id])
    
    #@q = Workout.where(user_id: params[:user_id], day_id: params[:day_id]).ransack(params[:q])
    #@workouts = @q.result(distinct: true).paginate(page: params[:page], per_page: 20 )
    
  end
  
  def new
    @users = User.all
    @workout = Workout.new(user_id: params[:user_id], day_id: params[:day_id], body_part: params[:body_part])
    @traning_menus = @user.traning_menus.where(body_part: params[:body_part])
  end
  
  def create
    @workout = @day.workouts.new(workout_params)
    if @workout.save
      flash[:success] = "新規作成しました。"
      redirect_to user_day_workouts_url @user
    else
      render :new
    end
  end
  
  def edit
    @workout = @day.workouts.find(params[:id])
  end
  
  def update
    @workout = @day.workouts.find(params[:id])
    if @workout.update_attributes(workout_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user_day_workouts_url @user
    else
      render :edit      
    end
  end
  
  def destroy
    @workout = @day.workouts.find(params[:id])
    @workout.destroy
    flash[:success] = "削除しました。"
    redirect_to user_day_workouts_url @user
  end
  
  def bodypart_menu
  end
  
  def bodypart_menu_index
  end
  
  def traning_menu
    @traning_menus = @user.traning_menus.where(body_part: params[:body_part]).distinct.pluck(:traning_event)
  end
  
  def traning_contents
    @first_day = params[:date].nil? ?
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    
    @days = @user.days.where( worked_on: @first_day..@last_day).order(:worked_on)
    
    @workout = TraningMenu.find_by(traning_event: params[:traning_event])
    
    days = @days.pluck(:worked_on)
    
    books = @days.each{ |day| Workout.where(day_id: day.id) 
      debugger
    }
    
    #@graph = LazyHighCharts::HighChart.new('graph') do |f|
    #  f.title(text: '本 月間登録推移')
    #  f.xAxis(categories: days)
    #  f.series(name: '登録数', data: books)
    #  f.series(name: '登録数', data: books)
    #end
  end
  
  def index_bodypart
  end
  
  def index_menu_modal
    @workout = Workout.find_by(traning_event: params[:traning_event])
  end
  
  def traning_day_contents
    @first_day = params[:date].nil? ?
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    
    @days = @user.days.where( worked_on: @first_day..@last_day).order(:worked_on)
    
    @workout = TraningMenu.find_by(traning_event: params[:traning_event])
    
    @day = Day.find(params[:day_id])
    
    
    #books = days.each { |item| Workout.where(traning_kg: item) }
    
    #@graph = LazyHighCharts::HighChart.new('graph') do |f|
    #  f.title(text: '本 月間登録推移')
    #  f.xAxis(categories: days)
    #  f.series(name: '登録数', data: books)
    #  f.series(name: '登録数', data: books)
    #end
  end
  
  private
    
    def workout_params
      params.require(:workout).permit(:worked_on, :body_part, :traning_event, :target_muscle, :traning_set, :traning_kg, :traning_rep, :note)
    end
    
    def workout_search_params
      params.fetch(:search, {}).permit(:body_part)
    end
  
end
