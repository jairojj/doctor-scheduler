class PacientsController < ApplicationController
    before_action :logged_in_user, only: [:new]

    def new
      @pacient = Pacient.new
    end
    
    def create
      @pacient = Pacient.new(params.require(:pacient).permit(:name, :email, :password,))
      if @pacient.save
        redirect_to '/home'
      else
        render 'new'
      end
    end
    
    def show
      @pacient = Pacient.find(params[:id])
    end
    
    def logged_in_user
      if logged_in?
        redirect_to '/home'
      end
    end

end
