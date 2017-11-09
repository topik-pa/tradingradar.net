class StudyPageController < ApplicationController
  
  before_action :require_user, only: [:index, :show]
    
  def index
    #id = params[:id] ? params[:id] : ''
      
    #@user = User.find_by_email(current_user.email)
    
    @isin = params[:isin] ? params[:isin] : nil   
    if @isin
      @stock = Stock.find_by isin: @isin 
    else
      last_study_stock_id = Study.where(:user_id => $user_id).last().stock_id
      @stock = Stock.find(last_study_stock_id)
    end
    

    @lastStudy = Study.where(:stock_id => @stock.id, :user_id => $user_id).last()
    @studiesSize = @stock.studies.size 

      
  end
  
  
    def create
      @study = Study.new(study_params)

      respond_to do |format|
        if @study.save
          format.html { redirect_to controller: 'study_page', action: 'index' ,notice: 'Study was successfully created.' }
          #format.json { render :show, status: :created, location: @study }
        else
          format.html { redirect_to controller: 'study_page', action: 'index', notice: 'Study was NOT successfully created.' }
          #format.json { render json: @study.errors, status: :unprocessable_entity }
        end
      end
    end
    
      private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_params
      params.require(:study).permit(:resistance, :support, :direction, :mmp1, :mmp2, :gap, :trading_position, :reversal_chart_pattern, :continuation_chart_pattern, :reversal_candlestick, :continuation_candlestick, :rsi, :rsi_cross, :rsi_divergence, :stoch, :stoch_cross, :stoch_divergence, :macd, :macd_cross, :buy, :sell, :stop_loss, :image_usrl, :note, :stock_id, :user_id)
    end
    
  private
    def colorClass(value)
      if value.to_s.include?("-")
              'red'
            else
              'green'
            end
    end
    helper_method :colorClass
    
    
end
