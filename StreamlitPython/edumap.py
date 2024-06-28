import streamlit as st 
from streamlit_folium import st_folium
from streamlit_folium import folium  
import branca 
from geopy.geocoders import Nominatim
from dbconn import * 
from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut, GeocoderUnavailable
import time 
from geopy.distance import geodesic
import base64

def geocode_with_retry(loc, address, max_retries=3):
    retries = 0
    while retries < max_retries:
        try:
            return loc.geocode(address, timeout=10)
        except (GeocoderTimedOut, GeocoderUnavailable):
            retries += 1
            time.sleep(1)
    return None

def MapView(Usere):
    email = Usere
    User = None
    for item in collection.find({}, {'_id': 0}):
        if email == item['email']:
            User = item
            break
    
    if User:
        loc = Nominatim(user_agent="GetLoc")
        area = str(User['area'])
        district = str(User['district'])
        getLoc = geocode_with_retry(loc, f"{area},{district} , Nepal")
        if getLoc:
            latitude = getLoc.latitude
            longitude = getLoc.longitude
        else:
            latitude, longitude = 27.6800062, 85.3857303  # Default location if geocoding fails
    
    # Retrieve user data from MongoDB collection
    users = list(collection.find({}, {'_id': 0}))
    
    # Initialize a Folium map
    initial_location = [latitude,longitude]  # Default location (Kathmandu, Nepal)
    # initial_location = [27.6800062, 85.3857303]  # Default location (Kathmandu, Nepal)
    m = folium.Map(location=initial_location, zoom_start=20, height=200, width=400, control_scale=True, zoom_control=True)

    # Dictionary to store user details by location
    location_user_details = {}

    # Iterate through all users to get their locations
    for user in users:
        area = user['area']
        district = user['district']
        location = f"{area}, {district}, Nepal"
        geocode_result = geocode_with_retry(loc, location)

        if geocode_result:
            latitude = geocode_result.latitude
            longitude = geocode_result.longitude
            lat_long_key = (latitude, longitude)
            
            user_detail = f"""
            <details>
                <summary style="cursor: pointer; margin-bottom: 10px;">Name: {user['name']}</summary>
                <div style="padding: 5px;">
                    <div style="border: 1px solid #ccc; border-radius: 5px; padding: 10px;">
                        <p><strong>Email:</strong> {user['email']}</p>
                        <p><strong>Area:</strong> {user['area']}</p>
                        <p><strong>District:</strong> {user['district']}</p>
                        <p><strong>Qualification:</strong> {user['qualification']}</p>
                    </div>
                </div>
            </details>
            """

            # Aggregate user details by location
            if lat_long_key in location_user_details:
                location_user_details[lat_long_key].append(user_detail)
            else:
                location_user_details[lat_long_key] = [user_detail]

    # Add markers to the map
    for (latitude, longitude), user_details in location_user_details.items():
        all_user_details = "\n".join(user_details)
        iframe = branca.element.IFrame(html=all_user_details, width=250, height=150)
        popup = folium.Popup(iframe, max_width=500)
        folium.Marker([latitude, longitude], popup=popup).add_to(m)
    
    # Display the map in Streamlit
    st_folium(m, height=200, use_container_width=True, returned_objects=[])


def profile_view(loggedinuser):
    # Get the logged-in user details
    User = None
    for item in collection.find({}, {'_id': 0}):
        if loggedinuser == item['email']:
            User = item
            break

    # Geocode the logged-in user's location
    loc = Nominatim(user_agent="GetLoc")
    area = str(User['area'])
    district = str(User['district'])
    getLoc = geocode_with_retry(loc, f"{area},{district} , Nepal")
    if getLoc:
        user_latitude = getLoc.latitude
        user_longitude = getLoc.longitude
    else:
        st.write("Failed to geocode user location")
        return

    # Initialize a list to store nearby users' details
    nearby_users = []

    # Iterate through all users to get their locations
    for user in collection.find({}, {'_id': 0}):
        if user['email'] == loggedinuser:
            continue  # Skip the logged-in user
        
        area = user['area']
        district = user['district']
        location = f"{area}, {district}, Nepal"
        geocode_result = geocode_with_retry(loc, location)

        if geocode_result:
            latitude = geocode_result.latitude
            longitude = geocode_result.longitude
            distance = geodesic((user_latitude, user_longitude), (latitude, longitude)).km
            user['distance'] = distance
            nearby_users.append(user)

    # Sort users by distance
    nearby_users.sort(key=lambda x: x['distance'])

    # Display the nearby users' details
    for user in nearby_users:
        user_image = "data:image/png;base64,..."  # Replace with the actual base64 encoded image
        encoded_image = base64.b64encode(user_image).decode()
        user_name = user['name']
        distance = user['distance']
        
        user_detail_html = f"""
        <div style='display: flex; align-items: center; margin-bottom: 20px;'>
            <img src="{encoded_image}" height="50" style="border-radius: 50%; object-fit: cover; height: 50px; width: 50px; margin-right: 20px;" />
            <div>
                <p style='margin: 0; font-size: 16px; color: green; font-weight: bold;'>{user_name}</p>
                <p style='margin: 0; font-size: 14px; color: grey;'>{distance:.2f} km away</p>
            </div>
        </div>
        """
        st.write(user_detail_html, unsafe_allow_html=True)


