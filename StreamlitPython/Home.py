import streamlit as st 
import base64
from dbconn import *
from datetime import datetime
import time 


with open("assets/dummyUser.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read()).decode()



# post_html_template = 



def HomeUI(loggedInUser):
    email = loggedInUser
    for item in collection.find({},{'_id':0}):
        if email in item['email']:
            User = item
            break

    with open("assets/edumap.png", "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read()).decode()

    # Display the image using Streamlit
    st.write(f"""
        <style>
            .header {{
                position: fixed;
                top: 25px;
                width: 88%;
                background-color: #f0f8ff; /* Faint blue color */
                display: flex;
                align-items: center;
                padding: 10px 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                z-index: 100;
            }}
            .header img {{
                height: 50px;
                margin-right: 20px;
                margin-top: 20px;
            }}
            .header h1 {{
                font-size: 24px;
                color: #333;
                margin: 0;
            }}
        </style>
        <div class="header">
            <img src="data:image/png;base64,{encoded_string}" alt="EduMap Logo"/>
            <h1>EduMap</h1>
        </div>
        <div style="margin-top: 70px;"></div>
    """, unsafe_allow_html=True)
    
    col1,col2,col3=st.columns([2.5,5,2.5])

    with col1.container(border=False,height=200):
        with open("assets/dummyUser.png", "rb") as image_file:
            encoded_string = base64.b64encode(image_file.read()).decode()
            
        #SET username from database 
        
        username=User['name']
        
        st.write(f"""
            <div style='display: flex;
            align-items: center;
            border: 0px solid #ccc;
            padding: 10px;
            max-width: 500px;
            margin: auto;
            border-radius: 10px;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;'>
                <img src="data:image/png;base64,{encoded_string}" height="50" style="border-radius: 50%;
            object-fit: cover;
            height: 50px;
            width: 50px;
            margin-right: 10px;" />
                <p style='margin: 0;
            font-size: 16px;
            color: green;
            font-weight: bold;'> {username}</p>
            </div>
        """, unsafe_allow_html=True)

    user_post='Post here '
        
    with col2:
        s_col1, s_col2=st.columns([12,1])
        username=s_col1.text_input('Search',label_visibility='collapsed', placeholder='Search...')
        s_col2.button(':mag:','Search',use_container_width=True)
        with st.container(border=False,height=375):
            st.write(f'''
                <style>
                    .body {{
                        font-family: Arial, sans-serif;
                        background-color: #f0f2f5;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                        margin: 0;
                    }}
                    .post-container {{
                        width: 500px;
                        background-color: #fff;
                        border-radius: 8px;
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                        padding: 16px;
                        margin: 16px;
                    }}
                    .user {{
                        display: flex;
                        align-items: center;
                        margin-bottom: 12px;
                    }}
                    .user-image img {{
                        width: 40px;
                        height: 40px;
                        border-radius: 50%;
                        margin-right: 12px;
                    }}
                    .user-name span {{
                        font-weight: bold;
                        font-size: 14px;
                        color: #333;
                    }}
                    .caption-text p {{
                        font-size: 14px;
                        color: #333;
                        margin: 0 0 12px;
                    }}
                    .button {{
                        text-align: center;
                        margin-top: 12px;
                    }}
                    .contact-me {{
                        background-color: #1877f2;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        padding: 8px 16px;
                        font-size: 14px;
                        cursor: pointer;
                    }}
                    .contact-me:hover {{
                        background-color: #165db5;
                    }}
                    .contact-me:active {{
                        background-color: #154a93;
                    }}
                </style>

                <div class="post-container">
                    <div class="user">
                        <div class="user-image">
                            <img src="data:image/png;base64,{encoded_string}" alt="User Image">
                        </div>
                        <div class="user-name">
                            <span>{User['name']}</span>
                        </div>
                    </div>

                        {user_post} 
                    
                </div>
            ''', unsafe_allow_html=True)
            ss_col1,ss_col2,ss_col3=st.columns([0.75,12,1.5])
            with ss_col2.popover('Contact Me',use_container_width=True):
                message=st.text_input('Your Message',placeholder='Your Message',label_visibility='collapsed')
                if st.button('Send Message :arrow_right:','send_botton',use_container_width=True):
                    st.success('Message Sent')
                    
            
         
        
    with col3.container(border=False,height=200):
        with st.form('PostForm',clear_on_submit=True,border=False):
                #Creating post 
                post=st.text_area('User Post',label_visibility="collapsed",placeholder='Create a post...')
                # col1,col2=st.columns([1,4])
                if st.form_submit_button('Post',use_container_width=True):            

                    # Get the current date and time
                    current_date_time = datetime.now()

                    # Extract the current date
                    current_date = current_date_time.date()
                    current_date = str(current_date)
                    data={
                        'name':User['name'],
                        'email':User['email'],
                        'description':post,
                        'date':current_date
                    }
                    postinfo.insert_one(data)
                    successPlaceholder=st.empty()
                    successPlaceholder.success('Post successfull') 
                    time.sleep(3)
                    successPlaceholder.empty() 

         