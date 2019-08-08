class BookmarkController < ApplicationController
	include HTTParty
	'require json'

	def show
		#shared variables from index method
		@saved1 = session[:saved_0]
		@saved2 = session[:saved_1]
		@saved3 = session[:saved_2]
		@saved4 = session[:saved_3]
		@saved5 = session[:saved_4]

		if params[:id] == "delete1" 
			@bookmark = Bookmark.find_by(:place_id => @saved1).destroy
			render 'bookmark/destroy'
		elsif params[:id] == "delete2"
			@bookmark = Bookmark.find_by(:place_id => @saved2).destroy
			render 'bookmark/destroy'
		elsif params[:id] == "delete3"
			@bookmark = Bookmark.find_by(:place_id => @saved3).destroy
			render 'bookmark/destroy'
		elsif params[:id] == "delete4"
			@bookmark = Bookmark.find_by(:place_id => @saved4).destroy
			render 'bookmark/destroy'
		else
			@bookmark = Bookmark.find_by(:place_id => @saved5).destroy
			render 'bookmark/destroy'
		end
	end 

	def index
		@client = GooglePlaces::Client.new('AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk')

		@passed_bookmarks = params[:passed_parameter]
		array = @passed_bookmarks
		@saved1 = array[0]
		session[:saved_0] = @saved1
		@saved2 = array[1]
		session[:saved_1] = @saved2
		@saved3 = array[2]
		session[:saved_2] = @saved3
		@saved4 = array[3]
		session[:saved_3] = @saved4
		@saved5 = array[4]
		session[:saved_4] = @saved5


		@response1 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @saved1 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
		@details1 = JSON.parse(@response1.body);

		if (@saved2 != nil)
			@response2 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @saved2 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
			@details2 = JSON.parse(@response2.body);
		end 
		if (@saved3 != nil)
			@response3 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @saved3 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
			@details3 = JSON.parse(@response3.body);
		end

		if (@saved4 != nil)
			@response4 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @saved4 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
			@details4 = JSON.parse(@response4.body);
		end 
		if (@saved5 != nil)
			@response5 = HTTParty.get('https://maps.googleapis.com/maps/api/place/details/json?placeid=' + @saved5 + '&key=AIzaSyAteiBWZdJtHXmswrdeB51HvHdudz4TFOk');
			@details5 = JSON.parse(@response5.body);
		end 

		@one = '1. ' + @details1["result"]["name"]; 
			if @details1["result"]["formatted_address"] == nil 
				@address1 = 'Address: n/a';
			else
				@address1 = 'Address: ' + @details1["result"]["formatted_address"];
			end 
			if @details1["result"]["formatted_phone_number"] == nil
				@phone1 = 'Phone Number: n/a';
			else
				@phone1 = 'Phone Number: ' + @details1["result"]["formatted_phone_number"];
			end
			if @details1["result"]["website"] == nil
				@url1 = 'n/a';
			else
				@url1 = @details1["result"]["website"];
			end
		if (@saved2 != nil)
			@two = '2. ' + @details2["result"]["name"]; 
				if @details2["result"]["formatted_address"] == nil 
					@address2 = 'Address: n/a';
				else
					@address2 = 'Address: ' + @details2["result"]["formatted_address"];
				end 
				if @details2["result"]["formatted_phone_number"] == nil
					@phone2 = 'Phone Number: n/a';
				else
					@phone2 = 'Phone Number: ' + @details2["result"]["formatted_phone_number"];
				end
				if @details2["result"]["website"] == nil
					@url2 = 'n/a';
				else
					@url2 = @details2["result"]["website"];
				end
		end
		if (@saved3 != nil)
			@three = '3. ' + @details3["result"]["name"]; 
				if @details3["result"]["formatted_address"] == nil 
					@address3 = 'Address: n/a';
				else
					@address3 = 'Address: ' + @details3["result"]["formatted_address"];
				end 
				if @details3["result"]["formatted_phone_number"] == nil
					@phone3 = 'Phone Number: n/a';
				else
					@phone3 = 'Phone Number: ' + @details3["result"]["formatted_phone_number"];
				end
				if @details3["result"]["website"] == nil
					@url3 = 'n/a';
				else
					@url3 = @details3["result"]["website"];
				end
		end

		if (@saved4 != nil)
			@four = '4. ' + @details4["result"]["name"]; 
				if @details4["result"]["formatted_address"] == nil 
					@address4 = 'Address: n/a';
				else
					@address4 = 'Address: ' + @details4["result"]["formatted_address"];
				end 
				if @details4["result"]["formatted_phone_number"] == nil
					@phone4 = 'Phone Number: n/a';
				else
					@phone4 = 'Phone Number: ' + @details4["result"]["formatted_phone_number"];
				end
				if @details4["result"]["website"] == nil
					@url4 = 'n/a';
				else
					@url4 = @details4["result"]["website"];
				end
		end

		if (@saved5 != nil)
			@five = '5. ' + @details5["result"]["name"]; 
				if @details5["result"]["formatted_address"] == nil 
					@address5 = 'Address: n/a';
				else
					@address5 = 'Address: ' + @details5["result"]["formatted_address"];
				end 
				if @details5["result"]["formatted_phone_number"] == nil
					@phone5 = 'Phone Number: n/a';
				else
					@phone5 = 'Phone Number: ' + @details5["result"]["formatted_phone_number"];
				end
				if @details5["result"]["website"] == nil
					@url5 = 'n/a';
				else
					@url5 = @details5["result"]["website"];
				end
		end 
	end

end
