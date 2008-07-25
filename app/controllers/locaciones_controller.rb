class LocacionesController < ApplicationController
  # GET /locaciones
  # GET /locaciones.xml
  def index
    @locaciones = Locacion.find(:all)
    @tags = Locacion.tag_counts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locaciones }
    end
  end

  def list_by_tag
    @tag = params[:tag]
    @locaciones = Locacion.find_tagged_with(@tag)
  end

  # GET /locaciones/1
  # GET /locaciones/1.xml
  def show
    @locacion = Locacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locacion }
    end
  end

  # GET /locaciones/new
  # GET /locaciones/new.xml
  def new
    @locacion = Locacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locacion }
    end
  end

  # GET /locaciones/1/edit
  def edit
    @locacion = Locacion.find(params[:id])
  end

  # POST /locaciones
  # POST /locaciones.xml
  def create
    @locacion = Locacion.new(params[:locacion])
    @locacion.tag_list = params[:tags]

    respond_to do |format|
      if @locacion.save
        flash[:notice] = 'Locacion was successfully created.'
        format.html { redirect_to(@locacion) }
        format.xml  { render :xml => @locacion, :status => :created, :location => @locacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locaciones/1
  # PUT /locaciones/1.xml
  def update
    @locacion = Locacion.find(params[:id])

    respond_to do |format|
      if @locacion.update_attributes(params[:locacion])
        flash[:notice] = 'Locacion was successfully updated.'
        format.html { redirect_to(@locacion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locaciones/1
  # DELETE /locaciones/1.xml
  def destroy
    @locacion = Locacion.find(params[:id])
    @locacion.destroy

    respond_to do |format|
      format.html { redirect_to(locaciones_url) }
      format.xml  { head :ok }
    end
  end
  
  def tag
    @locacion = Locacion.find(params[:id])
    @locacion.tag_list.add(params[:tags], :parse=>true)
    @locacion.save
    render :partial=>'tags'
  end

  # elimina los tags recibidos de la persona ID
  def untag
    @locacion = Locacion.find(params[:id])
    @locacion.tag_list.remove(params[:tag])
    @locacion.save
    render :partial=>'tags'
  end
  
  
end
