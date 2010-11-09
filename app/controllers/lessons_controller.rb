class LessonsController < ApplicationController
  before_filter :require_teacher_or_admin
  # GET /lessons
  # GET /lessons.xml
  def index
    @learning_day = LearningDay.find params[:learning_day_id]
    @lessons = @learning_day.lessons

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.xml
  def show
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.xml
  def new
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.xml
  def create
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.build(params[:lesson])

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to(school_class_learning_day_url(@learning_day.school_class, @learning_day), :notice => 'Урок успешно создан.') }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.xml
  def update
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      redirect_to(school_class_learning_day_url(@learning_day.school_class, @learning_day), :notice => 'Урок успешно отредактирован.')
    else
      render :action => "edit"
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.xml
  def destroy
    @learning_day = LearningDay.find params[:learning_day_id]
    @lesson = @learning_day.lessons.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to(school_class_learning_day_url(@learning_day.school_class, @learning_day)) }
      format.xml  { head :ok }
    end
  end
end
