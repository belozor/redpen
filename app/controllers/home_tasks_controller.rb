class HomeTasksController < ApplicationController
  # GET /home_tasks
  # GET /home_tasks.xml
  def index
    @home_tasks = HomeTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @home_tasks }
    end
  end

  # GET /home_tasks/1
  # GET /home_tasks/1.xml
  def show
    @home_task = HomeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home_task }
    end
  end

  # GET /home_tasks/new
  # GET /home_tasks/new.xml
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @home_task = @lesson.build_home_task
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @home_task }
    end
  end

  # GET /home_tasks/1/edit
  def edit
    @lesson = Lesson.find(params[:lesson_id])
    @home_task = @lesson.home_task
    
  end

  # POST /home_tasks
  # POST /home_tasks.xml
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @home_task = @lesson.build_home_task(params[:home_task])

    respond_to do |format|
      if @home_task.save
        format.html { redirect_to school_class_learning_day_url(@lesson.learning_day.school_class, @lesson.learning_day) }
        format.xml  { render :xml => @home_task, :status => :created, :location => @home_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @home_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /home_tasks/1
  # PUT /home_tasks/1.xml
  def update
    @home_task = HomeTask.find(params[:id])

    respond_to do |format|
      if @home_task.update_attributes(params[:home_task])
        format.html { redirect_to(@home_task, :notice => 'HomeTask was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @home_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /home_tasks/1
  # DELETE /home_tasks/1.xml
  def destroy
    @home_task = HomeTask.find(params[:id])
    @home_task.destroy

    respond_to do |format|
      format.html { redirect_to(home_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
