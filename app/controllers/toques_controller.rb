class ToquesController < ApplicationController
  
  before_filter :login_required, :only => [:new, :edit, :create, :destroy, :update ]
  
  # GET /toques
  # GET /toques.xml
  def index
    @toques = Toque.find(:all, :order=>"cuando DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @toques }
    end
  end

  # GET /toques/1
  # GET /toques/1.xml
  def show
    @toque = Toque.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @toque }
    end
  end

  # GET /toques/new
  # GET /toques/new.xml
  def new
    @toque = Toque.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @toque }
    end
  end

  # GET /toques/1/edit
  def edit
    @toque = Toque.find(params[:id])
  end

  # POST /toques
  # POST /toques.xml
  def create
    @toque = Toque.new(params[:toque])

    respond_to do |format|
      if @toque.save
        flash[:success] = 'Toque guardado.'
        format.html { redirect_to(@toque) }
        format.xml  { render :xml => @toque, :status => :created, :location => @toque }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @toque.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toques/1
  # PUT /toques/1.xml
  def update
    @toque = Toque.find(params[:id])

    respond_to do |format|
      if @toque.update_attributes(params[:toque])
        flash[:success] = 'Toque guardado.'
        format.html { redirect_to(@toque) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @toque.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toques/1
  # DELETE /toques/1.xml
  def destroy
    @toque = Toque.find(params[:id])
    @toque.destroy

    respond_to do |format|
      flash[:success] = 'Toque eliminado.'
      format.html { redirect_to(toques_url) }
      format.xml  { head :ok }
    end
  end
  
  def notificar
    @toque = Toque.find(params[:id])
    
    if @toque.cuando < Time.now then
      flash[:error] = "Ya es demasiado tarde para notificar. La fecha ya ha pasado."
      redirect_to toques_url
      return
    else
      GMailer.deliver_recis_com_ar(@toque)
      flash[:success] = "Toque notificado a recis.com.ar"
      
      @toque.update_attribute :notificado, true
    end    
    
    redirect_to toques_url
  end

  def rss
    @toques = Toque.find(:all, :conditions=>"DATEDIFF(DATE(cuando),CURDATE())>=0",:order=>'cuando DESC')
    render :layout=>false
  end
  
end
