import streamlit as st
import base64

# Ensure userStatus is set in session state
if 'userStatus' not in st.session_state:
    st.session_state.userStatus = False

if 'statusAction' not in st.session_state:
    st.session_state.statusAction = None 

# def setStatusTrue():
#     st.session_state.userStatus = True

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
        # st.session_state.statusAction='Login'
        # st.write('Login Clicked')
    col3.button('SignUp', use_container_width=True, on_click=signup_clicked)
        # st.session_state.statusAction='SignUp'
        # st.write('SignUp Clicked ')

def signUp():
    col1,col2,col3=st.columns([1,5,1])
    with col2.form('SignUp Form', clear_on_submit=False,border=True):
        st.write('''<p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Sign Up</p>''', unsafe_allow_html=True)
        fullName=st.text_input('Full Name ')
        email=st.text_input('Email ')
        password=st.text_input('Password',type='password')
        district=st.text_input('District')
        area=st.text_input('Area')
        qualification=st.text_area('Qualifications',height=10)
        if st.form_submit_button('Register',use_container_width=True):
            pass 

def Login():
    st.write('''<p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Login</p>''', unsafe_allow_html=True)
    # Add login form inputs here (e.g., username, password, etc.)
    st.form_submit_button('Login')

if __name__ == '__main__':
    if not st.session_state.userStatus:
        preHome_UI()
    if st.session_state.statusAction == 'Login':
        Login()
    if st.session_state.statusAction == 'SignUp':
        signUp()
