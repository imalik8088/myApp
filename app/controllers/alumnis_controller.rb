class AlumnisController < ApplicationController
#before_filter :login_required, :only => :index


  def index
    @alumnis = Alumni.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alumnis }
    end
  end

  def show
    @alumni = Alumni.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alumni }
    end
  end

  def new
    @alumni = Alumni.new(:country => "Deutschland")
    @schools = School.all
    @schools.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alumni }
    end
  end

  def edit
    @schools = School.all
    @alumni = Alumni.find(params[:id])
    @schools.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end


  def create
    @schools = School.all
    @alumni = Alumni.new(params[:alumni])
    @alumni.school_id = params[:school_id]
    

    respond_to do |format|
      if @alumni.save
        format.html { redirect_to(@alumni, :notice => 'Alumni was successfully created.') }
        format.xml  { render :xml => @alumni, :status => :created, :location => @alumni }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alumni.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @alumni = Alumni.find(params[:id])
    @alumni.school_id = params[:school_id]

    respond_to do |format|
      if @alumni.update_attributes(params[:alumni])
        format.html { redirect_to(@alumni, :notice => 'Alumni was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alumni.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @alumni = Alumni.find(params[:id])
    @alumni.destroy

    respond_to do |format|
      format.html { redirect_to(alumnis_url) }
      format.xml  { head :ok }
    end
  end
  
  # Mein Jahrgang
  def get_my_graduationyear
    @my_classmates = Alumni.my_classmates( params[:year], params[:school] )
  end
  
  # Meine Meetings
  def get_my_meetings
    @meetings = Meeting.my_meetings( params[:year], params[:school] )
    render "meetings/index"
  end
  
end
