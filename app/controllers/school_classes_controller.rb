class SchoolClassesController < ApplicationController
  # GET /school_classes
  # GET /school_classes.xml
  def index
    @school_classes = SchoolClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_classes }
    end
  end

  # GET /school_classes/1
  # GET /school_classes/1.xml
  def show
    @school_class = SchoolClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_class }
    end
  end

  # GET /school_classes/new
  # GET /school_classes/new.xml
  def new
    @school_class = SchoolClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_class }
    end
  end

  # GET /school_classes/1/edit
  def edit
    @school_class = SchoolClass.find(params[:id])
  end

  # POST /school_classes
  # POST /school_classes.xml
  def create
    @school_class = SchoolClass.new(params[:school_class])

    respond_to do |format|
      if @school_class.save
        format.html { redirect_to(@school_class, :notice => 'SchoolClass was successfully created.') }
        format.xml  { render :xml => @school_class, :status => :created, :location => @school_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /school_classes/1
  # PUT /school_classes/1.xml
  def update
    @school_class = SchoolClass.find(params[:id])

    respond_to do |format|
      if @school_class.update_attributes(params[:school_class])
        format.html { redirect_to(@school_class, :notice => 'SchoolClass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /school_classes/1
  # DELETE /school_classes/1.xml
  def destroy
    @school_class = SchoolClass.find(params[:id])
    @school_class.destroy

    respond_to do |format|
      format.html { redirect_to(school_classes_url) }
      format.xml  { head :ok }
    end
  end
end
