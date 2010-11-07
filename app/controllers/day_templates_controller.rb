class DayTemplatesController < ApplicationController
  # GET /day_templates
  # GET /day_templates.xml
  def index
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_templates = @school_class.day_templates.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @day_templates }
    end
  end

  # GET /day_templates/1
  # GET /day_templates/1.xml
  def show
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @day_template }
    end
  end

  # GET /day_templates/new
  # GET /day_templates/new.xml
  def new
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @day_template }
    end
  end

  # GET /day_templates/1/edit
  def edit
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.find(params[:id])
  end

  # POST /day_templates
  # POST /day_templates.xml
  def create
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.build(params[:day_template])

    respond_to do |format|
      if @day_template.save
        format.html { redirect_to school_class_day_templates_url(@school_class)}
        format.xml  { render :xml => @day_template, :status => :created, :location => @day_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @day_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /day_templates/1
  # PUT /day_templates/1.xml
  def update
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.find(params[:id])

    respond_to do |format|
      if @day_template.update_attributes(params[:day_template])
        format.html { redirect_to school_class_day_templates_url(@school_class)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @day_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /day_templates/1
  # DELETE /day_templates/1.xml
  def destroy
    @school_class = SchoolClass.find(params[:school_class_id])
    @day_template = @school_class.day_templates.find(params[:id])
    @day_template.destroy

    respond_to do |format|
      format.html {redirect_to school_class_day_templates_url(@school_class)}
      format.xml  { head :ok }
    end
  end
end
