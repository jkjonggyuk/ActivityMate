class GoogleType < ApplicationRecord
  validates_uniqueness_of :type_id
  
  def create 
    Google_type.create(params[:google_type])
  end

  private
  # permissible attributes
    def google_type_params
      params.require(:google_type).permit(:type_id, :google_type, :time, :theme)
    end
end
