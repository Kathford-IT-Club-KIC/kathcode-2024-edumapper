import streamlit as st 
import base64



def HomeUI(loggedInUser):
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
            <h1>Connecting the Learners Worldwide</h1>
        </div>
        <div style="margin-top: 70px;"></div>
    """, unsafe_allow_html=True)
    
    col1,col2,col3=st.columns([2.5,5,2.5])

    with col1.container(border=False,height=200):
        with open("assets/dummyUser.png", "rb") as image_file:
            encoded_string = base64.b64encode(image_file.read()).decode()
            
        #SET username from database 
        
        username='Mukesh Prajapati'
        
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

        pass
        
    with col2.container(border=True,height=200):
        #Creating post 
        post=st.text_area('User Post',label_visibility="collapsed",placeholder='Arbine le Vanxa aile')
        col1,col2=st.columns([1,4])
        col1.button('Post',use_container_width=True)
         
        
    with col3.container(border=True,height=200):
        pass

         