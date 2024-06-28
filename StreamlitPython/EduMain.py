import streamlit as st
import base64
import Home
from dbconn import *


st.set_page_config(
    page_icon='assets/edumap.png',
    page_title='EduMap- Connecting the Educators Worldwide',
    layout='wide'
)

# Ensure userStatus is set in session state
if 'userStatus' not in st.session_state:
    st.session_state.userStatus = False

if 'statusAction' not in st.session_state:
    st.session_state.statusAction = None 
    
if 'isloggedIn' not in st.session_state:
    st.session_state.isloggedIn=False 
    
if 'loggedInEmail' not in st.session_state:
    st.session_state.loggedInEmail = None 

def login_clicked():
    st.session_state.userStatus=True
    st.session_state.statusAction='Login'
    
def signup_clicked():
    st.session_state.userStatus=True
    st.session_state.statusAction='SignUp'

def preHome_UI():
    with open("assets/edumap.png", "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read()).decode()

    # Display the image using Streamlit
    st.write(f"""
        <div style='display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; height: 100%;'>
            <img src="data:image/png;base64,{encoded_string}" height="350" style="margin-bottom: 10px; border-radius: 50%; object-fit: cover;" />
            <p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Connecting the Learners Worldwide</p>
        </div>
    """, unsafe_allow_html=True)

    col1, col2, col3, col4 = st.columns([2, 2, 2, 2])

    col2.button('Login', use_container_width=True, on_click=login_clicked)
    col3.button('SignUp', use_container_width=True, on_click=signup_clicked)

def signUp():
    col1,col2,col3=st.columns([1,5,1])
    with col2.form('SignUp Form', clear_on_submit=False,border=True):
        st.write('''<p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Sign Up</p>''', unsafe_allow_html=True)
        name=st.text_input('Full Name ')
        email=st.text_input('Email ')
        password=st.text_input('Password',type='password')
        district=st.text_input('District')
        area=st.text_input('Area')
        qualification=st.text_area('Qualifications',height=10)
        if st.form_submit_button('Register',use_container_width=True):
            nameexist = False
            for item in collection.find({},{'_id':0}):
                if email in item['email']:
                    st.error('Email already exists in the database')
                    nameexist = True
                    break    
            
            #Prepare data to insert
            if nameexist == False:
                data = {
                    'name': name,
                    'email': email,
                    'password': password,
                    'district': district,
                    'area': area,
                    'qualification': qualification
                }
                # Insert data into MongoDB
                collection.insert_one(data)
                st.success('Registration successfull')
                st.session_state.statusAction='pre'
                st.rerun() 

def Login():    
    st.write('<br><br>',unsafe_allow_html=True)
    col1,col2,col3=st.columns([3,3,3],gap="medium")
    with col2:
        with open("assets/edumap.png", "rb") as image_file:
            encoded_string = base64.b64encode(image_file.read()).decode()

        st.write(f"""
            <div style='display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; height: 100%;'>
                <img src="data:image/png;base64,{encoded_string}" height="150" style="margin-bottom: 10px; border-radius: 50%; object-fit: cover;" />
                <p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Connecting the Learners Worldwide</p>
            </div>
        """, unsafe_allow_html=True)

        st.markdown("<br>", unsafe_allow_html=True)  
        with st.form('Login From',border=False):
            #text input for username  
            email=st.text_input('Email:',type="default",label_visibility='collapsed',placeholder='Email')
            
            #text input for password
            password=st.text_input('Password',type="password",label_visibility='collapsed',placeholder='Password')

            sub_column1, sub_column2,sub_column3=st.columns([3,2,3])
            submitted=sub_column2.form_submit_button('Login',use_container_width=True)
        with col2:
            if submitted:
                for item in collection.find({},{'_id':0}):
                    if email in item['email'] and password in item['password']:
                        st.session_state.isloggedIn=True
                        st.session_state.statusAction='pre'
                        st.success('Login successfull')
                        st.session_state.loggedInEmail=email
                        st.rerun()
                    
                    else:
                        st.error('Invalid Credentials')
                        st.session_state.isloggedIn=False
                        st.session_state.statusAction='Login'
                        break
    

if __name__ == '__main__':
    if not st.session_state.userStatus:
        preHome_UI()
    if st.session_state.isloggedIn==False:
        if st.session_state.statusAction == 'Login':
            Login()
        if st.session_state.statusAction == 'SignUp':
            signUp()
        if st.session_state.statusAction == 'pre':
            preHome_UI()
        
    if st.session_state.isloggedIn:
        Home.HomeUI(st.session_state.loggedInEmail)
