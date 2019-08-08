class Location < ActiveRecord::Base
  validates_uniqueness_of :city, scope: :state

  def create 
    Location.create(params[:location])
  end

# Will work as long as there's a location key in the params, otherwise it will raise an exception
  def update
    location = current_account.location.find(params[:id])
    location.update!(location_params)
    redirect_to location
  end

# Delete duplicate data stored in location db
  def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|model| [model.city,model.state,model.country] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
  end
end

  private
  # permissible attributes
    def location_params
      params.require(:location).permit(:city, :state, :country)
    end
end