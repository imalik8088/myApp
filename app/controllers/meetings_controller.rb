class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.xml
  def index
    @meetings = Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.xml
  def show
    @meeting = Meeting.find(params[:id])
    @comment = Comment.new
    #@comments = Comment.all
    #@comments = Comment.where("id = ?", @meeting.comment_id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.xml
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
    2.times {@meeting.assets.build}
  
  end


  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.graduation_year = current_user.graduation_year
    @meeting.school_id = current_user.school_id
    @meeting.alumnis << current_user
   
   #E-Mail an alle Klassenkameraden
    @alumnis = Alumni.my_classmates( current_user.graduation_year, current_user.school_id )
    @alumnis.each do |a|
      Notifier.meeting_invitation(a, @meeting).deliver
    end

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to(:controller => 'alumnis', :action => 'get_my_graduationyear', :notice => 'Treffen wurde erstellt und eine E-Mail an deinenn Klassenkameraden gesendet.', :year => current_user.graduation_year, :school => current_user.school_id )}
        format.xml  { render :xml => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.xml
  def update
    @meeting = Meeting.find(params[:id])
    @meeting.graduation_year = current_user.graduation_year
    @meeting.school_id = current_user.school_id

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to(@meeting, :notice => 'Meeting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.xml
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_comment
    @comment = Comment.new(params[:comment])
    @meeting = Meeting.find(params[:id])
    @comment.meeting = @meeting
    @comment.user = current_user.first_name
    
    if @comment.save
      flash[:notice] = "Kommentar Erfolgreich hinzugefügt"
      redirect_to(:action => "show")
    else
      render(:action => "show")
    end
  end
end
