class TemplateLessonsController < ApplicationController
  # GET /template_lessons
  # GET /template_lessons.xml
  def index
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lessons = @day_template.template_lessons.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @template_lessons }
    end
  end

  # GET /template_lessons/1
  # GET /template_lessons/1.xml
  def show
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @template_lesson }
    end
  end

  # GET /template_lessons/new
  # GET /template_lessons/new.xml
  def new
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @template_lesson }
    end
  end

  # GET /template_lessons/1/edit
  def edit
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.find(params[:id])
  end

  # POST /template_lessons
  # POST /template_lessons.xml
  def create
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.build(params[:template_lesson])

    respond_to do |format|
      if @template_lesson.save
        format.html { redirect_to(school_class_day_template_url(@day_template.school_class, @day_template)) }
        format.xml  { render :xml => @template_lesson, :status => :created, :location => @template_lesson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @template_lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /template_lessons/1
  # PUT /template_lessons/1.xml
  def update
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.find(params[:id])

    respond_to do |format|
      if @template_lesson.update_attributes(params[:template_lesson])
        format.html { redirect_to(school_class_day_template_url(@day_template.school_class, @day_template)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @template_lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /template_lessons/1
  # DELETE /template_lessons/1.xml
  def destroy
    @day_template = DayTemplate.find(params[:day_template_id])
    @template_lesson = @day_template.template_lessons.find(params[:id])
    @template_lesson.destroy

    respond_to do |format|
      format.html { redirect_to(school_class_day_template_url(@day_template.school_class, @day_template)) }
      format.xml  { head :ok }
    end
  end
end
