class LearningDaysController < ApplicationController
  # GET /learning_days
  # GET /learning_days.xml
  def index
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_days = @school_class.learning_days.find(:all)
    if params[:week].to_i >0
      @week_number = params[:week]
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learning_days }
    end
  end

  # GET /learning_days/1
  # GET /learning_days/1.xml
  def show
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learning_day }
    end
  end

  # GET /learning_days/new
  # GET /learning_days/new.xml
  def new
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learning_day }
    end
  end

  # GET /learning_days/1/edit
  def edit
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.find(params[:id])
  end

  # POST /learning_days
  # POST /learning_days.xml
  def create
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.build(params[:learning_day])
    if @learning_day.day_template_id.to_i >0
      @learning_day.use_day_template(@learning_day.day_template_id)
    end
    

    respond_to do |format|
      if @learning_day.save
        format.html {redirect_to(school_class_learning_day_url(@school_class, @learning_day), :notice => 'Учебный день успешно создан.') }
        format.xml  { render :xml => @learning_day, :status => :created, :location => @learning_day }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learning_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learning_days/1
  # PUT /learning_days/1.xml
  def update
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.find(params[:id])

    respond_to do |format|
      if @learning_day.update_attributes(params[:learning_day])
        format.html { redirect_to(school_class_learning_day_url(@school_class, @learning_day), :notice => 'LearningDay was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learning_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_days/1
  # DELETE /learning_days/1.xml
  def destroy
    @school_class= SchoolClass.find(params[:school_class_id])
    @learning_day = @school_class.learning_days.find(params[:id])
    @learning_day.destroy

    respond_to do |format|
      format.html { redirect_to(school_class_learning_days_url(@school_class)) }
      format.xml  { head :ok }
    end
  end
end
