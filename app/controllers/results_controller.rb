class ResultsController < ApplicationController
	include HTTParty
	'require json'

	def index 

		@client = GooglePlaces::Client.new('AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk')

		@title = 'Results:';
		@subheading = 'Here are your TOP 3!';

		# PARAMS: 
		@time = params[:time_id];
		@price = params[:price_id];
		@theme = params[:theme_id];
		@city = params[:search][:city_id];

		###### MAIN QUERY TO GOOGLE PLACES API ######

		@spot = @client.spots_by_query(@theme + " in " + @city);
		# parse spot to find places that are open_now, price_level matches 

		@spot1 = @spot[0];
		@spot2 = @spot[1];
		@spot3 = @spot[2];

		#Get place_id -> store for use in bookmark page
		@placeID_1 = @spot1.place_id;
		session[:passed_variable1] = @placeID_1
		@placeID_2 = @spot2.place_id;
		session[:passed_variable2] = @placeID_2
		@placeID_3 = @spot3.place_id;
		session[:passed_variable3] = @placeID_3

		#details request API call
		@response1 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @placeID_1 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
		@response2 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @placeID_2 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
		@response3 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @placeID_3 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
		#parse JSON that is returned to get detailed info
		@details1 = JSON.parse(@response1.body);
		@details2 = JSON.parse(@response2.body);
		@details3 = JSON.parse(@response3.body);

		#Weather things here

		#Now, depending on the location input, the location id code should be changed.

		@citynumber = "6173331" # Vancouver default


		if @city == "Austin, Texas"
			@citynumber = "4671654"
		elsif @city == "Boston, Massachusetts"
			@citynumber = "4930956";
  		elsif @city == "Calgary, Alberta"
			@citynumber = "5913490";
  		elsif @city == "Chicago, Illinois"
			@citynumber = "4887398";
  		elsif @city == "Dallas, Texas"
			@citynumber = "4684888";
  		elsif @city == "Denver, Colorado"
			@citynumber = "5419384";
  		elsif @city == "Edmonton, Alberta"
			@citynumber = "5946768";
  		elsif @city == "Halifax, Nova Scotia"
			@citynumber = "6324729";
  		elsif @city == "Hamilton, Ontario"
			@citynumber = "5969785";
  		elsif @city == "Honolulu, Hawaii"
			@citynumber = "5856195";
  		elsif @city == "Houston, Texas"
			@citynumber = "4699066";
  		elsif @city == "Los Angeles, California"
			@citynumber = "5368361";
  		elsif @city == "Miami, Florida"
			@citynumber = "4164138";
  		elsif @city == "Mississauga, Ontario"
			@citynumber = "6075357";			
  		elsif @city == "Montreal, Quebec"
			@citynumber = "6077243";
  		elsif @city == "New York City, New York"
			@citynumber = "5128581";
  		elsif @city == "Ottawa, Ontario"
			@citynumber = "6094817";
  		elsif @city == "Philadelphia, Pennsylvania"
			@citynumber = "4560349";
  		elsif @city == "Phoenix, Arizona"
			@citynumber = "5308655";
  		elsif @city == "Portland, Oregon"
			@citynumber = "5746545";
  		elsif @city == "Quebec City, Quebec"
			@citynumber = "6325494";
	  	elsif @city == "San Antonio, Texas"
			@citynumber = "4726206";
	  	elsif @city == "San Diego, California"
			@citynumber = "5391811";
	  	elsif @city == "San Francisco, California"
			@citynumber = "5391959";
	  	elsif @city == "San Jose, California"
			@citynumber = "4673475";
  		elsif @city == "Seattle, Washington"
			@citynumber = "5809844";
		elsif @city == "Toronto, Ontario"
			@citynumber = "6167865";
		elsif @city == "Vancouver, British Columbia"
			@citynumber = "6173331";
  		elsif @city == "Victoria, British Columbia"
			@citynumber = "6151264";
  		elsif @city == "Winnipeg, Manitoba"
			@citynumber = "6183235";
		end


		#Here, if conditional statement should change the location id depending on the input

		@response4 = HTTParty.get('https://api.openweathermap.org/data/2.5/forecast?id=' + @citynumber + '&APPID=8b9aa5429a07d5285e15a6d545e204fd');
    	@weatherdata = JSON.parse(@response4.body);
    	@weathercode = @weatherdata["list"][0]["weather"][0]["id"];    #["0"]["id"]; #2xx, 3xx, 4xx, ...
    	#@weathercodestr = @weatherarr["id"];
    	#@weathercodestr = @weathercodestr.get("id");
    	@weathercode = @weathercode.to_i;

    	#We need if/else to get the correct image name. For example, if code == 2xx, 11d; if == 3xx or 5xx, 09d; if == 6xx, 13d; if == 7xx, 50d; if == 800, 01d, if == 8xx, 9xx not 800, 03d, 
  
    	if @weathercode <= 299
    		@determinant = "11d"		#Thunderstorm
    		@weatherstmt = "THUNDERSTORM!!! Try indoor activities!"
    	elsif @weathercode <= 599
    		@determinant = "09d"		#cloud+rain
    		@weatherstmt = "RAIN cannot stop our activities!!!"
    	elsif @weathercode <= 699
    		@determinant = "13d"		#cloud+snow
    		@weatherstmt = "It's SNOWing!!! Good day for snow-activities!!!"
    	elsif @weathercode <= 799
    		@determinant = "50d"		#mist
    		@weatherstmt = "In the MIST, you can still enjoy activities!!!"
 		elsif @weathercode == 800
    		@determinant = "01d"		#sunny
    		@weatherstmt = "SUN is shining!!! Good day for activities!!!"
    	else 
 	  		@determinant = "03d"		#cloudy
 	  		@weatherstmt = "CLOUD can't stop us laughing out LOUD from activities!!!"
    	end

		@weathericon = "http://openweathermap.org/img/w/" + @determinant + ".png" ;



		# FIRST RESULT
		@first = '1. ' + @spot1.name; 
			if @spot1.formatted_address == nil 
				@address1 = 'Address: n/a';
			else
				@address1 = 'Address: ' + @spot1.formatted_address;
			end 
			if @details1["result"]["formatted_phone_number"] == nil
				@phone1 = 'Phone Number: n/a';
			else
				@phone1 = 'Phone Number: ' + @details1["result"]["formatted_phone_number"];
			end
			if @spot1.rating.to_s == nil
				@rating1 = 'Rating: n/a';
			else
				@rating1 = 'Rating: ' + @spot1.rating.to_s + ' out of 5';
			end

			if @details1["result"]["website"] == nil
				@url1 = 'n/a';
			else
				@url1 = @details1["result"]["website"];
			end
			@lat1 = @details1["result"]["geometry"]["location"]["lat"].to_s;
			@long1 = @details1["result"]["geometry"]["location"]["lng"].to_s;
			@map1 = "https://maps.googleapis.com/maps/api/staticmap?center=" + @lat1 + "," + @long1 + "&zoom=14&size=400x300&maptype=roadmap
			&markers=color:red%7Clabel:1%7C" + @lat1 + "," + @long1 + "&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk";
		
		# SECOND RESULT
		@second = '2. ' + @spot2.name;
			if @spot2.formatted_address == nil
				@address2 = 'Address: n/a';
			else
				@address2 = 'Address: ' + @spot2.formatted_address;
			end 
			if @details2["result"]["formatted_phone_number"] == nil
				@phone2 = 'Phone Number: n/a';
			else
				@phone2 = 'Phone Number: ' + @details2["result"]["formatted_phone_number"];
			end

			if @spot2.rating.to_s == nil
				@rating2 = 'Rating: n/a';
			else
				@rating2 = 'Rating: ' + @spot2.rating.to_s + ' out of 5';
			end

			if @details2["result"]["website"] == nil
				@url2 = 'n/a';
			else
				@url2 = @details2["result"]["website"];
			end
			@lat2 = @details2["result"]["geometry"]["location"]["lat"].to_s;
			@long2 = @details2["result"]["geometry"]["location"]["lng"].to_s;
			@map2 = "https://maps.googleapis.com/maps/api/staticmap?center=" + @lat2 + "," + @long2 + "&zoom=14&size=400x300&maptype=roadmap
			&markers=color:red%7Clabel:2%7C" + @lat2 + "," + @long2 + "&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk";
		
		# THIRD RESULT
		@third = '3. ' + @spot3.name;
			if @spot3.formatted_address == nil
				@address3 = 'Address: n/a';
			else
				@address3 = 'Address: ' + @spot3.formatted_address;
			end

			if @details3["result"]["formatted_phone_number"] == nil
				@phone3 = 'Phone Number: n/a';
			else
				@phone3 = 'Phone Number: ' + @details3["result"]["formatted_phone_number"];
			end

			if @spot3.rating.to_s == nil
				@rating3 = 'Rating: n/a';
			else
				@rating3 = 'Rating: ' + @spot3.rating.to_s + ' out of 5';
			end

			if @details3["result"]["website"] == nil
				@url3 = 'n/a';
			else
				@url3 = @details1["result"]["website"];
			end
			@lat3 = @details3["result"]["geometry"]["location"]["lat"].to_s;
			@long3 = @details3["result"]["geometry"]["location"]["lng"].to_s;
			@map3 = "https://maps.googleapis.com/maps/api/staticmap?center=" + @lat3 + "," + @long3 + "&zoom=14&size=400x300&maptype=roadmap
			&markers=color:red%7Clabel:3%7C" + @lat3 + "," + @long3 + "&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk";
	end

	def show
		@user_info = session[:passed_user_id] #passed from users controller
		if params[:id] == "bookmark1" 
			@placeID = session[:passed_variable1] #passed from index function above
			@bookmark = Bookmark.new(:place_id => @placeID, :user_id => @user_info)
			if @bookmark.save
				flash[:notice] = "Bookmarked!"
			else 
				flash[:alert] = "Something went wrong..."
			end
		elsif params[:id] == "bookmark2"
			@placeID = session[:passed_variable2]
			@bookmark = Bookmark.new(:place_id => @placeID, :user_id => @user_info)
			if @bookmark.save
				flash[:notice] = "Bookmarked!"
			else 
				flash[:alert] = "Something went wrong..."
			end
		else
			@placeID = session[:passed_variable3]
			@bookmark = Bookmark.new(:place_id => @placeID, :user_id => @user_info)
			if @bookmark.save
				flash[:notice] = "Bookmarked!"
			else 
				flash[:alert] = "Something went wrong..."
			end
		end
		@bookmarks = Bookmark.where(:user_id => @user_info).order('updated_at DESC').limit(5) #collection of all bookmarks associated with that user
		redirect_to bookmark_path(passed_parameter: @bookmarks.map(&:place_id))
	end

end
