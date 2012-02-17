class DocumentsController < ApplicationController
  
  def arhive
    @all_documents = Document.all
    render 'arhive'
  end
  
  def create
    new_file = self.upload_it params[:document]
    if new_file.valid? then
      new_file.save
      flash[:upload_success] = "Tukushot uspeshno ka4i file-a si!"
    else
      flash[:of_track] = "Something went off the rails!"
    end
    re_render
    #redirect_to users_path
  end
  
  def re_render
    render 'refresh_list', :locals => {
                                        :user => User.where(:id => session[:user].id).first
                                        }
  end
  
  def upload_it file
    f_name = file[:url].original_filename
    directory = "data/user_#{session[:user].id}" 
    path = File.join("public/#{directory}",f_name)
    File.open(path,'wb') { |f| f.write(file[:url].read ) }    
    Document.new :url => path.gsub('public',''), :name => f_name, :user_id => session[:user].id
  end
    
  
  def destroy
   f = Document.where(:id => params[:id]).first
   flash[:deleting] = "Delete #{params[:id]}"
   #if session[:user].id == f.user.id then      
   #   File.unlink f.url
   #   Document.delete f.id
      redirect_to users_path
   # end
  end
  
  def update_document
    
  end
  
end
