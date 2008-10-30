class DataController < ApplicationController

  # GET /data.xml?from[]=1-1&from[]=1-2
  def index
    @page_objects = PageObject.find(:all, :conditions => { :urn => params[:from] })
    @data = @page_objects.collect { |po| { :urn => po.urn, :name => po.title, :description =>  po.subtitle } }
    
    respond_to do |format|
      format.xml  { render :xml => @data }
    end
  end

end
